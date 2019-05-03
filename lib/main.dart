import 'package:flutter/material.dart';

import 'userinterface.dart';

void main() => runApp(MaterialApp(
      home: LoginPage(),
    ));

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email, password;
  bool isLoggedIn=false;
  final myGlobalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Log In "),
      ),
      body: Form(
        key: myGlobalKey,
        child: Container(
          child: Column(
            children: <Widget>[
              emailField(),
              passwordFeild(),
              RaisedButton(
                  child:
                      Text("Go To Calculator", style: TextStyle(fontSize: 25)),
                  elevation: 2,
                  onPressed: () {
                    var form = myGlobalKey.currentState;
                    if (form.validate()) {
                      form.save();
                      setState(() {
                        isLoggedIn = !isLoggedIn;
                      });
                      Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => new CalculatorInterface()),
                      );
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }

  passwordFeild() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        obscureText: true,
        validator: (value) {
          print(value);
          return  value.isEmpty ? "Not a Valid password!":null;
        },
        onSaved: (value) {
          password = value;
        },
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          icon: Icon(
            Icons.remove_red_eye,
            size: 40,
          ),
          hintText: "Enter Your Password",
        ),
        style: TextStyle(
          fontSize: 20,
          fontStyle: FontStyle.normal,
        ),
      ),
    );
  }

  emailField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        validator: (value) {
          print(value);
          return !value.contains('@') ? "Not a Valid Email!" : null;
        },
        onSaved: (value) {
          email = value;
        },
        decoration: InputDecoration(
          disabledBorder: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          icon: Icon(
            Icons.person,
            size: 40,
          ),
          hintText: "Enter Your Email",
        ),
        style: TextStyle(
          fontSize: 20,
          fontStyle: FontStyle.normal,
        ),
      ),
    );
  }
}
