import 'package:flutter/material.dart';
import '../helpers/auth.dart';
import '../helpers/http_exception.dart';

enum AuthMode { login, signup }

class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: AuthBox(),
      ),
    );
  }
}

class AuthBox extends StatefulWidget {
  @override
  _AuthBoxState createState() => _AuthBoxState();
}

class _AuthBoxState extends State<AuthBox> {
  var formKey = GlobalKey<FormState>();
  var authMode = AuthMode.login;
  var userInfo = {
    "email": "",
    "username": "",
    "password": "",
  };

  void submit() async {
    FocusScope.of(context).unfocus();
    bool isValid = formKey.currentState.validate();
    if (!isValid) return;
    formKey.currentState.save();
    if (authMode == AuthMode.login) {
      try {
        await login(
          userInfo["email"].trim(),
          userInfo["password"].trim(),
        );
      } on HttpException catch (e) {
        Scaffold.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              e.toString(),
              textAlign: TextAlign.center,
            )));
      } catch (e) {
        print(e);
      }
    } else {
      try {
        await signin(
          userInfo["email"].trim(),
          userInfo["password"].trim(),
          userInfo["username"].trim(),
        );
      } catch (e) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        width: 300,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 125,
              child: Text(
                "Weabook",
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),
              alignment: Alignment.center,
            ),
            Divider(
              thickness: 2,
            ),
            Container(
              height: 35,
              child: Text(
                authMode == AuthMode.login ? "Login" : "Sign-Up",
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      initialValue: userInfo["email"],
                      decoration: InputDecoration(hintText: "Email"),
                      validator: (value) {
                        if (value.isEmpty || !value.contains("@"))
                          return "Please enter a valid email";
                        return null;
                      },
                      onSaved: (newValue) {
                        userInfo['email'] = newValue;
                      },
                    ),
                    SizedBox(height: 5),
                    if (authMode == AuthMode.signup)
                      TextFormField(
                        decoration: InputDecoration(hintText: "Username"),
                        validator: (value) {
                          if (value.isEmpty)
                            return "Please enter a valid username";
                          return null;
                        },
                        onSaved: (newValue) {
                          userInfo["username"] = newValue;
                        },
                      ),
                    if (authMode == AuthMode.signup) SizedBox(height: 10),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(hintText: "Password"),
                      initialValue: userInfo["password"],
                      validator: (value) {
                        if (value.isEmpty || value.length <= 7)
                          return "Password must at least 7 characters long";
                        return null;
                      },
                      onSaved: (newValue) {
                        userInfo["password"] = newValue;
                      },
                    ),
                    SizedBox(height: 20),
                    RaisedButton(
                      onPressed: submit,
                      child: Text(
                          authMode == AuthMode.login ? "Login" : "Register"),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: FlatButton(
                child: Text(
                  authMode == AuthMode.login
                      ? "Create an Account"
                      : "I Already Have Account",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                onPressed: () {
                  setState(() {
                    authMode = authMode == AuthMode.login
                        ? AuthMode.signup
                        : AuthMode.login;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
