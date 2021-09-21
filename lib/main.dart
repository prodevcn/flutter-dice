// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'dice.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, title: 'Dice game', home: Login());
  }
}

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  
  TextEditingController controller = TextEditingController();
  TextEditingController controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log in'),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 50)),
              Center(
                child: Image(
                  image: AssetImage('image/chef.gif'),
                  width: 170.0,
                  height: 190.0,
                ),
              ),
              Form(
                child: Theme(
                  data: ThemeData(
                    primaryColor: Colors.teal,
                    inputDecorationTheme: InputDecorationTheme(
                      labelStyle: TextStyle(color: Colors.teal, fontSize: 15.0),
                    ),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(40.0),
                    child: Column(
                      children: [
                        TextField(
                          controller: controller,
                          decoration: InputDecoration(
                            labelText: 'Enter dice',
                          ),
                          keyboardType: TextInputType.datetime,
                        ),
                        TextField(
                          controller: controller2,
                          decoration:
                              InputDecoration(labelText: 'Enter password'),
                          keyboardType: TextInputType.text,
                          obscureText: true,
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        ButtonTheme(
                          minWidth: 100.0,
                          height: 50.0,
                          child: ElevatedButton(
                            child: Icon(Icons.arrow_right),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.redAccent
                            ),
                            onPressed: () {
                              if (controller.text == "dice" && controller2.text == "1234") {
                                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Dice()));
                              } else if (controller.text == "dice" && controller2.text != "1234") {
                                showSnakBar(context, 'wrong password');
                              } else if (controller.text != "dice" && controller2.text == "1234") {
                                showSnakBar(context, 'please check "dice"');
                              } else {
                                showSnakBar(context, 'Please fill');
                              }
                            },
                          )
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

void showSnakBar(BuildContext context, String msg) {
   ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        msg,
        textAlign: TextAlign.center,
        
      ),
      backgroundColor: Colors.black,
      duration: Duration(milliseconds: 2000),
    )
  );
}