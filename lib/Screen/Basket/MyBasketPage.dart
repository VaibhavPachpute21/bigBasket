// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:getwidget/components/button/gf_button.dart';

class MyBasket extends StatefulWidget {
  const MyBasket({Key? key}) : super(key: key);

  @override
  State<MyBasket> createState() => _MyBasketState();
}

class _MyBasketState extends State<MyBasket> {
  List<int> quantity = [1, 1, 1];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Basket"),
      ),
      body: ListView(
        children: [
          basketItems(),
          Row(     
            mainAxisAlignment: MainAxisAlignment.center,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              InkWell(child: Text("Missed something?",style: TextStyle(color: Colors.red),)),
              Text("Check Our Inventory")
            ],
          ),
          Container(
            margin: EdgeInsets.only(left: 10,right: 10),
            child: GFButton(onPressed: (){},
            
            color: Colors.red,
            child: Text("Products",style: TextStyle(color: Colors.white,fontSize: 18),),
            ),
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Container(child: Text("Have Promocode")),
            Container(child: Column(
              children: [
                Container(
                  width:MediaQuery.of(context).size.width*0.60,
                  child:TextFormField(
                    
                    decoration: InputDecoration(
                      
                      contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                      focusColor: Colors.red,
                      border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
          ),),
                  ),
                )
              ],
            ),)
          ],),
        ],
      ),
    );
  }

  basketItems() {
    return Wrap(
      children: List.generate(2, (index) {
        return Container(
          padding: EdgeInsets.all(2),
          margin: EdgeInsets.all(2),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5), border: Border.all()),
          child: Row(
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage(
                  "./assets/p1.png",
                ),
              ),
              Container(
                width: 170,
                margin: EdgeInsets.only(left: 4),
                // ignore: prefer_const_literals_to_create_immutables
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Product:Fresh Tomato"),
                    Text("Quantity:1 kg Pack"),
                    Row(
                      children: [
                        Text("Price:"),Text("50 ₹",style: TextStyle(decoration: TextDecoration.lineThrough)),
                      ],
                    ),
                    Text("Total: 45.25 ₹")
                  ],
                ),
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.red),
                        borderRadius: BorderRadius.circular(5)),
                    child: Row(
                      children: [
                        Container(
                          child: InkWell(
                            onTap: () {
                              if (quantity[index] > 1) {
                                setState(() {
                                  quantity[index]--;
                                });
                              }
                            },
                            child: Icon(
                              Icons.remove,
                            ),
                          ),
                        ),
                        Container(
                            width: 20,
                            color: Colors.red,
                            child: Center(
                                child: Text(quantity[index].toString()))),
                        Container(
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                quantity[index]++;
                              });
                            },
                            child: Icon(Icons.add),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text("Saving 4.75 ₹",style: TextStyle(color: Colors.lightGreen,fontSize: 12),)

                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}
