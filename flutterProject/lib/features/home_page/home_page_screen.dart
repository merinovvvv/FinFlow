import "package:fl_chart/fl_chart.dart";
import "package:flutter/material.dart";

import "../../fin_flow_app.dart";


class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Category> expenses = Expenses.instance.expenses;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text(widget.title),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(
            flex: 2,
          ),
          Expanded(
            // Center(
            child: PieChart(
              PieChartData(
                sections: getSections(),
                centerSpaceRadius: 50,
              ),
            ),
          ),
          Spacer(
            flex: 1,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/add_expenses');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                fixedSize: Size(150, 75),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text(
                '-',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 45,
                    fontWeight: FontWeight.bold),
              ),
            ),
            ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.greenAccent,
                fixedSize: Size(150, 75),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text(
                '+',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 45,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ]),
          Spacer(
            flex: 1,
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> getSections() {
    List<PieChartSectionData> sectionData = [];
    List<Color> colors = [
      Colors.blueAccent,
      Colors.redAccent,
      Colors.greenAccent,
      Colors.lightBlueAccent,
      Colors.pinkAccent,
      Colors.deepOrangeAccent
    ];
    double sumExpenses = 0;
    for (var i = 0; i < expenses.length; i++) {
      sumExpenses += expenses[i].value;
    }
    for (var i = 0; i < expenses.length; i++) {
      sectionData.add(PieChartSectionData(
        color: colors[i % colors.length],
        value: expenses[i].value,
        title: '''${expenses[i].name}
 ${((expenses[i].value / sumExpenses) * 100).round()}%''',
        radius: 80,
        titleStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: const Color(0xffffffff),
        ),
      ));
    }
    if (sectionData.isEmpty) {
      sectionData.add(PieChartSectionData(
        color: Colors.blueGrey,
        value: 100,
        title: '',
        radius: 80,
        titleStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: const Color(0xffffffff),
        ),
      ));
    }
    return sectionData;
  }

  void onPressed() {
    return;
  }
}
