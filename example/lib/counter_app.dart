import 'package:flutter/material.dart';
import 'package:sync_ease/sync_ease.dart';

void main() {
  runApp(const SyncEaseApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 15,
            ),
            TextButton(
              child: const Text("Navigate"),
              onPressed: () {
                to(const SecondScreen());
                showSyncSnackBar(const SnackBar(content: Text("sad")));
              },
            )
          ],
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Second Page"),
      ),
    );
  }
}
