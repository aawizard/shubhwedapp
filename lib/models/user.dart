class users{

  final String accountHolderName;
  final String bankAccountNumber;
  final String brideGroomName;
  final String brideName;
  final String date;
  final String deliveryAddress;
  final String email;
  final String gPayNumber;
  final String ifscCode;
  final String payTmNumber;
  final String uid;
  final String upiID;
  final String venue;
  final String phoneNumber;
  final String name;



  users({this.name,this.phoneNumber, this.accountHolderName, this.bankAccountNumber, this.brideGroomName, this.brideName, this.date, this.deliveryAddress, this.email, this.gPayNumber, this.ifscCode, this.payTmNumber, this.uid, this.upiID, this.venue});



factory users.fromMap( Map data){
  data = data ?? { };
  return users(
      accountHolderName: data['accountHolderName'] ?? '',
      bankAccountNumber : data['bankAccountNumber'] ?? '',
      brideGroomName: data['brideGroomName'] ?? '',
      brideName : data['brideName'] ?? '',
      date: data['date'] ?? '',
      deliveryAddress: data['deliveryAddress'] ?? '',
      email: data['email'] ?? '',
      gPayNumber: data['gPayNumber'] ?? '',
      ifscCode: data['ifscCode'] ?? '',
      payTmNumber: data['payTmNumber'] ?? '',
      uid: data['uid'] ?? '',
      upiID: data['upiID'] ?? '',
      venue: data['venue'] ?? '',
      phoneNumber: data['phoneNumber']??'',
    name: data['name']??''

  );
}
}




