import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controllers/question_controller.dart';

import '../../../constants.dart';

class Widgets extends StatefulWidget {
  const Widgets({Key? key, this.values, this.type}) : super(key: key);

  final List<String>? values;
  final dynamic? type;

  @override
  _WidgetsState createState() => _WidgetsState();
}

class _WidgetsState extends State<Widgets> {
  @override
  Widget build(BuildContext context) {
    Widget wgt;

    switch (widget.type) {
      case 'text':
        wgt = TextFormField(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: "",
            hintStyle: const TextStyle(color: kSecondaryColor),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.cyan),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.cyan),
            ),
          ),
        );
        break;
      case 'select':
        String dropdownValue = widget.values![0];
        wgt = DropdownButton<String>(
          isExpanded: true,
          value: dropdownValue,
          // isExpanded: true,
          dropdownColor: Colors.white,
          icon: Icon(
            Icons.arrow_downward,
            size: 24,
            color: kGrayColor,
          ),
          elevation: 16,
          style: const TextStyle(color: Colors.deepPurple),
          underline: Container(
            height: 2,
            width: 100,
            color: kGrayColor,
          ),
          onChanged: (String? newValue) {
            setState(() {
              dropdownValue = newValue!;
            });
          },
          items: (widget.values!)
              .cast<String>()
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
                value: value,
                child: Text(value,
                    style: TextStyle(
                      color: kBlackColor,
                    )));
          }).toList(),
        );
        break;
      default:
        wgt = Text(
          "text",
          style: TextStyle(color: Colors.amber),
        );
    }

    return wgt;
  }
}
