import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_in_flutter/main.dart';
import 'RegisterScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

Widget buildUsername() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      SizedBox(height: 10),
      Container(
        margin: EdgeInsets.only(left: 30, right: 30),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
            ]),
        height: 45,
        child: TextField(
          keyboardType: TextInputType.name,
          style: TextStyle(color: Colors.black87),
          decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(left: 14),
              hintText: 'Nimi...',
              hintStyle: TextStyle(color: Color.fromARGB(255, 88, 88, 88))),
        ),
      )
    ],
  );
}

Widget buildPassword() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      SizedBox(height: 10),
      Container(
        margin: EdgeInsets.only(left: 30, right: 30),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
            ]),
        height: 45,
        child: TextField(
          obscureText: true,
          style: TextStyle(color: Colors.black87),
          decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(left: 14),
              hintText: 'Salasana...',
              hintStyle: TextStyle(color: Color.fromARGB(255, 88, 88, 88))),
        ),
      )
    ],
  );
}

Widget buildRegisterBtn() {
  return Container(
    margin: EdgeInsets.only(left: 100, right: 100),
    width: double.infinity,
    child: ElevatedButton(
      onPressed: () => {runApp(RegisterScreen())},
      style: ElevatedButton.styleFrom(
        primary: Color.fromARGB(255, 228, 228, 228),
        shadowColor: Colors.transparent,
      ),
      child: Text(
        'Rekisteröidy',
        style: TextStyle(
          color: Color.fromARGB(255, 131, 131, 131),
          fontSize: 17,
          fontWeight: FontWeight.normal,
        ),
      ),
    ),
  );
}

Widget buildLoginBtn() {
  return Container(
    margin: EdgeInsets.only(left: 100, right: 100),
    width: double.infinity,
    child: ElevatedButton(
      onPressed: () => {runApp(MyApp())},
      style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(15),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
      child: Text(
        'Kirjaudu',
        style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.normal,
        ),
      ),
    ),
  );
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Kirjaudu'),
          elevation: 2,
        ),
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: GestureDetector(
            child: Stack(
              children: <Widget>[
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 228, 228, 228),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Google Maps In Flutter',
                        style: TextStyle(
                          color: Color.fromARGB(255, 17, 113, 158),
                          fontSize: 25,
                        ),
                      ),
                      SizedBox(height: 10),
                      buildUsername(),
                      buildPassword(),
                      buildRegisterBtn(),
                      buildLoginBtn(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
