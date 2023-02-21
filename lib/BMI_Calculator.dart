import 'dart:math';

import 'package:flutter/material.dart';

import 'BMIRESULT.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  bool isMale =true;
  double height =120.0;
  int weight =40;
  int age =20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BMI CALCULATOR'),),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          isMale =true;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.0),
                          color: isMale?Colors.blue:Colors.grey[400],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.male,size: 50.0,),
                            Text('Male',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20,),
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          isMale =false;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.0),
                          color: !isMale?Colors.blue:Colors.grey[400],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.female,size: 50.0,),
                            Text('Female',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.0),
                color: Colors.grey[400],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  const Text('HIGHT',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children:   [
                       Text('${height.round()}',style: const TextStyle(fontSize: 30,fontWeight: FontWeight.w900),),
                       const SizedBox(width: 5,),
                       const Text('CM',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    ],
                  ),
                  Slider(value: height,
                      max: 200,
                      min: 80,
                      onChanged: (value){
                      setState(() {
                        height =value;
                      });
                      }),

                ],
              ),
            ),
          ),),
          Expanded(child: Padding(
            padding: const EdgeInsets.all(20.0),
              child: Row(
               mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
              decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
            color: Colors.grey[400],
          ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Age',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                          Text('$age',style: TextStyle(fontSize: 30,fontWeight: FontWeight.w900),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(onPressed: (){
                                setState(() {
                                  age++;
                                });
                              },child: const Icon(Icons.add),mini: true,),
                              FloatingActionButton(onPressed: (){
                                setState(() {
                                  age--;
                                });
                              },child: const Icon(Icons.remove),mini: true,),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 20,),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.grey[400],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Wight',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                          Text('$weight',style: const TextStyle(fontSize: 30,fontWeight: FontWeight.w900),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(onPressed: (){
                                setState(() {
                                  weight++;
                                });
                              },child: const Icon(Icons.add),mini: true,),
                              FloatingActionButton(onPressed: (){
                                setState(() {
                                  weight--;
                                });
                              },child: const Icon(Icons.remove),mini: true,),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
                child: ElevatedButton(onPressed: (){
                  double result = weight / pow(height/100, 2);
                  print(result.round());

                  Navigator.push(context,
                      MaterialPageRoute(
                        builder: (context)=>  BMIRESULT(isMale: isMale,result: result.round(),age: age,),));
                }, child: const Text('Calculate',style: TextStyle(fontSize: 30),))),
          ),
        ],
      ),
    );
  }
}
