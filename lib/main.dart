import 'package:flutter/material.dart';

import 'BMI_Calculator.dart';

void main(){
  runApp(const BMI());
}
class BMI extends StatefulWidget {
  const BMI({Key? key}) : super(key: key);

  @override
  State<BMI> createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Calculator()
    );
  }
}
