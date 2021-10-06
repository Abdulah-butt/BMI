import 'package:bmi/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class OutputPage extends StatefulWidget {
  OutputPage(double bmi){
   output_bmi=bmi.toInt();
   calculateCodition(output_bmi);
  }

  @override
  _OutputPageState createState() => _OutputPageState();
}

int output_bmi=0;
String condition='';

void calculateCodition(int bmi){
if(bmi<18){
  condition='Under weight';
}else if(bmi>=18&&bmi<25){
  condition='Greate shape';
}else if(bmi>=25&&bmi<30){
  condition='Over weight';
}else if(bmi>=30){
  condition='Obese';
}else{
  condition='';
}
}
class _OutputPageState extends State<OutputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(bodyColor),
      appBar: new AppBar(
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.white54),
        title: new Text("Result",),
        backgroundColor: Color(headerColor),
        centerTitle: true,
      ),
      body: new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _getRadialGauge(),
        ],
      ),
    );
  }



  Widget _getRadialGauge() {
    return SfRadialGauge(
      backgroundColor: Colors.white54,
        title: GaugeTitle(
            text: 'BMI',
            textStyle:
            const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
        axes: <RadialAxis>[
          RadialAxis(minimum: 0, maximum: 50, ranges: <GaugeRange>[
            GaugeRange(
                startValue: 0,
                endValue: 18,
                color: Colors.brown,
                startWidth: 10,
                endWidth: 10),
            GaugeRange(
                startValue: 18,
                endValue: 25,
                color: Colors.green,
                startWidth: 10,
                endWidth: 10),
            GaugeRange(
                startValue: 25,
                endValue: 30,
                color: Colors.orange,
                startWidth: 10,
                endWidth: 10),
            GaugeRange(
                startValue: 30,
                endValue: 50,
                color: Colors.red,
                startWidth: 10,
                endWidth: 10),
          ], pointers: <GaugePointer>[
            NeedlePointer(value: output_bmi.toDouble())
          ], annotations: <GaugeAnnotation>[
            GaugeAnnotation(
                widget: Container(
                    child: Text('$condition',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold))),
                angle: 90,
                positionFactor: 0.5)
          ])
        ]);
  }


}
