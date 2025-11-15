import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:lists_and_fetching_data_from_internet/tek_satirlik_widget.dart';

// ignore: must_be_immutable
class ListviewKullanimi extends StatelessWidget {
  ListviewKullanimi({super.key});

  List<Ogrenci> tumOgrenciler = List.generate(
    1000,
    (index) => Ogrenci(
      id: index,
      isim: "Ogrenic adi ${index + 1}",
      erkekMi: index % 2 == 0,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tumOgrenciler.length,
      itemBuilder: (context, index) => GestureDetector(
        onLongPress: () {
          debugPrint("Card widget tikklandi ${tumOgrenciler[index].isim}");
        },
        child: Card(
          color: tumOgrenciler[index].erkekMi
              ? Colors.blue.shade300
              : Colors.pink.shade300,
          child: ListTile(
            onTap: () {
              SmartDialog.show(
                builder: (context) {
                  return Container(
                    height: MediaQuery.of(context).size.height*0.1,
                    width: MediaQuery.of(context).size.width*0.7,
                    decoration: BoxDecoration(
                      color: Colors.deepPurpleAccent.shade200,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "Listtile widget tiklandi ${tumOgrenciler[index].isim}",
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                },
              );
              debugPrint(
                "Listtile widget tiklandi ${tumOgrenciler[index].isim}",
              );
            },
            title: Text(tumOgrenciler[index].isim),
            leading: CircleAvatar(child: Text(index.toString())),
          ),
        ),
      ),
    );
  }

  ListView listViewKullanimi() {
    return ListView(
      children: [
        TekSatirlikListTile(),
        TekSatirlikListTile(),
        TekSatirlikListTile(),
      ],
    );
  }

  SingleChildScrollView singleChildScroll() {
    return SingleChildScrollView(child: TekSatirlikListTile());
  }
}

class Ogrenci {
  final int id;
  final String isim;
  final bool erkekMi;

  Ogrenci({required this.id, required this.isim, required this.erkekMi});

  @override
  String toString() {
    return "$isim ";
  }
}
