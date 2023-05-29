import 'package:flutter/material.dart';
import 'package:notepad/Edituser.dart';
import 'package:notepad/addusers.dart';
import 'package:notepad/databaseconnection/viewuser.dart';
import 'package:notepad/model/User.dart';
import 'package:notepad/sources/userservices.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<User> _userList;
  final userservice=userService();
  getalluser() async{
    _userList=<User>[];
    var users=await userservice.ReadAllUsers();
    users.forEach((user){
      setState(() {
        var usermodel=User();
        usermodel.id=user['id'];
        usermodel.name=user['name'];
        usermodel.age=user['age'];
        usermodel.contact=user['contact'];
        usermodel.notes=user['notes'];
        _userList.add(usermodel);
      });
    });
  }

  @override
  void initState() {
    getalluser();
    super.initState();
  }

  _delete(BuildContext context,userId){
    return showDialog(context: context, builder: (_del){
      return AlertDialog(
        title: const Text("Are you sure you want to delete?"),
        actions: [
          TextButton(onPressed: ()async{
            var result=await userservice.delete(userId);
            Navigator.pop(context);
            if(result != null){
              getalluser();
            }
          }, child: const Text('Delete')),
          TextButton(onPressed: (){
            Navigator.pop(context);
          }, child: const Text('Close')),
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("LocalDatabase"),),
      body: ListView.builder(itemCount: _userList.length,
          itemBuilder: (context,index){
            return Card(
              child: ListTile(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>classview(user: _userList[index],)));

                },
                leading: Icon(Icons.person),
                title: Text(_userList[index].name ?? ''),
                subtitle: Text(_userList[index].contact ?? ' '),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Edituser(user: _userList[index],)))
                          .then((data) {
                        if(data!=null){
                          getalluser();
                        }
                      });
                    }, icon: const Icon(Icons.edit,color: Colors.blue,)),
                    IconButton(onPressed: (){
                      _delete(context,_userList[index].id);
                    }, icon: const Icon(Icons.delete,color: Colors.redAccent,)),
                  ],
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>addusers())).then((data){
            if(data!=null){
              getalluser();
            }
          });
        },
        child: Icon(Icons.add),
      ),

    );
  }
}
