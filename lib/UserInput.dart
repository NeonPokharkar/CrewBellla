import 'package:crewbella/ProfileService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'DataTypes/Profile.dart';
import 'UserProfile.dart';

class UserInput extends StatefulWidget {
  const UserInput({Key? key}) : super(key: key);

  @override
  _UserInputState createState() => _UserInputState();
}

class _UserInputState extends State<UserInput> {
  bool isuserloading=false;
  TextEditingController usernameTextEditingController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("CrewBella"),
        ),
        body: (isuserloading)
            ?Center(
          child: CircularProgressIndicator(
          ),
        )
            :Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(30),
              child: TextField(
                controller: usernameTextEditingController,
                scrollPadding: EdgeInsets.zero,
                decoration: InputDecoration(
                  hintText: "username",
                  border: OutlineInputBorder(),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            RaisedButton(
              child: Text("Search User",style: TextStyle(color: Colors.white),),
              color: Colors.blue,
              onPressed:() async{
                setState(() {
                  isuserloading=true;
                });
                Profile profile= await ProfileService.getProfile(usernameTextEditingController.text);
                if(profile.username!="" && profile.userid!=-1)
                  {
                    Navigator.push(context, MaterialPageRoute(builder: (ctx) => UserProfile(profile: profile)));
                    setState(() {
                      isuserloading=false;
                    });
                  }
                else
                  {
                    setState(() {
                      isuserloading=false;
                    });
                    print('usernotexist');
                  }
              },
            ),
          ],
        ),
      ),
    );
  }
}
