import "package:flutter/material.dart";

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("dale"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text("Você esta Logado"),
              SizedBox(height: 15.0),
              new OutlineButton(
                borderSide: BorderSide(
                      color: Colors.green, style: BorderStyle.solid, width: 3.0),
                child: Text("Logout"),
                onPressed: (){

                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
