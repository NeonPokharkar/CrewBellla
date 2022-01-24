import 'package:intl/intl.dart';

class Locations {
  String? city,country,state,zipcode;
  int? id;
  bool? is_primary;
  DateTime? created_at;
  Locations({this.created_at,this.country,this.city,this.state,this.zipcode,this.id,this.is_primary});
  factory Locations.fromMap(Map<String,dynamic> json,int i) {
    return Locations(
      city: json['locations'][i]['city'],
      country: json['locations'][i]['country'],
      state: json['locations'][i]['state'],
      zipcode: json['locations'][i]['zipcode'],
      id: json['locations'][i]['id'],
      is_primary: json['locations'][i]['is_primary'],
      created_at: DateFormat("EEE, dd MMM yyyy HH:mm:ss 'GMT'").parse(json['locations'][i]['created_at']),
    );
  }
}