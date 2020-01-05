import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



class Displayhusky extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        
        title: Text("huskytable",
        style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                fontFamily: "Pacifico"
              ),),
      ),
      body: Container(
        child: FutureBuilder<List<Post>>(
          future: getdata(),
          builder: (context, snapshot){
            if (!snapshot.hasData) return Container();
            List<Post> posts = snapshot.data;
            return new ListView(
              // children: posts.map((post) => Text(post.username)).toList(),
              children: posts.map((post) => ListTile(
                      
                title: Text(post.dogtype,
                      style: TextStyle(
                              fontSize: 35.0,
                              fontFamily: "Pacifico",
                              color: Colors.purpleAccent,
                            )),
                subtitle: Text(post.color,
                      style: TextStyle(
                              fontSize: 12.0,
                              fontFamily: "Ubuntu",
                              color: Colors.black87,
                            )),
                leading: CircleAvatar(
                        backgroundColor: Colors.purpleAccent,
                        child: Text(post.dogtype[0],
                            style: TextStyle(
                              fontSize: 18.0,
                              fontFamily: "Ubuntu",
                              color: Colors.black,
                            )),
                      ),
                    )
              ).toList(),
            );
          },
        ),
        
      ), 
    );
  }
}
class Displaypom extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        
        title: Text("pomtable",
        style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                fontFamily: "Pacifico"
              ),),
      ),
      body: Container(
        child: FutureBuilder<List<Post>>(
          future: getdatapom(),
          builder: (context, snapshot){
            if (!snapshot.hasData) return Container();
            List<Post> posts = snapshot.data;
            return new ListView(
              // children: posts.map((post) => Text(post.username)).toList(),
              children: posts.map((post) => ListTile(
                      
                title: Text(post.dogtype,
                      style: TextStyle(
                              fontSize: 35.0,
                              fontFamily: "Pacifico",
                              color: Colors.purpleAccent,
                            )),
                subtitle: Text(post.color,
                      style: TextStyle(
                              fontSize: 12.0,
                              fontFamily: "Ubuntu",
                              color: Colors.black87,
                            )),
                leading: CircleAvatar(
                        backgroundColor: Colors.purpleAccent,
                        child: Text(post.dogtype[0],
                            style: TextStyle(
                              fontSize: 18.0,
                              fontFamily: "Ubuntu",
                              color: Colors.black,
                            )),
                      ),
                    )
              ).toList(),
            );
          },
        ),
        
      ), 
    );
  }
}

class Displaygolden extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        
        title: Text("pomtable",
        style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                fontFamily: "Pacifico"
              ),),
      ),
      body: Container(
        child: FutureBuilder<List<Post>>(
          future: getdatagolden(),
          builder: (context, snapshot){
            if (!snapshot.hasData) return Container();
            List<Post> posts = snapshot.data;
            return new ListView(
              // children: posts.map((post) => Text(post.username)).toList(),
              children: posts.map((post) => ListTile(
                      
                title: Text(post.dogtype,
                      style: TextStyle(
                              fontSize: 35.0,
                              fontFamily: "Pacifico",
                              color: Colors.purpleAccent,
                            )),
                subtitle: Text(post.color,
                      style: TextStyle(
                              fontSize: 12.0,
                              fontFamily: "Ubuntu",
                              color: Colors.black87,
                            )),
                leading: CircleAvatar(
                        backgroundColor: Colors.purpleAccent,
                        child: Text(post.dogtype[0],
                            style: TextStyle(
                              fontSize: 18.0,
                              fontFamily: "Ubuntu",
                              color: Colors.black,
                            )),
                      ),
                
                    )
              ).toList(),
            );
          },
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
    

    Post({this.dogid, this.doggoldenid, this.dogpomid, this.color, this.height, this.weight, this.dogtype});

   factory Post.fromJson(Map<String, dynamic> json) {
      return new Post(
        color: json['color'].toString(),
        height: json['height'].toString(),
        weight: json['weight'].toString(),
        dogtype: json['dogtype'].toString(),       
      );
   }
}

Future<List<Post>> getdata() async {
  http.Response response = await http.get("http://192.168.18.54/LoginAPI/getdata.php");
  List responseJson = json.decode(response.body);
  return responseJson.map((m) => new Post.fromJson(m)).toList(); 
  }
  Future<List<Post>> getdatapom() async {
  http.Response response = await http.get("http://192.168.18.54/LoginAPI/getdatapom.php");
  List responseJson = json.decode(response.body);
  return responseJson.map((m) => new Post.fromJson(m)).toList(); 
  }
  Future<List<Post>> getdatagolden() async {
  http.Response response = await http.get("http://192.168.18.54/LoginAPI/getdatagolden.php");
  List responseJson = json.decode(response.body);
  return responseJson.map((m) => new Post.fromJson(m)).toList(); 
  }