class StudentValidationMixin{

  String? validateFirstName(String? value){
   if(value!=null && value.length<2){
     return "İsim en az 2 karakter olmalıdır";
   }
  }
  String? validateLastName(String? value){
    if(value!=null && value.length<2){
      return "Soyad en az 2 karakter olmalıdır";
    }
  }
  String? validateGrade(String? value){
    if(value!=null ){
      int grade= int.parse(value);
      if(grade<0||grade>100)
        return "Not 0 100 arasında olmalıdır";
    }
  }
}