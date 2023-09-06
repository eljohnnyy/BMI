import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result(
      {super.key,
      required this.ismeal,
      required this.result,
      required this.age});
  final bool ismeal;
  final double result;
  final int age;
  String get resultphrase{
String resulttext='';
if(result>=30)  {resulttext='Obese';}


else if(result>=25&&result<30) {resulttext='Overweight';}
 

else if(result>=18.5&&result<=24.9) { resulttext='Normal';}


else  { resulttext='Thin';}


return resulttext;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Gender:  ${ismeal ? 'Meal' : 'Female'}',
                style:
                    Theme.of(context).textTheme.displayLarge,
              ),
                 Text(
                'Result:  ${result.toStringAsFixed(1)}',
               style:
                    Theme.of(context).textTheme.displayLarge,
              ),
               Text(
                'Healthiness:  $resultphrase',
                           
               style:
                    Theme.of(context).textTheme.displayLarge,
                           ),
               Text(
                'Age:  $age',
               style:
                    Theme.of(context).textTheme.displayLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
