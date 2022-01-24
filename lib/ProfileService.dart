import 'dart:convert';

import 'package:http/http.dart' as http;

import 'DataTypes/Profile.dart';

class ProfileService {
  static Future<Profile> getProfile(String username) async {
    String url="https://py.crewbella.com/user/api/profile/${username}";
    var response=await http.get(Uri.parse(url));
    print(response.body);
    if(response.statusCode==200)
      {
        var Json=jsonDecode(response.body.toString());
        var json=Json as Map<String,dynamic>;
        Profile temp;
        if(json.containsKey("result"))
          {
            temp=Profile(userid: -1,username: "");
          }
        else
          {
            temp=Profile.fromMap(json);
          }
        return temp;
      }
    else{
      return Profile(username: "", userid: -1);
    }
  }
}