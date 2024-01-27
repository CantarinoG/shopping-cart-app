import 'package:flutter/material.dart';
import 'package:shop/providers/counter.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Exemplo Contador",
        ),
      ),
      body: Column(
        children: <Widget>[
          Text(CounterProvider.of(context)?.state.value.toString() ?? "0"),
          IconButton(
            onPressed: () {
              setState(() {
                CounterProvider.of(context)?.state.inc();
              });
            },
            icon: Icon(Icons.add),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                CounterProvider.of(context)?.state.dec();
              });
            },
            icon: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
