
import 'package:flutter/material.dart';

class TekSatirlikListTile extends StatelessWidget {
  const TekSatirlikListTile({
    super.key,
    });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ListTile(
          leading: CircleAvatar(child: Icon(Icons.add)),
          trailing: CircleAvatar(child: Icon(Icons.arrow_back)),
          title: Text("Eren Sahin"),
          subtitle: Text("Gelistirici"),
        ),
        Divider(
          thickness: 3,
          indent: 10,
          endIndent: 10,
          color: Colors.blue[200],
        ),
        ListTile(
          leading: CircleAvatar(child: Icon(Icons.add)),
          trailing: CircleAvatar(child: Icon(Icons.arrow_back)),
          title: Text("Eren Sahin"),
          subtitle: Text("Gelistirici"),
        ),
        Divider(
          thickness: 3,
          indent: 10,
          endIndent: 10,
          color: Colors.blue[200],
        ),
        ListTile(
          leading: CircleAvatar(child: Icon(Icons.add)),
          trailing: CircleAvatar(child: Icon(Icons.arrow_back)),
          title: Text("Eren Sahin"),
          subtitle: Text("Gelistirici"),
        ),
        Divider(
          thickness: 3,
          indent: 10,
          endIndent: 10,
          color: Colors.blue[200],
        ),
        ListTile(
          leading: CircleAvatar(child: Icon(Icons.add)),
          trailing: CircleAvatar(child: Icon(Icons.arrow_back)),
          title: Text("Eren Sahin"),
          subtitle: Text("Gelistirici"),
        ),
        Divider(
          thickness: 3,
          indent: 10,
          endIndent: 10,
          color: Colors.blue[200],
        ),
        ListTile(
          leading: CircleAvatar(child: Icon(Icons.add)),
          trailing: CircleAvatar(child: Icon(Icons.arrow_back)),
          title: Text("Eren Sahin"),
          subtitle: Text("Gelistirici"),
        ),
        Divider(
          thickness: 3,
          indent: 10,
          endIndent: 10,
          color: Colors.blue[200],
        ),
        SizedBox(
          height: 600,
        ),
        ListTile(
          leading: CircleAvatar(child: Icon(Icons.add)),
          trailing: CircleAvatar(child: Icon(Icons.arrow_back)),
          title: Text("Eren Sahin"),
          subtitle: Text("Gelistirici"),
        ),
        Divider(
          thickness: 3,
          indent: 10,
          endIndent: 10,
          color: Colors.blue[200],
        ),
      ],
    );
  }
}
