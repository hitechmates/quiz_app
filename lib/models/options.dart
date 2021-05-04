// import 'package:json_annotation/json_annotation.dart';
// part 'options.g.dart';
//
// @JsonSerializable(explicitToJson: true)
// class Options {
//   String text;
//   String type;
//   List<String> values;
//
//   Options(this.text, this.type, this.values);
//   factory Options.fromJson(dynamic option) => _$OptionsFromJson(option);
//
//   dynamic toJson() => _$OptionsToJson(this);
// }

class Options {
  String text;
  String? type;
  List<String>? values;

  Options({required this.text, this.type, this.values});
  // factory Options.fromJson(dynamic option) => _$OptionsFromJson(option);
  factory Options.fromJson(Map<String, dynamic> json) => Options(
        text: json["text"],
        type: json["type"],
        values: new List<String>.from(json['values']),
      );
}
