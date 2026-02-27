import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  final Function(String name, int age, String gender) onsubmit;
  const EditProfile({super.key, required this.onsubmit});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController genderController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(label: Text("name")),
              ),
              SizedBox(height: 10),
              TextField(
                controller: ageController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(label: Text("age")),
              ),
              SizedBox(height: 10),
              TextField(
                controller: genderController,
                decoration: InputDecoration(label: Text("gender")),
              ),
              SizedBox(height: 40),

              ElevatedButton(
                onPressed: () {
                //  Navigator.of(context).pop({'name': 'ahmed'});

                 widget.onsubmit(
                    nameController.text,
                    int.parse(ageController.text),
                    genderController.text,
                  );
                },
                child: Text("SAVE"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
