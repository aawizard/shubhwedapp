import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:shubhwed/services/db.dart';
import 'package:shubhwed/screens/giftScreens/gift_screen.dart';
class giftCard extends StatefulWidget {
  final String imageUrl;
  final String giftName;
  final bool giftStatus;
  final int Price;
  final String giftUrl;
  final String details;
  final String id;
  const giftCard(
      {Key key,
      this.imageUrl,@required this.giftName,@required this.giftStatus, this.Price, this.giftUrl, this.details, this.id})
      : super(key: key);
  @override
  _giftCardState createState() => _giftCardState( );
}

class _giftCardState extends State<giftCard> {
  @override
  Widget build(BuildContext context) {
    var user = Provider.of<User>(context);
    DatabaseService _db=DatabaseService(user.uid);
    double width=MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        return showGeneralDialog(
            context: context,
            barrierDismissible: true,
            barrierLabel:
            MaterialLocalizations.of(context).modalBarrierDismissLabel,
            barrierColor: Colors.black45,
            transitionDuration: const Duration(milliseconds: 200),
            pageBuilder: (BuildContext buildContext, Animation animation,
                Animation secondaryAnimation) {
              return Center(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40.0),
                          bottomRight: Radius.circular(40.0))),
                  width: MediaQuery.of(context).size.width - 60,
                  height: 2 * MediaQuery.of(context).size.height / 3,
                  padding: EdgeInsets.all(20),
                  child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Text(
                           widget.giftName,
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.black,
                                decoration: TextDecoration.none),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Image(
                              image:widget.imageUrl==""?AssetImage("assets/shubhwed.png"):NetworkImage(widget.imageUrl,
                              ),

                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            widget.details,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                decoration: TextDecoration.none),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Price : Rs. ${widget.Price}",
                            maxLines: 1,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 25,
                                color: Colors.black,
                                decoration: TextDecoration.none),
                          ),
                          SizedBox(
                            height: 15,
                          ),

                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6),
                            child: RichText(
                              maxLines: 1,
                              text: TextSpan(
                                text: 'Open Gift Link',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.blue,
                                    decoration: TextDecoration.none),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    launch(widget.giftUrl);
                                  },
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(width: width/3,),
                              FlatButton(
                                child: Icon(
                                    Icons.delete,

                                ),
                                onPressed: (){
                                  _db.removegift(widget.id);
                                Navigator.pop(context);
                                },
                              )
                            ],
                          )
                        ],
                      )),
                ),
              );
            });
      },

      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          child: Card(
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            color: Color(0xffFBB4BA),
//            borderOnForeground: false,
            elevation: 10,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                  Container(
                    width:width/2 -34 ,
                    height: width/2 -34,
                    child: Image(
                      image: widget.imageUrl==""?AssetImage("assets/shubhwed.png"):NetworkImage(widget.imageUrl,
                      ),

                    ),
                  ),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        widget.giftName,
                        maxLines: 1,
                        style: TextStyle(fontSize: 25,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:widget.giftStatus==true? Text("Recieved",style: TextStyle(color: Colors.green),
                      ):Text("Not Recieved", style: TextStyle(color: Colors.red),),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

