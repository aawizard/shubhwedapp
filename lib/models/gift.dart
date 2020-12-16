import 'package:cloud_firestore/cloud_firestore.dart';
 class gift{
   final String id;
   final String imageUrl;
   final String giftName;
   final bool giftStatus;
   final double Price;
   final String giftUrl;
   final String details;

  gift({this.id,this.imageUrl, this.giftName, this.giftStatus, this.Price, this.giftUrl, this.details});
   factory gift.fromFirestore(DocumentSnapshot doc) {
     Map data = doc.data();
     return gift(
       id: doc.id,
       imageUrl: data['imageURL']??'',
       giftName: data['giftName']??'',
       giftStatus: data['giftStatus']??false,
       giftUrl: data['giftUrl']??'',
       details: data['details']??'',
       Price: data['Price']??0,
     );

   }


 }