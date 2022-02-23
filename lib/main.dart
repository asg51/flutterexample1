import 'package:flutter/material.dart';
import 'package:flutterexample1/models/student.dart';
import 'package:flutterexample1/screens/student_add.dart';
import 'package:flutterexample1/screens/student_edit.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
 late List<Student> students = [
    new Student.withId(1,"AA", "aa", 1),
    new Student.withId(2,"BB", "bb", 2),
    new Student.withId(3,"CC", "cc", 3)
  ];

  Student selectedStudent= Student("", "", 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Merhaba "),
        backgroundColor: Colors.black,
      ),
      body: buildBody(context),
    );
  }

  String secilen = "abc"; //global olması gerekiyor
  Widget buildBody(BuildContext context) {
    return Column(
      children: [
        Expanded(
            //
            child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://images.ctfassets.net/hrltx12pl8hq/7yQR5uJhwEkRfjwMFJ7bUK/dc52a0913e8ff8b5c276177890eb0129/offset_comp_772626-opt.jpg?fit=fill&w=800&h=300"),
              ),
              title: Text(
                  students[index].firstName + " " + students[index].firstName),
              subtitle: Text(
                  "Sınavdan aldığı not : " + students[index].grade.toString()),
              trailing: buildStatusIcon(students[index].grade),
              onTap: () {
                setState(() {
                  secilen = students[index].firstName +
                      " " +
                      students[index].firstName;
                  print(secilen);

                  selectedStudent=  students[index];
                });
              },
            );
          },
          itemCount: students.length,
        )),
        Text("Seçilen Öğrenci " + secilen),
        Row(
          children: [
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child: RaisedButton(
                onPressed: () {
                 /* var alert = AlertDialog(
                    title: Text("Sınav Sonucu"),
                    content: Text("Geçti"),
                  );
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => alert);
                  */
                print(students.length);
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentAdd(students,this)));
                },
                child: Row(
                  children: [
                    Icon(Icons.add),
                    SizedBox(
                      width: 5.5,
                    ),
                    Text("Ekle"),
                  ],
                ),
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentEdit(selectedStudent,this)));
                },
                child: Row(
                  children: [
                    Icon(Icons.update),
                    SizedBox(
                      width: 5.5,
                    ),
                    Text("Güncelle"),
                  ],
                ),
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: RaisedButton(
                color: Colors.amberAccent,
                onPressed: () {
                  setState(() {
                    students.remove(selectedStudent);
                  });

                },
                child: Row(
                  children: [
                    Icon(Icons.delete),
                    SizedBox(
                      width: 5.5,
                    ),
                    Text("Sil"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildStatusIcon(int grade) {
    if (grade >= 50)
      return Icon(Icons.grade);
    else if (grade >= 40)
      return Icon(Icons.album);
    else
      return Icon(Icons.clear);
  }
}
