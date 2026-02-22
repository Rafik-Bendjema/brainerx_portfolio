import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyPortfolio(name: "Ahmed"),
    );
  }
}

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
              Container(
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
              ),
              Divider(
                color: Colors.black,
                indent: 100,
                endIndent: 100,
                height: 50,
              ),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: AlignmentGeometry.topLeft,
                    end: AlignmentGeometry.bottomRight,
                    stops: [0.2, 0.2],
                    colors: [
                      Colors.blue,
                      const Color.fromARGB(24, 33, 149, 243),
                    ],
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
                          child: Text(
                            "Error",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 50),

                    Expanded(
                      child: Column(
                        children: [
                          myWidget("name", h1.name),
                          SizedBox(height: 10),
                          myWidget("age", h1.age.toString()),
                          SizedBox(height: 10),
                          myWidget("gender", h1.gender),
                        ],
                      ),
                    ),
                  ],
                ),
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
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemCount: projects.length,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      //print(index);
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
                                projects[index].title,
                                style: TextStyle(fontSize: 20),
                              ),
                              SizedBox(height: 10),
                              Text(projects[index].description),
                              SizedBox(height: 10),
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    projects.removeAt(index);
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
              ),
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
