import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shubhwed/utils/constants.dart';
import 'package:shubhwed/models/gift.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:shubhwed/components/giftCard.dart';
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

    double width=MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: GridView.count(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        semanticChildCount: 2,
        childAspectRatio: 0.6,
        children:gifts.map((gift) {
          return giftCard(
            giftName:gift.giftName ,
            id: gift.id,
            imageUrl: gift.imageUrl,
            giftStatus: gift.giftStatus,
            giftUrl: gift.giftUrl,
            details: gift.details,
            Price: gift.Price,

          ); }).toList(),

      ),
    );
  }
}

