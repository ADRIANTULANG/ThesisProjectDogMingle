import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:projectmobileapp/Searchpage.dart';
import 'Registerpage.dart';
import 'Searchpage.dart';
// import 'package:map_view/map_view.dart';

// var api_key = "AIzaSyAI9W_7ShoKgpLehSfYoU7F2pD-p7QlQ9g";
void main() {
  // MapView.setApiKey("api_key");
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: new MyApp(),
  ));
}

String email='';
String userid='';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
      
        primarySwatch: Colors.purple,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      routes: <String,WidgetBuilder>{
        '/Adminpage': (BuildContext context)=> new Adminpage(),
        '/Memberpage': (BuildContext context)=> new Memberpage(),
      }
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

// class MyMapPage extends StatefulWidget {
//   @override
//   MapPage createState() => MapPage();
// }


class _MyHomePageState extends State<MyHomePage> {

  TextEditingController emailinput = new TextEditingController();
  TextEditingController password = new TextEditingController();
  

  String msg='';

  Future<dynamic> _login() async{
   
   final response = await http.post("http://192.168.18.54/LoginAPI/login.php", body: {
    "email": emailinput.text,
    "password": password.text,
   });

   var datauser = json.decode(response.body);

   if(datauser.length== 0){
     setState(() {
       msg="Login fail";
     });
   }else{
     if(datauser[0]['usertype'] == 'admin'){
       Navigator.push(context, MaterialPageRoute(builder: (context) => Adminpage()));

     }else if(datauser[0]['usertype'] == 'member'){
       Navigator.push(context, MaterialPageRoute(builder: (context) => Memberpage(email: email)));
       
     }
     setState(() {
       email = datauser[0]['email'];
       userid = datauser[0]['userid'];
     });
   }
   return datauser;
  
  }
  


  
  Widget build(BuildContext context) {
    
    return Scaffold(

      
      
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Text("♡LOGIN♡",
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
           new Container(
            child: new Text("   ",
                style: TextStyle(
              ),),
          ),
          new Container(
            child: new Text(" 💜  ",
                style: TextStyle(
                fontSize: 80.0,
                fontWeight: FontWeight.bold,
                fontFamily: "Pacifico",
                color: Colors.white,
              ),),
          ),
         
          
//TEXTFIELD FOR THE EMAIL

         new Padding(
           padding: EdgeInsets.only(left: 50.0, right: 50.0),
            child: new TextField(
              controller: emailinput,
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
              obscureText: true,
            ),
          ),
          new Container(
            child: new Text("   ",
                style: TextStyle(
              ),),
          ),
          new Container(
            child: new Text("   ",
                style: TextStyle(
              ),),
          ),
          new Container(
            child: new Text("   ",
                style: TextStyle(
              ),),
          ),

//BUTTON FOR LOGIN BUTTON WITH FUNCTION
          new Row(
            children: <Widget>[
              
          
           new Container(
            child: new Padding(
              padding: EdgeInsets.all(30.0),
               
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
          new ButtonTheme(
            minWidth: 100.0,
            height: 50.0,
            child: new RaisedButton(
                  
               onPressed: (){
                 _login();
                 
               },
               shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
               color: Colors.purple,
               child: Text("LOGIN",
                style: TextStyle(
                fontSize: 10.0,
                fontWeight: FontWeight.bold,
                fontFamily: "Pacifico",
                color: Colors.white,
              ),
              
              ),
            ),
            
          ),
          new Container(
            child: new Padding(
              padding: EdgeInsets.all(30.0),
               
              ),
          ),
          new ButtonTheme(
            minWidth: 100.0,
            height: 50.0,
            child: new RaisedButton(
                  
               onPressed: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context) => Registerpage()));
                 
               },
               shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
               color: Colors.purple,
               child: Text("REGISTER",
                style: TextStyle(
                fontSize: 10.0,
                fontWeight: FontWeight.bold,
                fontFamily: "Pacifico",
                color: Colors.white,
              ),
              
              ),
            ),
            
          ),

            ],),
         
          new Container(
            child: new Text("   "
   
            ),
          ),
          new Container(
            child: new Text("   "
   
            ),
          ),
          new Container(
            child: new Text("   "
   
            ),
          ),
          new Container(
            child: new Text(msg,style:
            TextStyle(
              fontFamily: "pacifico",
              color: Colors.red,
              fontSize: 20.0,
            )
                
            ),
          ),
        ],
      ),
    );
  }
}

