import 'package:flutter/material.dart';

class ButtonTurleri extends StatelessWidget {
  const ButtonTurleri({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Buton Türleri")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.access_alarm),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(onPressed: () {},
            onLongPress: (){
              debugPrint("uzun basildi");
            }, 
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(
                Colors.red
              )
            ),
            child: Text("Text Button")
            ),
            TextButton.icon(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.resolveWith((states) {
                  if(states.contains(WidgetState.pressed)){
                    return Colors.red;
                  }
                  if(states.contains(WidgetState.hovered)){
                    return Colors.green;
                  }
                  return null;
                },),
              ),
              icon: Icon(Icons.add),
              label: Text("Text Button With Icon"),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple, foregroundColor: Colors.amber), 
            child: Text("ElevatedButton")),
            ElevatedButton.icon(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.blue, foregroundColor: Colors.white
              ),
              icon: Icon(Icons.remove),
              label: Text("ElevatedButton With Icon"),
            ),
            OutlinedButton(
              onPressed: () {}, 
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.all(16),
                  shape: StadiumBorder(),
                  side: BorderSide(color: Colors.purple,width: 4),
                  backgroundColor: Colors.pink, 
                  foregroundColor: Colors.white),
            child: Text("OutlinedButton")),
            OutlinedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.refresh),
              style: OutlinedButton.styleFrom(
                side: BorderSide(width: 4, color: Colors.black),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                )
              ),
              label: Text("OutlinedButton With Icon"),
            ),
          ],
        ),
      ),
    );
  }
}
