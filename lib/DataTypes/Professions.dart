import 'package:crewbella/DataTypes/Subtypes/QuickbookDetails.dart';
import 'package:intl/intl.dart';

class Professions {
  String? title;
  int? experience,id,user_id;
  bool? for_quickbook,is_primary;
  DateTime? created_at;
  QuickbookDetails? quickbook_details;
  Professions({this.title,this.experience,this.quickbook_details,this.id,this.user_id,this.for_quickbook,this.is_primary,this.created_at});
  factory Professions.fromMap(Map<String,dynamic> json,int i) {
    return Professions(
      title: json['professions'][i]['title'],
      experience: json['professions'][i]['experience'],
      id: json['professions'][i]['id'],
      user_id: json['professions'][i]['user_id'],
      for_quickbook: json['professions'][i]['for_quickbook'],
      is_primary: json['professions'][i]['is_primary'],
      created_at: DateFormat("EEE, dd MMM yyyy HH:mm:ss 'GMT'").parse(json['professions'][i]['created_at']),
      quickbook_details: QuickbookDetails.fromMap(json, i),
    );
  }
}