class Adminpage extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("ADMIN PAGE",
        style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                fontFamily: "Pacifico"
              ),),
      ),
      body: Column(
        children: <Widget>[
          

          new Container(
            child: new Text("  ",
               
              ),
          ),
          
          new Center(
            child: new Text(" Hi My Beatiful  ",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25.0,
                fontWeight: FontWeight.bold,
                fontFamily: "kaushanScript"
              ),),
          ),
          new Center(
            child: new Text('L💜vely Admin ',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 25.0,
                fontWeight: FontWeight.bold,
                fontFamily: "AlexBrush"
              ),),
          ),
          new Center(
            child: new Text(" Adrian Benedict S. Tulang  ",
                style: TextStyle(
                  color: Colors.purple,
                  fontSize: 25.0,
                fontWeight: FontWeight.bold,
                fontFamily: "kaushanScript"
              ),),
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
          new Container(
            child: new RaisedButton(
              onPressed: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()));
               },
               shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
               color: Colors.purple,
               child: Text("LOGOUT",
                style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                fontFamily: "AlexBrush",
                color: Colors.white,
              ),
              
              ),
               
              ),
          ),
          new Container(

          )


          
          
          

        ]
        
        
      ), 
    );
  }
}
class Memberpage extends StatelessWidget {

Memberpage({this.email});
final String email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: Text("MEMBER PAGE",
        style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                fontFamily: "Pacifico"
              ),),
      ),
      body: Column(
        children: <Widget>[
          
          new Container(
            child: new Text("  ",
               
              ),
          ),

          new Center(
            child: new Text(" Hi My Beatiful   ",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25.0,
                fontWeight: FontWeight.bold,
                fontFamily: "kaushanScript"
              ),),
          ),
          new Center(
            child: new Text("L💜vely MEMBER ",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 25.0,
                fontWeight: FontWeight.bold,
                fontFamily: "AlexBrush"
              ),),
          ),
          new Center(
            child: new Text("$email💜",
                style: TextStyle(
                  color: Colors.pinkAccent,
                  fontSize: 25.0,
                fontWeight: FontWeight.bold,
                fontFamily: "AlexBrush"
              ),),
          ),
          new Container(
            child: new RaisedButton(
              onPressed: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()));
               },
               shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
               color: Colors.purple,
               child: Text("LOGOUT",
                style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                fontFamily: "AlexBrush",
                color: Colors.white,
              ),
              
              ),
               
              ),
          ),
          new ButtonTheme(
            minWidth: 200.0,
             height: 100.0,
            child: new RaisedButton(
 
               onPressed: (){
                 getdata();
                 Navigator.push(context, MaterialPageRoute(builder: (context) => Displayhusky()));
               },
               
               shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(25.0)),
               color: Colors.purple,
               child: Text("HUSKY",
                style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              
              ),
            ),
            
          ),
          new Container(
            child: new Text("  ",
               
              ),
          ),
          new ButtonTheme(
            minWidth: 200.0,
             height: 100.0,
            child: new RaisedButton(
 
               onPressed: (){
                 getdatapom();
                 Navigator.push(context, MaterialPageRoute(builder: (context) => Displaypom()));
               },
               
               shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(25.0)),
               color: Colors.purple,
               child: Text("POMERANIAN",
                style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              
              ),
            ),
            
          ),
           new Container(
            child: new Text("   ",
                style: TextStyle(
              ),),
          ),
          new ButtonTheme(
            minWidth: 200.0,
             height: 100.0,
            child: new RaisedButton(
 
               onPressed: (){
                 getdatagolden();
                 Navigator.push(context, MaterialPageRoute(builder: (context) => Displaygolden()));
               },
               
               shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(25.0)),
               color: Colors.purple,
               child: Text("GOLDEN RETRIEVER",
                style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              
              ),
            ),
            
          ),
          // new RaisedButton(
          //   onPressed: (){
          //      Navigator.push(context, MaterialPageRoute(builder: (context) => MyMapPage()));
          //   }
          // )
          
          
          
          

        ]
        
        
      ),
      //DRAWER
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Hi  💜$email💜',
               style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'pacifico',
                color: Colors.white,
              ),),
              decoration: BoxDecoration(
                color: Colors.purpleAccent,
              ),
            ),
            ListTile(
              title: Text('PROFILE',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'pacifico',
                color: Colors.purpleAccent,
              ),),
              onTap: () {
                Navigator.pop(context);
              },
            ),ListTile(
              title: Text('ADD DOG',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'pacifico',
                color: Colors.purpleAccent,
              ),),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => AddDogpage(userid: userid)));
              },
            ),
          ],
        ),
      ),
    );
  }
}


