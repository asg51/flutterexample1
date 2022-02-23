class Student
{
  int id=-1;
  String firstName="";
  String lastName="";
  int grade=0;
  String status="";

  Student(String firstName, String lastName, int grade)
  {
  this.firstName=firstName;
  this.lastName=lastName;
  this.grade=grade;
  this.status="Geçti";
  }

  Student.withId(int id,String firstName, String lastName, int grade)
  {
    this.id= id;
    this.firstName=firstName;
    this.lastName=lastName;
    this.grade=grade;
    this.status="Geçti";
  }

  Student.withoutInfo()
  {

  }

  String get getFirstName
  {
    return this.firstName;
  }
  void set setFirsName(String value)
  {
    this.firstName= value;
  }

}