import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ogrencitakipotomasyou/Student/Student.dart';
import 'package:ogrencitakipotomasyou/validation/student_validator.dart';

class StudentEdit extends StatefulWidget{ 
  Student? selectedStudent;
 StudentEdit(Student selectedStudent){
  this.selectedStudent=selectedStudent;
 }
  @override
  State<StatefulWidget> createState() {
   
   return _StudentAddState(selectedStudent);
  }
}

class _StudentAddState  extends State with StudentValidationMixin{
  Student? selectedStudent;
  
  var FormKey = GlobalKey<FormState>();
  _StudentAddState(Student? selectedStudent) {
  this.selectedStudent=selectedStudent;
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
      initialValue: selectedStudent!.firstName,
                decoration: InputDecoration(labelText:"Öğrenci Adı: ",hintText:"Öğrenci adı" ),
                validator: validateFirstName,
                onSaved: (String? value){
                  selectedStudent?.firstName=value;
                },
              );
  }
   Widget buildLastNameField() {
     return TextFormField(
      initialValue: selectedStudent!.LastName,
                decoration: InputDecoration(labelText:"Öğrenci Soyadı: ",hintText:"Öğrenci soyadı" ),
                validator: validateLastName,
                onSaved: (String? value){
                  selectedStudent?.LastName=value;
                },
              );
  }
   Widget buildGradeField() {
     return TextFormField(
      initialValue: selectedStudent!.grade.toString(),
                decoration: InputDecoration(labelText:"Aldığı Not: ",hintText:"Aldığı not" ),
                validator: validateGrade,
                onSaved: (String? value){
                  selectedStudent?.grade=int.parse(value!);
                },
              );
  }

  Widget buildSubmitButton() {
   return ElevatedButton( 
      child: Text("Kaydet"),
      onPressed: (){
        if(FormKey.currentState!.validate()){
          FormKey.currentState!.save();
          saveStudent();
          Navigator.pop(context);
        }
      }
      );
  }

  void saveStudent() {
    print(selectedStudent?.firstName);
    print(selectedStudent?.LastName);
    print(selectedStudent?.grade);
  }



}