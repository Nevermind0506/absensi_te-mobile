class Province {
  String? id;
  String? name;

  Province({this.id, this.name});

  Province.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }

  static List<Province> fromJsonList(List? data) {
    if (data == null || data.isEmpty) return [];
    return data.map((e) => Province.fromJson(e)).toList();
  }

  @override
  String toString() => name!;
}
