import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'Maps.dart';

class Displayhusky extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center( 
          
          child:Text("Husky",
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
        child: FutureBuilder<List<Post>>(
          future: getdata(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return Container();
            List<Post> posts = snapshot.data;
            return new ListView(
              // children: posts.map((post) => Text(post.username)).toList(),
              children: posts.map((post) => new Container(
                      height: 150,
                      child: Card(
                        elevation: 10,
                        margin: EdgeInsets.all(20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: ListTile(
                          title: Text(post.dogtype,
                              style: TextStyle(
                                fontSize: 50.0,
                                fontFamily: "tangerine",
                                color: Colors.blueGrey,
                              )),
                          subtitle: Text(post.color,
                              style: TextStyle(
                                fontSize: 12.0,
                                fontFamily: "Ubuntu",
                                color: Colors.black87,
                              )),
                          leading: new Container(
                            width: 50,
                            alignment: FractionalOffset(0, 1),
                            child: CircleAvatar(
                              backgroundColor: Colors.grey[300],
                              child: Text(post.dogtype[0],
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontFamily: "Ubuntu",
                                    color: Colors.black,
                                  )),
                            ),
                          ),
                          trailing: Container(
                            padding: EdgeInsets.only(top:25),
                             child: Icon(Icons.map),),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyMapPage()));
                          },
                        ),
                      ),
                    ),
                  )
                  .toList(),
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
        title: Center( 
          child:Text(
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
        child: FutureBuilder<List<Post>>(
          future: getdatapom(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return Container();
            List<Post> posts = snapshot.data;
            return new ListView(
              children: posts.map((post) => new Container(
                      height: 150,
                      child: Card(
                        elevation: 10,
                        margin: EdgeInsets.all(20),
                        shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: ListTile(
                          title: Text(post.dogtype,
                              style: TextStyle(
                                fontSize: 50.0,
                                fontFamily: "tangerine",
                                color: Colors.blueGrey,
                              )),
                          subtitle: Text(post.color,
                              style: TextStyle(
                                fontSize: 12.0,
                                fontFamily: "Ubuntu",
                                color: Colors.black87,
                              )),
                          leading: new Container(
                            width: 50,
                            alignment: FractionalOffset(0, 1),
                            child: CircleAvatar(
                              backgroundColor: Colors.grey[300],
                              child: Text(post.dogtype[0],
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontFamily: "Ubuntu",
                                    color: Colors.black,
                                  )),
                            ),
                          ),
                          trailing: Container(
                            padding: EdgeInsets.only(top:25),
                             child: Icon(Icons.map),),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyMapPage()));
                          },
                        ),
                      ),
                    ),
                  )
                  .toList(),
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
        child: FutureBuilder<List<Post>>(
          future: getdatagolden(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return Container();
            List<Post> posts = snapshot.data;
            return new ListView(
              children: posts.map((post) => new Container(
                      height: 150,
                      child: Card(
                        elevation: 10,
                        margin: EdgeInsets.all(20),
                        shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: ListTile(
                          title: Text(post.dogtype,
                              style: TextStyle(
                                fontSize: 50.0,
                                fontFamily: "tangerine",
                                color: Colors.blueGrey,
                                )
                              ),
                          subtitle: Text(post.color,
                              style: TextStyle(
                                fontSize: 12.0,
                                fontFamily: "Ubuntu",
                                color: Colors.black87,
                              )),
                          leading: new Container(
                            width: 50,
                            alignment: FractionalOffset(0, 1),
                            child: CircleAvatar(
                              backgroundColor: Colors.grey[300],
                              child: Text(post.dogtype[0],
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontFamily: "Ubuntu",
                                    color: Colors.black,
                                  )),
                            ),
                          ),
                          trailing: Container(
                            padding: EdgeInsets.only(top:25),
                             child: Icon(Icons.map),),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyMapPage()));
                          },
                        ),
                      ),
                    ),
                  )
                  .toList(),
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

  Post(
      {this.dogid,
      this.doggoldenid,
      this.dogpomid,
      this.color,
      this.height,
      this.weight,
      this.dogtype});

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
  http.Response response =
      await http.get("http://192.168.18.54/LoginAPI/getdata.php");
  List responseJson = json.decode(response.body);
  return responseJson.map((m) => new Post.fromJson(m)).toList();
}

Future<List<Post>> getdatapom() async {
  http.Response response =
      await http.get("http://192.168.18.54/LoginAPI/getdatapom.php");
  List responseJson = json.decode(response.body);
  return responseJson.map((m) => new Post.fromJson(m)).toList();
}

Future<List<Post>> getdatagolden() async {
  http.Response response =
      await http.get("http://192.168.18.54/LoginAPI/getdatagolden.php");
  List responseJson = json.decode(response.body);
  return responseJson.map((m) => new Post.fromJson(m)).toList();
}
