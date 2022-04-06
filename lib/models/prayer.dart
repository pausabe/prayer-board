class Prayer{
  late String description;

  Prayer({required this.description});

  factory Prayer.fromJson(Map<String, dynamic> json) {
    String description = json['description'];
    return Prayer(description: description);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['description'] = description;
    return data;
  }

  @override
  String toString() {
    return "'${description.toString()}'";
  }
}