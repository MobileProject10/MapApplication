import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_in_flutter/LoginScreen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key, required this.onSubmit}) : super(key: key);
  final ValueChanged<String> onSubmit;

  @override
  State<StatefulWidget> createState() => _RegisterScreenState();
}

Widget buildCancelBtn() {
  return Container(
    margin: EdgeInsets.only(left: 100, right: 100, top: 10),
    width: double.infinity,
    child: ElevatedButton(
      onPressed: () => {runApp(LoginScreen(onSubmit: (String value) {  },))},
      style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(15),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
      child: Text(
        'Peru',
        style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.normal,
        ),
      ),
    ),
  );
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _controller = TextEditingController();
  final _controller2 = TextEditingController();
  final _controller3 = TextEditingController();

  String password = "";
  String errorText1 = "";
  String errorText2 = "";
  String errorText3 = "";

  @override
  void dispose() {
    _controller.dispose();
    _controller2.dispose();
    _controller3.dispose();
    super.dispose();
  }

  String? get _errorText {
    // at any time, we can get the text from _controller.value.text
    final text = _controller.value.text;
    // Note: you can do your own custom validation here
    // Move this logic this outside the widget for more testable code
    if (text.isEmpty) {
      errorText1 = "ERROR";
      return 'Kenttä ei voi olla tyhjä';
    }
    if (text.length < 4) {
      errorText1 = "ERROR";
      return 'Nimi liian lyhyt';
    }
    // return null if the text is valid
    errorText1 = "OK";
    return null;
  }

  String? get _errorText2 {
    // at any time, we can get the text from _controller.value.text
    final text = _controller2.value.text;
    // Note: you can do your own custom validation here
    // Move this logic this outside the widget for more testable code
    if (text.isEmpty) {
      errorText2 = "ERROR";
      return 'Kenttä ei voi olla tyhjä';
    }
    if (text.length < 4) {
      errorText2 = "ERROR";
      return 'Salasana on liian lyhyt';
    }
    // return null if the text is valid
    errorText2 = "OK";
    password = text;
    return null;
  }

  String? get _errorText3 {
    // at any time, we can get the text from _controller.value.text
    final text = _controller3.value.text;
    // Note: you can do your own custom validation here
    // Move this logic this outside the widget for more testable code
    if (text.isEmpty) {
      errorText3 = "ERROR";
      return 'Kenttä ei voi olla tyhjä';
    }
    if (text != password) {
      errorText3 = "ERROR";
      return 'Salasanat ei täsmää';
    }
    // return null if the text is valid
    errorText3 = "OK";
    return null;
  }

  void _submit() {
    if (_errorText == null && _errorText2 == null && _errorText3 == null) {
      widget.onSubmit(_controller.value.text);
      widget.onSubmit(_controller2.value.text);
      widget.onSubmit(_controller3.value.text);
      runApp(LoginScreen(onSubmit: (String value) {  },));
    }
  }

  final _text = '';
  final _text2 = '';
  final _text3 = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Rekisteröidy'),
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

                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          TextField(
                            controller: _controller,
                            decoration: InputDecoration(
                                hintText: 'Nimi...',
                                // use the getter variable defined above
                                errorText: _errorText),
                            // this will cause the widget to rebuild whenever the text changes
                            onChanged: (text) => setState(() => _text),
                          ),

                          TextField(
                            obscureText: true,
                            controller: _controller2,
                            decoration: InputDecoration(
                                hintText: 'Salasana...',
                                // use the getter variable defined above
                                errorText: _errorText2),
                            // this will cause the widget to rebuild whenever the text changes
                            onChanged: (text) => setState(() => _text2),
                          ),

                          TextField(
                            obscureText: true,
                            controller: _controller3,
                            decoration: InputDecoration(
                                hintText: 'Syötä salasana uudelleen...',
                                // use the getter variable defined above
                                errorText: _errorText3),
                            // this will cause the widget to rebuild whenever the text changes
                            onChanged: (text) => setState(() => _text3),
                          ),

                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 99.5, right: 99.5),
                            child: ElevatedButton(
                              onPressed: (errorText1 == "OK" && errorText2 == "OK" && errorText3 == "OK" ? _submit : null),
                              style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.all(15),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20))),
                              child: Text(
                                'Rekisteröidy',
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          ),

                          buildCancelBtn(),
                        ],
                      ),
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