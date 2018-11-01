import 'package:flutter/material.dart';
import "package:firebase_database/firebase_database.dart";
import "signup.dart";
import 'remember.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/signup': (BuildContext context) => new SignupPage(),
        '/remember': (BuildContext context) => new RememberPage()
      },
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  String _email;
  String _senha;

  void _sendData(){
    DatabaseReference ref = FirebaseDatabase.instance.reference();
    var data = {
      "Email": _email,
      "Senha": _senha,
    };
    ref.child('Usuario').push().set(data);
  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
        key: _formKey,
        resizeToAvoidBottomPadding: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                    child: Text('Barber',
                        style: TextStyle(
                            fontSize: 60.0, fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(16.0, 175.0, 0.0, 0.0),
                    child: Text('Selector',
                        style: TextStyle(
                            fontSize: 60.0, fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(240.0, 160.0, 0.0, 0.0),
                    child: Text('.',
                        style: TextStyle(
                            fontSize: 80.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.green)),
                  )
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                        decoration: InputDecoration(labelText: 'EMAIL',
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.green))),
                        validator: (value) => !value.contains('@') ? 'Email é Invalido': null,
                        onSaved: (value) => _email = value,
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                        decoration: InputDecoration(labelText: 'SENHA',
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.green))),
                      validator: (value) => value.length < 6 ? 'Senha muito curta': null,
                      onSaved: (value) => _senha = value,
                      obscureText: true,


                    ),
                    SizedBox(height: 5.0),
                    Container(
                      alignment: Alignment(1.0, 0.0),
                      padding: EdgeInsets.only(top: 15.0, left: 20.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed('/remember');
                        },
                        child: Text(
                          'Esqueci a senha',
                          style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat',
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ),
                    SizedBox(height: 40.0),
                    Container(
                      height: 40.0,
                      child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        shadowColor: Colors.greenAccent,
                        color: Colors.green,
                        elevation: 7.0,
                        child: FlatButton(
                          onPressed: ()
    {
    if(_formKey.currentState.validate()){
    Scaffold.of(context).showSnackBar(SnackBar(content: Text('Processando')));
    _sendData;
    }
    },
                          child: Center(
                            child: Text(
                              'LOGIN',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat'),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Container(
                      height: 40.0,
                      color: Colors.transparent,
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.black,
                                style: BorderStyle.solid,
                                width: 1.0),
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Center(
                              child:
                              ImageIcon(AssetImage('assets/facebook.png')),
                            ),
                            SizedBox(width: 10.0),
                            Center(
                              child: Text('Entrar com o Facebook',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat')),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                )),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Novo no BarberSelector ?',
                  style: TextStyle(fontFamily: 'Montserrat'),
                ),
                SizedBox(width: 4.0),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed('/signup');
                  },
                  child: Text(
                    'Registre-se',
                    style: TextStyle(
                        color: Colors.green,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline),
                  ),
                )
              ],
            )
          ],
        ));
  }
}


/*import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
//import 'package:firebase_auth/firebase_auth.dart';

//Pages
import 'homepage.dart';
import 'signuppage.dart';
import 'loginpage.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: LoginPage(),
      routes: <String, WidgetBuilder>{
        "/landingpage": (BuildContext context) => new MyApp(),
        "/signup": (BuildContext context) => new SignupPage(),
        "/login":  (BuildContext context) => new LoginPage(),
        "/homepage": (BuildContext context) => new HomePage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void _incrementBarber() {

    DatabaseReference ref = FirebaseDatabase.instance.reference();
    var data = {
      "name":'Joao',
      "sobrenome":"Heterotop",
      "Barbearia":'TopMan'
    };
    ref.child('Barbeiro').push().set(data);
  }

  void _incrementUser() {

    DatabaseReference ref = FirebaseDatabase.instance.reference();
    var data = {
      "name":'Emanoel',
      "sobrenome":"Homotop",
    };
    ref.child('Usuario').push().set(data);
  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
              child: new FloatingActionButton(onPressed: _incrementUser,
                child: new Icon(Icons.account_box),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
              child: new FloatingActionButton(onPressed: _incrementBarber,
              child: new Icon(Icons.content_cut),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/