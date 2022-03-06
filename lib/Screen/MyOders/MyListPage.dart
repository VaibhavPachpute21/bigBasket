// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class MyOrders extends StatefulWidget {
  const MyOrders({ Key? key }) : super(key: key);

  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Orders"),
      ),
      body:orderList() ,
    );
  }

orderList(){
  return ListView.builder(
    itemCount: 10,
    itemBuilder: (context,index){
    return Container(
      padding: EdgeInsets.all(2),
      margin: EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all()),
      child: Row(children: [
        CircleAvatar(radius: 40,
          backgroundImage: AssetImage("./assets/p1.png",),
        ),
        Container(width: 170,
        margin: EdgeInsets.only(left: 4),
          child: Column(children: [
            Text("Product:Tomato Quantity:2 kg Total:43.44 ₹ Paid:Google/upi")
          ],),
        ),
        IconButton(onPressed: (){}, icon:Icon(Icons.location_on_sharp,color: Colors.red,size: 35,)),
        IconButton(onPressed: (){}, icon:Icon(Icons.cancel,color: Colors.red,size: 35,))

       
      ],),
    );
  });
}


}