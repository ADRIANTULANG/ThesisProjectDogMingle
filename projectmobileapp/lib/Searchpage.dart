import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:projectmobileapp/Messagingpage.dart';
import 'dart:convert';
import 'Maps.dart';
import 'Messagingpage.dart';


class Displayhusky extends StatefulWidget {
  Displayhusky({this.email,this.address, this.userid, this.userreceiverid});
  final String userreceiverid;
  final String userid;
final String email;
final String address;

  @override
  _DisplayhuskyState createState() => _DisplayhuskyState(userid: userid);
}

class _DisplayhuskyState extends State<Displayhusky> {
  _DisplayhuskyState({this.userid});
  final String userid;

  final search = TextEditingController();
  List<Post> posts = List();
  List<Post> filteredUsers = List();

  @override
void initState() { 
  super.initState();
  getdata().then((usersFromServer) {
    setState(() {
      posts = usersFromServer;
      filteredUsers = posts;
      
    });
  });
  
}

   Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(
          "Husky",
          style: TextStyle(
              fontSize: 50.0,
              color: Colors.grey[300],
              fontWeight: FontWeight.bold,
              fontFamily: "tangerine"),
        ),
      ),
      ),
      body: Container(
        decoration: BoxDecoration(
              image: DecorationImage(
            colorFilter: new ColorFilter.mode(
                Colors.green.withOpacity(0.4), BlendMode.dstATop),
            image: AssetImage("images/dogimages.jpg"),
            fit: BoxFit.cover,
          )),
        child: Column( 
          
          children:<Widget>[
            
             new TextField(
                decoration: InputDecoration(

                  contentPadding: EdgeInsets.all(10),
                  hintText: "Search Husky type or Color"
                ),
                controller: search,
                onChanged: (string){

                  setState(() {
                    filteredUsers = posts.where((u) =>
                    (u.dogtype.toLowerCase().contains(string.toLowerCase()) || 
                    u.address.toLowerCase().contains(string.toLowerCase()) ||
                    u.userreceiverid.toLowerCase().contains(string.toLowerCase()) ||
                    u.color.toLowerCase().contains(string.toLowerCase()))).toList();
                  });
                },
              ),
              new Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.all(10.0),
                  itemCount: filteredUsers.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          
                          children: <Widget>[
                            new Text(
                                 "ID: " +  filteredUsers[index].userreceiverid + "             " + filteredUsers[index].dogtype +"  "+ userid, 
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,

                            ),
                            ),
                            new SizedBox(height: 5.0,),
                            new Text(
                               filteredUsers[index].color + "             " + filteredUsers[index].address, 
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.grey,

                            ),
                            ),
                            new FlatButton(
                              child: const Text('Delete', style: TextStyle(color: Colors.white)),
                              onPressed: () {
                                Navigator.push( context,MaterialPageRoute(builder: (context) => MyMapPage(address: filteredUsers[index].address)));
                              },
                            ),
                            new FlatButton(
                              onPressed: () {
                                Navigator.push( context,MaterialPageRoute(builder: (context) => NewMessages(userreceiverid: filteredUsers[index].userreceiverid, userid: userid)));                              
                            }, child: Text("Message"),
                          ),
                          ],
                        ),
                      )

                    );
                  },
                ),
              )       
      ]
      ),
      ),
    );
  }
}

class Displaypom extends StatefulWidget {
  Displaypom({this.email, this.userid});
  final String userid;
final String email;
  @override
  _DisplaypomState createState() => _DisplaypomState(userid: userid);
}

class _DisplaypomState extends State<Displaypom>   {
  _DisplaypomState({this.userid});
  final String userid;
  final search = TextEditingController();
  List<Post> posts = List();
  List<Post> filteredUsers = List();

  @override
void initState() { 
  super.initState();
  getdatapom().then((usersFromServer) {
    setState(() {
      posts = usersFromServer;
      filteredUsers = posts;
      
    });
  }); 
}

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(
          "Pomeranian",
          style: TextStyle(
              fontSize: 50.0,
              color: Colors.grey[300],
              fontWeight: FontWeight.bold,
              fontFamily: "tangerine"),
        ),
      ),
      ),
      body: Container(
        decoration: BoxDecoration(
              image: DecorationImage(
            colorFilter: new ColorFilter.mode(
                Colors.green.withOpacity(0.4), BlendMode.dstATop),
            image: AssetImage("images/dogimages.jpg"),
            fit: BoxFit.cover,
          )),
        child: Column( 
          
          children:<Widget>[
            
             new TextField(
                decoration: InputDecoration(

                  contentPadding: EdgeInsets.all(10),
                  hintText: "Search Pomeranian type or Color"
                ),
                controller: search,
                onChanged: (string){

                  setState(() {
                    filteredUsers = posts.where((u) =>
                    (u.dogtype.toLowerCase().contains(string.toLowerCase()) || 
                    u.address.toLowerCase().contains(string.toLowerCase()) ||
                    u.userreceiverid.toLowerCase().contains(string.toLowerCase()) ||
                    u.color.toLowerCase().contains(string.toLowerCase()))).toList();
                  });
                },
              ),
              new Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.all(10.0),
                  itemCount: filteredUsers.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          
                          children: <Widget>[
                            new Text(
                                 "ID: " + filteredUsers[index].userreceiverid + "           " +  filteredUsers[index].dogtype +"  "+ userid, 
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,

                            ),
                            ),
                            new SizedBox(height: 5.0,),
                            new Text(
                                 filteredUsers[index].color + "             " + filteredUsers[index].address, 
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.grey,

                            ),
                            ),
                             new FlatButton(
                  child: const Text('Delete', style: TextStyle(color: Colors.white)),
                  onPressed: () {
                     Navigator.push( context,MaterialPageRoute(builder: (context) => MyMapPage(address: filteredUsers[index].address,)));
                  },
                ),
                 new FlatButton(
                              onPressed: () {
                                Navigator.push( context,MaterialPageRoute(builder: (context) => NewMessages(userreceiverid: filteredUsers[index].userreceiverid, userid: userid)));                              
                            }, child: Text("Message"),
                          ),

                          ],
                        ),
                      )

                    );
                  },
                ),
              )       
      ]
      ),
      ),
    );
  }
}

