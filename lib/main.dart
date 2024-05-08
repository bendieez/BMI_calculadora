import 'package:flutter/material.dart';

void main() {
  runApp(BMICalculatorApp());
}

class BMICalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora de BMI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BMICalculatorPage(),
    );
  }
}

class BMICalculatorPage extends StatefulWidget {
  @override
  _BMICalculatorPageState createState() => _BMICalculatorPageState();
}

class _BMICalculatorPageState extends State<BMICalculatorPage> {
  double height = 150; // Altura en cm
  double weight = 60; // Peso en kg

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de BMI'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Ingrese su altura (cm):',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Slider(
              value: height,
              min: 100,
              max: 250,
              divisions: 150,
              label: height.round().toString(),
              onChanged: (value) {
                setState(() {
                  height = value;
                });
              },
            ),
            SizedBox(height: 20),
            Text(
              'Ingrese su peso (kg):',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Slider(
              value: weight,
              min: 30,
              max: 150,
              divisions: 120,
              label: weight.round().toString(),
              onChanged: (value) {
                setState(() {
                  weight = value;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                double bmi = calculateBMI(height, weight);
                String result = interpretBMI(bmi);
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Resultado'),
                      content: Text('Tu BMI es: $bmi\n$result'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Cerrar'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Calcular BMI'),
            ),
          ],
        ),
      ),
    );
  }

  double calculateBMI(double height, double weight) {
    return weight / ((height / 100) * (height / 100));
  }

  String interpretBMI(double bmi) {
    if (bmi < 18.5) {
      return 'Bajo peso';
    } else if (bmi < 24.9) {
      return 'Peso saludable';
    } else if (bmi < 29.9) {
      return 'Sobrepeso';
    } else {
      return 'Obesidad';
    }
  }
}
