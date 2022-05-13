import 'package:calculator/main.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:flutter/services.dart';
class Main extends StatefulWidget {
  const Main({ Key? key }) : super(key: key);
  
  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
 
 TextEditingController controller1 = TextEditingController();
 TextEditingController controller2 = TextEditingController();
 int? result=0,num1=0,num2=0;
 div(){
   setState(() {
     num1 = int.parse(controller1.text);
     num2 = int.parse(controller2.text);
     num1;
     num2;
     result = num1! ~/ num2!;
   });
 }
 Future<bool> exitDialog() async{
   bool? exitApp = await showDialog(context: context, builder: (BuildContext context){
    return AlertDialog(
      title: const Text("Are you sure"),
      content: const Text("Do you want to close the app?"),
      actions: [
        TextButton(onPressed: (){
          Navigator.of(context).pop(false);
        }, child: const Text("No"),),
        TextButton(onPressed: (){
          Navigator.of(context).pop(true);
        }, child: const Text("Yes"),)
      ],
    );
  }
   );
   return exitApp ?? false;
 }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        SystemNavigator.pop();
        return Future.value(false);
      },
      child: Scaffold(
        backgroundColor: Colors.yellowAccent,
        appBar: AppBar(
          title: const Text('Calculator'),
          leading: BackButton(onPressed: () {
            Navigator.pop(context);
          },),
        ),
        body: Padding(padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text("Division",
            style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,fontFamily: "Pacifico"),
            ),
            SizedBox(
            height: 10,
            ),
            TextField(
              controller: controller1,
              decoration: InputDecoration(
                labelText: "First Number",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0)
                )
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: controller2,
              decoration: InputDecoration(
                labelText: "Second Number",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0)
                )
              ),
            ),
            SizedBox(
            height: 10,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: () {
                    div();
                    controller1.clear();
                    controller2.clear();
                  }, child: Text(' Calculate'))
                ],
              ),
            ),
            SizedBox(
            height: 10,
            ),
             Text("Result: $num1/$num2",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text("$result",
            style: TextStyle(fontSize: 100,fontWeight: FontWeight.bold,color: Colors.green ),)
          ],
        ),
        ),
        resizeToAvoidBottomInset: false,
         floatingActionButton: FloatingActionButton(onPressed: (){
           exitDialog();
         },
        child:  IconButton(onPressed: null, icon: Icon(Icons.close,size: 30,),
        ),
        
        backgroundColor: Colors.blue,
        ),
      ),
    );
  }
}