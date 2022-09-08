import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ogrencitakipotomasyou/Student/Student.dart';
import 'package:ogrencitakipotomasyou/validation/student_validator.dart';

class StudentAdd extends StatefulWidget{ 
  List<Student>? students;
 StudentAdd(List<Student>students){
  this.students=students;
 }
  @override
  State<StatefulWidget> createState() {
   
   return _StudentAddState(students!);
  }
}

class _StudentAddState  extends State with StudentValidationMixin{
  List<Student> students = [];
  var student = Student.withoutInfo();
  var FormKey = GlobalKey<FormState>();
  _StudentAddState(List<Student>students){
  this.students=students;
 }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
     appBar: AppBar(
      title:Text("Yeni Öğrenci EKle"),
     ), 
     body: Container(
      margin: EdgeInsets.all(20.0),
        child: Form(
          key : FormKey,
          child: Column(
            children: [
            
             buildFirstNameField(),
             buildLastNameField(),
             buildGradeField(),
             buildSubmitButton(),
             
            ],
        ),
        )
     ),
    );
  }
  Widget buildFirstNameField() {
     return TextFormField(
                decoration: InputDecoration(labelText:"Öğrenci Adı: ",hintText:"Öğrenci adı" ),
                validator: validateFirstName,
                onSaved: (String? value){
                  student.firstName=value;
                },
              );
  }
   Widget buildLastNameField() {
     return TextFormField(
                decoration: InputDecoration(labelText:"Öğrenci Soyadı: ",hintText:"Öğrenci soyadı" ),
                validator: validateLastName,
                onSaved: (String? value){
                  student.LastName=value;
                },
              );
  }
   Widget buildGradeField() {
     return TextFormField(
                decoration: InputDecoration(labelText:"Aldığı Not: ",hintText:"Aldığı not" ),
                validator: validateGrade,
                onSaved: (String? value){
                  student.grade=int.parse(value!);
                },
              );
  }

  Widget buildSubmitButton() {
   return ElevatedButton( 
      child: Text("Kaydet"),
      onPressed: (){
        if(FormKey.currentState!.validate()){
          FormKey.currentState!.save();
          students.add(student);
          saveStudent();
          Navigator.pop(context);
        }
      }
      );
  }

  void saveStudent() {
    print(student.firstName);
    print(student.LastName);
    print(student.grade);
  }



}