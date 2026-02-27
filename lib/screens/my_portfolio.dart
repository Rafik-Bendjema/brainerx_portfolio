import 'package:first_app/screens/edit_profile.dart';
import 'package:first_app/widgets/app_bar.dart';
import 'package:first_app/widgets/info_box.dart';
import 'package:first_app/widgets/projects_section.dart';
import 'package:flutter/material.dart';

class MyPortfolio extends StatefulWidget {
  final String name;
  const MyPortfolio({super.key, required this.name});

  @override
  State<MyPortfolio> createState() => _MyPortfolioState();
}

class _MyPortfolioState extends State<MyPortfolio> {
  TextEditingController title_controller = TextEditingController();
  TextEditingController description_controller = TextEditingController();

  //variables
  Human h1 = Human(name: "rafik", age: 22, gender: "male");

  List<Project> projects = [
    Project(title: "PROJECT 1", description: "THIS IS PROJECT 1 "),
    Project(title: "PROJECT 2", description: "THIS IS PROJECT 2 "),
    Project(title: "PROJECT 3", description: "THIS IS PROJECT 3 "),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            children: [
              MyAppBar(name: widget.name),
              Divider(
                color: Colors.black,
                indent: 100,
                endIndent: 100,
                height: 50,
              ),
              InfoBox(human: h1),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => EditProfile(
                        onsubmit: (name, age, gender) {
                          //CALLBACK FUNCTION
                          setState(() {
                            h1 = Human(name: name, age: age, gender: gender);
                          });
                        },
                      ),
                    ),
                  );
                },
                child: Text("Edit"),
              ),
              Divider(
                color: Colors.black,
                indent: 100,
                endIndent: 100,
                height: 50,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "PROJECT",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => Dialog(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text("Add Project"),
                                SizedBox(height: 10),
                                TextField(
                                  controller: title_controller,
                                  decoration: InputDecoration(
                                    label: Text("Title"),
                                  ),
                                ),
                                SizedBox(height: 10),

                                TextField(
                                  controller: description_controller,
                                  decoration: InputDecoration(
                                    label: Text("Description"),
                                  ),
                                ),
                                SizedBox(height: 10),
                                TextButton(
                                  onPressed: () {
                                    //create a project
                                    if (title_controller.text.isEmpty ||
                                        description_controller.text.isEmpty) {
                                      return;
                                    }
                                    Project project = Project(
                                      title: title_controller.text,
                                      description: description_controller.text,
                                    );

                                    setState(() {
                                      projects.add(project);
                                    });
                                    //return pop
                                    Navigator.pop(context);
                                  },
                                  child: Text("add"),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    icon: Icon(Icons.add),
                  ),
                ],
              ),
              SizedBox(height: 10),
              //projects
              ProjectsSection(projects: projects),
            ],
          ),
        ),
      ),
    );
  }
}

class Human {
  final String name;
  final int age;
  final String gender;

  Human({required this.name, required this.age, required this.gender});
}

class Project {
  final String title;
  final String description;

  const Project({required this.title, required this.description});
}

Widget myWidget(String label, String value) => Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Text('$label:', style: TextStyle(fontSize: 15)),
    Text(
      value,
      style: TextStyle(
        color: Colors.black,
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
    ),
  ],
);
