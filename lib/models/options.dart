/// text : "0-1 years"
/// type : null
/// values : []

class Options {
  String text = '';
  dynamic? type;
  List<String>? values;

  Options({required this.text, this.type, this.values});

  Options.fromJson(dynamic json) {
    text = json["text"];
    type = json["type"];
    values = json["values"].cast<String>();
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["text"] = text;
    map["type"] = type;
    map["values"] = values;
    return map;
  }
}
