import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_application_18/models/pages_bojo.dart';

class PagesPage extends StatefulWidget {
  final PagesBojo? page;

  const PagesPage({Key? key, this.page}) : super(key: key);

  @override
  State<PagesPage> createState() => _PagesPageState();
}

class _PagesPageState extends State<PagesPage> {
  final TextEditingController _materiacontroller = TextEditingController();
  final TextEditingController _titlecontroller = TextEditingController();
  final TextEditingController _datacontroller = TextEditingController();

  final _materiaFocus = FocusNode();

  bool _userEdited = false;

  late PagesBojo _editedPage;

  @override
  void initState() {
    super.initState();
    if (widget.page == null) {
      _editedPage = PagesBojo();
    } else {
      _editedPage = PagesBojo.fromMap(widget.page!.toMap());
      _materiacontroller.text = _editedPage.materia!;
      _titlecontroller.text = _editedPage.title!;
      _datacontroller.text = _editedPage.data!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _requestPop,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: Text(_editedPage.materia ?? "New Page"),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (_editedPage.materia != null &&
                _editedPage.materia!.isNotEmpty) {
              Navigator.pop(context, _editedPage);
            } else {
              FocusScope.of(context).requestFocus(_materiaFocus);
            }
          },
          backgroundColor: Colors.orange,
          child: const Icon(Icons.save),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              GestureDetector(
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: _editedPage.img == null
                              ? const AssetImage("assets/imagens/iconebook.png")
                                  as ImageProvider
                              : FileImage(File(_editedPage.img.toString())),
                          fit: BoxFit.cover)),
                ),
                onTap: () {
                  ImagePicker()
                      .pickImage(source: ImageSource.camera)
                      .then((file) {
                    if (file == null) return;
                    setState(() {
                      _editedPage.img = file.path;
                    });
                  });
                },
              ),
              TextField(
                  controller: _materiacontroller,
                  focusNode: _materiaFocus,
                  decoration: const InputDecoration(labelText: "Materia"),
                  onChanged: (text) {
                    _userEdited = true;
                    setState() {
                      _editedPage.materia = text;
                    }
                  }),
              TextField(
                  controller: _titlecontroller,
                  decoration: const InputDecoration(labelText: "Title"),
                  onChanged: (text) {
                    _userEdited = true;
                    setState() {
                      _editedPage.title = text;
                    }
                  }),
              TextField(
                controller: _datacontroller,
                decoration: const InputDecoration(labelText: "Data"),
                onChanged: (text) {
                  _userEdited = true;
                  setState() {
                    _editedPage.data = text;
                  }
                },
                keyboardType: TextInputType.datetime,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> _requestPop() {
    if (_userEdited) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Clean Alter?"),
              content: const Text("If exit alter no wive save."),
              actions: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Cancel"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  child: const Text("Yes"),
                ),
              ],
            );
          });
      return Future.value(false);
    } else {
      return Future.value(true);
    }
  }
}
