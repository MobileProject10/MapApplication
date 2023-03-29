import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_in_flutter/main.dart';
import 'RegisterScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key, required this.onSubmit}) : super(key: key);
  final ValueChanged<String> onSubmit;

  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

Widget buildRegisterBtn() {
  return Container(
    margin: EdgeInsets.only(left: 100, right: 100),
    width: double.infinity,
    child: ElevatedButton(
      onPressed: () => {
        runApp(RegisterScreen(
          onSubmit: (String value) {},
        ))
      },
      style: ElevatedButton.styleFrom(
        primary: Color.fromARGB(255, 228, 228, 228),
        shadowColor: Colors.transparent,
        elevation: 0,
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

class _LoginScreenState extends State<LoginScreen> {
  final _controller = TextEditingController();
  final _controller2 = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    _controller2.dispose();
    super.dispose();
  }

  String? get _errorText {
    // at any time, we can get the text from _controller.value.text
    final text = _controller.value.text;
    // Note: you can do your own custom validation here
    // Move this logic this outside the widget for more testable code
    if (text.isEmpty) {
      return 'Kenttä ei voi olla tyhjä';
    }
    // return null if the text is valid
    return null;
  }

  String? get _errorText2 {
    // at any time, we can get the text from _controller.value.text
    final text = _controller.value.text;
    // Note: you can do your own custom validation here
    // Move this logic this outside the widget for more testable code
    if (text.isEmpty) {
      return 'Kenttä ei voi olla tyhjä';
    }
    // return null if the text is valid
    return null;
  }

  bool _submitted = false;

  void _submit() {
    setState(() => _submitted = true);
    // if there is no error text
    if (_errorText == null && _errorText2 == null) {
      // notify the parent widget via the onSubmit callback
      widget.onSubmit(_controller.value.text);
      widget.onSubmit(_controller2.value.text);
      runApp(MyApp());
    }
  }

  final _text = '';
  final _text2 = '';

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
                  padding: EdgeInsets.only(left: 30, right: 30),
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 228, 228, 228),
                  ),
                  
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      Text(
                        'OuluRoutes',
                        style: TextStyle(
                          color: Color.fromARGB(255, 17, 113, 158),
                          fontSize: 25,
                        ),
                      ),

                      SizedBox(height: 10),

                      TextField(
                        controller: _controller,
                        decoration: InputDecoration(
                          hintText: 'Käyttäjänimi...',
                          errorText: _submitted ? _errorText : null,
                        ),
                        onChanged: (text) => setState(() => _text),
                      ),

                      TextField(
                        obscureText: true,
                        controller: _controller2,
                        decoration: InputDecoration(
                          hintText: 'Salasana...',
                          errorText: _submitted ? _errorText2 : null,
                        ),
                        onChanged: (text) => setState(() => _text2),
                      ),

                      SizedBox(height: 20,),

                      ElevatedButton(
                          onPressed:
                              _controller.value.text.isNotEmpty && _controller2.value.text.isNotEmpty ? _submit : null,
                          style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.only(top: 15, bottom: 15, left: 50, right: 50),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20))),
                          child: Text(
                            'Kirjaudu',
                            style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.normal,
                                ),
                          ),
                        ),

                      buildRegisterBtn(),
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
