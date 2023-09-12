import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Home2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Home2();
}

class _Home2 extends State<Home2> {
  String title =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin leo lacus,";
  String desc =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin leo lacus, condimentum non dolor vel, ullamcorper mollis ex. Mauris vitae est dui. Duis at libero in tortor convallis condimentum sit amet sed nulla. Nulla gravida malesuada quam, at suscipit odio. Nulla facilisi. In at ultrices nibh. Donec libero velit, ullamcorper ac tortor et, ma";
  String date = "20/03/2023";

  num cardAxis() {
    final randomNumber = Random().nextInt(3);
    switch (randomNumber) {
      case 0:
        return 1;
      case 1:
        return 1.5;
      case 2:
        return 2;
      default:
        return 1.5; // Default case (fallback to 1.0).
    }
  }

  @override
  build(context) {
    return Scaffold(
        backgroundColor: Color(0xfff6f6f6),
        body: SafeArea(
          child: SingleChildScrollView(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  StaggeredGrid.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 6,
                    crossAxisSpacing: 6,
                    children: [
                      StaggeredGridTile.count(
                        crossAxisCellCount: 1,
                        mainAxisCellCount: cardAxis(),
                        child: Card(
                            color: Color(0xffffffff),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            elevation: 3,
                            shadowColor: Color(0xffeeeeee),
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                          child: Text(
                                        title,
                                        maxLines: 1,
                                        overflow: TextOverflow.fade,
                                        softWrap: false,
                                        style: (TextStyle(
                                            fontWeight: FontWeight.bold)),
                                      )),
                                      Container(
                                        margin: EdgeInsets.only(left: 5),
                                        alignment: Alignment.centerRight,
                                        child: Wrap(
                                          children: [
                                            (Text(date)),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Expanded(
                                      child: Text(
                                    desc,
                                  ))
                                ],
                              ),
                            )),
                      ),
                      StaggeredGridTile.count(
                        crossAxisCellCount: 1,
                        mainAxisCellCount: cardAxis(),
                        child: Card(
                            color: Color(0xffffffff),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            elevation: 3,
                            shadowColor: Color(0xffeeeeee),
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                          child: Text(
                                            title,
                                            maxLines: 1,
                                            overflow: TextOverflow.fade,
                                            softWrap: false,
                                            style: (TextStyle(
                                                fontWeight: FontWeight.bold)),
                                          )),
                                      Container(
                                        margin: EdgeInsets.only(left: 5),
                                        alignment: Alignment.centerRight,
                                        child: Wrap(
                                          children: [
                                            (Text(date)),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Expanded(
                                      child: Text(
                                        desc,
                                      ))
                                ],
                              ),
                            )),
                      ),
                      StaggeredGridTile.count(
                        crossAxisCellCount: 1,
                        mainAxisCellCount: cardAxis(),
                        child: Card(
                            color: Color(0xffffffff),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            elevation: 3,
                            shadowColor: Color(0xffeeeeee),
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                          child: Text(
                                            title,
                                            maxLines: 1,
                                            overflow: TextOverflow.fade,
                                            softWrap: false,
                                            style: (TextStyle(
                                                fontWeight: FontWeight.bold)),
                                          )),
                                      Container(
                                        margin: EdgeInsets.only(left: 5),
                                        alignment: Alignment.centerRight,
                                        child: Wrap(
                                          children: [
                                            (Text(date)),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Expanded(
                                      child: Text(
                                        desc,
                                      ))
                                ],
                              ),
                            )),
                      ),
                      StaggeredGridTile.count(
                        crossAxisCellCount: 1,
                        mainAxisCellCount: cardAxis(),
                        child: Card(
                            color: Color(0xffffffff),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            elevation: 3,
                            shadowColor: Color(0xffeeeeee),
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                          child: Text(
                                            title,
                                            maxLines: 1,
                                            overflow: TextOverflow.fade,
                                            softWrap: false,
                                            style: (TextStyle(
                                                fontWeight: FontWeight.bold)),
                                          )),
                                      Container(
                                        margin: EdgeInsets.only(left: 5),
                                        alignment: Alignment.centerRight,
                                        child: Wrap(
                                          children: [
                                            (Text(date)),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Expanded(
                                      child: Text(
                                        desc,
                                      ))
                                ],
                              ),
                            )),
                      ),
                      StaggeredGridTile.count(
                        crossAxisCellCount: 1,
                        mainAxisCellCount: cardAxis(),
                        child: Card(
                            color: Color(0xffffffff),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            elevation: 3,
                            shadowColor: Color(0xffeeeeee),
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                          child: Text(
                                            title,
                                            maxLines: 1,
                                            overflow: TextOverflow.fade,
                                            softWrap: false,
                                            style: (TextStyle(
                                                fontWeight: FontWeight.bold)),
                                          )),
                                      Container(
                                        margin: EdgeInsets.only(left: 5),
                                        alignment: Alignment.centerRight,
                                        child: Wrap(
                                          children: [
                                            (Text(date)),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Expanded(
                                      child: Text(
                                        desc,
                                      ))
                                ],
                              ),
                            )),
                      ),
                      StaggeredGridTile.count(
                        crossAxisCellCount: 1,
                        mainAxisCellCount: cardAxis(),
                        child: Card(
                            color: Color(0xffffffff),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            elevation: 3,
                            shadowColor: Color(0xffeeeeee),
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                          child: Text(
                                            title,
                                            maxLines: 1,
                                            overflow: TextOverflow.fade,
                                            softWrap: false,
                                            style: (TextStyle(
                                                fontWeight: FontWeight.bold)),
                                          )),
                                      Container(
                                        margin: EdgeInsets.only(left: 5),
                                        alignment: Alignment.centerRight,
                                        child: Wrap(
                                          children: [
                                            (Text(date)),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Expanded(
                                      child: Text(
                                        desc,
                                      ))
                                ],
                              ),
                            )),
                      ),
                      StaggeredGridTile.count(
                        crossAxisCellCount: 1,
                        mainAxisCellCount: cardAxis(),
                        child: Card(
                            color: Color(0xffffffff),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            elevation: 3,
                            shadowColor: Color(0xffeeeeee),
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                          child: Text(
                                            title,
                                            maxLines: 1,
                                            overflow: TextOverflow.fade,
                                            softWrap: false,
                                            style: (TextStyle(
                                                fontWeight: FontWeight.bold)),
                                          )),
                                      Container(
                                        margin: EdgeInsets.only(left: 5),
                                        alignment: Alignment.centerRight,
                                        child: Wrap(
                                          children: [
                                            (Text(date)),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Expanded(
                                      child: Text(
                                        desc,
                                      ))
                                ],
                              ),
                            )),
                      ),
                      StaggeredGridTile.count(
                        crossAxisCellCount: 1,
                        mainAxisCellCount: cardAxis(),
                        child: Card(
                            color: Color(0xffffffff),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            elevation: 3,
                            shadowColor: Color(0xffeeeeee),
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                          child: Text(
                                            title,
                                            maxLines: 1,
                                            overflow: TextOverflow.fade,
                                            softWrap: false,
                                            style: (TextStyle(
                                                fontWeight: FontWeight.bold)),
                                          )),
                                      Container(
                                        margin: EdgeInsets.only(left: 5),
                                        alignment: Alignment.centerRight,
                                        child: Wrap(
                                          children: [
                                            (Text(date)),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Expanded(
                                      child: Text(
                                        desc,
                                      ))
                                ],
                              ),
                            )),
                      ),
                      StaggeredGridTile.count(
                        crossAxisCellCount: 1,
                        mainAxisCellCount: cardAxis(),
                        child: Card(
                            color: Color(0xffffffff),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            elevation: 3,
                            shadowColor: Color(0xffeeeeee),
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                          child: Text(
                                            title,
                                            maxLines: 1,
                                            overflow: TextOverflow.fade,
                                            softWrap: false,
                                            style: (TextStyle(
                                                fontWeight: FontWeight.bold)),
                                          )),
                                      Container(
                                        margin: EdgeInsets.only(left: 5),
                                        alignment: Alignment.centerRight,
                                        child: Wrap(
                                          children: [
                                            (Text(date)),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Expanded(
                                      child: Text(
                                        desc,
                                      ))
                                ],
                              ),
                            )),
                      ),
                      StaggeredGridTile.count(
                        crossAxisCellCount: 1,
                        mainAxisCellCount: cardAxis(),
                        child: Card(
                            color: Color(0xffffffff),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            elevation: 3,
                            shadowColor: Color(0xffeeeeee),
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                          child: Text(
                                            title,
                                            maxLines: 1,
                                            overflow: TextOverflow.fade,
                                            softWrap: false,
                                            style: (TextStyle(
                                                fontWeight: FontWeight.bold)),
                                          )),
                                      Container(
                                        margin: EdgeInsets.only(left: 5),
                                        alignment: Alignment.centerRight,
                                        child: Wrap(
                                          children: [
                                            (Text(date)),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Expanded(
                                      child: Text(
                                        desc,
                                      ))
                                ],
                              ),
                            )),
                      ),
                      StaggeredGridTile.count(
                        crossAxisCellCount: 1,
                        mainAxisCellCount: cardAxis(),
                        child: Card(
                            color: Color(0xffffffff),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            elevation: 3,
                            shadowColor: Color(0xffeeeeee),
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                          child: Text(
                                            title,
                                            maxLines: 1,
                                            overflow: TextOverflow.fade,
                                            softWrap: false,
                                            style: (TextStyle(
                                                fontWeight: FontWeight.bold)),
                                          )),
                                      Container(
                                        margin: EdgeInsets.only(left: 5),
                                        alignment: Alignment.centerRight,
                                        child: Wrap(
                                          children: [
                                            (Text(date)),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Expanded(
                                      child: Text(
                                        desc,
                                      ))
                                ],
                              ),
                            )),
                      ),
                    ],
                  )
                ],
              )),
        ),
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            tooltip: "Add new Task.",
            onPressed: () => Navigator.pop));
  }
}
