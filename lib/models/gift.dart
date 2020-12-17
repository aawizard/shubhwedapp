import 'package:cloud_firestore/cloud_firestore.dart';
 class Gift{
   final String id;
   final String imageUrl;
   final String giftName;
   final bool giftStatus;
   final double Price;
   final String giftUrl;
   final String details;

  Gift({this.id,this.imageUrl, this.giftName, this.giftStatus, this.Price, this.giftUrl, this.details});
   factory Gift.fromFirestore(DocumentSnapshot doc) {
     Map data = doc.data();
     return Gift(
       id: doc.id,
       imageUrl: data['imageURL']??'',
       giftName: data['itemName']??'',
       giftStatus: data['giftStatus']??false,
       giftUrl: data['giftUrl']??'',
       details: data['description']??'',
       Price: data['Price']??0,
     );
   }
 }