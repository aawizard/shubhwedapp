import 'package:flutter/material.dart';
import 'package:shubhwed_web/models/item.dart';

class GiftGrid extends StatelessWidget {
    Map<String,dynamic> gift;

 
  double height;
  double width;
  GiftGrid(this.gift, this.height, this.width);
  @override
  Widget build(BuildContext context) {
    
    return   SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             
              ClipRRect(
                borderRadius: BorderRadius.circular(width*0.005),
                            child: Container(
                  height: height*0.2,
                  width: width * 0.2,
                  color: Colors.orange[50],
                  child: Image.network(
                    '${gift['imgURL']}',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  '${gift['itemName']}',
                  style: TextStyle(
                      fontSize: (14 / 720) * MediaQuery.of(context).size.width,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: Text(
                  '${gift['price']}',
                  style: TextStyle(
                      fontSize: (10 / 720) * MediaQuery.of(context).size.width,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: Text(
                  'Need :1',
                  style: TextStyle(
                      fontSize: (10 / 720) * MediaQuery.of(context).size.width,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: Text(
                  'Recieved',
                  style: TextStyle(
                      fontSize: (10 / 720) * MediaQuery.of(context).size.width,
                      color: Colors.green,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          
        
      ),
    );
  }
}
