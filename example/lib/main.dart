import 'package:flutter/material.dart';
import 'package:mergn_flutter_plugin_sdk/mergn_channel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String? _token;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("Widget build is called");
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text Fields
            const Text('Register to click', textAlign: TextAlign.center),
            const SizedBox(height: 20), // Spacer
            // Event Button
            ElevatedButton(
              onPressed: () {
                MergnChannel.registerAPICall(
                    "787bc5fb1f13150564d187eb0bfaf1fbm35rgn303e547cb2e3b758a2f4a7ce810b10e3");
              },
              child: const Text('Event'),
            ),
            const SizedBox(height: 20), // Spacer,
            const Text('Event Name = Cart_Cancel_Item',
                textAlign: TextAlign.center),
            const SizedBox(height: 20), // Spacer
            // Event Button
            ElevatedButton(
              onPressed: () {
                String eventName = "Event Name"; // Put Event Name here
                //Map<String, String> eventProperties = {"propertyName": "PropertyValue"};
                Map<String, String> eventProperties = Map();
                MergnChannel.sendEvent(eventName, eventProperties);
              },
              child: const Text('Event'),
            ),
            const SizedBox(height: 20), // Spacer

            const Text('Attribute Name = Email', textAlign: TextAlign.center),
            const SizedBox(height: 10), // Spacer
            const Text('Attribute Value = fluttersdk@mergn.com',
                textAlign: TextAlign.center),
            const SizedBox(height: 20), // Spacer

            // Attribute Button
            ElevatedButton(
              onPressed: () {
                String attributeName = "Email"; // Put Attribute name
                String attributeValue = "fluttersdk@mergn.com";
                MergnChannel.sendAttribute(attributeName, attributeValue);
              },
              child: const Text('Attribute'),
            ),
            const SizedBox(height: 20), // Spacer
            const Text('Unique Identifier = fluttersdk@mergn.com',
                textAlign: TextAlign.center),
            const SizedBox(height: 20), // Spacer

            // Login Button
            ElevatedButton(
              onPressed: () {
                MergnChannel.login(
                    "fluttersdk@mergn.com"); //Put Unique identifier
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
