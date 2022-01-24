
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'DataTypes/Profile.dart';

class UserProfile extends StatefulWidget {
  final Profile profile;
  const UserProfile({Key? key, required this.profile}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> with TickerProviderStateMixin {
  late TabController tabController;
  final GlobalKey<ScaffoldState> _scaffoldKey=GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    tabController=TabController(length: 6, vsync: this);
  }
  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }
  static double strokewidth=0.5;
  static var fittype=Profile.fittype;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        key: _scaffoldKey,
        drawer: Drawer(
          child: (widget.profile.portfolio==null)?Container():ListView.builder(
            itemCount: widget.profile.portfolio!.length,
            itemBuilder: (BuildContext context,int i) => RaisedButton(
              padding: EdgeInsets.zero,
              color: Colors.white,
              onPressed: () async {
                if(!await launch(widget.profile.portfolio![i].link!)){

                }
                else{
                  Scaffold.of(context).showSnackBar(SnackBar(content: Text("Couldn't launch the link")));
                }
              },
              child: Card(
                child: Column(
                  children: [
                    Text("${widget.profile.portfolio![i].project_name}",style: TextStyle(fontWeight: FontWeight.bold),),
                    Text("${widget.profile.portfolio![i].position}",style: TextStyle(fontStyle: FontStyle.italic),),
                    Text("${widget.profile.portfolio![i].description}",textAlign: TextAlign.center,),
                    Container(padding: EdgeInsets.fromLTRB(0, 10, 0, 0),child: Text("From: ${widget.profile.portfolio![i].started_time}")),
                    Icon(Icons.arrow_downward),
                    Text("To: ${widget.profile.portfolio![i].ended_time}"),
                    (widget.profile.portfolio![i].images==null)?Container():(widget.profile.portfolio![i].images!.length==0)?Container():GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 4,
                        crossAxisSpacing: 4,
                      ),
                      itemCount: widget.profile.portfolio![i].images!.length,
                      itemBuilder: (BuildContext context,int i) {
                        return widget.profile.portfolio![i].images![i];
                      },
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Text("Posted on ${widget.profile.portfolio![i].created_at}",style: TextStyle(fontSize: 8),),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        appBar: AppBar(
          leading: IconButton(
             icon: Icon(Icons.camera_rounded),
            onPressed: () {
               _scaffoldKey.currentState?.openDrawer();
            },
          ),
          title: Text("@${widget.profile.username}",textAlign: TextAlign.center,),
          centerTitle: true,
        ),
        body: Builder(
          builder: (context) => SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 300,
                  width: double.infinity,
                  child: RaisedButton(
                    child: Stack(
                      children: [
                        Container(
                          child: widget.profile.cover??Image.asset("assets/blank_cover.png", fit: fittype,),
                        ),
                        Positioned.fill(
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  radius: 40,
                                  child: ClipOval(
                                      child: widget.profile.image??Image.asset("assets/blank_profile.png",fit: fittype,)
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                        widget.profile.name??"",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(color: Colors.white, shadows: [Shadow(offset: Offset(-strokewidth,strokewidth), color: Colors.black),Shadow(offset: Offset(strokewidth,-strokewidth), color: Colors.black),Shadow(offset: Offset(strokewidth,strokewidth), color: Colors.black),Shadow(offset: Offset(-strokewidth,-strokewidth), color: Colors.black)],)
                                    ),
                                    if(widget.profile.is_verified??false)Icon(
                                      Icons.check_circle,
                                      color:Colors.green,
                                    ),
                                    if(widget.profile.quickbook_verified??false)Icon(
                                      Icons.check_circle,
                                      color:Colors.blue,
                                    ),
                                  ],
                                ),
                                Text(
                                    "On CrewBella since ${widget.profile.created!.day}/${widget.profile.created!.month}/${widget.profile.created!.year}",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.white,fontSize:10,shadows: [Shadow(offset: Offset(-strokewidth,strokewidth), color: Colors.black),Shadow(offset: Offset(strokewidth,-strokewidth), color: Colors.black),Shadow(offset: Offset(strokewidth,strokewidth), color: Colors.black),Shadow(offset: Offset(-strokewidth,-strokewidth), color: Colors.black)],)
                                ),
                                if(widget.profile.visits!=null)Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                        widget.profile.visits.toString(),
                                        textAlign: TextAlign.center,
                                        style: TextStyle(color: Colors.white,fontSize:10,shadows: [Shadow(offset: Offset(-strokewidth,strokewidth), color: Colors.black),Shadow(offset: Offset(strokewidth,-strokewidth), color: Colors.black),Shadow(offset: Offset(strokewidth,strokewidth), color: Colors.black),Shadow(offset: Offset(-strokewidth,-strokewidth), color: Colors.black)],)
                                    ),
                                    Container(
                                      width: 5,
                                    ),
                                    Icon(
                                      Icons.remove_red_eye,
                                      color: Colors.white,
                                      size: 20,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    onPressed: () {},
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    widget.profile.bio??"",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black, fontSize:15),
                  ),
                ),
                if(widget.profile.dateofbirth!=null) Text(
                  "Date of Birth: ${widget.profile.dateofbirth!.day}/${widget.profile.dateofbirth!.month}/${widget.profile.dateofbirth!.year}",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black, fontSize:15),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Text(
                            (widget.profile.followings??0).toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Container(
                            height: 10,
                          ),
                          Text(
                            "Followings",
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Text(
                            (widget.profile.strength??0).toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Container(
                            height: 10,
                          ),
                          Text(
                            "Strength",
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Text(
                            (widget.profile.quickbookings??0).toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Container(
                            height: 10,
                          ),
                          Text(
                            "Quick Bookings",
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                (widget.profile.locations==null)?Container():Row(
                  children: [
                    ...(List.generate(widget.profile.locations!.length, (index) => (widget.profile.locations![index].city==null)?Container():Expanded(
                      child: RaisedButton(
                        child: Text(widget.profile.locations![index].city!,style: TextStyle(color: (widget.profile.locations![index].is_primary??false)?Colors.white:Colors.blue),),
                        color: (widget.profile.locations![index].is_primary??false)?Colors.blue:Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                        onPressed: () {
                          Scaffold.of(context).showSnackBar(SnackBar(content: Text("Location: ${widget.profile.locations![index].city??" "},${widget.profile.locations![index].state??" "},${widget.profile.locations![index].country??" "},${widget.profile.locations![index].zipcode??" "} ;created on: ${widget.profile.locations![index].created_at??" "}")));
                        },
                      ),
                    )))
                  ],
                ),
                Text("Professions:"),
                (widget.profile.professions==null)?Text("No Professions to display"):(widget.profile.professions!.length==0)?Text("No Professions to display"):Row(
                  children: [
                    ...(List.generate(widget.profile.professions!.length, (index) => (widget.profile.professions![index].title==null)?Container():Expanded(
                      child: RaisedButton(
                        child: Text(widget.profile.professions![index].title!,style: TextStyle(color: (widget.profile.professions![index].is_primary??false)?Colors.white:Colors.blue),),
                        color: (widget.profile.professions![index].is_primary??false)?Colors.blue:Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                        onPressed: () {
                          Scaffold.of(context).showSnackBar(SnackBar(content: Text("Title: ${widget.profile.professions![index].title??" "}; Experience: ${widget.profile.professions![index].experience??" "} years; Is for QuickBook: ${widget.profile.professions![index].for_quickbook??" "}; Created on:${widget.profile.professions![index].created_at??" "}")));
                        },
                      ),
                    )))
                  ],
                ),
                Text("Skills:"),
                (widget.profile.skills==null)?Text("No Skills to display"):(widget.profile.skills!.length==0)?Text("No Skills to display"):Row(
                  children: [
                    ...(List.generate(widget.profile.skills!.length, (index) => (widget.profile.skills![index].title==null)?Container():Expanded(
                      child: RaisedButton(
                        child: Text(widget.profile.skills![index].title!,style: TextStyle(color: (false)?Colors.white:Colors.blue),),
                        color: (false)?Colors.blue:Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                        onPressed: () {
                          Scaffold.of(context).showSnackBar(SnackBar(content: Text("Skill: ${widget.profile.skills![index].title??" "}; Level: ${widget.profile.skills![index].level??" "} ; Created on:${widget.profile.skills![index].created_at??" "}")));
                        },
                      ),
                    )))
                  ],
                ),
                Container(
                  color: Colors.blue,
                  height: 50,
                  child: TabBar(
                    controller: tabController,
                    unselectedLabelColor: Colors.white,
                    indicatorColor: Colors.white,
                    tabs: [
                      Icon(Icons.keyboard,color: Colors.white,),
                      Icon(Icons.work,color: Colors.white,),
                      Icon(Icons.workspaces_outline,color: Colors.white,),
                      Icon(Icons.event,color: Colors.white,),
                      Icon(Icons.question_answer,color: Colors.white,),
                      Icon(Icons.people,color: Colors.white,),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.875-MediaQuery.of(context).padding.top-MediaQuery.of(context).padding.bottom-50,
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      (widget.profile.blogs!=null)?ListView.builder(
                        shrinkWrap: true,
                        itemCount: widget.profile.blogs!.length,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context,int i) {
                          return ListTile(
                            leading: CircleAvatar(
                              child: ClipOval(
                                child: widget.profile.blogs![i].image,
                              ),
                            ),
                            title: Text(widget.profile.blogs![i].title??""),
                            subtitle: (widget.profile.blogs![i].created_at!=null)?Text("Created: ${widget.profile.blogs![i].created_at!.day}/${widget.profile.blogs![i].created_at!.month}/${widget.profile.blogs![i].created_at!.year} ${widget.profile.blogs![i].created_at!.hour}:${widget.profile.blogs![i].created_at!.minute}:${widget.profile.blogs![i].created_at!.second}"):Text(""),
                          );
                        },
                      ):Container(),
                      (widget.profile.client_postings!=null)?ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: widget.profile.client_postings!.length,
                        itemBuilder: (BuildContext context,int i) {
                          return Card(
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    child: (widget.profile.client_postings![i].type_==null)?Container():Text("${widget.profile.client_postings![i].type_}"),
                                  ),
                                ),
                                (widget.profile.client_postings![i].profession==null)?Container():Text("${widget.profile.client_postings![i].profession}",style: TextStyle(fontWeight: FontWeight.bold),),
                                (widget.profile.client_postings![i].budget==null || widget.profile.client_postings![i].budget_cc==null)?Container():Text("Budget: ${widget.profile.client_postings![i].budget} ${widget.profile.client_postings![i].budget_cc}"),
                                (widget.profile.client_postings![i].experience==null)?Container():Text("Minimum experience: ${widget.profile.client_postings![i].experience} years"),
                                (widget.profile.client_postings![i].location!=null)?Text("Location: ${widget.profile.client_postings![i].location}"):Container(),
                                (widget.profile.client_postings![i].job_type==null)?Container():Text("Job type: ${widget.profile.client_postings![i].job_type}"),
                                (widget.profile.client_postings![i].time_period==null)?Container():Text("Duration: ${widget.profile.client_postings![i].time_period}"),
                                (widget.profile.client_postings![i].time_start!=null)?Text("Starting from: ${widget.profile.client_postings![i].time_start!.day}/${widget.profile.client_postings![i].time_start!.month}/${widget.profile.client_postings![i].time_start!.year} ${widget.profile.client_postings![i].time_start!.hour}:${widget.profile.client_postings![i].time_start!.minute}:${widget.profile.client_postings![i].time_start!.second}"):Container(),
                                (widget.profile.client_postings![i].openings==null)?Container():Text("Number of openings: ${widget.profile.client_postings![i].openings}"),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    child: (widget.profile.client_postings![i].is_active!=null)?(widget.profile.client_postings![i].is_active!)?Text("Active",style: TextStyle(color: Colors.blue),):Text("Not Active",style: TextStyle(color: Colors.red),):Container(),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child:Container(
                                    padding: EdgeInsets.all(10),
                                    child: (widget.profile.client_postings![i].created_at!=null)?Text("Posted on ${widget.profile.client_postings![i].created_at!.day}/${widget.profile.client_postings![i].created_at!.month}/${widget.profile.client_postings![i].created_at!.year} ${widget.profile.client_postings![i].created_at!.hour}:${widget.profile.client_postings![i].created_at!.minute}:${widget.profile.client_postings![i].created_at!.second}",style: TextStyle(fontSize: 8),):Container(),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      )
                          :Container(),
                      (widget.profile.crew_postings!=null)?ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: widget.profile.crew_postings!.length,
                        itemBuilder: (BuildContext context,int i) {
                          return Card(
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    child: (widget.profile.crew_postings![i].type_==null)?Container():Text("${widget.profile.crew_postings![i].type_}"),
                                  ),
                                ),
                                (widget.profile.crew_postings![i].profession==null)?Container():Text("${widget.profile.crew_postings![i].profession}",style: TextStyle(fontWeight: FontWeight.bold),),
                                (widget.profile.crew_postings![i].description==null)?Container():Text("${widget.profile.crew_postings![i].description}"),
                                (widget.profile.crew_postings![i].skills==null)?Container():Text("Skills required: ${widget.profile.crew_postings![i].skills}"),
                                (widget.profile.crew_postings![i].experience==null)?Container():Text("Minimum experience: ${widget.profile.crew_postings![i].experience} years"),
                                (widget.profile.crew_postings![i].location==null)?Container():Text("Location: ${widget.profile.crew_postings![i].location}"),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    child: (widget.profile.crew_postings![i].is_active!=null)?(widget.profile.crew_postings![i].is_active!)?Text("Active",style: TextStyle(color: Colors.blue),):Text("Not Active",style: TextStyle(color: Colors.red),):Container(),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child:Container(
                                    padding: EdgeInsets.all(10),
                                    child: (widget.profile.crew_postings![i].created_at!=null)?Text("Posted on ${widget.profile.crew_postings![i].created_at!.day}/${widget.profile.crew_postings![i].created_at!.month}/${widget.profile.crew_postings![i].created_at!.year} ${widget.profile.crew_postings![i].created_at!.hour}:${widget.profile.crew_postings![i].created_at!.minute}:${widget.profile.crew_postings![i].created_at!.second}",style: TextStyle(fontSize: 8),):Container(),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      )
                          :Container(),
                      (widget.profile.events!=null)?ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: widget.profile.events!.length,
                        itemBuilder: (BuildContext context,int i) {
                          return ListTile(
                            title: Text(widget.profile.events![i].theme??""),
                            leading: CircleAvatar(
                              child: ClipOval(
                                child: widget.profile.events![i].thumbnail,
                              ),
                            ),
                          );
                        },
                      )
                          :Container(),
                      (widget.profile.questions!=null)?ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: widget.profile.questions!.length,
                        itemBuilder: (BuildContext context,int i) {
                          return Card(
                            child: Column(
                              children: [
                                (widget.profile.questions![i].title==null)?Container():Container(padding: EdgeInsets.fromLTRB(10, 10, 10, 5),child: Text("Q: ${widget.profile.questions![i].title}",style: TextStyle(fontWeight: FontWeight.bold),)),
                                (widget.profile.questions![i].description==null)?Container():Container(padding: EdgeInsets.fromLTRB(10, 0, 10, 5),child: Text(widget.profile.questions![i].description??"",style: TextStyle(fontStyle: FontStyle.italic),)),
                                Container(
                                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                  child: (widget.profile.questions![i].answer!=null)?(widget.profile.questions![i].answer!.created_at!=null)?Text("A(${widget.profile.questions![i].answer!.created_at!.day}/${widget.profile.questions![i].answer!.created_at!.month}/${widget.profile.questions![i].answer!.created_at!.year} ${widget.profile.questions![i].answer!.created_at!.hour}:${widget.profile.questions![i].answer!.created_at!.minute}:${widget.profile.questions![i].answer!.created_at!.second}): ${widget.profile.questions![i].answer!.description??""}"):Text("A: ${widget.profile.questions![i].answer!.description??""}"):Text(""),
                                ),
                                Container(padding: EdgeInsets.all(10), child: Align(
                                  alignment: Alignment.bottomRight,
                                  child: (widget.profile.questions![i].created_at!=null)?Text("Asked on ${widget.profile.questions![i].created_at!.day}/${widget.profile.questions![i].created_at!.month}/${widget.profile.questions![i].created_at!.year} ${widget.profile.questions![i].created_at!.hour}:${widget.profile.questions![i].created_at!.minute}:${widget.profile.questions![i].created_at!.second}",style: TextStyle(fontSize: 8),):Container(),
                                ),),
                                Container(
                                  padding: EdgeInsets.all(5),
                                  child: Align(
                                    alignment: Alignment.bottomRight,
                                    child: (widget.profile.questions![i].me!=null)?(widget.profile.questions![i].me!)?Icon(Icons.face,color: Colors.blue,):Container():Container(),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      )
                          :Container(),
                      (widget.profile.social_hubs==null)?Container():ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: widget.profile.social_hubs!.length,
                        itemBuilder: (BuildContext context,int i) => Card(
                          child: Column(
                            children: [
                              Text("${widget.profile.social_hubs![i].title}",style: TextStyle(fontWeight: FontWeight.bold),),
                              Text("${widget.profile.social_hubs![i].description}"),
                              (widget.profile.social_hubs![i].images==null)?Container():(widget.profile.social_hubs![i].images!.length==0)?Container():GridView.builder(
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 4,
                                  mainAxisSpacing: 4,
                                ),
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: widget.profile.social_hubs![i].images!.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return widget.profile.social_hubs![i].images![index];
                                },
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  child: Text("Created on ${widget.profile.social_hubs![i].created_at}",style: TextStyle(fontSize: 8),),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
              mainAxisSize: MainAxisSize.min,
            ),
          ),
        ),
        bottomNavigationBar: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
                child: Text("Twitter",style: TextStyle(color: Colors.white),),
                color: Colors.blue,
                onPressed: () async {
                  if(!await launch("https://twitter.com/${widget.profile.twitter}"))
                  {

                  }
                  else
                  {
                    Scaffold.of(context).showSnackBar(SnackBar(content: Text("Couldn't launch the link")));
                  }
                },
              ),
            ),
            Expanded(
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
                child: Text("Instagram",style: TextStyle(color: Colors.white),),
                color: Colors.blue,
                onPressed: () async {
                  if(!await launch("https://www.instagram.com/${widget.profile.instagram}/"))
                  {

                  }
                  else
                  {
                  Scaffold.of(context).showSnackBar(SnackBar(content: Text("Couldn't launch the link")));
                  }
                },
              ),
            ),
            Expanded(
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
                child: Text("Facebook",style: TextStyle(color: Colors.white),),
                color: Colors.blue,
                onPressed: () async {
                  if(!await launch("https://www.facebook.com/${widget.profile.facebook}"))
                  {

                  }
                  else
                  {
                  Scaffold.of(context).showSnackBar(SnackBar(content: Text("Couldn't launch the link")));
                  }
                },
              ),
            ),
            Expanded(
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
                child: Text("Website", style: TextStyle(color: Colors.white),),
                color: Colors.blue,
                onPressed: () async {
                  if(!await launch("${widget.profile.website}"))
                  {

                  }
                  else
                  {
                  Scaffold.of(context).showSnackBar(SnackBar(content: Text("Couldn't launch the link")));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
