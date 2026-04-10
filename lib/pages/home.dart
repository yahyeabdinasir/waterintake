import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:untitled/data/waterData.dart';
import 'package:untitled/model/waterModel.dart';


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

  final WaterController = TextEditingController();
  void initState() {
    // TODO: implement initState
    final value = Provider.of<Waterdata>(context , listen: false).getwatermodel();
    print("this is the value $value");
    super.initState();

  }


  void SaveData() {
    Provider.of<Waterdata>(context, listen: false)
        .AddWater(Watermodel(
      amount: double.parse(WaterController.text.toString()),
      unit: 'ml',
      dateTime: DateTime.now(),
    ));


    if (!context.mounted) {
      return;
    }
  }



  void ShowDialog() {
    showDialog(
      context: context,
      builder: (context) =>
          AlertDialog(
            title: Text("Add Water"),
            content: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("add water to your daily intake"),
                SizedBox(height: 20),
                TextField(
                  textAlign: TextAlign.center,
                  controller: WaterController,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                  ],

                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Amount",
                  ),
                ),
              ],
            ),

            // this action it's list of the widget it's the attribute that belongs the alert dialog
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("cancel"),
              ),
              TextButton(
                onPressed: () {
                //  save data into the firebase

                  SaveData();
                  Navigator.pop(context);
                },
                child: Text("save"),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Waterdata>(
      builder: (context, value, child) =>
          Scaffold(
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
              backgroundColor: Theme
                  .of(context)
                  .colorScheme
                  .primary,
            ),

            body: ListView.builder(
              itemCount: value.WaterListProvider.length,
                itemBuilder: (context , index){
                final watermodel = value.WaterListProvider[index];
                return ListTile(
                  title: Text(watermodel.amount.toString()),
                );



                },

            ),

            floatingActionButton: FloatingActionButton(
              onPressed: () {
                ShowDialog();
              },
              child: Icon(Icons.add),
            ),
          ),
    );
  }
}

// void SaveWater(String amount) async{
//   var url = Uri.https(
//       "water-intake-fdba7-default-rtdb.firebaseio.com", "water.json");
//   var restults =  await http.post(url ,  headers: {
//   "Content-Type" : "application/json",
//
//
//   },
//   body: json.encode({
//     "water" : double.parse(amount),
//     "unit": "ml" ,
//     "time": DateTime.now().toIso8601String()
//
//   }));
//   if(restults.statusCode== 200){
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text("water saved successfully"))
//     );
//
//   }
//   else{
//     print("somthings went wrong ");
//   }
//
