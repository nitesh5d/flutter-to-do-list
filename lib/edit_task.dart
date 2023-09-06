import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notekeeper/home2.dart';

class EditTask extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _EditTask();
}

class _EditTask extends State<EditTask> {
  List<String> prioritiesList = ['low', 'medium', 'high'];
  late String selectedPriority = prioritiesList.first;

  TextEditingController titleControler = TextEditingController();
  TextEditingController descControler = TextEditingController();
  bool saveButtonPressed = false;
  bool delButtonPressed = false;

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
        title: const Text(
          'Edit Task',
          style: TextStyle(
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Home2(),
                    ));
              },
              icon: Icon(
                Icons.arrow_forward_ios_sharp,
                color: Color(0xffefefef),
              ))
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
            const Text("Priority:"),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 200,
              child: Expanded(
                child: DropdownButtonFormField(
                  value: selectedPriority,
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  borderRadius: BorderRadius.circular(30),
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
                      .map((e) => DropdownMenuItem(child: Text(e), value: e))
                      .toList(),
                  onChanged: (value) {},
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text("Title:"),
            TextField(
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
            TextField(
              controller: descControler,
              maxLength: 200,
              maxLines: 1,
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
            Row(
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
                        backgroundColor:
                        saveButtonPressed? Color(0xff000000) :Color(0xff252525)),
                  onPressed: () {},
                  child: const Text('Save'),
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
                        backgroundColor: delButtonPressed? Color(0xffa12106) : Color(0xffe03714)
                      ),
                      //   style: ButtonStyle(
                      //       backgroundColor:
                      //       delButtonPressed? MaterialStatePropertyAll<Color>(Color(0xffcf3313)):MaterialStatePropertyAll<Color>(Color(0xffe03714))),
                        onPressed: () {},
                        child: const Text('Delete')),
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
