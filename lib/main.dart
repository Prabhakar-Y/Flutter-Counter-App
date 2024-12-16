import 'package:flutter/material.dart';
import 'package:flutter_driver/driver_extension.dart';

void main() {
  enableFlutterDriverExtension();
  runApp( CounterApp());
}

class CounterApp extends StatefulWidget {
  @override
  CounterAppState createState() => CounterAppState();
}

class CounterAppState extends State<CounterApp> {
  int _counter = 0;

  // Reset counter
  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  // Increment counter
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  // Decrement counter
  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  // Pick a date
  void _pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Selected Date: ${picked.toLocal()}")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Counter App'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Current Value:',
                key: Key('counterLabel'), // Key for the label
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 10),
              Text(
                '$_counter',
                key: const Key('counterValue'), // Key for the counter value display
                style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    key: const Key('incrementButton'), // Key for the increment button
                    onPressed: _incrementCounter,
                    child:const Text('+1'),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    key: const Key('decrementButton'), // Key for the decrement button
                    onPressed: _decrementCounter,
                    child: const Text('-1'),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    key: const Key('resetButton'), // Key for the reset button
                    onPressed: _resetCounter,
                    child: const Text('Reset'),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                key: const Key('datePickerButton'), // Key for the date picker button
                onPressed: _pickDate,
                icon: const Icon(Icons.calendar_today),
                label: const Text('Pick a Date'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
