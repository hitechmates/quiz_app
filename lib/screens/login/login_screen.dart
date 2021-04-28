import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/constants.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Spacer(
                  flex: 2,
                ),
                TextFormField(
                  obscureText: false,
                  style: Theme.of(context)
                      .textTheme
                      .button
                      .copyWith(color: Colors.white),
                  // controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  autocorrect: false,
                  // validator: (val) => _validateEmail(val, 'Email'),
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.mail_outline),
                      filled: true,
                      fillColor: Color(0xFF1C2341),
                      // contentPadding:
                      //     EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      hintText: 'Email',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)))),
                ),
                Spacer(),
                TextFormField(
                  obscureText: false,
                  style: Theme.of(context)
                      .textTheme
                      .button
                      .copyWith(color: Colors.white),
                  // controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  autocorrect: false,
                  // validator: (val) => _validateEmail(val, 'Email'),
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.vpn_key),
                      filled: true,
                      fillColor: Color(0xFF1C2341),
                      // contentPadding:
                      //     EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      hintText: 'Password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)))),
                ),
                Spacer(),
                InkWell(
                  // onTap: () => Get.to(QuizScreen()),
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(kDefaultPadding * 0.75), //15
                    decoration: BoxDecoration(
                        gradient: kPrimaryGradient,
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    child: Text(
                      "Login",
                      style: Theme.of(context)
                          .textTheme
                          .button
                          .copyWith(color: Colors.black),
                    ),
                  ),
                ),
                Spacer(
                  flex: 2,
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
