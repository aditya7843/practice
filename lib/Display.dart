import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class showData extends StatelessWidget {
  String text;
  String selectedGender;
  String dob;
  String selectedValue;
  bool check2;
  bool check3;
  String prn;

  showData(this.text, this.dob, this.selectedGender, this.selectedValue,
      this.check2, this.check3,this.prn
      );
  String isDSY(check3){
    if(check3==true)
      return "YES";
    else
      return "NO";
  }
  String isDegree(check3){
    if(check2==true)
      return "YES";
    else
      return "NO";
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[50],
      appBar: AppBar(title: Text("User Data"),backgroundColor: Colors.yellow,),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 50, horizontal: 40),
        child: SingleChildScrollView(
          child: Column(

            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(height: 50,),
              Text("Name : $text",style: TextStyle(fontSize: 20),),
              SizedBox(height: 50,),
              Text("PRN : $prn",style: TextStyle(fontSize: 20),),
              SizedBox(height: 50,),
              Text("DOB : $dob",style: TextStyle(fontSize: 20),),
              SizedBox(height: 50,),

              Text("Branch : $selectedValue",style: TextStyle(fontSize: 20),),
              SizedBox(height: 50,),
              Text("Batch: $selectedGender",style: TextStyle(fontSize: 20),),
              SizedBox(height: 50,),
              Text("Is Migrant Student : ${isDegree(check2)}",style: TextStyle(fontSize: 20),),
              SizedBox(height: 50,),
              Text("IS MS student?: ${isDSY(check3)}",style: TextStyle(fontSize: 20),),



            ],
          ),
        ),
      )
      ,
    );
  }
}