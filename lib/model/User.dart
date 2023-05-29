class User{
  int? id;
  String? age;
  String? name;
  String? contact;
  String? notes;

  usermap(){
    var mapping=Map<String,dynamic>();
    mapping['id']=id??null;
    mapping['name']=name;
    mapping['age']=age;
    mapping['contact']=contact;
    mapping['Notes']=notes;
    return mapping;
  }

}