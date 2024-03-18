import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/sample.dart';
import 'package:state_management/test_text/text.dart';
import 'package:state_management/utils.dart';

import 'dark_mode/theme_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      // Step 1: declare provider
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => TextProvider())
      ],
      child: Consumer<ThemeProvider>(builder: (context, theme, _) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: theme.isDark
              ? ThemeData.dark()
              : ThemeData(
                  colorScheme:
                      ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                  useMaterial3: true,
                ),
          home: const MyHomePage(title: 'Flutter Demo Home Page'),
        );
      }),
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
  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Consumer<TextProvider>(builder: (context, tp, _) {
          return Text(tp.tpOutput);
        }),
      ),
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 100,
                color: Colors.amber,
                height: 100,
              ),
              ElevatedButton(
                  onPressed: () {
                    go(context, const SampleScreen());
                  },
                  child: const Text(
                    'Press Here',
                  )),
              Image.network(
                  "https://upload.wikimedia.org/wikipedia/commons/thumb/7/79/Flutter_logo.svg/2048px-Flutter_logo.svg.png"),
              Container(
                width: 100,
                color: Colors.blue,
                height: 100,
              ),
              Container(
                width: 100,
                color: const Color(0xFF00FF00),
                height: 100,
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          theme.toggleTheme();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
