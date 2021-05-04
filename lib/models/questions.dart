// import 'package:json_annotation/json_annotation.dart';
import 'options.dart';
// part 'questions.g.dart';
//
// @JsonSerializable(explicitToJson: true)
// class Question {
//   Question(this.id, this.question, this.type, this.options);
//
//   int id;
//   String question;
//   String type;
//   Options options;
//
//   factory Question.fromJson(Map<String, dynamic> json) =>
//       _$QuestionFromJson(json);
//   Map<String, dynamic> toJson() => _$QuestionToJson(this);
//
//   // factory Question.fromJson(dynamic json) {
//   //   return new Question(
//   //       id: json['id'],
//   //       question: json['question'],
//   //       type: json['type'],
//   //       options: new List<Options>.from(json['options']));
//   // }
// }

class Question {
  Question(
      {this.id,
      required this.question,
      required this.type,
      required this.options});

  int? id;
  String question;
  String type;
  Options options;

  factory Question.fromJson(dynamic json) {
    return new Question(
        id: json['id'],
        question: json['question'],
        type: json['type'],
        options: Options.fromJson(json['options']));
  }
}

const List sample_data = [
  {
    "id": 1,
    "question":
        "Flutter is an open-source UI software development kit created by ______",
    "options": ['Apple', 'Google', 'Facebook', 'Microsoft'],
    "answer_index": 1,
  },
  {
    "id": 2,
    "question": "When google release Flutter.",
    "options": ['Jun 2017', 'Jun 2017', 'May 2017', 'May 2018'],
    "answer_index": 2,
  },
  {
    "id": 3,
    "question": "A memory location that holds a single letter or number.",
    "options": ['Double', 'Int', 'Char', 'Word'],
    "answer_index": 2,
  },
  {
    "id": 4,
    "question": "What command do you use to output data to the screen?",
    "options": ['Cin', 'Count>>', 'Cout', 'Output>>'],
    "answer_index": 2,
  },
];

// [
// {
// "id": 1,
// "question":"शराब की बोतल सर पे उठाके करेंगे ब्रेक डांस तो होगी ....... ",
// "options": ["शादी", "सगाई", "जुदाई", "None of the above"]
// },
// {
// "id": 2,
// "question": "When google release Flutter.",
// "options": ["Jun 2017", "Jun 2017", "May 2017", "May 2018"]
// },
// {
// "id": 3,
// "question": "A memory location that holds a single letter or number.",
// "options": ["Double", "Int", "Char", "Word"]
// },
// {
// "id": 4,
// "question": "What command do you use to output data to the screen?",
// "options": ["Cin", "Count>>", "Cout", "Output>>"]
// }
// ]
