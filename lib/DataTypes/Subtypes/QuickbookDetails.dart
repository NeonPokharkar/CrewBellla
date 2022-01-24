class QuickbookDetails {
  String? rate_currency,rate_duration;
  bool? is_active,is_flexible;
  double? rate_amount;
  List<int>? portfolio_ids;
  QuickbookDetails({this.rate_currency,this.rate_duration,this.is_active,this.is_flexible,this.rate_amount,this.portfolio_ids});
  factory QuickbookDetails.fromMap(Map<String,dynamic> json,int i){
    List<int> temp1=[];
    if(json['professions'][i]['quickbook_details']!=null)
      {
        if(json['professions'][i]['quickbook_details']['portfolio_ids']!=null)
          {
            for(int j=0;j<json['professions'][i]['quickbook_details']['portfolio_ids'].length;j++)
            {
              temp1.add(json['professions'][i]['quickbook_details']['portfolio_ids'][j]);
            }
          }
        return QuickbookDetails(
          rate_currency: json['professions'][i]['quickbook_details']['rate_currency'],
          rate_duration: json['professions'][i]['quickbook_details']['rate_duration'],
          rate_amount: json['professions'][i]['quickbook_details']['rate_amount']*1.0,
          is_active: json['professions'][i]['quickbook_details']['is_active'],
          is_flexible: json['professions'][i]['quickbook_details']['is_flexible'],
          portfolio_ids: temp1,
        );
      }
    else{
      return QuickbookDetails(rate_currency: "");
    }
  }
}