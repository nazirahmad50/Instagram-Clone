import 'package:flutter/material.dart';
import 'package:instagram_clone/screens/signup_screen.dart';
import 'package:instagram_clone/services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  static final String id =
      "login_screen"; // access variable id without making instance of login screen

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>(); // needed for validation
  String _email, _password;

  _submit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      //loginIn user
      AuthService.login(context, _email, _password);
    }
  }

  Widget emailField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: TextFormField(
        decoration: InputDecoration(labelText: "Email"),
        validator: (input) =>
            !input.contains("@") ? "Please enter a valid email" : null,
        onSaved: (input) => _email = input,
      ),
    );
  }

  Widget passwordField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: TextFormField(
        decoration: InputDecoration(labelText: "Password"),
        validator: (input) =>
            input.length < 6 ? "Must be at least 6 characters" : null,
        onSaved: (input) => _password = input,
        obscureText: true,
      ),
    );
  }

  Widget signinBtn() {
    return Container(
      width: 250,
      child: FlatButton(
        padding: EdgeInsets.all(10),
        onPressed: _submit,
        color: Colors.blue,
        child: Text(
          "Signin",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }

  Widget goToSignupBtn() {
    return Container(
      width: 250,
      child: FlatButton(
        padding: EdgeInsets.all(10),
        onPressed: () => Navigator.pushNamed(context,SignupScreen.id),
        color: Colors.blue,
        child: Text(
          "Go to Signup",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height, //size of screen
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "Instagram",
                style: TextStyle(fontSize: 50, fontFamily: "Billabong"),
              ),
              Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    emailField(),
                    passwordField(),
                    SizedBox(
                      height: 20,
                    ),
                    signinBtn(),
                    SizedBox(height: 20),
                    goToSignupBtn(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
