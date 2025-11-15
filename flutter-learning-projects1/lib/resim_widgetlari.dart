import 'package:flutter/material.dart';

class ResimWidgetlari extends StatelessWidget {
  const ResimWidgetlari({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Resim Widgetlari"),),
      body: Center(
        child: Column(
          children: [
            Image.asset("assets/image/1.jpg"),            
          ],),
      ),
    );
  }
}