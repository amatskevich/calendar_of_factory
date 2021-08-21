class CustomShiftData {
  int id;
  String name;
  String description;
  bool show;

  CustomShiftData(this.id, this.name, this.description, this.show);

  CustomShiftData.fromMap(Map<String, dynamic> map)
      : assert(map["id"] != null),
        assert(map["show"] != null),
        id = map["id"],
        name = map["name"],
        description = map["description"],
        show = map["show"] == 1 ? true : false;

  Map<String, dynamic> toMap() {
    return {
      "id": this.id,
      "name": this.name,
      "description": this.description,
      "show": this.show ? 1 : 0,
    };
  }
}
