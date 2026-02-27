import 'package:flutter/material.dart';

class MyAppBar extends StatefulWidget {
  final String name;
  const MyAppBar({super.key, required this.name});

  @override
  State<MyAppBar> createState() => _AppBarState();
}

class _AppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text("Welcome Back ", style: TextStyle(fontSize: 15)),
              Text(
                widget.name,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 66, 147, 176),
                ),
              ),
            ],
          ),
          ElevatedButton(onPressed: () {}, child: Text("Logout")),
        ],
      ),
    );
  }
}
