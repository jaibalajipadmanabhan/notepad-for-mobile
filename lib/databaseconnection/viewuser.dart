import 'package:flutter/material.dart';
import '../model/User.dart';


class classview extends StatefulWidget {
  final User user;
  const classview({Key? key,required this.user}) : super(key: key);

  @override
  State<classview> createState() => _classviewState();
}

class _classviewState extends State<classview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" users"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text('Details',style: TextStyle(fontWeight: FontWeight.w500,color: Colors.blueGrey,fontSize: 20),),
            SizedBox(height: 20,),
            Row(
              children: [
                Text('Name',style: TextStyle(color: Colors.indigo,fontSize: 16,fontWeight: FontWeight.w500),),
                Padding(padding: const EdgeInsets.only(left:30),
                  child:Text(widget.user.name?? ' ',style: TextStyle(fontSize: 16),),)
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Text('Age',style: TextStyle(color: Colors.indigo,fontSize: 16,fontWeight: FontWeight.w500),),
                Padding(padding: const EdgeInsets.only(left:30),
                  child:Text(widget.user.age?? ' ',style: TextStyle(fontSize: 16),),)
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Text('Contact',style: TextStyle(color: Colors.indigo,fontSize: 16,fontWeight: FontWeight.w500),),
                Padding(padding: const EdgeInsets.only(left:30),
                  child:Text(widget.user.contact?? ' ',style: TextStyle(fontSize: 16),),)
              ],
            ),
            SizedBox(height: 20,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Notes',style: TextStyle(color: Colors.indigo,fontSize: 16,fontWeight: FontWeight.w500),),
                SizedBox(height: 20,),
                Text(widget.user.notes?? ' ',style: TextStyle(fontSize: 16),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
