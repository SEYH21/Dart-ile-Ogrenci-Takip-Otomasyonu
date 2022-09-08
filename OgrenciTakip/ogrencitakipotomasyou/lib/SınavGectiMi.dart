import 'package:flutter/material.dart';

import 'Student/Student.dart';
import 'screens/Student_add.dart';


void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ),
  );
}
class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  String mesaj = "Öğrenci Takip Sistemi";
  Student selectedStudent= Student.withId(0,"","",0);
  List<Student> students = [
    Student.withId(1,"Ali", "Veli", 35),
    Student.withId(2,"Ayşe", "Fatma", 45),
    Student.withId(3,"Ahmet", "Mehmet", 65),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mesaj),
      ),
      body: buildbody(context),
    );
  }
  void mesajGoster(BuildContext context, String mesaj) {
    var alert = AlertDialog(
      title: Text("İşlem Sonucu: "),
      content: Text(mesaj),
    );
    showDialog(context: context, builder: (BuildContext context) => alert);
  }
  Widget buildbody(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: ListView.builder(
                itemCount: students.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                      leading: Icon(Icons.person),
                      title: Text(students[index].firstName +
                          " " +
                          students[index].LastName +
                          " "),
                      subtitle: Text("Sınavdan Aldığı not: " +
                          students[index].grade.toString() +
                          "[" +
                          students[index].getStatus +
                          "]"),
                      trailing: buildStatusIcon(students[index].grade),
                      onTap: () {
                        setState(() {
                          selectedStudent = students[index];
                        });
                        print(selectedStudent.firstName );
                      });
                })),
        Text("Secili Ogrenci: " + selectedStudent.firstName),
        Row(
          children: [
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                primary: Colors.green, 
              ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentAdd(students)));
                },
                child: FittedBox(
                  child: Row(
                    children: [
                      Icon(Icons.add),
                      SizedBox(width: 5.0,),
                      Text("Yeni Öğrenci"),
                    ],
                  ),
                ),
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                primary: Colors.blue, 
              ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentAdd(students)));
                },
                child: Row(
                  children: [
                    Icon(Icons.update),
                    SizedBox(width: 5.0,),
                    Text("Güncelle"),
                  ],
                ),
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                primary: Colors.orange, 
              ),
              child: Row(
                  children: [
                    Icon(Icons.delete),
                    SizedBox(width: 5.0,),
                    Text("Sil"),
                  ],
                ),
                onPressed: () {
                  setState(() {
                     students.remove(selectedStudent);
                  });
                  var mesaj = "Öğrenci Silindi." + selectedStudent.firstName;
                  mesajGoster(context, mesaj);
                },
              ),
            )
          ],
        ),
      ],
    );
  }
  Widget buildStatusIcon(int grade) {
    if (grade >= 50) {
      return Icon(Icons.done);
    } else if (grade >= 40) {
      return Icon(Icons.album);
    } else {
      return Icon(Icons.clear);
    }
  }
}
