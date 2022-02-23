import 'package:flutter/material.dart';
import 'package:flutterexample1/models/student.dart';
import 'package:flutterexample1/validation/student_validator.dart';

import '../main.dart';

class StudentAdd extends StatefulWidget {

 List<Student> students;
 State<MyApp> app;
  StudentAdd(this.students,this.app) {
    print(this.students.length);
  }
  @override
  State<StatefulWidget> createState() {
    return _StudentAddState(this.students,this.app);
  }
}

// StudentValidationMixin kalıtım almasın ama StudentValidationMixin fonksiyonları kullanabilsin
class _StudentAddState extends State with StudentValidationMixin {
   List<Student> students=[];
   State<MyApp> app;
  _StudentAddState(this.students,this.app) {

  }
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
      decoration:
          InputDecoration(labelText: "Öğrenci Adı", hintText: "Emrullah"),
      validator: validateFirstName,
      onSaved: (String? value) {
        if (value != null) student.firstName = value;
      },
    );
  }

  buildLastNameField() {
    return TextFormField(
      decoration:
          InputDecoration(labelText: "Öğrenci Soyadı", hintText: "Aşgaroğlu"),
      validator: validateLastName,
      onSaved: (String? value) {
        if (value != null) student.lastName = value;
      },
    );
  }

  buildGradeField() {
    return TextFormField(
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
  students.add(student);
  Navigator.pop(context);
});




        }
      },
    );
  }
}
