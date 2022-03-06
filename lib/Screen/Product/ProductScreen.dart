// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/components/button/gf_icon_button.dart';
import 'package:getwidget/getwidget.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  String dsption="Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.";

  var _myColorOne = Colors.grey;
  var _myColorTwo = Colors.grey;
  var _myColorThree = Colors.grey;
  var _myColorFour = Colors.grey;
  var _myColorFive = Colors.grey;
  int quantity = 1;

  List opt=["India","Vegetarian","Winter Fruits"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          elevation: 0,
            leading: IconButton(
                onPressed: () {}, icon: Icon(Icons.arrow_back_ios_rounded)),
            actions: <Widget>[
              IconButton(onPressed: () {}, icon: Icon(Icons.search)),
              IconButton(onPressed: () {}, icon: Icon(Icons.share_outlined)),
              IconButton(
                  onPressed: () {}, icon: Icon(Icons.shopping_basket_outlined)),

              //IconButton
            ]),
        body: SafeArea(
          child: ListView(
            children: [
              Container(
                padding: EdgeInsets.all(5),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Strawberry, 200g",
                      style: TextStyle(fontSize: 18),
                    ),
                    Container(
                      
                      padding: EdgeInsets.all(5),
                      child: Row(
                        children: [
                          Text("Rs 50"),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            "MRP:",
                            style: TextStyle(color: Colors.grey.shade400),
                          ),
                          Text(
                            "68.75",
                            style: TextStyle(
                                color: Colors.grey.shade400,
                                decoration: TextDecoration.lineThrough),
                          ),
                          Card(
                            color: Colors.red,
                            child: Text(
                              "20% OFF",
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    ),
                    Text(
                      "(Inclusive of all taxes)",
                      style: TextStyle(color: Colors.grey.shade400, fontSize: 12),
                    ),
                  ],
                ),
              ),
              
              SizedBox(
                height: 5,
              ),
              ClipRRect(
                child: Image.asset("./assets/p1.png"),
              ),
              Container(
                padding: EdgeInsets.only(left: 75, right: 75),
                child: GFButton(
                    color: Colors.green,
                    onPressed: () {},
                    child: Text(
                      "In Season",
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    )),
              ),
              Container(
                color: Colors.white,
                child: SizedBox(
                  height: 50,
                  child: ListView.builder(
                      itemCount: 2,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.all(5),
                          margin: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                  color: Colors.greenAccent.shade100)),
                          child: ClipRRect(
                            child: Image.asset("./assets/p1.png"),
                          ),
                        );
                      }),
                ),
              ),

              Container(
                margin: EdgeInsets.only(top: 5),
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        padding: EdgeInsets.only(left: 5),
                        child: Text(
                          "About this product",
                          style: TextStyle(fontSize: 22, color: Colors.grey.shade600),
                        )),
                    ExpnadableText(title:"About the product",decription:dsption),
                    ExpnadableText(title:"Benefits",decription:dsption),
                    ExpnadableText(title:"Storage and uses",decription:dsption),
                    ExpnadableText(title:"Other Product Info",decription:dsption),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(4),
                child: Row(children: [
                  Expanded(
                    child: GFButton(
                      blockButton: true,
                      icon: Icon(Icons.bookmark_border,size: 20,color: Colors.white,),
                      text: "SAVE FOR LATER",
                      color: Colors.black54,
                      onPressed: (){}),
                      
                  ),
                  Expanded(
                    child: GFButton(blockButton: true,
                    icon: Icon(Icons.shopping_basket_outlined,size: 20,color: Colors.white,),
                    text: "ADD TO BASKET",
                    color: Colors.red,
                      onPressed: (){}),
                  ),
                ],),
              ),
              Container(
                padding: EdgeInsets.all(5),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("You may like to view more in"),
                    SizedBox(
                      height: 30,
                      child: ListView.builder(
                        scrollDirection:Axis.horizontal,
                        itemCount: 3,
                        itemBuilder: (context,index){
                        return Container(
                          margin: EdgeInsets.only(right: 2),
                         
                          decoration: BoxDecoration(
                            border: Border.all()
                          ),
                          child: Card(child: Text(opt[index]),),);
                      }),
                    ),
                  ],
                ),
              ),              

            ],
          ),
        ));
  }

  b1() {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(
            "Fresh from farm - Tomato ₹ 20/kg",
            style: TextStyle(fontSize: 22),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
                onPressed: () {
                  setState(() {
                    _myColorOne = Colors.amber;
                    _myColorTwo = Colors.grey;
                    _myColorThree = Colors.grey;
                    _myColorFour = Colors.grey;
                    _myColorFive = Colors.grey;
                  });
                },
                icon: Icon(
                  Icons.star,
                  color: _myColorOne,
                )),
            IconButton(
                onPressed: () {
                  setState(() {
                    _myColorOne = Colors.amber;
                    _myColorTwo = Colors.amber;
                    _myColorThree = Colors.grey;
                    _myColorFour = Colors.grey;
                    _myColorFive = Colors.grey;
                  });
                },
                icon: Icon(
                  Icons.star,
                  color: _myColorTwo,
                )),
            IconButton(
                onPressed: () {
                  setState(() {
                    _myColorOne = Colors.amber;
                    _myColorTwo = Colors.amber;
                    _myColorThree = Colors.amber;
                    _myColorFour = Colors.grey;
                    _myColorFive = Colors.grey;
                  });
                },
                icon: Icon(
                  Icons.star,
                  color: _myColorThree,
                )),
            IconButton(
                onPressed: () {
                  setState(() {
                    _myColorOne = Colors.amber;
                    _myColorTwo = Colors.amber;
                    _myColorThree = Colors.amber;
                    _myColorFour = Colors.amber;
                    _myColorFive = Colors.grey;
                  });
                },
                icon: Icon(
                  Icons.star,
                  color: _myColorFour,
                )),
            IconButton(
                onPressed: () {
                  setState(() {
                    _myColorOne = Colors.amber;
                    _myColorTwo = Colors.amber;
                    _myColorThree = Colors.amber;
                    _myColorFour = Colors.amber;
                    _myColorFive = Colors.amber;
                  });
                },
                icon: Icon(
                  Icons.star,
                  color: _myColorFive,
                )),
          ],
        ),
        ClipRRect(
          child: Image.asset("./assets/p1.png"),
        ),
        Row(
          children: [
            Text("Quantity:"),
            SizedBox(
              width: 50,
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    if (quantity > 1) {
                      setState(() {
                        quantity--;
                      });
                    }
                  },
                  child: Container(
                    width: 20,
                    decoration: BoxDecoration(border: Border.all()),
                    child: Center(child: Text("-")),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Text("$quantity"),
                SizedBox(
                  width: 5,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      quantity++;
                    });
                  },
                  child: Container(
                    width: 20,
                    decoration: BoxDecoration(border: Border.all()),
                    child: Center(child: Text("+")),
                  ),
                ),
              ],
            )
          ],
        ),
        Text("Total:40 ₹"),
        Card(
          color: Colors.grey.shade400,
          child: Center(child: Text("*Delivers in 7 hrs")),
        ),
        Container(
            padding: EdgeInsets.only(left: 5),
            child: Text(
              "About The Product",
              style: TextStyle(fontSize: 22, color: Colors.grey.shade400),
            )),
        Container(
            padding: EdgeInsets.only(left: 5),
            child: Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.")),
        Container(
            padding: EdgeInsets.only(left: 5),
            child: Text(
              "Ratings & Reviews",
              style: TextStyle(fontSize: 22, color: Colors.grey.shade400),
            )),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              padding: EdgeInsets.all(5),
              child: Row(
                children: [
                  Text(
                    "5",
                    style: TextStyle(fontSize: 18),
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                ],
              ),
            ),
            Text("2.6k ratings")
          ],
        ),
        Container(
            height: 50,
            padding: EdgeInsets.all(4),
            margin: EdgeInsets.only(bottom: 10),
            child: GFButton(
              text: "Add",
              color: Colors.red,
              shape: GFButtonShape.standard,
              blockButton: true,
              onPressed: () {},
            )),
      ],
    );
  }
}


