import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class CrewPostings {
  String? description,location,profession,skills,type_;
  int? experience,id;
  bool? is_active;
  DateTime? created_at;
  CrewPostings({this.description,this.location,this.profession,this.skills,this.type_,this.experience,this.id,this.is_active,this.created_at});
  factory CrewPostings.fromMap(Map<String,dynamic> json,int i) {
    return CrewPostings(
      description: json['crew_postings'][i]['description'],
      location: json['crew_postings'][i]['location'],
      profession: json['crew_postings'][i]['profession'],
      skills: json['crew_postings'][i]['skills'],
      type_: json['crew_postings'][i]['type_'],
      experience: json['crew_postings'][i]['experience'],
      id: json['crew_postings'][i]['id'],
      is_active: json['crew_postings'][i]['is_active'],
      created_at: DateFormat("EEE, dd MMM yyyy HH:mm:ss 'GMT'").parse(json['crew_postings'][i]['created_at']),
    );
  }
}