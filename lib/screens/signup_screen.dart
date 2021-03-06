import 'package:flutter/material.dart';
import 'package:instagram_clone/services/auth_service.dart';

class SignupScreen extends StatefulWidget {
  static final String id =
      "signup_screen"; // access variable id without making instance of signup_screen screen

  @override
  _State createState() => _State();
}

class _State extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>(); // needed for validation
  String _email, _password, _name;

  void _submit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      //Signup user
      AuthService.signUpUser(context, _name, _email, _password);
    }
  }

  Widget nameField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: TextFormField(
        decoration: InputDecoration(labelText: "Name"),
        validator: (input) =>
            input.trim().isEmpty ? "Please enter a valid name" : null,
        onSaved: (input) => _name = input,
      ),
    );
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

  Widget signupBtn() {
    return Container(
      width: 250,
      child: FlatButton(
        padding: EdgeInsets.all(10),
        onPressed: _submit,
        color: Colors.blue,
        child: Text(
          "Signup",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }

  Widget backToLoginBtn() {
    return Container(
      width: 250,
      child: FlatButton(
        padding: EdgeInsets.all(10),
        onPressed: () => Navigator.pop(context),
        color: Colors.blue,
        child: Text(
          "Back to Login",
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
                    nameField(),
                    emailField(),
                    passwordField(),
                    SizedBox(
                      height: 20,
                    ),
                    signupBtn(),
                    SizedBox(height: 20),
                    backToLoginBtn(),
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
