// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:quiz_app/controllers/question_controller.dart';
//
// import '../../../constants.dart';
//
// class Option extends StatefulWidget {
//   const Option({
//     Key? key,
//     this.text,
//     this.index,
//     this.type,
//     this.press,
//   }) : super(key: key);
//
//   final String text;
//   final int index;
//   final String type;
//   final VoidCallback press;
//
//   @override
//   _OptionState createState() => _OptionState();
// }
//
// class _OptionState extends State<Option> {
//   bool valuefirst = false;
//
//   Widget condition(qnController) {
//     Widget wgt;
//
//     Color getTheRightColor() {
//       if (qnController.isAnswered) {
//         if (widget.index == qnController.selectedAns) {
//           return Colors.blue;
//         }
//       }
//       return kGrayColor;
//     }
//
//     switch (widget.type) {
//       case 'multi':
//         wgt = CheckboxListTile(
//           controlAffinity: ListTileControlAffinity.trailing,
//           // secondary: const Icon(Icons.alarm),
//           title: Text(
//             "${widget.index + 1} ${widget.text}",
//             style: TextStyle(color: kGrayColor, fontSize: 16),
//           ),
//           // subtitle: Text('Ringing after 12 hours'),
//           autofocus: false,
//           activeColor: Colors.blue,
//           checkColor: Colors.white,
//           selected: valuefirst,
//           dense: true,
//           value: valuefirst,
//           onChanged: (bool value) {
//             setState(() async {
//               return this.valuefirst = value;
//             });
//           },
//         );
//         break;
//       default:
//         wgt = Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               "${widget.index + 1} ${widget.text}",
//               style: TextStyle(color: getTheRightColor(), fontSize: 16),
//             ),
//             Container(
//               height: 26,
//               width: 26,
//               decoration: BoxDecoration(
//                 color: getTheRightColor() == kGrayColor
//                     ? Colors.transparent
//                     : getTheRightColor(),
//                 borderRadius: BorderRadius.circular(50),
//                 border: Border.all(color: getTheRightColor()),
//               ),
//               child: Icon(
//                 Icons.close,
//                 size: 16,
//               ),
//             )
//           ],
//         );
//     }
//     return wgt;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<QuestionController>(
//         init: QuestionController(),
//         builder: (qnController) {
//           return InkWell(
//             onTap: widget.press,
//             child: Container(
//                 margin: EdgeInsets.only(top: kDefaultPadding),
//                 padding: EdgeInsets.all(kDefaultPadding),
//                 decoration: BoxDecoration(
//                   border: Border.all(color: kGrayColor),
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//                 child: condition(qnController)),
//           );
//         });
//   }
// }
