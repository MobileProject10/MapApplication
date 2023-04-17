import 'package:flutter/material.dart';
import 'package:google_maps_in_flutter/main.dart';

class Premium extends StatelessWidget {
  const Premium({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),

      // standard dark theme

      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Upgrade to premium'),
          leading: BackButton(
            color: Colors.black,
            onPressed: () => runApp(const MyApp()),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Name'),
                    ),
                    TextFormField(
                      decoration:
                          const InputDecoration(labelText: 'Phone number'),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Email'),
                    ),
                    TextFormField(
                      decoration:
                          const InputDecoration(labelText: 'Card Number'),
                    ),
                    TextFormField(
                      decoration:
                          const InputDecoration(labelText: 'Expiration Date'),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'CVC'),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {},
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
            ],
          ),
        ),
      ),
    );
  }
}
