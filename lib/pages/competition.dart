import 'package:flutter/material.dart';

class CompetitionPage extends StatefulWidget {
  const CompetitionPage({key}) : super(key: key);

  @override
  _CompetitionPageState createState() => _CompetitionPageState();
}

class _CompetitionPageState extends State<CompetitionPage>{

   @override
   Widget build(BuildContext context) {
     return Scaffold(
       body:Center(
         child:Text("Competitions")
       )
      );
   }
}