class Displaygolden extends StatefulWidget {
  Displaygolden({this.email, this.userid});
  final String userid;
final String email;
  @override
  _DisplaygoldenState createState() => _DisplaygoldenState(userid: userid);
}

class _DisplaygoldenState extends State<Displaygolden> {
  _DisplaygoldenState({this.userid});
  final String userid;
  final search = TextEditingController();
  List<Post> posts = List();
  List<Post> filteredUsers = List();


@override
void initState() { 
  super.initState();
  getdatagolden().then((usersFromServer) {
    setState(() {
      posts = usersFromServer;
      filteredUsers = posts;
      
    });
  });
  
}

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(
          "Golden Retriever",
          style: TextStyle(
              fontSize: 50.0,
              color: Colors.grey[300],
              fontWeight: FontWeight.bold,
              fontFamily: "tangerine"),
        ),
      ),
      ),
      body: Container(
        decoration: BoxDecoration(
              image: DecorationImage(
            colorFilter: new ColorFilter.mode(
                Colors.green.withOpacity(0.4), BlendMode.dstATop),
            image: AssetImage("images/dogimages.jpg"),
            fit: BoxFit.cover,
          )),
        child: Column( 
          
          children:<Widget>[
            
             new TextField(
                decoration: InputDecoration(

                  contentPadding: EdgeInsets.all(10),
                  hintText: "Search Golden Retriever type or Color"
                ),
                controller: search,
                onChanged: (string){

                  setState(() {
                    filteredUsers = posts.where((u) =>
                    (u.dogtype.toLowerCase().contains(string.toLowerCase()) || 
                    u.address.toLowerCase().contains(string.toLowerCase()) || 
                    u.userreceiverid.toLowerCase().contains(string.toLowerCase()) || 
                    u.color.toLowerCase().contains(string.toLowerCase()))).toList();
                  });
                },
              ),
              new Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.all(10.0),
                  itemCount: filteredUsers.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          
                          children: <Widget>[
                            new Text(
                                 "ID: " + filteredUsers[index].userreceiverid + "                 " + filteredUsers[index].dogtype +"  "+ userid,
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,

                            ),
                            ),
                            new SizedBox(height: 5.0,),
                            new Text(
                                  filteredUsers[index].color + "                 " + filteredUsers[index].address , 
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.grey,

                            ),
                            ),
                            FlatButton(
                  child: const Text('Delete', style: TextStyle(color: Colors.white)),
                  onPressed: () {
                     Navigator.push( context,MaterialPageRoute(builder: (context) => MyMapPage(address: filteredUsers[index].address,)));
                  },
                ),
                 new FlatButton(
                              onPressed: () {
                                Navigator.push( context,MaterialPageRoute(builder: (context) => NewMessages(userreceiverid: filteredUsers[index].userreceiverid, userid: userid)));                              
                            }, child: Text("Message"),
                          ),

                          ],
                        ),
                      )

                    );
                  },
                ),
              )
            
             
      ]
      ),
      ),
    );
  }
}

class Post {
  
  final int dogid;
  final int doggoldenid;
  final int dogpomid;
  final String color;
  final String height;
  final String weight;
  final String dogtype;
  final String address;
  final String userreceiverid;

  Post({
   
        this.dogid,
      this.doggoldenid,
      this.dogpomid,
      this.color,
      this.height,
      this.weight,
      this.dogtype,
      this.address,
       this.userreceiverid,});

  factory Post.fromJson(Map<String, dynamic> json) {
    return new Post(
      userreceiverid: json['userreceiverid'].toString(),
      color: json['color'].toString(),
      height: json['height'].toString(),
      weight: json['weight'].toString(),
      dogtype: json['dogtype'].toString(),
      address: json['address'].toString(),
    );
  }
}

Future<List<Post>> getdata() async {
  http.Response response =
      await http.get("http://172.20.41.130/LoginAPI/getdata.php");
  List responseJson = json.decode(response.body);
  return responseJson.map((m) => new Post.fromJson(m)).toList();

}

Future<List<Post>> getdatapom() async {
  http.Response response =
      await http.get("http://172.20.41.130/LoginAPI/getdatapom.php");
  List responseJson = json.decode(response.body);
  return responseJson.map((m) => new Post.fromJson(m)).toList();
}

Future<List<Post>> getdatagolden() async {
  http.Response response =
      await http.get("http://172.20.41.130/LoginAPI/getdatagolden.php");
  List responseJson = json.decode(response.body);
  return responseJson.map((m) => new Post.fromJson(m)).toList();
}
