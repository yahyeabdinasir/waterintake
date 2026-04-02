import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyDesing();
  }
}

class MyDesing extends StatefulWidget {
  const MyDesing({super.key});

  @override
  State<MyDesing> createState() => _MyDesingState();
}

class _MyDesingState extends State<MyDesing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Water Take"),
        actions: [
          IconButton(onPressed: () {
            print("hello map ");
    },
      icon: Icon(Icons.map),

          )


        ],
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("hello yahye ");
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
