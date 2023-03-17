import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_in_flutter/main.dart';

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
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color:  Colors.black26,
              blurRadius: 6,
              offset: Offset(0,2)
            )
          ]
        ),
        height: 60,
        child: TextField(
          keyboardType: TextInputType.name,
          style: TextStyle(
            color: Colors.black87
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(left: 14),
            hintText: 'Nimi...',
            hintStyle: TextStyle(
              color: Color.fromARGB(255, 88, 88, 88)
            )
          ),
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
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color:  Colors.black26,
              blurRadius: 6,
              offset: Offset(0,2)
            )
          ]
        ),
        height: 60,
        child: TextField(
          obscureText: true,
          style: TextStyle(
            color: Colors.black87
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(left: 14),
            hintText: 'Salasana...',
            hintStyle: TextStyle(
              color: Color.fromARGB(255, 88, 88, 88)
            )
          ),
        ),
      )
    ],
  );
}

Widget buildLoginBtn(){
  return Container(
    padding: EdgeInsets.symmetric(vertical: 25),
    width: double.infinity,
    child: ElevatedButton(
      onPressed: () => {
        runApp(MyApp()
        )
      },
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(15),
      ),
      child: Text(
        'Kirjaudu'
      ),
    ),
  );
}

class _LoginScreenState extends State<LoginScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xff),
                      Color(0xff),
                      Color(0xff),
                      Color(0xff),
                    ]
                  )
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Google Maps In Flutter',
                      style: TextStyle(
                        color: Color.fromARGB(255, 24, 89, 187),
                        fontSize: 40,
                        fontWeight: FontWeight.normal
                      ),
                    ),
                    SizedBox(height: 20),
                    buildUsername(),
                    buildPassword(),
                    buildLoginBtn(),
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