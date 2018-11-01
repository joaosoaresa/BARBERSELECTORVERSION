import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() =>  _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  String _email;
  String _senha;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body:  Center(
          child: Container(
              padding: EdgeInsets.all(25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextField(
                      decoration: InputDecoration(hintText: "Email"),
                      onChanged: (value){
                        setState(() {
                          _email = value;
                        });
                      }
                  ),
                  SizedBox(height: 15.0),
                  TextField(
                      decoration: InputDecoration(hintText: "Senha") ,
                      onChanged: (value){
                        setState(() {
                          _senha = value;
                        });
                      }
                  ),
                  SizedBox(height: 20.0),
                  RaisedButton(
                    child: Text("Login"),
                    color: Colors.green,
                    textColor: Colors.white,
                    elevation: 7.0,
                    onPressed: (){

                    },
                  ),
                  SizedBox(height: 20.0),
                  Text("Dale"),
                  SizedBox(height: 10.0),
                  RaisedButton(
                    child: Text("Sign up"),
                    color: Colors.green,
                    textColor: Colors.white,
                    elevation: 7.0,
                    onPressed: (){

                    },
                  ),
                ],
              )),
        ));
  }
}
