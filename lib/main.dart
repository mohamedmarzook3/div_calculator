import 'dart:async';
import 'dart:io';
import 'package:calculator/calculator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Calculator',
    home: MyApp(),
    debugShowCheckedModeBanner: false,
    
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
        ),
        body: Center(
          child: ElevatedButton(
            child: const Text('Start Button'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Main()),
              );
            },
          ),
        ),
              floatingActionButton: FloatingActionButton(onPressed: (){
                exitDialog();
              },
      child:  IconButton(onPressed: null, icon: Icon(Icons.close,size: 30,)
      ),
      backgroundColor: Colors.blue,
      ),
      ),
    );
  }


}