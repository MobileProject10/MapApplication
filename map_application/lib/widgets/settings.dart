import 'package:flutter/material.dart';
import 'package:google_maps_in_flutter/models/theme_settings.dart';
import 'package:provider/provider.dart';
import 'package:google_maps_in_flutter/main.dart';


class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SettingsState();
}

class _SettingsState extends State<Settings>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('settings'),
           leading: BackButton(
             color: Colors.black,
             onPressed: () => runApp(MyApp()),
          ),
        ),
        body: Column(
          children: [
            Card(
              child: ListTile(
                title: Text('Theme'),
              ),
            ),
            Consumer<ThemeSettings>(
              builder: (context, value, child) {
                return SwitchListTile(
                  title: Text('Dark theme'),
                  value: value.darkTheme,
                  onChanged: (newValue) {
                    value.toggleTheme();
                  },
                );
              },
            ),
          ],
        ));
  }
}