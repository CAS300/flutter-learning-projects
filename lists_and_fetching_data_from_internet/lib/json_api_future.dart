import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lists_and_fetching_data_from_internet/models/person_model.dart';

class JsonApiFutureBuilder extends StatelessWidget {
  const JsonApiFutureBuilder({super.key});

  Future<List<Person>> 
  _loadJson() async {
    try{
      await Future.delayed(Duration(seconds: 5));
      var jsonString = await rootBundle.loadString("assets/data/persons.json");
    Map<String, dynamic> jsonMap=json.decode(jsonString);
    // debugPrint(jsonMap['persons'][1]['adres'][1]['il'].toString());
    List<dynamic>jsonList=jsonMap['persons'];
    List<Person> kisiler=jsonList.map((eleman)=>Person.fromJson(eleman)).toList();

    for (var kisi in kisiler){
      debugPrint(kisi.isim);
    }
    return kisiler;
    }catch(e){
      debugPrint(e.toString());
      return Future.error(e);
    }
  }

  @override
  Widget build(BuildContext context){
    
    return FutureBuilder<List<Person>>(future: _loadJson(), builder: (context, snapshot){
      if(snapshot.hasData){
        var myPersonList=snapshot.data!;
        return ListView.builder(itemBuilder: (context, index) {
          var tekPerson=myPersonList[index];
          return ListTile(
            title: Text(tekPerson.isim),
            leading: CircleAvatar(child: Text(tekPerson.id.toString()),),
            subtitle: Text(tekPerson.adres.toString()),
          );
        },
        itemCount: myPersonList.length,
        );
      }else if(snapshot.hasError){
        return Center(
          child: Text('ERROR CIKTI'),
        );
      }else{
        return Center(child: CircularProgressIndicator(),);
      }
    });
  }
}
