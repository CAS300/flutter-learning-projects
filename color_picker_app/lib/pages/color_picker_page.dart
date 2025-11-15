import 'dart:math';

import 'package:app2/constants/colors.dart';
import 'package:app2/widgets/color_display.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ColorPickerPage extends StatefulWidget {
  const ColorPickerPage({super.key});

  @override
  State<ColorPickerPage> createState() => _ColorPickerPageState();
}

class _ColorPickerPageState extends State<ColorPickerPage> {
  Color selectedColor = Colors.red;
  bool isCircular = false;
  bool isShowColorName = true;

  void _rastgeleRenkSec() {
    final colors = renkler.keys.toList();
    final rastgeleSayi = Random().nextInt(colors.length);
    final randomColor = colors[rastgeleSayi];
    setState(() {
      selectedColor = randomColor;
      debugPrint(rastgeleSayi.toString());
    });
  }

  void _renginKodunuGoster() {
    Fluttertoast.showToast(
      msg:
          // ignore: deprecated_member_use
          "RGB:(${selectedColor.red}, ${selectedColor.green}, ${selectedColor.blue})",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: selectedColor,
      textColor: Colors.white,
      fontSize: 24.0,
    );
  }

  void _containerSekliniDegistir() {
    setState(() {
      isCircular = !isCircular;
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    var withOpacity = selectedColor.withOpacity(0.9);
    return Scaffold(
      appBar: AppBar(
        title: Text('Renk Seçici'),
        centerTitle: true,
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              setState(() {
                isShowColorName = !isShowColorName;
              });
            },
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  value: 'a',
                  child: Row(
                    children: [
                      Icon( 
                        isShowColorName ? Icons.visibility_off : Icons.visibility,
                        size:20,
                        color: Colors.black54
                      ),
                      const SizedBox(width: 8),
                      Text(isShowColorName ? 'Renk Adını Gizle':'Renk Adını Göster'),
                      ]),
                ),
              ];
            },
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              ColorDisplay(selectedColor: selectedColor, isCircular: isCircular, withOpacity: withOpacity),
              SizedBox(height: 10),
              isShowColorName
                  ? Text(renkler[selectedColor] ?? 'Seçilen Renk')
                  : SizedBox(),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    DropdownButton(
                      value: selectedColor,
                      items: renkler.entries.map((entry) {
                        return DropdownMenuItem(
                          value: entry.key,
                          child: Row(
                            children: [
                              Container(width: 20, height: 20, color: entry.key),
                              SizedBox(width: 4),
                              Text(entry.value),
                            ],
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedColor = value!;
                        });
                      },
                    ),
                    ElevatedButton(
                      onPressed: _rastgeleRenkSec,
                      child: Text('Rastgele'),
                    ),
                    IconButton(
                      onPressed: _renginKodunuGoster,
                      icon: Icon(Icons.info),
                    ),
                    IconButton(
                      onPressed: () {
                        _containerSekliniDegistir();
                      },
                      icon: Icon(
                        isCircular
                            ? Icons.square_outlined
                            : Icons.circle_outlined,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

