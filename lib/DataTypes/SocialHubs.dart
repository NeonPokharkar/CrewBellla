import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'Profile.dart';

class SocialHubs {
  static var fittype=Profile.fittype;
  String? description,title;
  int? id;
  DateTime? created_at;
  List<Image>? images;
  SocialHubs({this.description,this.title,this.id,this.created_at,this.images});
  factory SocialHubs.fromMap(Map<String, dynamic> json,int i) {
    List<Image> temp1=[];
    for(int j=0;j<json['social_hubs'][i]['images'].length;i++)
      {
        temp1.add((json['social_hubs'][i]['images'][j]=="" || json['social_hubs'][i]['images'][j]==null)?Image.asset("assets/blank_scenery.png",fit: fittype,):Image.network(json['social_hubs'][i]['images'][j],fit: fittype,));
      }
    return SocialHubs(
      description: json['social_hubs'][i]['description'],
      title: json['social_hubs'][i]['title'],
      id: json['social_hubs'][i]['id'],
      created_at: DateFormat("EEE, dd MMM yyyy HH:mm:ss 'GMT'").parse(json['social_hubs'][i]['created_at']),
      images: temp1,
    );
  }
}