class AddDogpage extends StatelessWidget {


AddDogpage({this.userid});
final String userid;
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      
      appBar: AppBar(
        automaticallyImplyLeading: false,
        
        title: Center(
          child: Text("DOG REGISTRATION ",
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
            child: new Text(" $userid ",
                style: TextStyle(
              ),),
          ),
            
          new Container(
            child: new Text("   ",
                style: TextStyle(
              ),),
          ),
          new Container(
            child: new Text("   ",
                style: TextStyle(
              ),),
          ),
          new ButtonTheme(
            minWidth: 305.0,
             height: 60.0,
            child: new RaisedButton(
 
               onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Goldenpage()));
                 
               },
               shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(25.0)),
               color: Colors.purple,
               child: Text("REGISTER GOLDEN",
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
            child: new Text("   ",
                style: TextStyle(
              ),),
          ),
          new ButtonTheme(
            minWidth: 305.0,
             height: 60.0,
            child: new RaisedButton(
 
               onPressed: (){
                
                Navigator.push(context, MaterialPageRoute(builder: (context) => Pomerpage()));
                 
               },
               shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(25.0)),
               color: Colors.purple,
               child: Text("REGISTER POM",
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
                
                Navigator.push(context, MaterialPageRoute(builder: (context) => Huskypage()));
                 
               },
               shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(25.0)),
               color: Colors.purple,
               child: Text("REGISTER HUSKY",
                style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                fontFamily: "pacifico",
                color: Colors.white,
              ),
              
              ),
            ),
            
          ),
           
          
  
        ],
      ),
       
    );
  }
}

class Huskypage extends StatelessWidget {

