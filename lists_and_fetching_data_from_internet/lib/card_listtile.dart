import 'package:flutter/material.dart';

class CardListTileKullanimi extends StatefulWidget {
  const CardListTileKullanimi({super.key});

  @override
  State<CardListTileKullanimi> createState() => _CardListTileKullanimiState();
}

class _CardListTileKullanimiState extends State<CardListTileKullanimi> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        color: Colors.deepPurple.shade100,
        shadowColor: Colors.deepPurple.shade700,
        elevation: 12,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
           children: [ 
            Expanded(child: tekSatir()),
           ],
        ),
      ),
    );
  }

  Column tekSatir() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            leading: CircleAvatar(child: Icon(Icons.add)),
            trailing: CircleAvatar(child: Icon(Icons.arrow_back)),
            title: Text("Eren Sahin"),
            subtitle: Text("Gelistirici"),
          ),
          Divider(thickness: 3, 
          indent: 10,
          endIndent: 10,
          color: Colors.blue[200]),
        ],
      );
  }
}