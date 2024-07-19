import 'package:flutter/material.dart';

void main() {
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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
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
  bool logical = true;
  int a = 10; //1 ci tapsiriq
  String answer = "Cavab"; //1 ci tapsiriq
  TextEditingController textController = new TextEditingController(); //2 ci tapsiriq
  TextEditingController numberController = new TextEditingController(); //3 ci tapsiriq
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              answer,
            ), //1-ci tapsiriq
            ElevatedButton(
                onPressed: () {
                  switch (a > 5) {
                    case true:
                      answer = "Ədəd 5-dən böyükdür";
                      break;
                    case false:
                      answer = "Ədəd 5-dən kiçikdir";
                      break;
                  }
                  setState(() {});
                },
                child: Text('Yoxla')),
            // 2 ci tapsiriq
            TextField(
              controller: textController,
            ),
            ElevatedButton(
                onPressed: () {
                  int dayOfWeek = int.parse(textController.text.toString()); //Istifadeciden aldigimiz qiymet
                  switch (dayOfWeek) {
                    case 7:
                      answer = "Bazar gunu";
                      break; //Bu mutleq qoyulmalidir eks halda diger hal-a da avtomatik girecek
                    case 1:
                      answer = "Birinci gun";
                      break;
                    case 2:
                      answer = "Ikinci gun";
                      break;
                  }
                  setState(() {}); //Bunu mutleq cagirmaliyiq ki ekran update olsun
                },
                child: Text('Yoxla')),
            // 2 ci tapsiriq sonu
            TextField(
              controller: numberController,
            ),
            ElevatedButton(
                onPressed: () {
                  int number = int.parse(numberController.text.toString()); //Istifadeciden aldigimiz qiymet
                  int result = number % 2;
                  switch (result) {
                    //Faizli bolme qaliqli bolmeni ifade edir,cut eden 2-ye tam bolunen ededdir.
                    case 0:
                      answer = "Eded cutdur";
                      break;
                    default:
                      answer = "Eded tekdir";
                  }
                  setState(() {}); //Bunu mutleq cagirmaliyiq ki ekran update olsun
                },
                child: Text('Yoxla')),
            // 3 cu tapsiriq
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
