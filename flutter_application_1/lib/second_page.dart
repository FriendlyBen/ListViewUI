import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

// ignore: camel_case_types
class second_page extends StatelessWidget{
  const second_page({Key? key}): super(key:key);


  Future<List<Mentor>> getData() async{
    var jsonData =  await rootBundle.loadString('assets/team_info.json');
    final jsonResult = jsonDecode(jsonData);
    
    List<Mentor> mentors = [];
    for(var item in jsonResult['team_info']){
      String name = item['name']?? '';
      int age = item['age']?? 0;
      String country = item['country']?? '';
      String description = item['description']?? '';


      Mentor mentor = Mentor(name, age, country, description);
      mentors.add(mentor);

    }

    return mentors;

  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meet the Mobile Dev Team"),
      ),
        body: FutureBuilder<List<Mentor>>(
          future: getData(),
          builder: (BuildContext context, AsyncSnapshot<List<Mentor>> snapshot){
            if(snapshot.hasData){
              return ListView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index){
                  final mentor = snapshot.data![index];
                  return Container( margin: const EdgeInsets.all(10), padding: const EdgeInsets.all(20),
                    child: Container(color: Colors.red, padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Container(margin: const EdgeInsets.all(10),child: Image.asset('assets/photos/people/${mentor.name}.png'),),
                          Container(margin: const EdgeInsets.all(10), child: Text(style: const TextStyle(fontSize: 30), "Name: ${mentor.name}")),
                          Container(margin: const EdgeInsets.all(10), child: Text(style: const TextStyle(fontSize: 20),'Age: ${mentor.age}')),
                          Container(margin: const EdgeInsets.all(10), color: Colors.white, padding: const EdgeInsets.all(10), width: 200, height: 200,
                          child: Image.asset('assets/photos/countries/${mentor.country}.png'),),
                          Container(padding: const EdgeInsets.all(10), color: Colors.white, child: Text(style: TextStyle(fontSize: 25),
                          "Description: \n${mentor.description}")),
                        ],
                      ),
                    ),
                  );
                },
              );
            }else{
              return const CircularProgressIndicator();
            }
          }
        )
      // body: Center(
      //   child: Column(
      //     children: [
      //       Image.asset('assets/photos/people/ahrar.png'),
      //     ]),
      //     )
      );
  }
}

class Mentor{
  late String name;
  late String imagePath;
  late int age;
  late String country;
  late String description;

  Mentor(this.name, this.age, this.country, this.description);

}