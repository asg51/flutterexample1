import 'package:flutter/material.dart';
import 'package:flutterexample1/models/student.dart';
import 'package:flutterexample1/validation/student_validator.dart';

import '../main.dart';

class StudentEdit extends StatefulWidget {
  Student student;
  State<MyApp> app;
  StudentEdit(this.student, this.app) {}
  @override
  State<StatefulWidget> createState() {
    return _StudentEditState(this.student, this.app);
  }
}

// StudentValidationMixin kalıtım almasın ama StudentValidationMixin fonksiyonları kullanabilsin
class _StudentEditState extends State with StudentValidationMixin {
  Student editStudent;
  State<MyApp> app;
  _StudentEditState(this.editStudent, this.app) {}
  Student student = Student.withoutInfo();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yeni Öğrenci Ekle"),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                buildFirstNameField(),
                buildLastNameField(),
                buildGradeField(),
                buildSumbitButton()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildFirstNameField() {
    return TextFormField(
      initialValue: editStudent.firstName,
      decoration: InputDecoration(labelText: "Öğrenci Adı", hintText: "Emrullah"),
      validator: validateFirstName,
      onSaved: (String? value) {
        if (value != null) student.firstName = value;
      },
    );
  }

  buildLastNameField() {
    return TextFormField(
      initialValue: editStudent.lastName,
      decoration: InputDecoration(labelText: "Öğrenci Soyadı", hintText: "Aşgaroğlu"),
      validator: validateLastName,
      onSaved: (String? value) {
        if (value != null) student.lastName = value;
      },
    );
  }

  buildGradeField() {
    return TextFormField(
      initialValue: editStudent.grade.toString(),
      decoration: InputDecoration(labelText: "Aldığı Not", hintText: "51"),
      validator: validateGrade,
      onSaved: (String? value) {
        if (value != null) student.grade = int.parse(value);
      },
    );
  }

  Widget buildSumbitButton() {
    return RaisedButton(
      child: Text("Kayıt Et"),
      onPressed: () {
        if (formKey.currentState!.validate()) {
          formKey.currentState?.save();
          app.setState(() {
            editStudent.firstName = student.firstName;
            editStudent.lastName = student.lastName;
            editStudent.grade = student.grade;
            Navigator.pop(context);
          });
        }
      },
    );
  }
}
