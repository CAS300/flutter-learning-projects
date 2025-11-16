import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:lists_and_fetching_data_from_internet/dio_kullanimi.dart';
// import 'package:lists_and_fetching_data_from_internet/json_api_future.dart';
// import 'package:lists_and_fetching_data_from_internet/gridview_cesitleri.dart';
// import 'package:lists_and_fetching_data_from_internet/card_listtile.dart';
// import 'package:lists_and_fetching_data_from_internet/listview_kullanimi.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorObservers: [FlutterSmartDialog.observer],
      // here
      builder: FlutterSmartDialog.init(),
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          
          title: const Text('Liste ve Veri Islemleri'),
        ),
        body: DioKullanimi(),
        ),
      debugShowCheckedModeBanner: false,
      );
  }
}