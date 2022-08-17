const String pagestable = 'pagestable';
const String idColumn = 'idColumn';
const String materiaColumn = 'materiaColumn';
const String titleColumn = 'titleColumn';
const String dataColumn = 'dataColumn';
const String imgColumn = 'imgColumn';

class PagesBojo {
  int? id;
  String? materia;
  String? title;
  String? data;
  String? img;

  PagesBojo();

  PagesBojo.fromMap(Map<String, dynamic> map)
      : id = map[idColumn],
        materia = map[materiaColumn],
        title = map[titleColumn],
        data = map[dataColumn],
        img = map[imgColumn];

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      materiaColumn: materia,
      titleColumn: title,
      dataColumn: data,
      imgColumn: img
    };
    if (id != null) {
      map[idColumn] = id;
    }
    return map;
  }
}
