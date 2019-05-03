import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CalculatorInterface extends StatefulWidget {
  @override
  _CalculatorInterfaceState createState() => _CalculatorInterfaceState();
}

class _CalculatorInterfaceState extends State<CalculatorInterface> {
  String _expression;
  String _result = "";
  String operator = "";
  String numberSet1 = "", numberSet2 = "";

  _getValueFromButton() {
    setState(() {
      if (_expression == "") {
        Fluttertoast.showToast(
            msg: "Enter the second expression",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        numberSet2 = _expression;
        double a = double.parse(numberSet1);
        double b = double.parse(numberSet2);
        switch (operator) {
          case "+":
            double c = a + b;
            _result = c.toString();
            break;
          case "-":
            double c = a - b;
            _result = c.toString();
            break;
          case "/":
            if (b == 0) {
              Fluttertoast.showToast(
                  msg: "Cannot be divided by 0",
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.CENTER,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0);
            } else {
              double c = a / b;
              _result = c.toString();
            }
            break;
          case "*":
            double c = a * b;
            _result = c.toString();
            break;
          default:
            break;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Calculator"),
        ),
        body: Container(
            child: Column(
          children: <Widget>[
            TextFormField(
              style: TextStyle(
                fontSize: 40,
              ),
              decoration: InputDecoration(
                hintText: this._result,
                hintStyle: TextStyle(
                  fontSize: 40,
                ),
              ),
            ),
            Row(
              children: <Widget>[
                arrrangeDigits(),
                separaterLine(),
                operatorArray(),
              ],
            )
          ],
        )),
      ),
    );
  }

  Widget operatorArray() {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                setState(() {
                  if (_expression == null) {
                    print("Please enter the valid number to add first");
                  } else {
                    numberSet1 = _expression;
                    operator = "/";
                    _expression = "";
                    _result = _expression;
                  }
//                  _expression = _expression == null ? "%" : _expression + "/";
                });
              },
              child: Image(
                image: AssetImage('images/divide.png'),
                width: 50,
                height: 50,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                setState(() {
                  if (_expression == null) {
                    print("Please enter the valid number to add first");
                  } else {
                    numberSet1 = _expression;
                    operator = "*";
                    _expression = "";
                    _result = _expression;
                  }
                });
              },
              child: Image(
                image: AssetImage('images/error.png'),
                width: 50,
                height: 50,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                setState(() {
                  if (_expression == null) {
                    print("Please enter the valid number to add first");
                  } else {
                    numberSet1 = _expression;
                    operator = "-";
                    _expression = "";
                    _result = _expression;
                  }
                });
              },
              child: Image(
                image: AssetImage('images/minus.png'),
                width: 50,
                height: 50,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                if (_expression == null) {
                  print("Please enter the valid number to add first");
                } else {
                  numberSet1 = _expression;
                  operator = "+";
                  _expression = "";
                  _result = _expression;
                }
              });
            },
            child: Image(
              image: AssetImage('images/plus.png'),
              width: 50,
              height: 50,
            ),
          ),
        ],
      ),
    );
  }

  Widget arrrangeDigits() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _expression =
                          _expression == null ? "1" : _expression + "1";
                      _result = _expression;
                    });
                  },
                  child: Image(
                    image: AssetImage('images/one.png'),
                    width: 50,
                    height: 50,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _expression =
                          _expression == null ? "2" : _expression + "2";
                      _result = _expression;
                    });
                  },
                  child: Image(
                    image: AssetImage('images/two.png'),
                    width: 50,
                    height: 50,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _expression =
                          _expression == null ? "3" : _expression + "3";
                      _result = _expression;
                    });
                  },
                  child: Image(
                    image: AssetImage('images/three.png'),
                    width: 50,
                    height: 50,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _expression =
                          _expression == null ? "4" : _expression + "4";
                      _result = _expression;
                    });
                  },
                  child: Image(
                    image: AssetImage('images/four.png'),
                    width: 50,
                    height: 50,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _expression =
                          _expression == null ? "5" : _expression + "5";
                      _result = _expression;
                    });
                  },
                  child: Image(
                    image: AssetImage('images/five.png'),
                    width: 50,
                    height: 50,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _expression =
                          _expression == null ? "6" : _expression + "6";
                      _result = _expression;
                    });
                  },
                  child: Image(
                    image: AssetImage('images/six.png'),
                    width: 50,
                    height: 50,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _expression =
                          _expression == null ? "7" : _expression + "7";
                      _result = _expression;
                    });
                  },
                  child: Image(
                    image: AssetImage('images/seven.png'),
                    width: 50,
                    height: 50,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _expression =
                          _expression == null ? "8" : _expression + "8";
                      _result = _expression;
                    });
                  },
                  child: Image(
                    image: AssetImage('images/eight.png'),
                    width: 50,
                    height: 50,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _expression =
                          _expression == null ? "9" : _expression + "9";
                      _result = _expression;
                    });
                  },
                  child: Image(
                    image: AssetImage('images/nine.png'),
                    width: 50,
                    height: 50,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _expression =
                          _expression == null ? "0" : _expression + "0";
                      _result = _expression;
                    });
                  },
                  child: Image(
                    image: AssetImage('images/zero.png'),
                    width: 50,
                    height: 50,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: _getValueFromButton,
                  child: Image(
                    image: AssetImage('images/equal.png'),
                    width: 40,
                    height: 40,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _expression = "";
                      _result = _expression;
                    });
                  },
                  child: Image(
                    image: AssetImage('images/cancel.png'),
                    width: 50,
                    height: 50,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget separaterLine() {
    return Container(
      height: 300,
      width: 5,
      decoration: BoxDecoration(color: Colors.red),
    );
  }
}
