import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPrecentageOfAmount;

  const ChartBar(
      {@required this.label,
      @required this.spendingAmount,
      @required this.spendingPrecentageOfAmount});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (cx, constraints) {
      return Column(
        children: <Widget>[
          Container(
              height: constraints.maxHeight * 0.15,
              child: FittedBox(
                  child: Text('\$${spendingAmount.toStringAsFixed(0)}'))),
          SizedBox(
            height: constraints.maxHeight * 0.04,
          ),
          Container(
            height: constraints.maxHeight * 0.6,
            width: 10,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                Container(
                    decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(4))),
                FractionallySizedBox(
                    heightFactor: spendingPrecentageOfAmount,
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(4))))
              ],
            ),
          ),
          SizedBox(
            height: constraints.maxHeight * 0.04,
          ),
          Container(height: constraints.maxHeight * 0.17, child: Text(label))
        ],
      );
    });
  }
}
