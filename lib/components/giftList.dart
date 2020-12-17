import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shubhwed/utils/constants.dart';
import 'package:shubhwed/models/gift.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
class giftList extends StatefulWidget {
  @override
  _giftListState createState() => _giftListState();
}

class _giftListState extends State<giftList> {
  String giftName, imageUrl,details,Price,giftUrl;
  @override
  Widget build(BuildContext context) {
    var user = Provider.of<User>(context);
    var gifts= Provider.of<List<Gift>>(context);
    print('                 $gifts');
    double width=MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: GestureDetector(
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
                                placeholder: 'assets/shubhwed.png',
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
          padding: const EdgeInsets.all(5.0),
          child: GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            semanticChildCount: 2,
            childAspectRatio: 0.6,
            children:gifts.map((gift) {
              setState(() {
                giftName=gift.giftName;
                imageUrl=gift.imageUrl;
                details=gift.details;
                Price=gift.Price.toString();
                giftUrl=gift.giftUrl;
              });
              return Card(
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
                          image: gift.imageUrl==""?AssetImage("assets/shubhwed.png"):NetworkImage(gift.imageUrl,
                          ),

                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          gift.giftName,
                          maxLines: 2,
                          style: TextStyle(fontSize: 25,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:gift.giftStatus==true? Text("Recieved",style: TextStyle(color: Colors.green),
                        ):Text("Not Recieved", style: TextStyle(color: Colors.red),),
                      )
                    ],
                  ),
                ),
              ),
            );}).toList(),

          ),
        ),
      ),
    );
  }
}

