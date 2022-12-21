import 'package:flutter/material.dart';
import 'package:event_schedular/main.dart';
import 'package:event_schedular/second_page.dart';

void main()=>runApp(MaterialApp(
  home:Home()
));
class Home extends StatefulWidget{
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List <String> titlenames=[];
  List <String> subtitlenames=[];
  var title_name;
  var subtitle_name;
  var monthnames=['Jan','Feb','March','April','May','June','July','Aug','Sept','Oct','Nov','Dec'];
  @override
  Widget build(BuildContext context){
    return Scaffold(
          // backgroundColor: Colors.indigo,
          appBar:AppBar(
              title:Text('Event Schedular'),
              backgroundColor: Colors.green,
          ),
          body:ListView.separated(
              itemBuilder: (context,index){
                return ListTile(
                  title: Text('${titlenames[index]}',textAlign: TextAlign.center),
                  subtitle: Text('${subtitlenames[index]}',textAlign: TextAlign.center),
                );
              },
              itemCount: titlenames.length,
              separatorBuilder: (context,index){
                return Divider(height: 30,thickness: 0,);
              },
          ),
          floatingActionButton:FloatingActionButton(
            child:Text('+',
              style:TextStyle(
                fontSize:30,
              ),
            ),
            onPressed: () async{
             final result=await Navigator.push(context, MaterialPageRoute(builder: (context)=>Secondpage()));
             print(result);
             setState((){
               if(result.toString().substring(0,23)=="Date is not mentioned  "){
                 title_name="Date is not mentioned";
               }
               else {
                 String re=result.toString().substring(0, 11);
                 String re1=result.toString().substring(8,10);
                 String re2=result.toString().substring(5,7);
                 var mymonth=int.parse(re2);
                 re2=monthnames[mymonth-1];
                 re=re1+" "+re2;
                 title_name =re;
               }
               if(result.toString().substring(23)==""){
                 subtitle_name="Event is not mentioned";
               }
               else {
                 subtitle_name =result.toString().substring(23);
               }
               titlenames.add(title_name);
               subtitlenames.add(subtitle_name);
             });
          },
            backgroundColor: Colors.lightBlue,
          ),
        );
  }
}
