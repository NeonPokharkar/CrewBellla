
import 'package:crewbella/DataTypes/ClientPostings.dart';
import 'package:crewbella/DataTypes/CrewPostings.dart';
import 'package:crewbella/DataTypes/Events.dart';
import 'package:crewbella/DataTypes/Locations.dart';
import 'package:crewbella/DataTypes/Portfolio.dart';
import 'package:crewbella/DataTypes/Professions.dart';
import 'package:crewbella/DataTypes/Questions.dart';
import 'package:crewbella/DataTypes/Skills.dart';
import 'package:crewbella/DataTypes/SocialHubs.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import 'Blogs.dart';

class Profile {
  static var fittype=BoxFit.cover;
  String? bio,facebook,name,instagram,linkedin,fullname,twitter,username,website,imagelink;
  int? followings,quickbookings,userid,visits;
  double? strength;
  bool? is_following,is_verified,is_working,quickbook_verified,is_logged_in;
  DateTime? dateofbirth,created;
  List<Blogs>? blogs;
  List<Locations>? locations;
  List<Events>? events;
  List<CrewPostings>? crew_postings;
  List<ClientPostings>? client_postings;
  List<Professions>? professions;
  List<Portfolio>? portfolio;
  List<Skills>? skills;
  List<SocialHubs>? social_hubs;
  List<Questions>? questions;
  Image? cover,image;
  Profile({this.bio,this.blogs,this.questions,this.social_hubs,this.portfolio,this.skills,this.locations,this.professions,this.events,this.is_logged_in,this.crew_postings,this.client_postings, this.facebook, this.fullname,this.cover,this.image, this.name,this.quickbook_verified,this.instagram,this.linkedin,this.twitter,this.username,this.website,this.imagelink,this.followings,this.quickbookings,this.strength,this.userid,this.visits,this.is_following,this.is_verified,this.is_working,this.dateofbirth,this.created});
  factory Profile.fromMap(Map<String, dynamic> json) {
    List<Blogs> temp1=[];
    List<ClientPostings> temp2=[];
    List<CrewPostings> temp3=[];
    List<Events> temp4=[];
    List<Locations> temp5=[];
    List<Professions> temp6=[];
    List<Portfolio> temp7=[];
    List<Skills> temp8=[];
    List<SocialHubs> temp9=[];
    List<Questions> temp0=[];
    if(json.containsKey("questions"))
      {
        for(int i=0;i<json['questions'].length;i++)
          {
            temp0.add(Questions.fromMap(json, i));
          }
      }
    if(json.containsKey("social_hubs"))
      {
        for(int i=0;i<json['social_hubs'].length;i++)
          {
            temp9.add(SocialHubs.fromMap(json, i));
          }
      }
    if(json.containsKey("skills"))
      {
        for(int i=0;i<json['skills'].length;i++)
          {
            temp8.add(Skills.fromMap(json, i));
          }
      }
    if(json.containsKey("portfolio"))
      {
        for(int i=0;i<json['portfolio'].length;i++)
          {
            temp7.add(Portfolio.fromMap(json, i));
          }
      }
    if(json.containsKey("professions"))
      {
        for(int i=0;i<json['professions'].length;i++)
          {
            temp6.add(Professions.fromMap(json, i));
          }
      }
    if(json.containsKey("locations"))
      {
        for(int i=0;i<json['locations'].length;i++)
          {
            temp5.add(Locations.fromMap(json, i));
          }
      }
    if(json.containsKey("events"))
      {
        for(int i=0;i<json["events"].length;i++)
          {
            temp4.add(Events.fromMap(json, i));
          }
      }
    if(json.containsKey("crew_postings"))
      {
        for(int i=0;i<json['crew_postings'].length;i++)
          {
            temp3.add(CrewPostings.fromMap(json, i));
          }
      }
    if(json.containsKey("client_postings"))
      {
        for(int i=0;i<json['client_postings'].length;i++)
          {
            temp2.add(ClientPostings.fromMap(json, i));
          }
      }
    if(json.containsKey("blogs"))
      {
        for(int i=0;i<json['blogs'].length;i++)
          {
            temp1.add(Blogs.fromMap(json, i));
          }
      }
    return Profile(bio: json['basic']['bio'],
      facebook: json['basic']['facebook'],
      name: json['basic']['name'],
      instagram: json['basic']['instagram'],
      linkedin: json['basic']['linkedin'],
      fullname: json['basic']['fullname'],
      twitter: json['basic']['twitter'],
      username: json['basic']['username'],
      website: json['basic']['website'],
      imagelink: json['basic']['image_hd'],
      followings: json['basic']['followings'],
      quickbookings: json['basic']['quick_bookings'],
      strength: json['basic']['strength']*1.0,
      userid: json['basic']['user_id'],
      visits: json['basic']['visits'],
      is_following: json['basic']['is_following'],
      is_verified: json['basic']['is_verified'],
      is_working: json['basic']['is_working'],
      quickbook_verified: json['basic']['quickbook_verified'],
      dateofbirth: (json['basic']['dob']=="" || json['basic']['dob']==null)?null:DateFormat("yyyy-MM-dd").parse(json['basic']['dob']),
      created: (json['basic']['created_at']=="" || json['basic']['created_at']==null)?null:DateFormat("EEE, dd MMM yyyy HH:mm:ss 'GMT'").parse(json['basic']['created_at']),
      image: (json['basic']['image']=='' || json['basic']['image']==null)?Image.asset("assets/blank_pofile.png", fit: fittype,):Image.network(json['basic']['image'],fit: fittype,),
      cover: (json['basic']['cover']=="" || json['basic']['cover']==null)?Image.asset("assets/blank_cover.png", fit: fittype,):Image.network(json['basic']['cover'], fit: fittype,),
      blogs: temp1,
      client_postings: temp2,
      crew_postings: temp3,
      events: temp4,
      is_logged_in: json['is_logged_in'],
      locations: temp5,
      professions: temp6,
      portfolio: temp7,
      skills: temp8,
      social_hubs: temp9,
      questions: temp0,
    );
  }
}