class ExpnadableText extends StatefulWidget {
  final String title;
  final String decription;
  const ExpnadableText({ Key? key,  required this.title,required this.decription }) : super(key: key);

  @override
  State<ExpnadableText> createState() => _ExpnadableTextState();
}

class _ExpnadableTextState extends State<ExpnadableText> {
 String firstHalf='';
  String secondHalf='';
  bool flag = true;

  @override
  void initState() {
    super.initState();

    if (widget.decription.length > 80) {
      firstHalf = widget.decription.substring(0, 80);
      secondHalf = widget.decription.substring(80, widget.decription.length);
    } else {
      firstHalf = widget.decription;
      secondHalf = "";
    }
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
                    title: Text(widget.title,style: TextStyle(color: Colors.grey.shade400),),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(flag ? (firstHalf + "... ") : (firstHalf + secondHalf)),
                        InkWell(
                          onTap: () {
                            setState(() {
                              flag=!flag;
                            });
                          },
                          child: Text(
                          flag ? "View more" : "",
                          style: TextStyle(color: Colors.blue),
                      ),
                        ),
                      ],
                    ),

                    trailing: IconButton(onPressed: (){
                      setState(() {
                        flag=!flag;
                      });
                    }, icon:flag? Icon(Icons.add):Icon(Icons.minimize),),
                    
                  ),
    );
  }
}