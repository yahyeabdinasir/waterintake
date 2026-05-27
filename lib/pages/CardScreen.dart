import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:untitled/data/waterData.dart';
import 'package:untitled/model/waterModel.dart';
import 'package:untitled/pages/detailedPage.dart';

class CardScreen extends StatelessWidget {
  CardScreen({super.key, required this.watermodel, this.isDetails = true});

  final Watermodel watermodel;
  bool isDetails;

  @override
  Widget build(BuildContext context) {
    return Card(
      // so the meaning of the elevation is that give a small shadow the below of the card
      elevation: 4,

      child: ListTile(
        title: Row(
          children: [
            Icon(Icons.water_drop, size: 30, color: Colors.blue),
            SizedBox(width: 10),
            Text(
              style: Theme.of(context).textTheme.titleMedium,
              '${watermodel.amount.toString()}, ${watermodel.unit} ',
            ),
          ],
        ),

        subtitle: Text(watermodel.dateTime.toString()),
        trailing: IconButton(onPressed: (){
          Provider.of<Waterdata>(context , listen: false).delete(watermodel);


        }, icon: Icon(Icons.delete),
        ),
        onTap: () {
          isDetails
              ? Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Detailedpage(
                      property: watermodel,
                      id: watermodel.dateTime,
                    ),
                  ),
                )
              : Text("not");
        },
      ),
    );
  }
}
