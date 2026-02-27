import 'package:first_app/screens/my_portfolio.dart';
import 'package:flutter/material.dart';

class InfoBox extends StatefulWidget {
  final Human human;
  const InfoBox({super.key, required this.human});

  @override
  State<InfoBox> createState() => _InfoBoxState();
}

class _InfoBoxState extends State<InfoBox> {
  @override
  Widget build(BuildContext context) {
    //variable
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: AlignmentGeometry.topLeft,
          end: AlignmentGeometry.bottomRight,
          stops: [0.2, 0.2],
          colors: [Colors.blue, const Color.fromARGB(24, 33, 149, 243)],
        ),
        borderRadius: BorderRadius.circular(20),
      ),

      child: Row(
        children: [
          Container(
            width: 120,
            height: 120,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(shape: BoxShape.circle),
            child: Image.asset(
              fit: BoxFit.fitHeight,
              "assets/images/profile_picture.jpg",
              errorBuilder: (context, error, stackTrace) => Center(
                child: Text("Error", style: TextStyle(color: Colors.black)),
              ),
            ),
          ),
          SizedBox(width: 50),

          Expanded(
            child: Column(
              children: [
                myWidget("name", widget.human.name),
                SizedBox(height: 10),
                myWidget("age", widget.human.age.toString()),
                SizedBox(height: 10),
                myWidget("gender", widget.human.gender),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
