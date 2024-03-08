import 'package:flutter/material.dart';
import 'package:sync_ease/sync_ease.dart';

class CounterLogic extends SyncEaseLogic{
  int a=0;

  increment(){
    a++;
    put(); // update Logic Builder Widget
  }
}

class MyApp extends StatelessWidget{
  final CounterLogic _counterLogic=SyncEaseLogic.reg(CounterLogic());

   MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: (){
          _counterLogic.increment();
        },
      ),
      body: Center(
        child: LogicBuilder(
          logic: _counterLogic,
          builder: (BuildContext context) {
            return Text(_counterLogic.a.toString());
          },
        )
      ),
    );
  }

}