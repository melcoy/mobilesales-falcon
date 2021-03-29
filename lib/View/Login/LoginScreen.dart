import 'package:flutter/material.dart';
import 'package:salesappmobile/Util/Util.dart';
import 'package:salesappmobile/View/Dashboard/Dashboard.dart';

class LoginScreen extends StatefulWidget {
  static const idScreen = "login";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 35.0,
              ),
              // Image(
              //   image: AssetImage("images/logo.png"),
              //   width: 390.0,
              //   height: 250.0,
              //   alignment: Alignment.center,
              // ),
              SizedBox(
                height: 1.0,
              ),

              Text(
                "Login as a Sales",
                style: TextStyle(fontSize: 24.0),
                textAlign: TextAlign.center,
              ),
              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextFormField(
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              !value.contains("@")) {
                            return 'Field must have ' "@" ' or enter some text';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            labelText: "Email",
                            labelStyle: TextStyle(fontSize: 14.0),
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 10.0,
                            )),
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter Password';
                          }
                          return null;
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                            labelText: "Password",
                            labelStyle: TextStyle(fontSize: 14.0),
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 10.0,
                            )),
                        style: TextStyle(fontSize: 14.0),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      RaisedButton(
                        color: colorRedFigma,
                        textColor: Colors.white,
                        child: Container(
                          height: 50.0,
                          child: Center(
                            child: Text(
                              "Login",
                              style: TextStyle(
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                        ),
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(24.0),
                        ),
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            // If the form is valid, display a snackbar. In the real world,
                            // you'd often call a server or save the information in a database.
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Login Data')));
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) {
                              return Dashboard();
                            }));
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),

              FlatButton(
                child: Text("Do not have an Account ? Register Here"),
                onPressed: () {
                  // Navigator.pushNamedAndRemoveUntil(
                  //     context, RegistrationScreen.idScreen, (route) => false);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
