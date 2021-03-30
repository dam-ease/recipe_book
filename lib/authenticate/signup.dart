import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
import 'package:recipe_book/components/rounded_button.dart';
import 'package:recipe_book/constants.dart';
import 'package:recipe_book/models/user.dart';
import 'package:recipe_book/services/auth.dart';
import 'package:recipe_book/services/database.dart';

class SignUp extends StatefulWidget {
  final Function toggleView;
  SignUp({this.toggleView});
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool showSpinner = false;
  String email = '';
  String password = '';
  String error = '';
  String username = '';

  String validateEmail(String value) {
    Pattern pattern = r"^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$";
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Enter a valid email address';
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;
    final user = Provider.of<User>(context);
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
                padding: EdgeInsets.fromLTRB(width * 0.055, height * 0.139,
                    width * 0.055, height * 0.078),
                constraints: BoxConstraints.expand(),
                child: SafeArea(
                    child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
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
                          height: height * 0.1148,
                        ),
                        TextFormField(
                          validator: (value) =>
                              value.isEmpty ? 'Enter a Username' : null,
                          onChanged: (value) {
                            setState(() {
                              username = value;
                            });
                          },
                          keyboardType: TextInputType.name,
                          decoration:
                              kInputDecoration.copyWith(hintText: 'UserName'),
                        ),
                        SizedBox(
                          height: height * 0.025,
                        ),
                        TextFormField(
                          validator: validateEmail,
                          keyboardType: TextInputType.emailAddress,
                          decoration:
                              kInputDecoration.copyWith(hintText: 'Email'),
                          onChanged: (value) {
                            setState(() {
                              email = value;
                            });
                          },
                        ),
                        SizedBox(
                          height: height * 0.025,
                        ),
                        TextFormField(
                          onChanged: (value) {
                            setState(() {
                              password = value;
                            });
                          },
                          validator: (value) => value.length < 6
                              ? 'Enter a Password 6+ chars long'
                              : null,
                          obscureText: true,
                          decoration:
                              kInputDecoration.copyWith(hintText: 'Password'),
                        ),
                        SizedBox(
                          height: height * 0.009375,
                        ),
                        GestureDetector(
                          child: Text(
                            'Already have an account?',
                            style: kForgotStyle,
                            textAlign: TextAlign.right,
                          ),
                          onTap: () {
                            widget.toggleView();
                          },
                        ),
                        SizedBox(
                          height: height * 0.039,
                        ),
                        GestureDetector(
                          onTap: () async {
                            if (_formKey.currentState.validate()) {
                              setState(() {
                                showSpinner = true;
                              });

                              dynamic result =
                                  await _auth.registerWithEmailAndPassword(
                                      email, password, username);
                              if (result == null) {
                                setState(() {
                                  error =
                                      'Could not sign up with those credentials';
                                  showSpinner = false;
                                });
                              }
                            }
                          },
                          child: RoundedButton(
                            displayText: 'Sign Up',
                            bgColor: Colors.white,
                            textColor: Color.fromRGBO(52, 168, 83, 0.8),
                          ),
                        ),
                        SizedBox(height: height * 0.01875),
                        Text(
                          error,
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 14.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
              ),
              Positioned(
                  top: height * 0.1953,
                  right: width * 0.0555,
                  child: Container(
                    height: height * 0.08125,
                    width: width * 0.1444,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage("images/logo.png"),
                      fit: BoxFit.contain,
                    )),
                  ))
            ],
          )),
    );
  }
}
