import 'options.dart';

/// id : 1
/// question : "How long have you been in software engineering?"
/// subText : ""
/// type : "radio"
/// options : [{"text":"0-1 years","type":null,"values":null},{"text":"1-2 years","type":null,"values":null},{"text":"2-4 years","type":null,"values":null},{"text":"4-6 years","type":null,"values":null},{"text":"6-10 years","type":null,"values":null},{"text":"10-15 years","type":null,"values":null},{"text":"15+ years","type":null,"values":null}]

class Question {
  int? id;
  String? question;
  String? subText;
  String? type;
  List<Options>? options;

  Question({this.id, this.question, this.subText, this.type, this.options});

  Question.fromJson(dynamic json) {
    id = json["id"];
    question = json["question"];
    subText = json["subText"];
    type = json["type"];
    if (json["options"] != null) {
      options = [];
      json["options"].forEach((v) {
        options?.add(Options.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["question"] = question;
    map["subText"] = subText;
    map["type"] = type;
    if (options != null) {
      map["options"] = options?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
