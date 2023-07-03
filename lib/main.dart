import 'package:dio/dio.dart';
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
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyApiExample(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyApiExample extends StatefulWidget {
  const MyApiExample({super.key, required this.title});

 
  final String title;

  @override
  // ignore: library_private_types_in_public_api
  _MyApiExampleState createState() => _MyApiExampleState();
}

class _MyApiExampleState extends State<MyApiExample> {

  String name = "amr";
  int age = 22;
  String country = "New Zealand";

bool awaitData = true;

  getDataFromApi() async {
    Response  response = await Dio()
        .get("https://run.mocky.io/v3/e7e27bb5-dade-4c65-90ad-f0c6634fa2bc");
      //print(response.data); 
awaitData = false;
setState(() {
  
    name = response.data["name"];
    age = response.data["age"];
    country = response.data["country"];
});

     print(age);
  }
  @override
  void initState(){
    super.initState();
    getDataFromApi();
  }
  Widget build(BuildContext context) {
    
    return Scaffold(
      body:
        awaitData? 
         Center(child: CircularProgressIndicator(color: Colors.lightBlueAccent,),)
        :
      SafeArea(
          child: Center(
            child: Column(
             
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  Text(name),
                const SizedBox(
                  height: 20,
                ),
                  Text(age.toString()),
                SizedBox(
                  height: 20,
                ),
                  Text(country),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(onPressed: (){
                  getDataFromApi();
                }, child: const Text('Get data!'),)
              ],
            ),
          ),
        ),
      );
  }
}
