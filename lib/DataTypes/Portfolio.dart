import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import 'Profile.dart';

class Portfolio {
  static var fittype=Profile.fittype;
  String? description,link,position,project_name;
  int? id;
  List<Image>? images;
  DateTime? started_time,ended_time,created_at;
  Portfolio({this.description,this.link,this.position,this.project_name,this.id,this.images,this.started_time,this.ended_time,this.created_at});
  factory Portfolio.fromMap(Map<String,dynamic> json,int i) {
    List<Image> temp1=[];
    for(int j=0;j<json['portfolio'][i]['images'].length;j++)
      {
        temp1.add((json['portfolio'][i]['images'][j]=="" || json['portfolio'][i]['images'][j]==null)?Image.asset("assets/blank_scenery.png",fit: fittype,):Image.network(json['portfolio'][i]['images'][j], fit: fittype,));
      }
    return Portfolio(
      description: json['portfolio'][i]['description'],
      link: json['portfolio'][i]['link'],
      position: json['portfolio'][i]['position'],
      project_name: json['portfolio'][i]['project_name'],
      id: json['portfolio'][i]['id'],
      started_time: (json['portfolio'][i]['started_time']=="" || json['portfolio'][i]['started_time']==null)?null:DateFormat("yyyy-MM-dd").parse(json['portfolio'][i]['started_time']),
      ended_time: (json['portfolio'][i]['ended_time']=="" || json['portfolio'][i]['ended_time']==null)?null:DateFormat("yyyy-MM-dd").parse(json['portfolio'][i]['ended_time']),
      created_at: DateFormat("EEE, dd MMM yyyy HH:mm:ss 'GMT'").parse(json['portfolio'][i]['created_at']),
      images: temp1,
    );
  }
}