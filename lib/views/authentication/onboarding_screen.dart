import 'package:flutter/material.dart';
  
class Onboardingscreen extends StatefulWidget {
  Onboardingscreen({Key key}) : super(key: key);

  @override
  _OnboardingscreenState createState() => _OnboardingscreenState();
}

class _OnboardingscreenState extends State<Onboardingscreen> {

final _todoArr = [];
  final _formKey = GlobalKey<FormState>();
  final _taskController = TextEditingController();
  
  List<BottomNavigationBarItem> footericons = [
    BottomNavigationBarItem(
            
              icon: Icon(Icons.home),
               label: 'home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
             label: 'Settings',
    ), 
  ];

  Future<void> _showMyDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Add new Task'),
        content: SingleChildScrollView(
          child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                         controller: _taskController,
                          decoration: InputDecoration(
                              labelText: 'Enter new task',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                      ),  
                    ],
                  ))
        ),
        actions: <Widget>[
          TextButton(
            child: Text('Save'),
            onPressed: () {
              setState(() {
              _todoArr.add(_taskController.value.text.toString());
              });
              print(_todoArr);
              Navigator.of(context).pop();
            },
          ),
           TextButton(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
  
  
    void children() => children;
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TODO LIST'),
        centerTitle: false,
        leading: IconButton(
          icon: Icon(Icons.list),
          onPressed: (){Scaffold.of(context).openDrawer(); },
        tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
      
        ),
      ),
      body: new ListView.builder(
             itemCount: _todoArr.length,
            itemBuilder: (BuildContext ctxt, int index) {
              return 
                   ListTile(
                    title: Text(
                      _todoArr[index],
                     
                    ),
                  );
            }),
    
     
      
     bottomNavigationBar:  BottomNavigationBar (items : footericons),
    
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
         onPressed: (){
           _showMyDialog(context);
        },
      ),
     floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

    );
  }
}



