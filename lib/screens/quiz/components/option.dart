import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controllers/question_controller.dart';
import 'package:quiz_app/screens/quiz/components/widgets.dart';

import '../../../constants.dart';

class Option extends StatefulWidget {
  const Option(
      {Key? key,
      required this.index,
      required this.text,
      this.type,
      this.optionType,
      this.values,
      required this.press})
      : super(key: key);

  final int index;
  final String text;
  final dynamic? type;
  final dynamic? optionType;
  final dynamic? values;
  final VoidCallback press;

  @override
  _OptionState createState() => _OptionState();
}

class _OptionState extends State<Option> {
  bool valuefirst = false;
  Widget condition(qnController, parentWidget) {
    Widget wgt;
    String selectedRadio = "false";

    Color getTheRightColor() {
      if (qnController.isAnswered) {
        if (parentWidget.index == qnController.selectedAns) {
          return Colors.blue;
        }
      }
      return kGrayColor;
    }

    // print('in opt---${parentWidget.text}');

    switch (parentWidget.type) {
      case 'multi':
        wgt = CheckboxListTile(
          controlAffinity: ListTileControlAffinity.trailing,
          // secondary: const Icon(Icons.alarm),
          title: Text(
            "${parentWidget.index + 1} ${parentWidget.text}",
            style: TextStyle(color: kGrayColor, fontSize: 16),
          ),
          // subtitle: Text('Ringing after 12 hours'),
          autofocus: false,
          activeColor: Colors.blue,
          checkColor: Colors.white,
          selected: valuefirst,
          dense: true,
          value: valuefirst,
          onChanged: (bool? value) {
            setState(() {
              this.valuefirst = value!;
            });
          },
        );
        break;
      case 'radio':
        wgt = Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${parentWidget.index + 1} ${parentWidget.text}",
              style: TextStyle(color: getTheRightColor(), fontSize: 16),
            ),
            Container(
              height: 26,
              width: 26,
              decoration: BoxDecoration(
                color: getTheRightColor() == kGrayColor
                    ? Colors.transparent
                    : getTheRightColor(),
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: getTheRightColor()),
              ),
              child: Icon(
                Icons.close,
                size: 16,
              ),
            )
          ],
        );
        break;
      default:
        wgt = Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(kDefaultPadding * 0.75),
                  child: Text(
                    "${parentWidget.index + 1} ${parentWidget.text}",
                    style: TextStyle(color: getTheRightColor(), fontSize: 16),
                  ),
                ),

                Widgets(
                    type: parentWidget.optionType, values: parentWidget.values)
                // Expanded(
                //     child: ListView.builder(
                //   scrollDirection: Axis.vertical,
                //   shrinkWrap: true,
                //   physics: NeverScrollableScrollPhysics(),
                //   padding: EdgeInsets.all(kDefaultPadding),
                //   itemCount: parentWidget.values!.length,
                //   itemBuilder: (BuildContext context, int index) {
                //     String dropdownValue = parentWidget.values![0];
                //     return DropdownButton<String>(
                //       value: dropdownValue,
                //       icon: const Icon(Icons.arrow_downward),
                //       iconSize: 24,
                //       elevation: 16,
                //       style: const TextStyle(color: Colors.deepPurple),
                //       underline: Container(
                //         height: 2,
                //         color: Colors.deepPurpleAccent,
                //       ),
                //       onChanged: (String? newValue) {
                //         setState(() {
                //           dropdownValue = newValue!;
                //         });
                //       },
                //       items: (parentWidget.values)
                //           .cast<String>()
                //           .map<DropdownMenuItem<String>>((String value) {
                //         return DropdownMenuItem<String>(
                //           value: value,
                //           child: Text(value),
                //         );
                //       }).toList(),
                //     );
                //     //   RadioListTile<String>(
                //     //   title: Text(parentWidget.values![index],
                //     //       style: Theme.of(context)
                //     //           .textTheme
                //     //           .subtitle1!
                //     //           .copyWith(color: kGrayColor)),
                //     //   value: parentWidget.values![index],
                //     //   groupValue: selectedRadio,
                //     //   onChanged: (val) => {print('vall----$val')},
                //     // );
                //   },
                // ))
              ],
            ),
          ],
        );
    }
    return wgt;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionController>(
        init: QuestionController(),
        builder: (qnController) {
          return InkWell(
            onTap: widget.press,
            child: Container(
              margin: EdgeInsets.only(top: kDefaultPadding),
              padding: EdgeInsets.all(kDefaultPadding),
              // decoration: BoxDecoration(
              //   border: Border.all(color: kGrayColor),
              //   borderRadius: BorderRadius.circular(15),
              // ),
              child: condition(qnController, widget),
            ),
          );
        });
  }
}
