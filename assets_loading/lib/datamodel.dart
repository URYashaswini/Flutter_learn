class datamodel {
  int? id;
  String? name;
  String? imageurl;
  datamodel({this.id, this.name, this.imageurl});
  datamodel.fromjson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imageurl = json['imageurl'];
  }
}
