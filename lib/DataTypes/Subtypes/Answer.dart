import 'package:intl/intl.dart';

class Answer {
  String? description;
  int? id;
  DateTime? created_at;
  Answer({this.description,this.id,this.created_at});
  factory Answer.fromMap(Map<String,dynamic> json, int i) {
    if(json['questions'][i]['answer']!=null)
      {
        return Answer(
          description: json['questions'][i]['answer']['description'],
          id: json['questions'][i]['answer']['id'],
          created_at: DateFormat("EEE, dd MMM yyyy HH:mm:ss 'GMT'").parse(json['questions'][i]['answer']['created_at']),
        );
      }
    else{
      return Answer(id: -1);
    }
  }
}