import 'package:flutter/material.dart';
import 'package:event_schedular/second_page.dart';


void main()=>runApp(MaterialApp(
   home:Secondpage()
));
class Secondpage extends StatefulWidget{
  @override
  State<Secondpage> createState() => _SecondpageState();
}

class _SecondpageState extends State<Secondpage> {
  var result=TextEditingController();
  String _selecteddate="Date is not mentioned  ";
  Future <void> opendatepicker(BuildContext context) async{
    final DateTime? d=await showDatePicker(
        context: context
        ,initialDate: DateTime.now(),
        firstDate: DateTime(2022),
        lastDate: DateTime(2030),);
    if (d!=null){
      setState(() {
        _selecteddate=new DateTime(d.year,d.month,d.day).toString();
      });

    }
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title:Text('New Event'),
        backgroundColor: Colors.green,
      ),
      body:Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Container(
              width:300,
              child:TextField(
                controller: result,
                style:TextStyle(fontWeight: FontWeight.bold,),
                decoration: InputDecoration(
                  hintStyle: TextStyle(color:Colors.black),
                  border:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  prefixIcon: IconButton(
                    icon: Icon(Icons.calendar_month,color: Colors.green,),
                    onPressed: (){
                      opendatepicker(context);
                    },
                  ),
                  hintText: "Event",
                ),
              ),
            ),
            const SizedBox(height: 15,),
            ElevatedButton(
              style:ElevatedButton.styleFrom(
                minimumSize: Size(300,50),
                textStyle: TextStyle(fontWeight: FontWeight.bold),
              ),
              child:Text('ADD'),
              onPressed:()=>Navigator.pop(context,_selecteddate+result.text.toString()),
            ),
          ],
        ),
      ),
    );
  }
}