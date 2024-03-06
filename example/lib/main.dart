

import 'package:flutter/material.dart';
import 'package:sync_ease/sync_ease/src/ease.dart';
import 'package:sync_ease/sync_ease/src/sync_ease_logic.dart';
import 'package:sync_ease/sync_ease/widgets/ease_builder.dart';

class User{
  String? name;
  String? email;

  User({this.name,this.email});
}

class HomeLogic extends SyncEaseLogic{
  final Ease<int> _increment=Ease(0);
}
void main(){
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget{

  final Ease<List> _incrementList=Ease([0]);
  final Ease<User> _user=Ease(User(name: "Ali",email: "ali@gmail.com"));
  final HomeLogic _homeLogic=SyncEaseLogic.reg(HomeLogic());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        children: [
          FloatingActionButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>SecondPage()));
          },
            child: Icon(Icons.arrow_forward_ios_rounded),
          ),
          FloatingActionButton(
            onPressed: (){

              _homeLogic._increment.value++;
              _incrementList.add(1);
              _user.value=User(name: "Muhsin",email: "muhsin@gmail.com");
              _user.update((value){

              });
              _user.update((user) => user.name = "Muhsin");
            },
            child: Icon(Icons.add),
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Int Test"),
                EaseBuilder(
                  ease:_homeLogic. _increment,
                  builder: (BuildContext context, int value) {
                    return Text(value.toString());
                  },
                ),
                Text("class Test"),
                EaseBuilder(
                  ease: _user,
                  builder: (BuildContext context, User value) {
                    return Column(
                      children: [
                        Text(value.name.toString()),
                        Text(value.email.toString()),
                      ],
                    );
                  },
                ),

                EaseBuilder(
                  ease: _incrementList,
                  builder: (BuildContext context,  value) {
                    return  Expanded(
                      child: ListView.builder(
                        itemCount: _incrementList.value.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            tileColor:index.isEven? Colors.red:Colors.green,
                            title: Text(_incrementList.value[index].toString(),
                              style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white
                              ),),
                          );
                        },
                      ),
                    );
                  },
                ),

              ],
            )
        ),
      ),
    );
  }

}


class SecondPage extends StatelessWidget{
  HomeLogic homeLogic=SyncEaseLogic.get(HomeLogic());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(homeLogic._increment.value.toString()),
      ),
    );
  }

}