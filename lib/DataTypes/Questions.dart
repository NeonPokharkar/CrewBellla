import 'package:crewbella/DataTypes/Subtypes/Answer.dart';
import 'package:intl/intl.dart';

class Questions {
  String? description,title;
  int? id;
  bool? me;
  DateTime? created_at;
  Answer? answer;
  Questions({this.description,this.title,this.id,this.me,this.created_at,this.answer});
  factory Questions.fromMap(Map<String,dynamic> json,int i)
  {
    return Questions(
      description: json['questions'][i]['description'],
      title: json['questions'][i]['title'],
      id: json['questions'][i]['id'],
      me: json['questions'][i]['me'],
      created_at: DateFormat("EEE, dd MMM yyyy HH:mm:ss 'GMT'").parse(json['questions'][i]['created_at']),
      answer: Answer.fromMap(json, i),
    );
  }
}