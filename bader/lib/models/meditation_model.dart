class Meditation {
  Meditation({
    required this.code,
    required this.data,
  });
  late final int code;
  late final List<Med> data;

  Meditation.printMyName() {
    print("nasndnasd");
  }

  Meditation.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    data = List.from(json['data']).map((e) => Med.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['code'] = code;
    _data['data'] = data.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Med {
  Med({
    required this.id,
    required this.name,
    required this.created,
    required this.updated,
    // required this.V,
    required this.isComplete,
  });
  late final String id;
  late final String name;
  late final String? created;
  late final String updated;
  // late final int? V;
  late final bool? isComplete;

  Med.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['Name'];
    created = json['createdAt'];
    updated = json['updatedAt'];
    isComplete = json['isComplete'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['Name'] = name;
    _data['created'] = created;
    _data['updated'] = updated;
    _data['isComplete'] = isComplete;
    return _data;
  }
}
