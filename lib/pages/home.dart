import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  final WaterController = TextEditingController();

  void ShowDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Add Water"),
        content: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("add water to your daily intake"),
            SizedBox(height: 20,),
            TextField(
              textAlign: TextAlign.center,
              controller: WaterController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp("[0-9]")),
              ],

              decoration: InputDecoration(
                border: OutlineInputBorder(),
                // floatingLabelBehavior: FloatingLabelBehavior.never,
                // alignLabelWithHint: true,
                labelText: "Amount",
              ),
            ),
          ],
        ),
        // this action it's list of the widget it's the attribute that belongs the alert dialog

        actions: [

          TextButton(onPressed: (){
            Navigator.pop(context);

          }, child: Text("cancel")),
          TextButton(onPressed: (){

          }, child: Text("save")),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Water Take"),
        actions: [
          IconButton(
            onPressed: () {
              print("hello map ");
            },
            icon: Icon(Icons.map),
          ),
        ],
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ShowDialog();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
