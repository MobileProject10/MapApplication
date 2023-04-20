import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_in_flutter/Router.dart';
import 'package:provider/provider.dart';
import 'LoginScreen.dart';
import 'models/theme_settings.dart';
import 'widgets/settings.dart';

void main() => runApp(LoginApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext) {
    return MaterialApp(
      title: 'Google Maps In Flutter',
      debugShowCheckedModeBanner: false,
      home: LoginScreen(onSubmit: (String value) {  },),
    );
  }
}

class _MyAppState extends State<MyApp> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => ThemeSettings(),
          ),
        ],
        child: Consumer<ThemeSettings>(
          builder: (context, value, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: value.darkTheme ? darkTheme : lightTheme,
              home: Scaffold(
                appBar: AppBar(
                  title: const Text('OuluRoutes'),
                  elevation: 2,
                  backgroundColor: Color.fromARGB(255, 33, 143, 11),
                ),
                drawer: Drawer(
                  // Add a ListView to the drawer. This ensures the user can scroll
                  // through the options in the drawer if there isn't enough vertical
                  // space to fit everything.
                  child: ListView(
                    // Important: Remove any padding from the ListView.
                    padding: EdgeInsets.zero,
                    children: [
                      const DrawerHeader(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 33, 143, 11),
                        ),
                        child: Text('Valikko',
                          style: TextStyle(
                          fontSize: 30,
                          letterSpacing: 3,
                        ),
                        ),
                      ),
                      ListTile(
                        leading: const Icon(Icons.settings),
                        title: const Text('Asetukset'),
                        onTap: () {
                          // Update the state of the app
                          // ...
                          // Then close the drawer
                          runApp(router());
                          //Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.exit_to_app),
                        title: const Text('Kirjaudu ulos'),
                        onTap: () {
                          // Update the state of the app
                          // ...
                          // Then close the drawer
                          runApp(LoginScreen(onSubmit: (String value) {  },));
                        },
                      ),
                    ],
                  ),
                ),
                body: GoogleMap(
                  onMapCreated: _onMapCreated,
                  initialCameraPosition: CameraPosition(
                    target: _center,
                    zoom: 11.0,
                  ),
                ),
              ),
            );
          },
        ));
  }
}




