import 'dart:io';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_application_4/models/pages_bojo.dart';
import 'package:flutter_application_4/models/page_helper.dart';
import 'package:flutter_application_4/pages/pages_page.dart';

enum OrderOptions { ordemaz, ordemza }

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageHelper helper = PageHelper();

  List<PagesBojo> pages = [];

  @override
  void initState() {
    super.initState();

    _getAllPages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pages"),
        backgroundColor: Colors.orange,
        centerTitle: true,
        actions: <Widget>[
          PopupMenuButton<OrderOptions>(
            itemBuilder: (context) => <PopupMenuEntry<OrderOptions>>[
              const PopupMenuItem<OrderOptions>(
                  value: OrderOptions.ordemaz, child: Text('Order of A-Z')),
              const PopupMenuItem<OrderOptions>(
                  value: OrderOptions.ordemza, child: Text('Order of Z-A')),
            ],
            onSelected: _orderList,
          )
        ],
      ),
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showPagesPage();
        },
        backgroundColor: Colors.orange,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
          padding: const EdgeInsets.all(10.0),
          itemCount: pages.length,
          itemBuilder: (context, index) {
            return _PageCard(context, index);
          }),
    );
  }

  Widget _PageCard(BuildContext context, int index) {
    return GestureDetector(
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: <Widget>[
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: pages[index].img != null
                            ? FileImage(File(pages[index].img.toString()))
                            : const AssetImage("assets/images/iconebook.png")
                                as ImageProvider,
                        fit: BoxFit.cover),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(pages[index].materia ?? "",
                            style: const TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold)),
                        Text(pages[index].title ?? "",
                            style: const TextStyle(
                              fontSize: 17,
                            )),
                        Text(
                          pages[index].data ?? "",
                          style: const TextStyle(
                            fontSize: 17,
                          ),
                        ),
                      ]),
                )
              ],
            ),
          ),
        ),
        onTap: () {
          _showOptions(context, index);
        });
  }

  void _orderList(OrderOptions result) {
    switch (result) {
      case OrderOptions.ordemaz:
        setState(() {
          pages.sort((a, b) {
            return a.materia!.toLowerCase().compareTo(b.materia!.toLowerCase());
          });
        });
        break;
      case OrderOptions.ordemza:
        setState(() {
          pages.sort((a, b) {
            return a.materia!.toLowerCase().compareTo(b.materia!.toLowerCase());
          });
        });
        break;
    }
  }

  void _showOptions(BuildContext context, int index) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return BottomSheet(
              //
              onClosing: () {},
              builder: (context) {
                return Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: ElevatedButton(
                          onPressed: () {
                            launchUrl(Uri.parse("Data: ${pages[index].data}"));
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "Reproduction",
                            style:
                                TextStyle(color: Colors.orange, fontSize: 19),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                            _showPagesPage(page: pages[index]);
                          },
                          child: const Text(
                            "Edited",
                            style:
                                TextStyle(color: Colors.orange, fontSize: 19),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: ElevatedButton(
                          onPressed: () {
                            helper.deletePage(pages[index].id!.toInt());
                            setState(() {
                              pages.removeAt(index);
                              Navigator.pop(context);
                            });
                          },
                          child: const Text(
                            "Delete",
                            style:
                                TextStyle(color: Colors.orange, fontSize: 19),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              });
        });
  }

  void _getAllPages() {
    helper.getAllPages().then((list) {
      setState(() {
        pages = list;
      });
    });
  }

  void _showPagesPage({PagesBojo? page}) async {
    final recPage = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PagesPage(
                  page: page,
                )));
    if (recPage != null) {
      if (page != null) {
        await helper.updatePages(recPage);
      } else {
        await helper.savePage(recPage);
      }
      _getAllPages();
    }
  }
}
