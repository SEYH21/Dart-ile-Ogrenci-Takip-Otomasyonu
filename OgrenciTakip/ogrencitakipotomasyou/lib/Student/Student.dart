class Student{
var id;
var firstName;
var LastName;
var grade;
var status;



Student.withId(int id,String firstName,String lastName,int grade){
  this.id = id;
  this.firstName=firstName;
  this.LastName=lastName;
  this.grade=grade;
  
}

Student(String firstName,String lastName,int grade){ 
  this.firstName=firstName;
  this.LastName=lastName;
  this.grade=grade;
  
}

Student.withoutInfo(){


  
}
String get getStatus{

  String messsage=" ";
   if (this.grade >= 50) {
      messsage = "Geçti ";
    }
    else if(this.grade>=40){
      return messsage="Bütünlemeye Kaldı";
    } else {
      messsage = "Kaldı";
    }
    return messsage;
}

}