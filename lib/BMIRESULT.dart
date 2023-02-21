import 'package:flutter/material.dart';

class BMIRESULT extends StatelessWidget {
  final int result;
  final bool isMale;
  final int age;

  BMIRESULT({
   required this.age,
    required this.result,
    required this.isMale,
});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BMI RESULT'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
             Text('GENDER : $isMale',style: const TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold),),
            Text('AGE : $age',style: const TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold),),
            Text('WEIGHT :$result ',style: const TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold),),

          ],
        ),
      ),
    );
  }
}
