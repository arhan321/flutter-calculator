import 'package:flutter/material.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CalculatorHomePage(),
    );
  }
}

class CalculatorHomePage extends StatefulWidget {
  const CalculatorHomePage({Key? key}) : super(key: key);

  @override
  _CalculatorHomePageState createState() => _CalculatorHomePageState();
}

class _CalculatorHomePageState extends State<CalculatorHomePage> {
  final String _output = "0";
  String _currentInput = "";
  double _num1 = 0;
  double _num2 = 0;
  String _operand = "";

  void _onNumberPressed(String value) {
    setState(() {
      if (_currentInput.length < 12) {
        if (_currentInput == "0") {
          _currentInput = value;
        } else {
          _currentInput += value;
        }
      }
    });
  }

  void _onOperandPressed(String value) {
    setState(() {
      _operand = value;
      _num1 = double.parse(_currentInput);
      _currentInput = "";
    });
  }

  void _onEqualsPressed() {
    setState(() {
      _num2 = double.parse(_currentInput);
      switch (_operand) {
        case "+":
          _currentInput = (_num1 + _num2).toString();
          break;
        case "-":
          _currentInput = (_num1 - _num2).toString();
          break;
        case "×":
          _currentInput = (_num1 * _num2).toString();
          break;
        case "÷":
          _currentInput = (_num1 / _num2).toString();
          break;
        default:
          break;
      }
      _operand = "";
    });
  }

  void _onClearPressed() {
    setState(() {
      _currentInput = "0";
      _num1 = 0;
      _num2 = 0;
      _operand = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              _currentInput,
              style: const TextStyle(fontSize: 30),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildNumberButton('7'),
              _buildNumberButton('8'),
              _buildNumberButton('9'),
              _buildOperandButton('÷'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildNumberButton('4'),
              _buildNumberButton('5'),
              _buildNumberButton('6'),
              _buildOperandButton('×'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildNumberButton('1'),
              _buildNumberButton('2'),
              _buildNumberButton('3'),
              _buildOperandButton('-'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildNumberButton('0'),
              _buildClearButton(),
              _buildEqualsButton(),
              _buildOperandButton('+'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNumberButton(String value) {
    return ElevatedButton(
      onPressed: () => _onNumberPressed(value),
      child: Text(
        value,
        style: const TextStyle(fontSize: 20),
      ),
    );
  }

  Widget _buildOperandButton(String value) {
    return ElevatedButton(
      onPressed: () => _onOperandPressed(value),
      child: Text(
        value,
        style: const TextStyle(fontSize: 20),
      ),
    );
  }

  Widget _buildEqualsButton() {
    return ElevatedButton(
      onPressed: _onEqualsPressed,
      child: const Text(
        '=',
        style: TextStyle(fontSize: 20),
      ),
    );
  }

  Widget _buildClearButton() {
    return ElevatedButton(
      onPressed: _onClearPressed,
      child: const Text(
        'C',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
