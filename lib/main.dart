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

  late String? name;
  late int? age;
  late String? country;


  getDataFromApi() async {
    Response response = await Dio()
        .get("https://run.mocky.io/v3/4c5757c1-a331-46a5-8b37-646fac6bbb23");
      print(response.data); 


    // name = response.data["name"];
    // age = response.data["age"];
    // country = response.data["country"];

    // print(name);
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
       
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
    
        title: Text(widget.title),
      ),
      body: Center(
      
        child: SafeArea(
          child: Column(
           
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                Text(
                'Name',
              ),
              const SizedBox(
                height: 20,
              ),
                Text(
                'Age',
              ),
              SizedBox(
                height: 20,
              ),
                // ignore: prefer_const_constructors
                Text(
                'Country',
              ),
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
