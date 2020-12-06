import 'package:flutter/material.dart';
import 'package:recipe_book/components/rounded_button.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:recipe_book/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:recipe_book/screens/recipe_search.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _auth = FirebaseAuth.instance;
  final textController1 = TextEditingController();
  final textController2 = TextEditingController();
  final textController3 = TextEditingController();

  showAlertDialog(BuildContext context) {
    Widget okButton = FlatButton(
      onPressed: () {
        Navigator.pop(context);
      },
      child: Text("OK"),
    );
    AlertDialog alert = AlertDialog(
      title: Text('Error'),
      content: Text('No Field should be empty'),
      actions: [
        okButton,
      ],
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }

  checkIfEmpty() async {
    String email, name, password;
    name = textController1.text;
    email = textController2.text;
    password = textController3.text;

    if (name == '' || email == '' || password == '') {
      showAlertDialog(context);
    } else {
      setState(() {
        showSpinner = true;
      });
      try {
        final newUser = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        if (newUser != null) {
          Navigator.pushNamed(context, 'fourth');
        }
        setState(() {
          showSpinner = false;
        });
      } catch (e) {
        print(e);
      }
    }
  }

  String validateEmail(String value) {
    Pattern pattern = r"^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$";
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Enter a valid email address';
    } else {
      return null;
    }
  }

  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/img13.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              padding: EdgeInsets.fromLTRB(20, 89, 20, 50),
              constraints: BoxConstraints.expand(),
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Welcome to',
                        style: kFirstStyle,
                      ),
                      Text(
                        'Recipe Book',
                        style: kSecondStyle,
                      ),
                      SizedBox(
                        height: 73.5,
                      ),
                      TextFormField(
                        controller: textController1,
                        keyboardType: TextInputType.name,
                        decoration:
                            kInputDecoration.copyWith(hintText: 'UserName'),
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      TextFormField(
                        validator: validateEmail,
                        controller: textController2,
                        keyboardType: TextInputType.emailAddress,
                        decoration:
                            kInputDecoration.copyWith(hintText: 'Email'),
                        onChanged: (value) => value,
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      TextFormField(
                        controller: textController3,
                        obscureText: true,
                        decoration:
                            kInputDecoration.copyWith(hintText: 'Password'),
                      ),
                      SizedBox(
                        height: 6.0,
                      ),
                      GestureDetector(
                        child: Text(
                          'Already have an account?',
                          style: kForgotStyle,
                          textAlign: TextAlign.right,
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, 'second');
                          print('Already have an account');
                        },
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      GestureDetector(
                        onTap: () {
                          checkIfEmpty();
                        },
                        child: RoundedButton(
                          displayText: 'Sign Up',
                          bgColor: Colors.white,
                          textColor: Color.fromRGBO(52, 168, 83, 0.8),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
                top: 125.0,
                right: 20.0,
                child: Container(
                  height: 52.0,
                  width: 52.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage("images/logo.png"),
                    fit: BoxFit.contain,
                  )),
                ))
          ],
        ),
      ),
    );
  }
}
