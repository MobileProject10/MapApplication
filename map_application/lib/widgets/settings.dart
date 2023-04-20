import 'package:flutter/material.dart';
import 'package:google_maps_in_flutter/models/theme_settings.dart';
import 'package:provider/provider.dart';
import 'package:google_maps_in_flutter/main.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 33, 143, 11),
          title: Text('Asetukset'),
          leading: BackButton(
            color: Colors.black,
            onPressed: () => runApp(MyApp()),
          ),
        ),
        body: Column(
          children: [
            Consumer<ThemeSettings>(
              builder: (context, value, child) {
                return SwitchListTile(
                  title: Text('Tumma teema'),
                  value: value.darkTheme,
                  onChanged: (newValue) {
                    value.toggleTheme();
                  },
                );
              },
            ),
          ],
        ),
        );
  }
}
