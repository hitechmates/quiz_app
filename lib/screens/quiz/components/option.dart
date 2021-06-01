import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:quiz_app/controllers/question_controller.dart';
import 'package:quiz_app/screens/quiz/components/widgets.dart';

import '../../../constants.dart';

class Option extends StatefulWidget {
  const Option({
    Key? key,
    required this.options,
    this.type,
  }) : super(key: key);

  final List options;
  final dynamic? type;

  @override
  _OptionState createState() => _OptionState();
}

class _OptionState extends State<Option> {
  String _selectedRadio = "";
  bool valuefirst = false;
  List<String> _selectedCheckboxItems = [];

  List<Widget> condition() {
    List<Widget> wgt;

    switch (widget.type) {
      case 'radio':
        wgt = widget.options
            .map<Widget>((data) => Padding(
                  padding: const EdgeInsets.all(10),
                  child: RadioListTile<String>(
                    title: Text(
                      "${data.text}",
                      style: TextStyle(fontSize: 16),
                    ),
                    groupValue: _selectedRadio,
                    value: data.text,
                    onChanged: (val) {
                      setState(() {
                        debugPrint('VAL = $val');
                        _selectedRadio = data.text;
                      });
                    },
                  ),
                ))
            .toList();
        break;

      case 'checbox':
        // var valueFirst = {data.text: false};
        print("2222222");
        // wgt = CheckboxListTile(
        //   controlAffinity: ListTileControlAffinity.trailing,
        //   // secondary: const Icon(Icons.alarm),
        //   title: Text(
        //     "${data.text}",
        //     style: TextStyle(color: kGrayColor, fontSize: 16),
        //   ),
        //   // subtitle: Text('Ringing after 12 hours'),
        //   autofocus: false,
        //   activeColor: Colors.blue,
        //   checkColor: Colors.white,
        //   // selected: valueFirst[data.text]!,
        //   dense: true,
        //   value: valueFirst[data.text],
        //   onChanged: (bool? value) {
        //     setState(() {
        //       print("value==${value}");
        //       valueFirst['index'] = value!;
        //       print("value==${valueFirst}");
        //     });
        //   },
        // );
        wgt = [new Container()];
        break;
      default:
        wgt = [new Container()];
    }

    return wgt;
  }

  @override
  Widget build(BuildContext context) {
    print("1111111111");
    return Container(
      margin: EdgeInsets.only(top: kDefaultPadding1),
      padding: EdgeInsets.all(kDefaultPadding1),
      // decoration: BoxDecoration(
      //   border: Border.all(color: kGrayColor),
      //   borderRadius: BorderRadius.circular(15),
      // ),
      child: Container(
        // margin: EdgeInsets.all(kDefaultPadding),
        padding: EdgeInsets.all(kDefaultPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: condition(),
          // widget.options
          //     .map<Widget>((data) => Padding(
          //           padding: const EdgeInsets.all(10),
          //           child: condition(data),
          //         ))
          //     .toList(),
        ),
      ),
    );
  }
}
