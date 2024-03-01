import 'package:flutter/material.dart';
//stateless: full widget rerender, statefull:only renders

class AddTaskScreen extends StatefulWidget {
  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final controller1 = TextEditingController(); //controller for
  @override
  void initState() {
    //state is called at the beginnning
    super.initState();
    /*controller1.addListener(
      //to take userinput
      () {
        print(controller1.text);
      },
    );*/
    print("init state called");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    // controller1.dispose();
    print("Dispose callled");
  }

  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Add Task",
                  style:
                      TextStyle(color: Colors.lightBlueAccent, fontSize: 40.0)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: TextField(
                  autofocus:
                      true, //as soon as the taskfield opens it opens the keyboard without clicking on the textfield
                  textAlign: TextAlign.center,
                  controller: controller1,
                  decoration: InputDecoration(
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: const BorderSide(
                            color: Colors.lightBlueAccent, width: 5.0),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: const BorderSide(
                            color: Colors.lightBlueAccent, width: 5.0),
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(width: 5.0),
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 2.0)),
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              InkWell(
                //creates clickable areas i.e increases to touch area
                onTap: () {},
                child: Container(
                  width: MediaQuery.of(context).size.width *
                      0.8, //screen size 80 % width
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  color: Colors.lightBlueAccent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Add',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
