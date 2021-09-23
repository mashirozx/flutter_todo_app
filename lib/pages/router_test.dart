import 'package:flutter/material.dart';
import 'tips.dart';

class RouterTestRoute extends StatelessWidget {
  const RouterTestRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () async {
          var result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const TipRoute(
                  text: "I'm a router parameter",
                );
              },
            ),
          );
          assert(false, "router return value: $result");
        },
        child: const Text("open tip"),
      ),
    );
  }
}
