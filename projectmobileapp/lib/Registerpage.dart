
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'main.dart';


class Registerpage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      
      appBar: AppBar(
        automaticallyImplyLeading: false,
        
        title: Center(
          child: Text("REGISTRATION",
            style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                fontFamily: "Pacifico"
        ),)
        ),
      ),
      resizeToAvoidBottomPadding: false,
      body: Column(
      
        children: <Widget>[
          new Container(
            child: new Text("   ",
                style: TextStyle(
              ),),
          ),
          
          
//TEXTFIELD FOR THE EMAIL

         new Padding(
           padding: EdgeInsets.only(left: 50.0, right: 50.0),
            child: new TextField(
              controller: email,
              decoration: new InputDecoration(
                labelText: 'Enter email',
                prefixIcon: Icon(Icons.email),
                 border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                          borderSide: new BorderSide(
                          ),
                        ),
              ),
              
            ),
          ), 
        
          new Container(
            child: new Text("   ",
                style: TextStyle(
              ),),
          ),

//TEXTFIELD FOR THE PASSWORD

          new Padding(
            padding: EdgeInsets.only(left: 50.0, right: 50.0),
            child: new TextField(
              controller: password,
              decoration: new InputDecoration(
                labelText: 'Enter password',
                prefixIcon: Icon(Icons.lock),
                 border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                          borderSide: new BorderSide(
                          ),
                        ),
              ),
            ),
          ),
          new Container(
            child: new Text("   ",
                style: TextStyle(
              ),),
          ),
          


//BUTTON FOR LOGIN BUTTON WITH FUNCTION

          new ButtonTheme(
            minWidth: 305.0,
             height: 60.0,
            child: new RaisedButton(
 
               onPressed: (){
                 insertdata();
                 Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()));
                 
               },
               shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(25.0)),
               color: Colors.purple,
               child: Text("SAVE",
                style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                fontFamily: "pacifico",
                color: Colors.white,
              ),
              
              ),
            ),
            
          ),
           new Container(
            child: new Text("  ",
                
            ),
          ),
           new Container(
            child: new Text("  ",
                
            ),
          ),
          new Center(
            child: new Text("💜",
                style: TextStyle(
                fontSize: 150.0,
                fontWeight: FontWeight.bold,
                fontFamily: "Pacifico"
              ),
            ),
          ),
          
  
        ],
      ),
       
    );
  }

  final password = TextEditingController();
  final email = TextEditingController();
  final usertype = String;
  final address = TextEditingController();
  
  void insertdata(){
    
    var url="http://192.168.18.54/LoginAPI/addData.php";

     

    http.post(url, body: {
      "password": password.text,
      "email": email.text,
      "usertype": "member",
    });
  } 
  
}