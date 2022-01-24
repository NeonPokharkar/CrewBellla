import 'package:intl/intl.dart';

class Skills {
  String? title;
  int? id,level;
  DateTime? created_at;
  Skills({this.title,this.id,this.created_at,this.level});
  factory Skills.fromMap(Map<String,dynamic> json,int i) {
    return Skills(
      title: json['skills'][i]['title'],
      id: json['skills'][i]['id'],
      level: json['skills'][i]['level'],
      created_at: DateFormat("EEE, dd MMM yyyy HH:mm:ss 'GMT'").parse(json['skills'][i]['created_at']),
    );
  }
}