import 'package:flutter/material.dart';



class UserProfile extends  StatelessWidget {
  
UserProfile({this.email, this.address, this.userid});
final String email;
final String address;
final String userid;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container( 
        decoration: BoxDecoration(
            image: DecorationImage(
            colorFilter: new ColorFilter.mode(Colors.green.withOpacity(0.4), BlendMode.dstATop),
            image: AssetImage("images/dogimages.jpg"),
            fit: BoxFit.cover,
          )
        ),
        child: Column(
          children: <Widget>[  
            new Center( 
              child:Container(
                height: 310,
                decoration: BoxDecoration(
                    image: DecorationImage(
                    colorFilter: new ColorFilter.mode(Colors.green.withOpacity(0.4), BlendMode.dstATop),
                    image: AssetImage("images/profileimage.jpg"),
                    fit: BoxFit.cover,
                  )
                ),
                child: Column(
                  children: <Widget>[
                    new Center(
                      child: Container(
                        child: Container(
                          margin: EdgeInsets.only(top: 70),
                          height: 140,
                          width: 140, 
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(1000),
                              image: DecorationImage(
                              image: AssetImage("images/userimage.jpg"),
                              fit: BoxFit.cover,
                            )
                          ),
                        )
                      ),
                    ),
                     new Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Text("     $email     ",
                            style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontFamily: "tANGERINE",
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54,
                          )
                      )
                    ),
                  ],
                )
              ),
             ),
             new Container(
               margin: EdgeInsets.only(top: 30),
               width: 300,
               height: 350,
               decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey[300],
                          ),
                child: Column(
                  children: <Widget>[
                    new Container(
                      margin: EdgeInsets.only(top: 30),
                        child:Text("$email@gmail.com",
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.black87,
                            fontFamily: "tangerine",
                          ),
                      ),
                    ),
                    new Container(
                      margin: EdgeInsets.only(top: 30),
                        child:Text("  "+ address,
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.black87,
                            fontFamily: "tangerine",
                          ),
                      ),
                    ),
                     new Container(
                      margin: EdgeInsets.only(top: 30),
                        child:Text("09167062033",
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.black87,
                            fontFamily: "tangerine",
                          ),
                      ),
                    ),
                  ],
                )
             )
          ],
        )
      ),
    );
  }
}


