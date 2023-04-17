import 'package:flutter/material.dart';
import 'package:google_maps_in_flutter/main.dart';
import 'package:google_maps_in_flutter/widgets/premium.dart';

class Kayttaja extends StatelessWidget {
  const Kayttaja({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),

      // standard dark theme

      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Käyttäjä'),
          leading: BackButton(
            color: Colors.black,
            onPressed: () => runApp(const MyApp()),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Upgrade to premium:',
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      // ignore: prefer_const_constructorss
                      builder: (context) => const Premium(),
                    ),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Change theme & rebuild to
                    // show it using these buttons
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Upgrade'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Name'),
                      initialValue: 'John Doe',
                      enabled: false,
                    ),
                    TextFormField(
                      decoration:
                          const InputDecoration(labelText: 'Phone number'),
                      initialValue: '911',
                      enabled: false,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Email'),
                      initialValue: 'johndoe@example.com',
                      enabled: false,
                    ),
                    TextFormField(
                      decoration:
                          const InputDecoration(labelText: 'Premium Status'),
                      initialValue: 'false',
                      enabled: false,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
