/// text : "0-1 years"
/// type : null
/// values : null

class Options {
  String? text;
  dynamic? type;
  dynamic? values;

  Options({this.text, this.type, this.values});

  Options.fromJson(dynamic json) {
    text = json["text"];
    type = json["type"];
    values = json["values"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["text"] = text;
    map["type"] = type;
    map["values"] = values;
    return map;
  }
}
