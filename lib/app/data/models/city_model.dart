class City {
  String? id;
  String? name;

  City({this.id, this.name});

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }

  static List<City> fromJsonList(List? data) {
    if (data == null || data.isEmpty) return [];
    return data.map((e) => City.fromJson(e)).toList();
  }

  @override
  String toString() => name!;
}
