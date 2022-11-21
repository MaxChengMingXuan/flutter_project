import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:ndialog/ndialog.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Search',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const MyHomePage(title: 'Movie Search'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //Define variables
  TextEditingController movietitle = TextEditingController();
  String mImg =
      'http://probablyprogramming.com/wp-content/uploads/2009/03/handtinytrans.gif';
  String mTitle = '';
  String runtime = '-';
  String genre = "-";
  String rating = "-";

  //application Appearance
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 10),
              Image.asset(
                'assets/images/Filmstrip2.png',
                scale: 30,
              ),
              const Text("Movie Search",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 20, bottom: 20),
                    child: Card(
                      color: const Color.fromARGB(255, 241, 250, 249),
                      margin: const EdgeInsets.all(16),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(
                          child: Column(
                            children: [
                              TextField(
                                controller: movietitle,
                                decoration: InputDecoration(
                                    hintText: 'Enter movie title to search',
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0))),
                              ),
                              const SizedBox(height: 10),
                              MaterialButton(
                                height: 35,
                                minWidth: 10,
                                onPressed: () {
                                  showConfDialog(context); //fun1
                                  //_showImg(); //fun2
                                },
                                color: const Color.fromARGB(255, 154, 185, 215),
                                child: const Text("Search"),
                              ),
                              const SizedBox(height: 10),
                              Image.network(mImg),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Card(
                                        color: const Color.fromARGB(
                                            255, 241, 250, 249),
                                        margin: const EdgeInsets.all(10),
                                        child: Column(
                                          children: [
                                            const Text("Rating",
                                                style: TextStyle(fontSize: 20)),
                                            Text(rating,
                                                style: const TextStyle(
                                                    fontSize: 20)),
                                          ],
                                        ),
                                      ),
                                      Card(
                                        color: const Color.fromARGB(
                                            255, 241, 250, 249),
                                        margin: const EdgeInsets.all(10),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Text("Runtime",
                                                style: TextStyle(fontSize: 20)),
                                            Text(runtime,
                                                style: const TextStyle(
                                                    fontSize: 20)),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Card(
                                    color: const Color.fromARGB(
                                        255, 241, 250, 249),
                                    margin: const EdgeInsets.all(10),
                                    child: Column(
                                      children: [
                                        const Text("Genre",
                                            style: TextStyle(fontSize: 20)),
                                        Text(genre,
                                            style:
                                                const TextStyle(fontSize: 15)),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  //search for the movie
  Future<void> _search() async {
    ProgressDialog progressDialog = ProgressDialog(context,
        message: const Text("Progress"), title: const Text("Searching..."));
    progressDialog.show();
    var apiid = "38c8d62c";
    String name = movietitle.text;
    var url = Uri.parse('https://omdbapi.com/?t=$name&&apikey=$apiid');
    var response = await http.get(url);

    var rescode = response.statusCode;
    if (response.statusCode == 200) {
      Fluttertoast.showToast(
          msg: "Connected",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          fontSize: 14.0);
    } else {
      Fluttertoast.showToast(
          msg: "Failed to search",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          fontSize: 14.0);
    }
    if (rescode == 200 && name.isEmpty == false) {
      var jsonData = response.body;
      var parsedJson = json.decode(jsonData);

      setState(() {
        var ngenre = parsedJson['Genre'];
        var nruntime = parsedJson['Runtime'];
        var nrating = parsedJson['Ratings'][1]['Value'];
        var imgUrl = parsedJson['Poster'];

        genre = ngenre.toString();
        runtime = nruntime.toString();
        rating = nrating.toString();
        mImg = imgUrl.toString();
      });

      progressDialog.dismiss();

      Fluttertoast.showToast(
          msg: "Done",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          fontSize: 14.0);
    } else {
      Fluttertoast.showToast(
          msg: "Invalid Input",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          fontSize: 14.0);
    }
  }

  //Confirmation Dialog
  showConfDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = MaterialButton(
      child: const Text("Cancel"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = MaterialButton(
      child: const Text("Continue"),
      onPressed: () {
        Navigator.of(context).pop();
        _search();
      },
    );
    // set up the AlertDialog
    AlertDialog conf = AlertDialog(
      title: const Text("Confirmation"),
      content: const Text("Are you sure you want to search for this movie?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return conf;
      },
    );
  }
}
