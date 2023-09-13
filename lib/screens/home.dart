import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:notekeeper/db_helper.dart';
import 'package:sqflite/sqflite.dart';
import 'edit_task.dart';
import 'home_logic.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Home();
  }
}

class _Home extends State<Home> {
  Color priorityIconColor = Colors.amberAccent;
  IconData priorityIcon = Icons.disc_full;
  List<dynamic>? items;

  // var logic = HomeLogic();

  var db = DBHelper.instance;

  void getAllTodoList() async {
    var result = await db.queryAll();
    setState(() {
      items = result;
    });
  }

  IconData leadingIcon(priority) {
    if (priority == 2) {
      return Icons.timer_rounded;
    } else if (priority == 1) {
      return Icons.safety_check_sharp;
    } else {
      return Icons.eco;
    }
  }

  Color leadingColor(priority) {
    if (priority == 2) {
      return Colors.red;
    } else if (priority == 1) {
      return Colors.orangeAccent;
    } else {
      return Colors.lightBlue;
    }
  }

  void deleteThisTodo(id) async {
    var result = await db.deleteTask(id);
    getAllTodoList();
    setState(() {});
  }

  @override
  void initState() {
    getAllTodoList();
    super.initState();
  }

  @override
  build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "To Do",
          style: TextStyle(
            color: Color(0xff252525),
            fontWeight: FontWeight.w400,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xffefefef),
        elevation: 0,
        foregroundColor: const Color(0xff252525),
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Color(0xffefefef),
            statusBarIconBrightness: Brightness.dark),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [currentWidget()],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        elevation: 1,
        backgroundColor: const Color(0xffe4f8ff),
        foregroundColor: Colors.blue,
        splashColor: Colors.blue[100],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        label: const Text("Add Task"),
        icon: const Icon(Icons.add),
        tooltip: "Add a new Task.",
        onPressed: () async {
          await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      EditTask("Add Note", 0, getAllTodoList)));
          getAllTodoList();
        },
      ),
    );
  }

  Widget currentWidget() {
    return (items == null || items!.isEmpty)
        ? Padding(
            padding: const EdgeInsets.all(30),
            child: Column(children: [
              Image.asset('imgs/notask.png'),
              const Text(
                "No task found, Click the below button to add a task.",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black45),
              ),
            ]),
          )
        : ListView.separated(
            shrinkWrap: true,
            itemCount: items!.length,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (BuildContext context, int index) {
              return const Divider(
                thickness: 0.5,
                height: 2,
                indent: 20,
                endIndent: 20,
              );
            },
            itemBuilder: (context, index) {
              return Material(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(20),
                child: InkWell(
                  splashColor: Colors.black12,
                  child: Container(
                    decoration: const BoxDecoration(color: Colors.transparent),
                    child: ListTile(
                      leading: Icon(
                        leadingIcon(items![index]['priority']),
                        color: leadingColor(items![index]['priority']),
                        size: 58,
                      ),
                      title: Text(
                        items![index]['title'],
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                        maxLines: 1,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      subtitle: Row(
                        children: [
                          Text(
                            items![index]['updateDate'].toString(),
                            style: const TextStyle(
                                fontSize: 10, color: Color(0xff646464)),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Text(
                              items![index]['desc'],
                              overflow: TextOverflow.ellipsis,
                              softWrap: false,
                              maxLines: 1,
                              style: const TextStyle(color: Color(0xff333333)),
                            ),
                          ),
                        ],
                      ),
                      trailing: IconButton(
                        icon: const Icon(
                          Icons.delete_outlined,
                          color: Colors.redAccent,
                        ),
                        highlightColor: Colors.red[100],
                        onPressed: () {
                          deleteThisTodo(items![index]['id']);
                        },
                        splashColor: Colors.red[100],
                      ),
                      onLongPress: () async {
                        await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EditTask("Edit Note",
                                    items![index]['id'], getAllTodoList)));
                        getAllTodoList();
                      },
                      onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => showTaskDialog(
                                items![index]['title'],
                              items![index]['desc'],
                              leadingIcon(items![index]['priority']),
                              leadingColor(items![index]['priority']),),
                          );
                      },
                    ),
                  ),
                ),
              );
            },
          );
  }

  showTaskDialog(title, desc, icon, iconColor) {
    return Dialog(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        padding: EdgeInsets.only(top:20,bottom: 40,left: 20,right: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  splashRadius: 20,
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.clear),
                )
              ],
            ),
            Icon(icon,color: iconColor, size: 68,),
            SizedBox(height: 20,),
            SizedBox(
              width: double.maxFinite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text(title,style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Text(desc,style: TextStyle(fontSize: 18),),
              ],),
            )
          ],
        ),
      ),
    );
  }
}
