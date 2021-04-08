import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salesappmobile/Bloc/Login/bloc/loginbloc_bloc.dart';
import 'package:salesappmobile/Util/Util.dart';
import 'package:salesappmobile/View/Dashboard/Dashboard.dart';

class LoginScreen extends StatefulWidget {
  static const idScreen = "login";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

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
                height: 10.0,
              ),

              Text(
                "Login Sales",
                style: TextStyle(fontSize: 40.0),
                textAlign: TextAlign.center,
              ),

              BlocListener<LoginblocBloc, LoginblocState>(
                listener: (context, state) {
                  if (state is LoginSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        duration: const Duration(seconds: 4),
                        content: Text(state.loginMessage.toString())));
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return Dashboard();
                    }));
                  }
                  if (state is LoginblocFailure) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        duration: const Duration(seconds: 4),
                        content: Text(state.errorMessage)));
                  }
                },
                child: BlocBuilder<LoginblocBloc, LoginblocState>(
                    builder: (context, state) {
                  print(state);
                  return Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          TextFormField(
                            controller: emailController,
                            validator: (value) {
                              if (value == null ||
                                  value.isEmpty ||
                                  !value.contains("@")) {
                                return 'Field must have '
                                    "@"
                                    ' or enter some text';
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
                            controller: passwordController,
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
                          if (state is LoginblocLoading)
                            Center(
                              child: CircularProgressIndicator(),
                            )
                          else
                            ElevatedButton(
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  fontSize: 18.0,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: colorRedFigma,
                                onPrimary: Colors.white,
                                minimumSize:
                                    Size(MediaQuery.of(context).size.width, 50),
                                shape: const BeveledRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))),
                              ),
                              onPressed: () {
                                if (_formKey.currentState.validate()) {
                                  BlocProvider.of<LoginblocBloc>(context).add(
                                    LoginButtonPressed(
                                        email: "sinarmaslog01@gmail.com",
                                        password: "sinarmas"),
                                  );
                                }
                              },
                            ),
                        ],
                      ),
                    ),
                  );
                }),
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
