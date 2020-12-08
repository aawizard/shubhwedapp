import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shubhwed/utils/constants.dart';
class EventCard extends StatefulWidget {
  final String imageUrl;
  final String giftName;
  final bool giftStatus;
  final double Price;
  final String giftUrl;
  final String details;

  const EventCard(
      {Key key,
      this.imageUrl, this.giftName, this.giftStatus, this.Price, this.giftUrl, this.details})
      : super(key: key);
  @override
  _EventCardState createState() => _EventCardState( imageUrl,giftName,giftStatus,Price,giftUrl,details);
}

class _EventCardState extends State<EventCard> {
  final String imageUrl;
  final String giftName;
  final bool giftStatus;
  final double Price;
  final String giftUrl;
  final String details;
  _EventCardState(this.imageUrl, this.giftName, this.giftStatus, this.Price, this.giftUrl, this.details);
  @override
  Widget build(BuildContext context) {
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
                            giftName,
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.black,
                                decoration: TextDecoration.none),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: FadeInImage.assetNetwork(
                              image: imageUrl,
                              placeholder: 'assets/greySquare.JPG',
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            details,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                decoration: TextDecoration.none),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Price : Rs. $Price",
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
                                    launch(giftUrl);
                                  },
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
              );
            });
      },

      child: Padding(
        padding: const EdgeInsets.all(7.0),
        child: Card(

          color: Color(0xffFBB4BA),
          borderOnForeground: false,
          elevation: 20,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: MediaQuery.of(context).size.width/2 -40,
              child: Column(
                children: <Widget>[
                  Image(
                    image: imageUrl==""?AssetImage("assets/shubhwed.png"):NetworkImage(imageUrl),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      giftName,
                      maxLines: 2,
                      style: TextStyle(fontSize: 25,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:giftStatus==true? Text("Recieved",style: TextStyle(color: Colors.green),
                    ):Text("Not Recieved", style: TextStyle(color: Colors.red),),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

