import 'package:cloud_firestore/cloud_firestore.dart';
 class Gift{
   final String id;
   final String imageUrl;
   final String giftName;
   final bool giftStatus;
   final int Price;
   final String giftUrl;
   final String details;

  Gift({this.id,this.imageUrl, this.giftName, this.giftStatus, this.Price, this.giftUrl, this.details});
   factory Gift.fromFirestore(DocumentSnapshot doc) {
     Map data = doc.data();
     return Gift(
       id: doc.id,
       imageUrl: data['imgURL']??'',
       giftName: data['itemName']??'',
       giftStatus: data['status']??false,
       giftUrl: data['productUrl']??'',
       details: data['description']??'',
       Price: data['price']??0,
     );
   }
 }