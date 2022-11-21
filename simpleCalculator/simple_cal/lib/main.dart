import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const MyCalPage(),
    );
  }
}

class MyCalPage extends StatefulWidget {
  const MyCalPage({super.key});

  @override
  State<MyCalPage> createState() => _MyCalPageState();
}

class _MyCalPageState extends State<MyCalPage> {
  TextEditingController textnum1 = TextEditingController();
  TextEditingController textnum2 = TextEditingController();
  // AudioCache audioCache = AudioCache();
  // AudioPlayer audioPlayer = AudioPlayer();
  final player = AudioPlayer(playerId: 'my_unique_playerId');

  double sum = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

            // title: const Text("Simple Calculator")
            ),
        body: Center(
          child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                color: const Color.fromARGB(255, 234, 230, 218),
                child: Card(
                    color: const Color.fromARGB(255, 215, 230, 238),
                    margin: const EdgeInsets.all(16),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/Calculator.png',
                            scale: 7,
                          ),
                          const SizedBox(height: 20),
                          TextField(
                            controller: textnum1,
                            decoration: InputDecoration(
                                hintText: 'First number',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0))),
                            keyboardType:
                                const TextInputType.numberWithOptions(),
                          ),
                          const SizedBox(height: 20),
                          MaterialButton(
                            onPressed: calculateMe,
                            onLongPress: _loadOk,
                            color: Colors.blue[100],
                            child: const Text("Add!"),
                          ),
                          const SizedBox(height: 20),
                          TextField(
                            controller: textnum2,
                            decoration: InputDecoration(
                                hintText: 'Second number',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0))),
                            keyboardType:
                                const TextInputType.numberWithOptions(),
                          ),
                          const SizedBox(height: 20),
                          MaterialButton(
                            onPressed: _loadOk,
                            // onLongPress: _loadOk,
                            color: Colors.blue[100],
                            child: const Text("Ding!"),
                          ),
                        ],
                      ),
                    )),
              ),
              Text(
                "Result: $sum",
                style: const TextStyle(fontSize: 16, color: Colors.purple),
              )
            ]),
          ),
        ));
  }

  void calculateMe() {
    String num1 = textnum1.text;
    String num2 = textnum2.text;
    double numa = double.parse(num1);
    double numb = double.parse(num2);
    sum = numa + numb;
    // print(sum);
    setState(() {});
    //update the UI
  }

  Future _loadOk() async {
    await player.play(AssetSource('sound/bell.wav'));
  }

  Future loadFail() async {}
}
