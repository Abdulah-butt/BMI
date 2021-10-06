import 'package:bmi/ui/output.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "BMI",
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

bool maleColor = true;
bool femaleColor = false;

int headerColor = 0xff0f1433;
int bodyColor = 0xff283063;
int beforeClickColor = 0xff363e63;
int _weight = 80;
int _age=18;
int value=0;
double bmi=0.0;
class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(bodyColor),
      appBar: new AppBar(
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.white54),
        title: new Text("BMI CACULATOR"),
        backgroundColor: Color(headerColor),
        centerTitle: true,
      ),
      body: new Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new GestureDetector(
                  onTap: () {
                    setState(() {
                      femaleColor = false;
                      maleColor = true;
                    });
                  },
                  child: new Container(
                    height: size.height * 0.2,
                    width: size.width * 0.4,
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Icon(
                          Icons.male_rounded,
                          size: size.height * 0.1,
                          color: Colors.white60,
                        ),
                        new Text(
                          "MALE",
                          style: _textStyle(16),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: maleColor
                          ? Color(headerColor)
                          : Color(beforeClickColor),
                    ),
                  ),
                ),
                new GestureDetector(
                  onTap: () {
                    setState(() {
                      femaleColor = true;
                      maleColor = false;
                    });
                  },
                  child: new Container(
                    height: size.height * 0.2,
                    width: size.width * 0.4,
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Icon(
                          Icons.female_rounded,
                          size: size.height * 0.1,
                          color: Colors.white60,
                        ),
                        new Text(
                          "FEMALE",
                          style: _textStyle(16),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: femaleColor
                          ? Color(headerColor)
                          : Color(beforeClickColor),
                    ),
                  ),
                )
              ],
            ),
          ),

          // height progrss bar
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: new Row(
              children: <Widget>[
                new Container(
                  height: size.height * 0.2,
                  width: size.width * 0.92,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Color(headerColor),
                  ),
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Text(
                        "Height\n",
                        style: _textStyle(16),
                      ),
                      new Text(
                        "${_value.toInt()} cm\n",
                        style: _textStyle(22),
                      ),
                      new Slider(
                        value: _value,
                        onChanged: (double value) {
                          setState(() {
                            _value = value;
                          });
                        },
                        min: 90,
                        max: 275,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(18.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                //weight box

                new Container(
                  height: size.height * 0.2,
                  width: size.width * 0.4,
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Text(
                        "Weight",
                        style: _textStyle(14),
                      ),
                      new Text(
                        "${_weight}",
                        style: _textStyle(48),
                      ),
                      new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          GestureDetector(
                            onTap: (){
                              setState(() {
                                _weight=_weight+1;
                                print(_weight);
                              });
                            },
                            child: new Container(
                              height: size.height * 0.05,
                              width: size.height * 0.05,
                              decoration: _boxDecoration(),
                              child: Icon(Icons.add),
                            ),
                          ),
                          SizedBox(width: size.width*0.05,),
                          GestureDetector(
                            onTap: (){
                              setState(() {
                                _weight=_weight-1;
                              });
                            },
                            child: new Container(
                              height: size.height * 0.05,
                              width: size.height * 0.05,
                              decoration: _boxDecoration(),
                              child: Icon(Icons.remove),
                            ),
                          ),

                        ],
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: new Color(headerColor),
                  ),
                ),




                // Age Container


                new Container(
                  height: size.height * 0.2,
                  width: size.width * 0.4,
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Text(
                        "Age",
                        style: _textStyle(14),
                      ),
                      new Text(
                        "${_age}",
                        style: _textStyle(48),
                      ),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          GestureDetector(
                            onTap: (){
                              setState(() {
                                _age=_age+1;
                                print(_weight);
                              });
                            },
                            child: new Container(
                              height: size.height * 0.05,
                              width: size.height * 0.05,
                              decoration: _boxDecoration(),
                              child: Icon(Icons.add),
                            ),
                          ),
                          SizedBox(width: size.width*0.05,),
                          GestureDetector(
                            onTap: (){
                              setState(() {
                                _age=_age-1;
                              });
                            },
                            child: new Container(
                              height: size.height * 0.05,
                              width: size.height * 0.05,
                              decoration: _boxDecoration(),
                              child: Icon(Icons.remove),
                            ),
                          ),

                        ],
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: new Color(headerColor),
                  ),
                ),

              ],
            ),
          ),


          // Calculate Button

          Padding(
            padding: const EdgeInsets.all(18.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Container(
                  height: size.height * 0.1,
                  width: size.width * 0.92,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                    color: new Color(headerColor),
                  ),
                  child: ElevatedButton(onPressed: (){
                    Navigator.push(context, new MaterialPageRoute(builder: (context){
                      double height_in_meter=_value/100;
                      print(height_in_meter);
                      bmi=_weight/(height_in_meter*height_in_meter);
                      return OutputPage(bmi);
                    }));
                  }, child: Text("CACULATE BMI",style:_textStyle(28),),style:ElevatedButton.styleFrom(primary: Color(beforeClickColor)) ,),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }









}

double _value = 170;

TextStyle _textStyle(double size) {
  return TextStyle(
      color: Colors.white60, fontWeight: FontWeight.bold, fontSize: size);
}

BoxDecoration _boxDecoration() {
  return BoxDecoration(
    shape: BoxShape.circle,
    color: Colors.white,
  );
}




