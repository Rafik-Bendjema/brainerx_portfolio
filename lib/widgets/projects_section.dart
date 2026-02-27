import 'package:first_app/screens/my_portfolio.dart';
import 'package:flutter/material.dart';

class ProjectsSection extends StatefulWidget {
  final List<Project> projects;
  const ProjectsSection({super.key, required this.projects});

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemCount: widget.projects.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            //print(index);X§§
          },
          child: Stack(
            children: [
              /*   Positioned(
                          bottom: -20,
                          right: 0,
                          child: SvgPicture.asset(
                            errorBuilder: (context, error, stackTrace) =>
                                SizedBox.shrink(),
                            height: 60,
                            fit: BoxFit.fitHeight,
                            "assets/images/braineerx_logo.svg",
                          ),
                        ),*/
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(),
                  gradient: LinearGradient(
                    begin: AlignmentGeometry.topLeft,
                    end: AlignmentGeometry.bottomRight,
                    stops: [0.5, 0.9],
                    colors: [
                      const Color.fromARGB(255, 151, 189, 255),
                      const Color.fromARGB(0, 255, 255, 255),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.projects[index].title,
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(height: 10),
                    Text(widget.projects[index].description),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          widget.projects.removeAt(index);
                        });
                      },
                      child: Text("DELETE"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
