import 'package:flutter/material.dart';

import 'Display.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Myapp(),
  ));
}

class Myapp extends StatefulWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  DateTime selectedDate = DateTime.now();

  String date= "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}";
  TextEditingController name = TextEditingController();
  TextEditingController prn = TextEditingController();

  String _selectedGender = 'male';
  String selectedValue = "Computer";
  bool? check1 = false, check2 = true, check3 = false;
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(child: Text("Computer"), value: "Computer"),
    DropdownMenuItem(child: Text("IT"), value: "IT"),
    DropdownMenuItem(child: Text("Electronics"), value: "Electronics"),
    DropdownMenuItem(child: Text("Mechanical"), value: "Mechanical"),
    DropdownMenuItem(child: Text("Civil"), value: "Civil"),
  ];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));

    // if (picked != null && picked != selectedDate) {
    setState(() {
      date= "${picked?.day}/${picked?.month}/${picked?.year}";
    });
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[100],
     /* appBar: AppBar(
        //toolbarHeight: 100,
        //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        centerTitle: true,
        title: Text(
          "Form",
          style: TextStyle(fontSize: 30),
        ),
      ),*/

      appBar: AppBar(
        backgroundColor: Colors.yellow,
        toolbarHeight: 50.0,
        title: Center(
          child: Text(
              'Students form',
                  style: TextStyle(
              color: Colors.black
          ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellow,
        child: Icon(Icons.done),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return showData(name.text.toString(),date,_selectedGender,selectedValue,check2!,check3!,prn.text.toString());
          }));
        },
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: Form(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 10.0,
                ),
                TextFormField(

                  decoration: InputDecoration(
                      labelText: "Name",
                      hintText: "Enter your name",
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                        const BorderSide(width: 3, color: Colors.grey),
                       // borderRadius: BorderRadius.circular(15),
                      ),

                      // Set border for focused state
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 3, color: Colors.blueAccent),
                        borderRadius: BorderRadius.circular(15),
                      )),
                  controller: name,
                ),

                SizedBox(
                  height: 20.0,
                ),

                TextFormField(

                  decoration: InputDecoration(
                      labelText: "PRN",
                      hintText: "Enter your PRN",
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                        const BorderSide(width: 3, color: Colors.grey),
                       //v borderRadius: BorderRadius.circular(15),
                      ),

                      // Set border for focused state
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 3, color: Colors.blueAccent),
                        borderRadius: BorderRadius.circular(15),
                      )),
                  controller: prn,
                ),



                Divider(),
                SizedBox(
                  height: 30,
                ),
                ListTile(
                  leading: Text(
                    "DOB : ",
                    style: TextStyle(fontSize: 18),
                  ),
                  title: Center(child: Container(padding: EdgeInsets.all(10), child: Text(date,style: TextStyle(fontSize: 18,),),decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Colors.grey),)),
                  // title: Text($selectedDate),
                  trailing: IconButton(
                    icon: Icon(Icons.calendar_month),
                    onPressed: () async {
                      _selectDate(context);
                    },
                  ),
                ),

                ListTile(
                  leading: Text(
                    "Select Branch : ",
                    style: TextStyle(fontSize: 18),
                  ),
                  trailing: DropdownButton(
                      value: selectedValue,
                      style: TextStyle(color: Colors.black, fontSize: 15),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedValue = newValue!;
                        });
                      },
                      items: menuItems),
                ),


                Divider(),
                SizedBox(
                  height: 30,
                ),
                ListTile(
                  leading: Text(
                    "Select Batch : ",
                    style: TextStyle(fontSize: 18),
                  ),
                  title: Column(
                    children: [
                      ListTile(
                        leading: Radio<String>(
                          value: 'A',
                          groupValue: _selectedGender,
                          onChanged: (value) {
                            setState(() {
                              _selectedGender = value!;
                            });
                          },
                        ),
                        title: const Text('A'),
                      ),
                      ListTile(
                        leading: Radio<String>(
                          value: 'B',
                          groupValue: _selectedGender,
                          onChanged: (value) {
                            setState(() {
                              _selectedGender = value!;
                            });
                          },
                        ),
                        title: const Text('B'),
                      ),

                      ListTile(
                        leading: Radio<String>(
                          value: 'C',
                          groupValue: _selectedGender,
                          onChanged: (value) {
                            setState(() {
                              _selectedGender = value!;
                            });
                          },
                        ),
                        title: const Text('C'),
                      ),







                    ],
                  ),
                ),
                Divider(),
                SizedBox(
                  height: 30,
                ),

                Divider(),
                SizedBox(
                  height: 30,
                ),

                CheckboxListTile(
                  //checkbox positioned at right
                  value: check2,
                  onChanged: (bool? value) {
                    setState(() {
                      check2 = value;
                    });
                  },
                  title: Text(
                    "Are you a migrant Student?",
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ),
                Divider(),

                CheckboxListTile(
                  //checkbox positioned at left
                  value: check3,
                  // controlAffinity: ListTileControlAffinity,
                  onChanged: (bool? value) {
                    setState(() {
                      check3 = value;
                    });
                  },
                  title: Text(
                    "Are you MS student?",
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ),

                // Add TextFormFields and ElevatedButton here.
              ],
            ),
          ),
        ),
      ),
    );

  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             Text("${selectedDate.toLocal()}".split(' ')[0]),
//             const SizedBox(
//               height: 20.0,
//             ),
//             ElevatedButton(
//               onPressed: () => _selectDate(context),
//               child: const Text('Select date'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }