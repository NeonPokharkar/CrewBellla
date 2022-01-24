
import 'package:flutter/cupertino.dart';

import 'Profile.dart';

class Events {
  static var fittype=Profile.fittype;
  String? theme,sku;
  Image? thumbnail;
  Events({this.theme,this.sku,this.thumbnail});
  factory Events.fromMap(Map<String,dynamic> json, int i) {
    return Events(
      theme: json['events'][i]['theme'],
      sku: json['events'][i]['sku'],
      thumbnail: (json['events'][i]['thumbnail']=="" || json['events'][i]['thumbnail']!=null)?Image.asset("assets/blank_scenery.png", fit: fittype,):Image.network(json['events'][i]['thumbnail'],fit: fittype,),
    );
  }
}