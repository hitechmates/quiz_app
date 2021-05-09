import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/widgets/custom_textfield.dart';
import 'package:quiz_app/widgets/main_action_button.dart';

class ProfileScreen extends StatelessWidget {

   TextEditingController? nameController;
   TextEditingController? genderController;
   TextEditingController? emailIdController;
   TextEditingController? phoneNumberController;
   TextEditingController? dobController;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
        backgroundColor: kdarkBlue,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus &&
              currentFocus.focusedChild != null) {
            currentFocus.focusedChild!.unfocus();
          }
        },
        child: Container(
          width: size.width,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SizedBox(
                    width: 350,
                    child: CustomTextField(
                      controller: nameController,
                      labelText: 'Name',
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SizedBox(
                    width: 350,
                    child: CustomTextField(
                      controller: emailIdController,
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.email),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SizedBox(
                    width: 350,
                    child: CustomTextField(
                      controller: genderController,
                      labelText: 'Gender',
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SizedBox(
                    width: 350,
                    child: CustomTextField(
                      controller: phoneNumberController,
                      labelText: 'PhoneNumber',
                      prefixIcon: Icon(Icons.phone),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SizedBox(
                    width: 350,
                    child: CustomTextField(
                      controller: dobController,
                      labelText: 'Date of birth',
                      prefixIcon: Icon(Icons.calendar_today_outlined),
                    ),
                  ),
                ),
                SizedBox(
                  width: 350,
                  child: MainActionButton(
                    label: 'Save',
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
