import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Home();
}

class _Home extends State<Home> {
  Color priorityIconColor = Colors.amberAccent;
  IconData priorityIcon = Icons.album_sharp;
  String title = "Null";
  String date = "Null";
  // List itemss = [1,2,3,4,5,6,7,8,9,0,1,2,3,4,5,6,7,8,9,0];
  List<dynamic> items = [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    0,
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    0
  ].map((e) => e.toString()).toList();

  @override
  build(context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Material(
                    color: Colors
                        .transparent, // Make sure Material is transparent
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          priorityIconColor =
                              priorityIconColor == Colors.amberAccent
                                  ? Colors.red
                                  : Colors.amberAccent;

                          priorityIcon =
                          priorityIcon == Icons.album_sharp
                              ? Icons.stars_rounded
                              : Icons.album_sharp;
                        });
                      },
                      borderRadius: BorderRadius.circular(20),
                      splashColor: Colors.black12, // Set splash color here
                      child: Container(
                        decoration: BoxDecoration(color: Colors.transparent),
                        child: ListTile(
                          leading: Container(
                            height: double.infinity,
                            child: Icon(
                              priorityIcon,
                              color: priorityIconColor,
                              size: 58,
                            ),
                          ),
                          title: Text(title),
                          subtitle: Text(date),
                          trailing: IconButton(
                            icon: Icon(Icons.delete_outlined),
                            onPressed: () {},
                            splashColor: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: 100,
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider(
                    thickness: 0.5,
                    height: 2,
                    indent: 20,
                    endIndent: 20,
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        tooltip: "Add new Task.",
        onPressed: () {},
      ),
    );
  }
}
