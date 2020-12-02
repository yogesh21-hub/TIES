import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class OverallStats extends StatefulWidget {
  @override
  _OverallStatsState createState() => _OverallStatsState();
}

class _OverallStatsState extends State<OverallStats> {
  List<charts.Series<Marks, String>> seriesList;
  _createSampleData() {
    final globalnooftimesData = [
      new Marks('12', 1, Color(0xffFD6666)),
      new Marks('13', 2, Color(0xffFD6666)),
      new Marks('14', 4, Color(0xffFD6666)),
      new Marks('15', 2, Color(0xffFD6666)),
      new Marks('16', 5, Color(0xffFD6666)),
      new Marks('17', 1, Color(0xffFD6666)),
      new Marks('18', 5, Color(0xffFD6666)),
      new Marks('19', 1, Color(0xffFD6666)),
      new Marks('20', 5, Color(0xffFD6666)),
    ];
    seriesList.add(charts.Series(
        id: ' 12',
        data: globalnooftimesData,
        domainFn: (Marks nooftimes, _) => nooftimes.scored,
        measureFn: (Marks nooftimes, _) => nooftimes.nooftimes,
        colorFn: (Marks nooftimes, _) =>
            charts.ColorUtil.fromDartColor(nooftimes.color)));
  }

  List<charts.Series<SubGroup, String>> seriesSubList;
  _createData() {
    final globalData = [
      new SubGroup('0', 1, Color(0xffFD6666)),
      new SubGroup('50', 2, Color(0xffFD6666)),
      new SubGroup('100', 4, Color(0xffFD6666)),
      new SubGroup('150', 2, Color(0xffFD6666)),
      new SubGroup('200', 5, Color(0xffFD6666)),
      new SubGroup('250', 1, Color(0xffFD6666)),
      new SubGroup('300', 5, Color(0xffFD6666)),
      new SubGroup('350', 1, Color(0xffFD6666)),
    ];
    seriesSubList.add(charts.Series(
        id: 'zx',
        data: globalData,
        domainFn: (SubGroup number, _) => number.scores,
        measureFn: (SubGroup number, _) => number.number,
        colorFn: (SubGroup number, _) =>
            charts.ColorUtil.fromDartColor(number.colors)));
  }

  @override
  void initState() {
    seriesList = List<charts.Series<Marks, String>>();
    seriesSubList = List<charts.Series<SubGroup, String>>();
    _createSampleData();
    _createData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Container(
              height: 180,
              width: double.infinity,
              child: charts.BarChart(
                seriesList,
                animate: true,
                barGroupingType: charts.BarGroupingType.grouped,
                primaryMeasureAxis: new charts.NumericAxisSpec(
                    renderSpec: new charts.NoneRenderSpec()),
              )),
          SizedBox(
            height: 17,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 33.0),
            child: Text(
              'Overall Assessment Scores in percentage with respect to time for the current semester.',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 19,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
              height: 235,
              width: double.infinity,
              child: charts.BarChart(
                seriesSubList,
                animate: true,
                barGroupingType: charts.BarGroupingType.values[2],
                primaryMeasureAxis: new charts.NumericAxisSpec(
                    renderSpec: new charts.NoneRenderSpec()),
              )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 33.0),
            child: Text(
              'Scores with respect to the entire batch.',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 19,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 17,
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 96.0),
                    child: Text(
                      '85%',
                      style: TextStyle(
                          color: Color(0xffD33030),
                          fontSize: 19,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 32.0),
                    child: Text('Avg. % of Entire Batch',
                        style: TextStyle(
                            color: Color(0xffD33030),
                            fontSize: 17,
                            fontWeight: FontWeight.w400)),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 96.0),
                    child: Text(
                      '75%',
                      style: TextStyle(
                          color: Color(0xffD33030),
                          fontSize: 19,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 32.0),
                    child: Text('Avg. % of Sub Group',
                        style: TextStyle(
                            color: Color(0xffD33030),
                            fontSize: 17,
                            fontWeight: FontWeight.w400)),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 31,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 60.0),
                child: Text(
                  '80%',
                  style: TextStyle(
                      color: Color(0xffD33030),
                      fontSize: 19,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40.0),
                child: Text('Your Avg. %',
                    style: TextStyle(
                        color: Color(0xffD33030),
                        fontSize: 17,
                        fontWeight: FontWeight.w400)),
              ),
            ],
          ),
          SizedBox(
            height: 49,
          ),
        ],
      ),
    );
  }
}

class Marks {
  final String scored;
  final int nooftimes;
  Color color;
  Marks(this.scored, this.nooftimes, this.color);
}

class SubGroup {
  final String scores;
  final int number;
  Color colors;
  SubGroup(this.scores, this.number, this.colors);
}
