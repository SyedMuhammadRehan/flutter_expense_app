import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final spendingprctamount;
  ChartBar(this.label,this.spendingAmount,this.spendingprctamount);


  @override
  Widget build(BuildContext context) {
    return 
    LayoutBuilder(builder: (context, constraintss){ return   Column(
      children: [
        Container(
          height: constraintss.maxHeight *0.15,
          child: FittedBox(child: Text('\$${spendingAmount.toStringAsFixed(0)}'))),
        SizedBox(height: constraintss.maxHeight *0.04,),
        Container(
          height: constraintss.maxHeight *0.6,
          width: 10,
          child: Stack(
            children: [
              Container(
              decoration: BoxDecoration(
                border: Border.all(color:Colors.grey, width: 1.0),
                color: Color. fromRGBO(220, 220, 220, 1),
                borderRadius: BorderRadius.circular(10),

              ),
              ),
              FractionallySizedBox(heightFactor: spendingprctamount, child: Container(decoration: BoxDecoration(color: Colors.blueGrey,borderRadius: BorderRadius.circular(10)),),)
            ],
          ),
        ),  SizedBox(height: constraintss.maxHeight *0.05),
Container(
  height: constraintss.maxHeight * 0.15,
  child: FittedBox(child: Text(label))),      ],
           
            
    );  },);
   
  }
}