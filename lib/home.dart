import 'package:flutter/material.dart';
class MyApp extends StatefulWidget {


  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "jehad",
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  MySnackBar(message,context){
    return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message))
    );
  }
  Alertdialog(context,int index){
    return showDialog(
        context: context,
        builder: (BuildContext context){
      return Expanded(
          child: AlertDialog(
            title:Text('Confirmation'),
            content: Text('Are you sure for Delete?'),
            actions: [
              IconButton(onPressed: (){
                Navigator.pop(context);
              }, icon: Icon(Icons.delete_forever),color: Colors.blue.shade500),
              IconButton(onPressed: (){_remove(index);
                Navigator.pop(context);
                }, icon: Icon(Icons.delete_outline),color: Colors.blue.shade500,)

            ],
      )
      );
    }
    );
  }

  List<Map<String, dynamic>>_name=[];

  TextEditingController _namecontroller = TextEditingController();
  TextEditingController _numbercontroller = TextEditingController();

  _addname(){
    if(_namecontroller.text.isNotEmpty && _numbercontroller.text.isNotEmpty){
      setState(() {
        _name.add({
          'name':_namecontroller.text,
          'number':_numbercontroller.text,
        }
        );
        _numbercontroller.clear();
        _namecontroller.clear();
      });
    }
  }
 dynamic _remove(int index){
  setState(() {
    _name.removeAt(index);
  });
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact List',style: TextStyle(fontSize: 25,color: Colors.white),),
        toolbarHeight: 70,
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _namecontroller,
              decoration: InputDecoration(
                hintText:'Name',
                  hintStyle: TextStyle(fontSize:20),
                border:OutlineInputBorder(
                   borderRadius: BorderRadius.circular(8)
                )
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _numbercontroller,
              keyboardType:TextInputType.number,
              decoration: InputDecoration(
                  hintText:'Nunber',
                  hintStyle: TextStyle(fontSize:20),
                  border:OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)
                  )
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)
                  )
                ),
                onPressed: _addname, child:Text('Add',style: TextStyle(fontSize: 20,color: Colors.white),),
              ),
            ),
          ),
          SizedBox(height: 20,),
          Expanded(
            child: ListView.builder(
              itemCount:_name.length,
              itemBuilder:(context,index){
                return Card(
                  child: ListTile(
                    title: Text(_name[index]['name'],style: TextStyle(fontSize: 20,color: Colors.red),),
                    subtitle: Text(_name[index]['number'],style: TextStyle(fontSize: 17,color: Colors.grey),),
                    leading: Icon(Icons.person,size: 40,color: Colors.black54,),
                    trailing: Icon(Icons.phone,size: 35,color: Colors.blue,),
                    onLongPress: (){
                      Alertdialog(context,index);
                    },
                    onTap: (){
                      Alertdialog(context,index);
                    },

                  ),
                );
              }
            ),
          )
        ],
      ),
    );
  }
  }
