import 'package:intl/intl.dart';

import 'Profile.dart';

class ClientPostings {
  static var fittype=Profile.fittype;
  String? budget_cc,description,job_type,location,profession,skills,time_period,type_;
  int? budget,experience,openings,id;
  DateTime? created_at,time_start;
  bool? is_active;
  ClientPostings({this.budget_cc,this.description,this.job_type,this.location,this.profession,this.skills,this.time_period,this.type_,this.budget,this.experience,this.openings,this.created_at,this.time_start,this.id,this.is_active});
  factory ClientPostings.fromMap(Map<String,dynamic> json,int i) {
    return ClientPostings(
      budget_cc: json['client_postings'][i]['budget_cc'],
      description: json['client_postings'][i]['description'],
      job_type: json['client_postings'][i]['job_type'],
      location: json['client_postings'][i]['location'],
      profession: json['client_postings'][i]['profession'],
      skills: json['client_postings'][i]['skills'],
      time_period: json['client_postings'][i]['time_period'],
      type_: json['client_postings'][i]['type'],
      budget: json['client_postings'][i]['budget'],
      experience: json['client_postings'][i]['experience'],
      openings: json['client_postings'][i]['openings'],
      is_active: json['client_postings'][i]['is_active'],
      id: json['client_postings'][i]['id'],
      created_at: DateFormat("EEE, dd MMM yyyy HH:mm:ss 'GMT'").parse(json['client_postings'][i]['created_at']),
      time_start: (json['client_postings'][i]['time_start']==null || json['client_postings'][i]['time_start']=="")?null:DateFormat("EEE, dd MMM yyyy HH:mm:ss 'GMT'").parse(json['client_postings'][i]['time_start']),
    );
  }
}