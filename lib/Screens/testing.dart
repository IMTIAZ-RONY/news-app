import 'package:flutter/material.dart';
import 'package:news_app/Services/api_services.dart';

class testingScreen extends StatefulWidget {
  const testingScreen({super.key});

  @override
  State<testingScreen> createState() => _testingScreenState();
}

class _testingScreenState extends State<testingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        child: SafeArea(
           child: Column(
            children: [
              ElevatedButton(onPressed: (){
                ApiService().getBreakingNews();
              }, child:Text("Data Checque")),
            ],
          ),
        ),
      ) ,
    );
  }
}