  final color = TextEditingController();
  final height = TextEditingController();
  final weight = TextEditingController();
  final dogtype = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Huskypage",
        style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                fontFamily: "Pacifico"
              ),),
      ),
      body: Column(
        children: <Widget>[
          new Container(
            child: Text("Successfuly Added",style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                fontFamily: "Pacifico"
              ),)
          ),
          new Padding(
            padding: EdgeInsets.only(left: 50.0, right: 50.0),
            child: new TextField(
              controller: dogtype,
              decoration: new InputDecoration(
                labelText: 'Enter dogtype',
                prefixIcon: Icon(Icons.lock),
                 border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                          borderSide: new BorderSide(
                          ),
                        ),
              ),
            ),
          ),
          new Padding(
            padding: EdgeInsets.only(left: 50.0, right: 50.0),
            child: new TextField(
              controller: color,
              decoration: new InputDecoration(
                labelText: 'Enter color',
                prefixIcon: Icon(Icons.lock),
                 border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                          borderSide: new BorderSide(
                          ),
                        ),
              ),
            ),
          ),
          new Padding(
            padding: EdgeInsets.only(left: 50.0, right: 50.0),
            child: new TextField(
              controller: height,
              decoration: new InputDecoration(
                labelText: 'Enter height',
                prefixIcon: Icon(Icons.lock),
                 border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                          borderSide: new BorderSide(
                          ),
                        ),
              ),
            ),
          ),
          new Padding(
            padding: EdgeInsets.only(left: 50.0, right: 50.0),
            child: new TextField(
              controller: weight,
              decoration: new InputDecoration(
                labelText: 'Enter weight',
                prefixIcon: Icon(Icons.lock),
                 border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                          borderSide: new BorderSide(
                          ),
                        ),
              ),
            ),
          ),
          new ButtonTheme(
            minWidth: 305.0,
             height: 60.0,
            child: new RaisedButton(
 
               onPressed: (){
                 insertdoghusky();
                 Navigator.push(context, MaterialPageRoute(builder: (context) => Memberpage()));
                 
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
          
          
        ],
      
      ), 
    );
  }
  void insertdoghusky(){
    
    var url="http://192.168.18.54/LoginAPI/registerdog.php";
    http.post(url, body: {
      
      "color": color.text,
      "weight": weight.text,
      "height": height.text,
      "dogtype": dogtype.text,
    });
  }
}
class Pomerpage extends StatelessWidget {

  final color = TextEditingController();
  final height = TextEditingController();
  final weight = TextEditingController();
final dogtype = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Pomeranian Dogs",
        style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                fontFamily: "Pacifico"
              ),),
      ),
      body: Column(
        children: <Widget>[
          new Container(
            child: Text("Successfuly Added",style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                fontFamily: "Pacifico"
              ),)
          ),
          new Padding(
            padding: EdgeInsets.only(left: 50.0, right: 50.0),
            child: new TextField(
              controller: dogtype,
              decoration: new InputDecoration(
                labelText: 'Enter dogtype',
                prefixIcon: Icon(Icons.lock),
                 border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                          borderSide: new BorderSide(
                          ),
                        ),
              ),
            ),
          ),
          new Padding(
            padding: EdgeInsets.only(left: 50.0, right: 50.0),
            child: new TextField(
              controller: color,
              decoration: new InputDecoration(
                labelText: 'Enter color',
                prefixIcon: Icon(Icons.lock),
                 border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                          borderSide: new BorderSide(
                          ),
                        ),
              ),
            ),
          ),
          new Padding(
            padding: EdgeInsets.only(left: 50.0, right: 50.0),
            child: new TextField(
              controller: height,
              decoration: new InputDecoration(
                labelText: 'Enter height',
                prefixIcon: Icon(Icons.lock),
                 border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                          borderSide: new BorderSide(
                          ),
                        ),
              ),
            ),
          ),
          new Padding(
            padding: EdgeInsets.only(left: 50.0, right: 50.0),
            child: new TextField(
              controller: weight,
              decoration: new InputDecoration(
                labelText: 'Enter weight',
                prefixIcon: Icon(Icons.lock),
                 border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                          borderSide: new BorderSide(
                          ),
                        ),
              ),
            ),
          ),
          new ButtonTheme(
            minWidth: 305.0,
             height: 60.0,
            child: new RaisedButton(
 
               onPressed: (){
                 insertdogpom();
                 Navigator.push(context, MaterialPageRoute(builder: (context) => Memberpage()));
                 
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
          
          
        ],
      
      ), 
    );
  }
   void insertdogpom(){
    
    var url="http://192.168.18.54/LoginAPI/registerdogpom.php";
    http.post(url, body: {
      "color": color.text,
      "weight": weight.text,
      "height": height.text,
      "dogtype": dogtype.text,
    });
  }


}



class Goldenpage extends StatelessWidget {

