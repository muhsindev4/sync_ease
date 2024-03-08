import 'package:flutter/material.dart';
import 'package:sync_ease/sync_ease.dart';

/// A class representing a user with a name and email.
class User {
  String? name;
  String? email;

  User({this.name, this.email});
}

/// The main application widget.
class MyApp extends StatelessWidget {
  final Ease<List> _incrementList = Ease([0]);
  final Ease<User> _user = Ease(User(name: "Ali", email: "ali@gmail.com"));
  final HomeLogic _homeLogic = SyncEaseLogic.reg(HomeLogic());

  /// Constructs a new instance of MyApp.
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        children: [
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SecondPage()),
              );
            },
            child: const Icon(Icons.arrow_forward_ios_rounded),
          ),
          FloatingActionButton(
            onPressed: () {
              _homeLogic._increment.value++;
              _incrementList.add(1);
              _user.value = User(name: "Muhsin", email: "muhsin@gmail.com");
              _user.update((value) {});
              _user.update((user) => user.name = "Muhsin");
            },
            child: const Icon(Icons.add),
          ),
          TextButton(
            child: const Text("Add Last Name"),
            onPressed: () {
              _homeLogic.addLastName();
            },
          )
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("LogicBuilder Example"),
              LogicBuilder(
                logic: _homeLogic,
                builder: (BuildContext context) {
                  return Text("Full Name:${_homeLogic.fullName}");
                },
              ),
              const Text("Ease<int> Example"),
              EaseBuilder(
                ease: _homeLogic._increment,
                builder: (BuildContext context, int value) {
                  return Text(value.toString());
                },
              ),
              const Text("Ease<User> Example"),
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
              const Text("EaseBuilder Example"),
              EaseBuilder(
                ease: _incrementList,
                builder: (BuildContext context, value) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: _incrementList.value.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          tileColor: index.isEven ? Colors.red : Colors.green,
                          title: Text(
                            _incrementList.value[index].toString(),
                            style: const TextStyle(
                                fontSize: 25, color: Colors.white),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// A stateless widget representing the second page of the application.
class SecondPage extends StatelessWidget {
  final HomeLogic homeLogic = SyncEaseLogic.get(HomeLogic());

  SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(homeLogic._increment.value.toString()),
      ),
    );
  }
}

/// The main logic class for the application.
class HomeLogic extends SyncEaseLogic {
  final Ease<int> _increment = Ease(0);
  String fullName = "Flutter";

  /// Adds the last name "Developer" to the full name.
  void addLastName() {
    fullName = "${fullName}Developer";
    put();
  }
}
