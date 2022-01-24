import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import 'Profile.dart';

class Blogs {
  static var fittype=Profile.fittype;
  String? title;
  Image? image;
  DateTime? created_at;
  int? id;
  Blogs({this.title,this.image,this.created_at,this.id});
  factory Blogs.fromMap(Map<String,dynamic> json, int i) {
    return Blogs(
      image: (json["blogs"][i]['image']=="" || json['blogs'][i]['image']==null)?Image.asset('assets/blank_scenery.png',fit: fittype,):Image.network(json["blogs"][i]['image'],fit: fittype,),
      title: json["blogs"][i]['title'],
      id: json["blogs"][i]['id'],
      created_at: DateFormat("EEE, dd MMM yyyy HH:mm:ss 'GMT'").parse(json["blogs"][i]['created_at']),
    );
  }
}