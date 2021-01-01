import 'dart:convert';

import 'package:baldia_app/utils/colors.dart';
import 'package:baldia_app/widget/boxfield.dart';
import 'package:baldia_app/widget/gradient_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'utils/responsive_screen.dart';
class InfractionScreen extends StatefulWidget {
  @override
  _InfractionScreenState createState() => _InfractionScreenState();
}
// ignore: camel_case_types
class _InfractionScreenState extends State<InfractionScreen> {

  TextEditingController _nameController = TextEditingController();
  TextEditingController _infractionTypeController = TextEditingController();
  TextEditingController _activityTypeController = TextEditingController();
  TextEditingController _companyProfileController = TextEditingController();
  TextEditingController _ownerProfileController = TextEditingController();
  TextEditingController _notesController = TextEditingController();

  FocusNode _nameFocusNode = FocusNode();
  FocusNode _infracFocusNode = FocusNode();
  FocusNode _activityFocusNode = FocusNode();
  FocusNode _companyFocusNode = FocusNode();
  FocusNode _ownerFocusNode = FocusNode();
  FocusNode _notesFocusNode = FocusNode();
  bool isLoading = false;
  String name,infractionType,activityType, companyProfile, ownerProfile,notes;
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




  BoxField nameWidget() {
    return BoxField(
        controller: _nameController,
        focusNode: _infracFocusNode,
        hintText: "إسم المنشأة",
        lableText: "إسم المنشأة",
        obscureText: true,
        onSaved: (String val) {
          name = val;
        },
        iconColor: colorCurve);
  }


  BoxField typeWidget() {
    return BoxField(
        controller: _infractionTypeController,
        focusNode: _activityFocusNode,
        hintText: "نوع المخالفة",
        lableText: "نوع النشاط",
        obscureText: true,
        onSaved: (String val) {
          infractionType = val;
        },
        iconColor: colorCurve);
  }


  BoxField typeWidget2() {
    return BoxField(
        controller: _activityTypeController,
        focusNode: _companyFocusNode,
        hintText: "نوع النشاط",
        lableText: "نوع النشاط",
        obscureText: true,
        icon: Icons.lock_outline,
        onSaved: (String val) {
          activityType = val;
        },
        iconColor: colorCurve);
  }


  BoxField econoWidget() {
    return BoxField(
        controller: _companyProfileController,
        focusNode: _ownerFocusNode,
        hintText: "السجل التجاري للمنشأة",
        lableText: "السجل التجاري للمنشأة",
        obscureText: true,
        icon: Icons.lock_outline,
        onSaved: (String val) {
          companyProfile = val;
        },
        iconColor: colorCurve);
  }

  BoxField econoWidget2() {
    return BoxField(
        controller: _ownerProfileController,
        focusNode: _notesFocusNode,
        hintText: "السجل التجاري لصاحب المنشأة",
        lableText: "السجل التجاري لصاحب المنشأة",
        obscureText: true,
        icon: Icons.lock_outline,
        onSaved: (String val) {
          ownerProfile = val;
        },
        iconColor: colorCurve);
  }

  BoxField noteWidgets() {
    return BoxField(
        controller: _notesController,
        hintText: "ملاحظات",
        lableText: "ملاحظات",
        obscureText: true,
        icon: Icons.lock_outline,
        onSaved: (String val) {
          notes = val;
        },
        iconColor: colorCurve);
  }
  BoxField imageWidgets() {
    return BoxField(
        controller: _notesController,
        hintText: "ملاحظات",
        lableText: "ملاحظات",
        defaultBorderColor: Colors.teal[500],
        obscureText: true,
        icon: Icons.camera_alt,
        onSaved: (String val) {
          notes = val;
        },
        iconColor: colorCurve);
  }
  Stack _uploadeImageWidget() {
    double screenWidth = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 10,top: 20),
          child: Material(
            color: Colors.teal[500],
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
              child: Text('إرفاق صور', style: TextStyle(fontFamily: 'ElMessiri',color: Colors.white,fontSize: 18)),
            ),
          ),
        ),

      ],
    );
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
              child: Text('حفظ المخالغة', style: TextStyle(fontFamily: 'ElMessiri',color: Colors.white,fontSize: 18)),
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            logo(),

             nameWidget(),
             typeWidget(),
             typeWidget2(),
             econoWidget(),
             econoWidget2(),
             noteWidgets(),
            _uploadeImageWidget(),
            _signUpButtonWidget()
          ],
        )),
  );

  // _onToLog() {
  //   Navigator.pushReplacement(context,
  //       new MaterialPageRoute(builder: (BuildContext context) => AppSignIn()));
  // }

  _onToSign() {
    Navigator.pushReplacement(context,
        new MaterialPageRoute(builder: (BuildContext context) => InfractionScreen()));
  }
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
