import 'dart:convert';

import 'package:baldia_app/utils/colors.dart';
import 'package:baldia_app/widget/boxfield.dart';
import 'package:baldia_app/widget/gradient_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'utils/responsive_screen.dart';
class AppSignIn extends StatefulWidget {
  @override
  _AppSignInState createState() => _AppSignInState();
}
// ignore: camel_case_types
class _AppSignInState extends State<AppSignIn> {

  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  FocusNode _phoneFocusNode = FocusNode();
  FocusNode _passFocusNode = FocusNode();
  bool isLoading = false;
  String firtsName,lastName,phone, email, password,confirmPassword;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final  _formKey = GlobalKey<FormState>();

  Screen size;
  var reg = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  int postStatus;
  String message;
  // ignore: missing_return


  @override
  Widget build(BuildContext context) {
    size = Screen(MediaQuery.of(context).size);

    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: backgroundColor,
        resizeToAvoidBottomInset: true,
        body: Stack(children: <Widget>[
          ClipPath(
              child: Container(
                color: colorCurve,
              )),
          SingleChildScrollView(
            child: SafeArea(
              top: true,
              bottom: false,
              child: Container(
                margin: EdgeInsets.symmetric(
                    horizontal: size.getWidthPx(20),
                    vertical: size.getWidthPx(20)),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(
                              Icons.arrow_back,
                              color: colorCurve,
                            ),
                            onPressed: () => Navigator.pop(context, false),
                          ),
                          SizedBox(width: size.getWidthPx(10)),

                        ],
                      ),
                      SizedBox(height: size.getWidthPx(10)),
                      registerFields(),
                    ]),
              ),
            ),
          )
        ]));
  }




  Image logo() {
    return   Image.asset("assets/images/log.png");
  }


  BoxField _personalID() {
    return BoxField(
        controller: _phoneNumberController,
        focusNode: _phoneFocusNode,
        hintText: "رقم الهوية",
        lableText: "رقم الهوية",
        keyboardType: TextInputType.number,
        obscureText: false,
        onSaved: (String val) {
          phone = val;
        },
        onFieldSubmitted: (String value) {
          FocusScope.of(context).requestFocus(_passFocusNode);
        },
        icon: Icons.phone_android,
        iconColor: colorCurve);
  }



  BoxField _passwordWidget() {
    return BoxField(
        controller: _passwordController,
        focusNode: _passFocusNode,
        hintText: " كلمة السر",
        lableText: "كلمة السر",
        obscureText: true,
        icon: Icons.lock_outline,
        onSaved: (String val) {
          password = val;
        },
        iconColor: colorCurve);
  }



  Stack _signUpButtonWidget() {
    double screenWidth = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 10,top: 20),
          child: Material(
            color: Colors.lightGreen,
            borderRadius: BorderRadius.circular(10.0),
            shadowColor: Colors.yellowAccent,
            elevation: 5.0,
            child: MaterialButton(
              //minWidth: 200.0,
              height: 50.0,
              minWidth: 350,
              onPressed: () {



                // }

              },
              child: Text('تسجيل الدحول', style: TextStyle(fontFamily: 'ElMessiri',color: Colors.white,fontSize: 18)),
            ),
          ),
        ),

      ],
    );
  }


  registerFields() => Container(
    child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            logo(),

            _personalID(),
            _passwordWidget(),
            _signUpButtonWidget()
          ],
        )),
  );

  // _onToLog() {
  //   Navigator.pushReplacement(context,
  //       new MaterialPageRoute(builder: (BuildContext context) => AppSignIn()));
  // }

  Future<void> _wrongPost() async {
    _scaffoldKey.currentState.showSnackBar(
      new SnackBar(duration: new Duration(seconds: 40), content:
      new Row(
        children: <Widget>[
          new Text("wrong.")
        ],
      ),
      ),
    );
  }
}
