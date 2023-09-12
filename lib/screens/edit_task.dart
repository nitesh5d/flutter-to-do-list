import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import '../db_helper.dart';
import 'home2.dart';

class EditTask extends StatefulWidget {
  var appbarTitle;
  var taskId;
  EditTask(this.appbarTitle, this.taskId, this.refreshFunc);

  Function refreshFunc;

  @override
  State<StatefulWidget> createState() =>
      _EditTask(appbarTitle, taskId, refreshFunc);
}

class _EditTask extends State<EditTask> {
  var appbarTitle;
  var taskId;
  var refreshFunc;
  _EditTask(this.appbarTitle, this.taskId, this.refreshFunc);

  List<String> prioritiesList = ['low', 'medium', 'high'];
  int selectedPriority = 1;

  TextEditingController titleControler = TextEditingController();
  var formkey = GlobalKey<FormState>();
  TextEditingController descControler = TextEditingController();

  bool saveButtonPressed = false;
  bool delButtonPressed = false;

  var item;
  var db = DBHelper.instance;

  void getTodo() async {
    var result = await db.queryByiD(taskId);
    setState(() {
      item = result;
      titleControler.text = item[0]["title"];
      descControler.text = item[0]["desc"];
      selectedPriority = item[0]["priority"];
    });
  }

  Future<void> insertTodo() async {
    final now = DateTime.now();
    String date = DateFormat('dd/MM/yyyy').format(now);
    var row = {
      'title': titleControler.text,
      'desc': descControler.text,
      'priority': selectedPriority,
      'createDate': date,
      'updateDate': date,
    };
    await db.insert(row);
  }

  Future<void> updateTodo() async {
    final now = DateTime.now();
    String date = DateFormat('dd/MM/yyyy').format(now);
    var row = {
      'title': titleControler.text,
      'desc': descControler.text,
      'priority': selectedPriority,
      'updateDate': date,
    };
    await db.updateTask(row, taskId);
  }

  void deleteThisTodo(id) async {
    var result = await db.deleteTask(id);
  }

  @override
  void initState() {
    if (taskId > 0) {
      getTodo();
    }
    super.initState();
  }

  @override
  build(context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffefefef),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_sharp),
          color: const Color(0xff252525),
          onPressed: () {
            Navigator.pop(context);
          },
          iconSize: 18,
        ),
        title: Text(
          appbarTitle,
          style: const TextStyle(
            color: Color(0xff252525),
            fontWeight: FontWeight.w400,
          ),
        ),
        centerTitle: true,
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Color(0xffefefef)),
        actions: [
          IconButton.filledTonal(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Home2(),
                    ));
              },
              icon: const Icon(
                Icons.arrow_forward_ios_sharp,
                color: Color(0xffefefef),
              ))
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 20, right: 20, bottom: 20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 30),
              child: Center(
                  child: Image.asset(
                'imgs/edittask.jpg',
                width: 120,
              )),
            ),
            SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text("Priority:"),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 200,
              child: DropdownButtonFormField(
                value: prioritiesList[selectedPriority],
                padding: const EdgeInsets.only(left: 20, right: 20),
                borderRadius: BorderRadius.circular(20),
                decoration: const InputDecoration(
                  hintText: "Set title to this task. (max characters 50)",
                  icon: Icon(Icons.shuffle),
                  iconColor: Color(0xff252525),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffe5e5e5))),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff252525))),
                ),
                items: prioritiesList
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: (value) {
                  selectedPriority = prioritiesList.indexOf(value!);
                  setState(() {});
                },
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              padding: const EdgeInsets.only(left: 20),
              child: Form(
                key: formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Title:"),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Title cannot be empty.';
                        }
                        return null;
                      },
                      controller: titleControler,
                      maxLength: 50,
                      maxLines: 1,
                      textAlign: TextAlign.start,
                      cursorColor: const Color(0xff252525),
                      decoration: const InputDecoration(
                        hintText: "Set title to this task. (max characters 50)",
                        counterText: "",
                        icon: Icon(Icons.comment_bank_rounded),
                        iconColor: Color(0xff252525),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffe5e5e5))),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff252525))),
                      ),
                      style: const TextStyle(
                          color: Color(0xff252525),
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text("Description:"),
                    TextFormField(
                      controller: descControler,
                      maxLength: 200,
                      maxLines: 5,
                      textAlign: TextAlign.start,
                      cursorColor: const Color(0xff252525),
                      decoration: const InputDecoration(
                        hintText: "Write about this task in detail",
                        counterText: "",
                        icon: Icon(Icons.text_snippet_outlined),
                        iconColor: Color(0xff252525),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffe5e5e5))),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff252525))),
                      ),
                      style: const TextStyle(
                          color: Color(0xff252525),
                          letterSpacing: 1,
                          fontWeight: FontWeight.normal),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    currentBtns(),
                  ],
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }

  Widget currentBtns() {
    return (taskId > 0)
        ? Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  child: Theme(
                data: ThemeData(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                ),
                child: FilledButton.tonal(
                  style: ElevatedButton.styleFrom(
                      splashFactory: NoSplash.splashFactory,
                      backgroundColor: saveButtonPressed
                          ? const Color(0xffbef0ff)
                          : const Color(0xff10aec9)),
                  onPressed: () {
                    formkey.currentState!.validate() ? updateTodo() : {};
                    setState(() {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Successfully Updated!")));
                    });
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(top: 13, bottom: 13),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.check,
                          size: 20,
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Text(
                          'SAVE',
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
              )),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                  child: Theme(
                data: ThemeData(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                ),
                child: FilledButton.tonal(
                    style: ElevatedButton.styleFrom(
                        splashFactory: NoSplash.splashFactory,
                        backgroundColor: delButtonPressed
                            ? const Color(0xffa12106)
                            : const Color(0xffe03714)),
                    //   style: ButtonStyle(
                    //       backgroundColor:
                    //       delButtonPressed? MaterialStatePropertyAll<Color>(Color(0xffcf3313)):MaterialStatePropertyAll<Color>(Color(0xffe03714))),
                    onPressed: () {
                      deleteThisTodo(taskId);
                      Navigator.pop(context);
                      refreshFunc();
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(top: 13, bottom: 13),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.delete_outlined,
                            size: 20,
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Text(
                            'DELETE',
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    )),
              ))
            ],
          )
        : Theme(
            data: ThemeData(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
            child: FilledButton.tonal(
              style: ElevatedButton.styleFrom(
                  splashFactory: NoSplash.splashFactory,
                  backgroundColor: saveButtonPressed
                      ? const Color(0xffbef0ff)
                      : const Color(0xff10aec9)),
              onPressed: () {
                formkey.currentState!.validate() ? insertTodo() : {};
                setState(() {
                  titleControler.clear();
                  descControler.clear();
                  selectedPriority = 1;
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Successfully Added!")));
                });
              },
              child: const Padding(
                padding: EdgeInsets.only(top: 13, bottom: 13),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.check,
                      size: 20,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      'SAVE',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
