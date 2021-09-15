import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../transaction.dart';

class TransList extends StatelessWidget {
  final List<Transaction> transaction;
  final Function delete;
TransList(this.delete,this.transaction);

  @override
  Widget build(BuildContext context) {   
    return  transaction.isEmpty
          ? Column(
              children: [
                Text("No transaction added yet...!"),
                Image.asset(
                  "lib/images/oop.png",
                  width: 50,
                  height: 50,
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                // return Card(
                //                       elevation: 5,
                //                       color: Colors.redAccent,
                //                       child: Row(
                //                         children: [
                //                           Container(

                //                             margin: EdgeInsets.symmetric(
                //                                 horizontal: 10, vertical: 10),
                //                             child: Text('\$${transaction[index].amount.toStringAsFixed(2)}',style: TextStyle(fontSize:18,fontWeight: FontWeight.bold),),
                //                             decoration: BoxDecoration
                //                             ( border: Border.all(color:Colors.black,width: 3,), ),
                //                             padding: EdgeInsets.all(10)

                //                           ),
                //                           Column(
                //                             crossAxisAlignment: CrossAxisAlignment.start,
                //                             children: [
                //                               Text(transaction[index].title,style: TextStyle(fontSize:16, color: Colors.black, fontWeight: FontWeight.bold)),
                //                               Text(DateFormat.yMMMd().format(transaction[index].date), style: TextStyle(fontSize:12, color: Colors.greenAccent)),
                //                             ],
                //                           )
                //                         ],
                //                       ));
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric( vertical:8, horizontal: 5),
                  child: ListTile(
                    
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: FittedBox(child: Text('\$${transaction[index].amount}')),
                      ),
                    ), title:Text( transaction[index].title),
                    subtitle: Text(DateFormat.yMMMd().format(transaction[index].date)),
                    trailing: MediaQuery.of(context).size.width >360 ?
                   FlatButton.icon(label: Text("Delete"),icon: Icon(Icons.delete),textColor:Colors.redAccent,onPressed:() => delete(transaction[index].id)) : 
                   IconButton(icon: Icon(Icons.delete),color: Colors.redAccent,onPressed:() => delete(transaction[index].id),)
                  
                  ),
                );
              },
              itemCount: transaction.length,
            );

  }
}
