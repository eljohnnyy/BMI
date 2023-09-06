import 'dart:math';

import 'package:bmi/result.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isMale=true;
  double height=170;
  int weight=55;
  int age=18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Body Mass Index',
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SafeArea(
              child: Center(
                child: Row(
                  children: [
                    row1(context,'Male'),
                    const SizedBox(width: 15,),
                    row1(context,'Female'),
                  ],
                ),
                
              ),
            ),
            const SizedBox(height: 15,),
            SafeArea(
              child: Center(
                child: Row(
                  children: [
                    row3(context,'Height'),
                  
                  ],
                ),
                
              ),
            ),
             const SizedBox(height: 15,),
              SafeArea(
              child: Center(
                child: Row(
                  children: [
                    row2(context,'Weight '),
                    const SizedBox(width: 15,),
                    row2(context,'Age'),
                  ],
                ),
                
              ),
            ),
        const SizedBox(height: 15,),
          Container(
            width: double.infinity,
            height: 50,
            
            child: ElevatedButton(
              
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                backgroundColor: Colors.teal,
            
              ),
              onPressed: (){
                var result=weight/(pow(height/100, 2));
Navigator.push(context, MaterialPageRoute(builder: (context){
  return Result(ismeal: isMale, result:result, age: age);
}));


              }, child: Text('Calculator',style: Theme.of(context).textTheme.displayMedium,)),
          )
          
          ],
        ),
      ),
    );
  }

Expanded row1(BuildContext context,String hint,) {
     
    return Expanded(
      child: GestureDetector(
            onTap: () {
              
              setState(() {
              hint=='Male'?  isMale=true:isMale=false;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color:(isMale&&hint=='Male')||(!isMale&&hint=='Female')? Colors.teal:Colors.blueGrey),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Icon(
                    hint=='Male'?Icons.male:Icons.female,
                    size: 90,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    hint,
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                   
                ],
              ),
            ),
          ),
    );
  }

Expanded row2(BuildContext context,String hint) {
     
    return Expanded(
      child: Container(
        padding:const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color:Colors.blueGrey),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           
            
            Text(
              hint,
              style: Theme.of(context).textTheme.displayMedium,
            ),
          const  SizedBox(height: 15,),
            Text(
                 hint=='Age'?'$age':'$weight',
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                   const  SizedBox(height: 15,),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                     FloatingActionButton(
                      heroTag: hint=='Age'?'Age--':'Weight--',
                      
                      backgroundColor: Colors.teal,
                     
                      onPressed: (){setState(() {
                        if(hint=='Age'){
                          age--;
                        }
                        else{
                          weight--;
                        }
                      });},child:const Icon(Icons.remove,size: 32,color: Colors.white,),) ,
                     FloatingActionButton(
                        heroTag: hint=='Age'?'Age++':'Weight++',
                      backgroundColor: Colors.teal,
                      onPressed: (){setState(() {
                          if(hint=='Age'){
                          age++;
                        }
                        else{
                          weight++;
                        }
                      });},child:const Icon(Icons.add,size: 32,color: Colors.white,),) ,
                    ],
                   )
          ],
        ),
      ),
    );
  }
  Expanded row3(BuildContext context,String hint) {
     
    return Expanded(
      child: Container(
        padding:const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color:Colors.blueGrey),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           
            
            Text(
              hint,
              style: Theme.of(context).textTheme.displayMedium,
            ),
          const  SizedBox(height: 15,),
            Row(
       
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Text(
                     '${height.toInt()}',
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                      Text(
                     ' cm',
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
              ],
            ),
            const  SizedBox(height: 15,),
             Slider(
              activeColor: Colors.teal,
              inactiveColor: Colors.teal,
              min: 90,
              max: 220,
              value: height, onChanged: (heightval){
                setState(() {
                  height=heightval;
                });
              })  
                  
                    ],
                   )
          
        ),
      );
    
  }

}