  final color = TextEditingController();
  final height = TextEditingController();
  final weight = TextEditingController();
  final dogtype = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Golden Retriever Dogs",
        style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                fontFamily: "Pacifico"
              ),),
      ),
      body: Column(
        children: <Widget>[
          new Container(
            child: Text("Successfuly Added",style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                fontFamily: "Pacifico"
              ),)
          ),
          new Padding(
            padding: EdgeInsets.only(left: 50.0, right: 50.0),
            child: new TextField(
              controller: dogtype,
              decoration: new InputDecoration(
                labelText: 'Enter dogtype',
                prefixIcon: Icon(Icons.lock),
                 border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                          borderSide: new BorderSide(
                          ),
                        ),
              ),
            ),
          ),
          new Padding(
            padding: EdgeInsets.only(left: 50.0, right: 50.0),
            child: new TextField(
              controller: color,
              decoration: new InputDecoration(
                labelText: 'Enter color',
                prefixIcon: Icon(Icons.lock),
                 border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                          borderSide: new BorderSide(
                          ),
                        ),
              ),
            ),
          ),
          new Padding(
            padding: EdgeInsets.only(left: 50.0, right: 50.0),
            child: new TextField(
              controller: height,
              decoration: new InputDecoration(
                labelText: 'Enter height',
                prefixIcon: Icon(Icons.lock),
                 border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                          borderSide: new BorderSide(
                          ),
                        ),
              ),
            ),
          ),
          new Padding(
            padding: EdgeInsets.only(left: 50.0, right: 50.0),
            child: new TextField(
              controller: weight,
              decoration: new InputDecoration(
                labelText: 'Enter weight',
                prefixIcon: Icon(Icons.lock),
                 border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                          borderSide: new BorderSide(
                          ),
                        ),
              ),
            ),
          ),
          
          
          new ButtonTheme(
            minWidth: 305.0,
             height: 60.0,
            child: new RaisedButton(
 
               onPressed: (){
                 insertdoggolden();
                 Navigator.push(context, MaterialPageRoute(builder: (context) => Memberpage()));
                 
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
          
        ],
      
      ), 
    );
  }
   void insertdoggolden(){
    
    var url="http://192.168.18.54/LoginAPI/registerdoggolden.php";
    http.post(url, body: {
      "color": color.text,
      "weight": weight.text,
      "height": height.text,
      "dogtype": dogtype.text,
    });
  }


}

// class MapPage extends State<MyMapPage> {
//   MapView mapView = new MapView();
//   CameraPosition cameraPosition;
//   var staticMapProvider = new StaticMapProvider(api_key);
//   Uri staticMapUri;

//  @override
//     void initState() { 
//       super.initState();
//       cameraPosition = new CameraPosition(new Location(28.420035, 77.337628), 2.0);
//       staticMapUri = staticMapProvider.getStaticUri(new Location(28.420035, 77.337628)
//       ,12,height: 400,width: 900, mapType: StaticMapViewType.roadmap);
      
//     }

 
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         title: Text("Map Page",
//         style: TextStyle(
//                 fontSize: 25.0,
//                 fontWeight: FontWeight.bold,
//                 fontFamily: "Pacifico"
//               ),),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: <Widget>[
//           new Container(
//             height: 300.0,
//             child: new Stack(
//               children: <Widget>[
//                 new Center(
//                   child: Container(
//                         child: new Text(
//                       "Map should show here",
//                     textAlign: TextAlign.center,
//                     ),
//                   padding: const EdgeInsets.all(20.0),
//                   ),
//                 ),
//                 new InkWell(
//                   child: new Center(
//                     child: new Image.network(staticMapUri.toString()),
//                   ),
//                   onTap: () {} ,
//                 )
//               ],
//             )
//           ),
//         new Container(
//           padding: new EdgeInsets.only(top: 10.0),
//           child: new Text("tap to interact",
//           style: new TextStyle(fontWeight: FontWeight.bold),
//           )
//         ),
//         new Container(
//           padding: new EdgeInsets.only(top: 25.0),
//           child: new Text(
//               "Camera Position: \n\nLat:${cameraPosition.center.latitude}\n\nLng:${cameraPosition.center.longitude}\n\nZoom: ${cameraPosition.zoom}"
//           ),
//         ),
//         ],
//       ), 
//     );
//   }
// }



