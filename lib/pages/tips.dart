import 'package:flutter/material.dart';

class TipRoute extends StatelessWidget {
  const TipRoute({
    Key? key,
    required this.text, // 接收一个text参数
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tips"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(text),
              ElevatedButton(
                onPressed: () => Navigator.pop(context, "I'm a return value"),
                child: const Text("back"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
