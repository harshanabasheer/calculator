import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String output = "0";
  String history = '';
  String _output = "";
  double num1 = 0;
  double num2 = 0;
  String operand = "";

  buttonPressed(String buttonText) {
    if (buttonText == "AC") {
      setState(() {
        output = "0";
        _output = "";
        num1 = 0;
        num2 = 0;
        operand = "";
        history = "";
      });
    }
    else if (buttonText == "+/-") {
      setState(() {
        output = "0";
        _output = "";
        num1 = 0;
        num2 = 0;
        operand = "";
        history = "";
      });
    }
    else if (buttonText == "+" || buttonText == "-" || buttonText == "*" ||
        buttonText == "/") {
      num1 = double.parse(output);
      operand = buttonText;
      _output = "";
      history = num1.toString() + operand.toString();
    }
    else if (buttonText == ".") {
      if (_output.contains(".")) {
        print("Already contains a decimal");
        return;
      } else {
        _output = _output + buttonText;
      }
    }
    else if (buttonText == "=") {
      num2 = double.parse(output);

    if (operand == "+") {
      _output = (num1 + num2).toString();
      history = num1.toString() + operand.toString() + num2.toString();
    }
    if (operand == "-") {
      _output = (num1 - num2).toString();
      history = num1.toString() + operand.toString() + num2.toString();
    }
    if (operand == "*") {
      _output = (num1 * num2).toString();
      history = num1.toString() + operand.toString() + num2.toString();
    }
    if (operand == "/") {
      _output = (num1 / num2).toString();
      history = num1.toString() + operand.toString() + num2.toString();
    }
    if (operand == "%") {
      _output = (num1 % num2).toString();
      history = num1.toString() + operand.toString() + num2.toString();
    }
    num1 = 0;
    num2 = 0;
    operand = "";
  }
    else{
      _output= _output+buttonText;
    }
    print(_output);

    setState(() {
      output = _output;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(height: 10),
            Align(
              alignment: Alignment.topRight,
              child: Text(
                history, style: TextStyle(color: Colors.white, fontSize: 48, fontWeight: FontWeight.bold),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Text(
                output, style: TextStyle(color: Colors.white, fontSize: 48, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildFloatingActionButton("AC", Colors.white70, Colors.black),
                SizedBox(width: 20),
                buildFloatingActionButton("+/-", Colors.white70, Colors.black),
                SizedBox(width: 20),
                buildFloatingActionButton("%", Colors.white70, Colors.black),
                SizedBox(width: 20),
                buildFloatingActionButton("/", Colors.yellow, Colors.white),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildFloatingActionButton("7", Colors.white30, Colors.white),
                SizedBox(width: 20),
                buildFloatingActionButton("8", Colors.white30, Colors.white),
                SizedBox(width: 20),
                buildFloatingActionButton("9", Colors.white30, Colors.white),
                SizedBox(width: 20),
                buildFloatingActionButton("*", Colors.yellow, Colors.white),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildFloatingActionButton("4", Colors.white30, Colors.white),
                SizedBox(width: 20),
                buildFloatingActionButton("5", Colors.white30, Colors.white),
                SizedBox(width: 20),
                buildFloatingActionButton("6", Colors.white30, Colors.white),
                SizedBox(width: 20),
                buildFloatingActionButton("-", Colors.yellow, Colors.white),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildFloatingActionButton("1", Colors.white30, Colors.white),
                SizedBox(width: 20),
                buildFloatingActionButton("2", Colors.white30, Colors.white),
                SizedBox(width: 20),
                buildFloatingActionButton("3", Colors.white30, Colors.white),
                SizedBox(width: 20),
                buildFloatingActionButton("+", Colors.yellow, Colors.white),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildFloatingActionButton("0", Colors.white30, Colors.white),
                SizedBox(width: 130),
                buildFloatingActionButton(".", Colors.white30, Colors.white),
                SizedBox(width: 20),
                buildFloatingActionButton("=", Colors.yellow, Colors.white),
              ],
            ),
          ],
        ),
      ),
    );
  }

  FloatingActionButton buildFloatingActionButton(String text1, Color backgroundColor, Color Colors) {
    return FloatingActionButton.large(
      onPressed: () {
        buttonPressed(text1);
      },
      backgroundColor: backgroundColor, // Background color of the button
      shape: CircleBorder(),
      child: Text(
        text1,
        style: TextStyle(color: Colors, fontWeight: FontWeight.bold,fontSize: 30),
      ),
    );
  }
}
