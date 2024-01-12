import 'package:flutter/material.dart';

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.amber),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  TextEditingController textfield = TextEditingController();
  final counter = Counter();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("App Testing")),
      body: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  counter.radio.length,
                  (index) => Column(
                        children: [
                          Text(counter.radio[index].toString()),
                          Radio(
                            value: counter.radio[index],
                            groupValue: counter.radioGroup,
                            onChanged: (value) {
                              setState(() {
                                counter.changes(value);
                              });
                            },
                          )
                        ],
                      )),
            ),
            const Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                "COUNTER",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      counter.decrement();
                    });
                  },
                  child: const Text("Dec", key: Key("btnDec")),
                ),
                Text("${counter.value}", style: const TextStyle(fontSize: 25)),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      counter.increment();
                    });
                  },
                  child: const Text("Inc", key: Key("btnInc")),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    counter.reset();
                  });
                },
                child: const Text("Reset", key: Key("btnRes")),
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 20, bottom: 20)),
            const Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                "REVERSE TEXT",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
            TextField(
              controller: textfield,
              decoration: const InputDecoration(
                hintText: "Enter Text",
                border: OutlineInputBorder(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    textfield.text = String.fromCharCodes(
                      textfield.text.runes.toList().reversed,
                    );
                  });
                },
                child: const Text("Reverse", key: Key("btnReverse")),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Counter {
  int value = 0;
  final List radio = [1, 2, 3, 4, 5];
  int radioGroup = 1;

  void changes(val) => radioGroup = val;

  void increment() => value = value + radioGroup;

  void decrement() => value = value - radioGroup;

  void reset() => value = 0;
}
