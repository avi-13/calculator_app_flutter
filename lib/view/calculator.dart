import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  List<String> button = [
    'C',
    '*',
    '/',
    '<--',
    '1',
    '2',
    '3',
    '-',
    '4',
    '5',
    '6',
    '%',
    '7',
    '8',
    '9',
    '%',
    '+',
    '0',
    '.',
    '=',
  ];
  final inputText = TextEditingController();
  String currOperator = '';
  double fOperand = 0.0;

  void handleButtonPress(String buttonText) {
    setState(() {
      switch (buttonText) {
        case 'C':
          inputText.text = '';
          currOperator = '';
          fOperand = 0.0;
          break;
        case '<--':
          if (inputText.text.isNotEmpty) {
            inputText.text =
                inputText.text.substring(0, inputText.text.length - 1);
          }
          break;
        case '=':
          if (currOperator.isNotEmpty && inputText.text.isNotEmpty) {
            double secondOperand = double.parse(inputText.text);
            double result =
                performOperation(fOperand, secondOperand, currOperator);
            inputText.text = result.toString();
            currOperator = '';
          }
          break;
        case '*':
        case '/':
        case '+':
        case '-':
        case '%':
          if (inputText.text.isNotEmpty) {
            fOperand = double.parse(inputText.text);
            currOperator = buttonText;
            inputText.text = '';
          }
          break;
        default:
          inputText.text += buttonText;
      }
    });
  }

  double performOperation(
      double fOperand, double secondOperand, String operator) {
    switch (operator) {
      case '*':
        return fOperand * secondOperand;
      case '/':
        return fOperand / secondOperand;
      case '+':
        return fOperand + secondOperand;
      case '-':
        return fOperand - secondOperand;
      case '%':
        return fOperand % secondOperand;
      default:
        throw Exception('Invalid operator: $operator');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculator"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: inputText,
              textAlign: TextAlign.right,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "",
              ),
              validator: (value) =>
                  value!.isEmpty ? "Please enter first name" : null,
            ),
          ),
          Expanded(
            child: GridView.count(
              padding: const EdgeInsets.all(8),
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              crossAxisCount: 4,
              children: [
                for (int i = 0; i < button.length; i++) ...{
                  SizedBox(
                    child: ElevatedButton(
                      onPressed: () => {handleButtonPress(button[i])},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.black,
                      ),
                      child: Text(
                        button[i],
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                }
              ],
            ),
          ),
        ],
      ),
    );
  }
}
