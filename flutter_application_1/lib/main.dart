import 'package:flutter/material.dart';
import 'second_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Mobile Dev Team'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center( 
          child: Column( mainAxisAlignment: MainAxisAlignment.center, mainAxisSize: MainAxisSize.min,
        children: [
          const Text(style: TextStyle(fontSize: 40),'Welcome to Deriv!'),
          const SizedBox(height: 10),
          InkWell(child: Image.asset('assets/photos/countries/derivLogo.png'), onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const second_page()));  
          },),
        ],
      )),
    );
  }
}
