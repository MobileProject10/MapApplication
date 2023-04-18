import 'package:google_maps_in_flutter/widgets/settings.dart';
import 'models/theme_settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class router extends StatelessWidget {
  const router({ Key? key}): super(key: key);

  @override
  Widget build (BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create:(context) => ThemeSettings(),
        ),
      ],
      child: Consumer<ThemeSettings>(
        builder:(context, value, child) {
          return MaterialApp(
      theme: value.darkTheme ? darkTheme : lightTheme ,
      home: Settings(),
        );
        },
      )
    );
  }
}