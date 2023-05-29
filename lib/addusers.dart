import 'package:flutter/material.dart';
import 'package:notepad/sources/userservices.dart';

import 'model/User.dart';

class addusers extends StatefulWidget {
  const addusers({Key? key}) : super(key: key);

  @override
  State<addusers> createState() => _addusersState();
}

class _addusersState extends State<addusers> {
  var Name=TextEditingController();
  var age=TextEditingController();
  var contact=TextEditingController();
  var Notes=TextEditingController();
  bool _validatename=false;
  bool _validateage=false;
  bool _validatecontact=false;
  bool _validateNotes=false;
  var _userService=userService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Add New users"),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Add New Details",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.indigo,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 20,),
                TextField(
                  controller: Name,
                  decoration:  InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: "Enter Name",
                    labelText:"Name",
                    errorText: _validatename?'Name cannot be empty':null,
                  ),
                ),
                const SizedBox(height: 20,),
                TextField(
                  controller: age,
                  decoration:  InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: "Enter your age",
                    labelText:"Age",
                    errorText: _validateage?'Age cannot be empty':null,
                  ),
                ),
                const SizedBox(height: 20,),
                TextField(
                  controller: contact,
                  keyboardType: TextInputType.phone,
                  decoration:  InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: "contact number",
                    labelText:"Contact number",
                    errorText: _validatecontact?'cantact number cannot be empty':null,
                  ),
                ),
                const SizedBox(height: 20,),
                TextField(
                  controller: Notes,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: "Description",
                    labelText:"Notes",
                    errorText: _validateNotes?'Description cannot be empty':null,
                  ),
                ),
                const SizedBox(height: 20,),
                Row(
                  children: [
                    TextButton(
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Colors.blueAccent,
                          textStyle: const TextStyle(fontSize: 16),
                        ),
                        onPressed: ()async{
                          setState(() {
                            Name.text.isEmpty?_validatename=true:_validatename=false;
                            age.text.isEmpty?_validateage=true: _validateage=false;
                            contact.text.isEmpty? _validatecontact=true:_validatecontact=false;
                            Notes.text.isEmpty?_validateNotes=true: _validateNotes=false;
                          });
                          if(_validatename==false&&_validateage==false&&_validatecontact==false
                              &&_validateNotes==false){
                            var _user=User();
                            _user.name=Name.text;
                            _user.age=age.text;
                            _user.contact=contact.text;
                            _user.notes=Notes.text;
                            var result=await _userService.SaveUser(_user);
                            Navigator.pop(context,result);
                          }
                        }, child: const Text("Save Detail")),
                    SizedBox(width: 40,),
                    TextButton(
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Colors.redAccent,
                          textStyle: const TextStyle(fontSize: 15),
                        ),
                        onPressed: (){
                          Name.text='';
                          age.text='';
                          contact.text='';
                          Notes.text='';
                        }, child: const Text("Cancel Detail"))
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
