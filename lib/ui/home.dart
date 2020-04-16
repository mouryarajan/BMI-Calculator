import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new bmi();
  }
}

class bmi extends State<Home> {
  final TextEditingController _ageController = new TextEditingController();
  final TextEditingController _heightController = new TextEditingController();
  final TextEditingController _weightController = new TextEditingController();
  double inches = 0.0;
  double result = 0.0;
  String _resultReading = 'Enter Details';

  String _finalResult = "BMI: 0.0";
  void _tapMe() {
    setState(() {
      int age = int.parse(_ageController.text);
      double height = double.parse(_heightController.text);
      double kg = double.parse(_weightController.text);
      double weight = kg * 2.20462;
      inches = height*12;
      if((_ageController.text.isNotEmpty || age > 0) && ((_heightController.text.isNotEmpty || inches > 0) && (_weightController.text.isNotEmpty || weight > 0)))
        {
          result = weight / (inches * inches) * 703;

          if(result < 18.5)
            {
              _resultReading = 'Under Weight';
            }
          else if(result < 24.9)
            {
              _resultReading = 'Normal';
            }
          else if(result < 29.9)
            {
              _resultReading = 'Over Weight';
            }
          else if(result > 30.0)
            {
              _resultReading = 'Obese';
            }
          else
            {
              _resultReading = 'Ennter proper Details';
            }
        }
      else
        {
          result = 0.0;
        }
    });
    _finalResult = "Your BMI: ${result.toStringAsFixed(1)}";
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Center(child: new Text('BMI')),
        backgroundColor: Colors.pinkAccent,
      ),
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          children: <Widget>[
            new Padding(padding: new EdgeInsets.all(2.0)),
            new Image.asset(
              'images/bmilogo.png',
              width: 85,
              height: 75,
            ),
            new Container(
              margin: const EdgeInsets.all(5.0),
              height: 240,
              width: 290,
              child: new Column(
                children: <Widget>[
                  new Padding(
                    padding: new EdgeInsets.all(5.2),
                  ),
                  new Container(
                    margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: new TextField(
                      controller: _ageController,
                      keyboardType: TextInputType.number,
                      decoration: new InputDecoration(
                        labelText: 'Age',
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        icon: new Icon(Icons.person_outline),

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0),
                        ),
                      ),
                    ),
                  ),
                  new Padding(
                    padding: new EdgeInsets.all(5.2),
                  ),
                  new Container(
                    margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: new TextField(
                      controller: _heightController,
                      keyboardType: TextInputType.number,
                      decoration: new InputDecoration(
                        labelText: 'Height',
                        hintText: 'Weight in lbs',
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        icon: new Icon(Icons.insert_chart),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0),
                        ),
                      ),
                    ),
                  ),
                  new Padding(
                    padding: new EdgeInsets.all(5.2),
                  ),
                  new Container(
                    margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: new TextField(
                      controller: _weightController,
                      keyboardType: TextInputType.number,
                      decoration: new InputDecoration(
                        labelText: 'Wiight',
                        hintText: 'Weight in Kg',
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        icon: new Icon(Icons.line_weight),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0),
                        ),
                      ),
                    ),
                  ),
                  new Padding(
                    padding: new EdgeInsets.all(5.6),
                  ),
                  new FlatButton(
                    color: Colors.pinkAccent,
                    onPressed: _tapMe,
                    child: new Text(
                      'Click me',
                      style: new TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            new Padding(
              padding: new EdgeInsets.all(5.5),
            ),
            new Center(
              child: new Text(
                '$_finalResult',
                style: new TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  color: Colors.pinkAccent,
                ),
              ),
            ),
            new Center(
              child: new Text(
                '$_resultReading',
                style: new TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  color: Colors.pinkAccent,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
