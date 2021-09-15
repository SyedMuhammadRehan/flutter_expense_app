import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import '../transaction.dart';
import 'chart_bar.dart';

class Chart extends StatelessWidget {
final List<Transaction> recentTransaction;

const Chart(this.recentTransaction);
 List<Map<String,Object>> get groupTransactionValue{
   return List.generate(7, (index)  {
     final weekDay=DateTime.now().subtract(Duration(days: index),);
     double sum=0;
     for (var i=0; i< recentTransaction.length; i++ ){
       if(recentTransaction[i].date.day==weekDay.day && recentTransaction[i].date.month==weekDay.month && recentTransaction[i].date.year==weekDay.year){
         sum+=recentTransaction[i].amount;
       }

     }
  
      return{ 'day' :  DateFormat.E().format(weekDay).substring(0,1) , 'amount' : sum};
   }).reversed.toList();

 }
  double get totalSpending {
    return groupTransactionValue.fold(0.0, (sum, item) {
 return sum + (item['amount'] as double);                         // error  item['amount']
    });
  }
  @override
  Widget build(BuildContext context) {
    print(groupTransactionValue);
    return Card(
      margin:EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children:
          groupTransactionValue.map((e) {
              return Flexible(
                fit: FlexFit.tight,
                child: ChartBar(e['day'] as String, e['amount'] as double, 
                
                   totalSpending==0.0 ? 0.0 :
                 (e['amount'] as double )/ totalSpending ),
              );
            }).toList(),
          
        ),
      ),
      
    );
  }
}
