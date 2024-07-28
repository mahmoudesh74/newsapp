import 'package:flutter/material.dart';

class HomeScreenCard extends StatelessWidget {
  String name;
   HomeScreenCard({super.key,required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(20),
      ),
      child:  Center(child: Text(name??"",style: TextStyle(fontSize: 20,color: Colors.white),)),
    );
  }
}
