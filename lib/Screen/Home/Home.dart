// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:sanjaymart/Screen/DeliveryTracking/TrackingMapPage.dart';
import 'package:sanjaymart/Screen/Product/ProductScreen.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

final serchBar=TextFormField(
        cursorColor: Colors.black,
        autofocus: false,
        controller: TextEditingController(),
        keyboardType: TextInputType.text,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Please Enter something");
          }
          return null;
        },
        onSaved: (value) {
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          fillColor: Colors.white,
          focusColor: Colors.white,
          prefixIcon: Icon(Icons.search),
          suffixIcon: Icon(Icons.mic),
          contentPadding: EdgeInsets.fromLTRB(20, 5, 20, 5),
          hintText: "Search 1000+ products",
          border: OutlineInputBorder( 
          ),
        ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.map_outlined),
        onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>LiveTrackingPage()) );
      },),
      backgroundColor: Colors.grey.shade400,
      appBar: AppBar(
        elevation: 0,
        titleSpacing: 5,
        title: Center(
          child:const Text("Sanjay Mart"),
        ),
        bottom:PreferredSize(child:Container(
          padding: EdgeInsets.all(5),
          color: Colors.green,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
            margin: EdgeInsets.only(top: 5,bottom: 5),
            
            child: serchBar)),
        preferredSize: Size.fromHeight(50)),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.account_circle, color: Colors.greenAccent, size: 30,),
            tooltip: 'Account',
            onPressed: () {

            },
          ), //IconButton
         
        ],
      ),
      drawer: Column(
        children:[
            
        ]
      ),
      body: ListView(
        children: [
         Padding(padding: EdgeInsets.only(top: 5,left: 2,right: 2),
         child: Card(
           // ignore: prefer_const_literals_to_create_immutables
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceAround,
             children: [
             Image.asset('./assets/qw.png'),
             Text("*Big Savings"),
             Image.asset('./assets/qw.png'),
           ],),
         ),
         ),

         Padding(padding: EdgeInsets.only(top: 5,left: 5,right: 5,bottom: 5),
         child: SizedBox(
           child: ClipRRect(borderRadius: BorderRadius.circular(4),
             child: Image.asset("./assets/sldr1.png")),
         ),
         ),

        Container(
          margin: EdgeInsets.only(left: 3,right:3),
          padding: EdgeInsets.all(4),
         decoration:BoxDecoration(
           borderRadius: BorderRadius.circular(10),
           color: Colors.grey.shade300,
         ),
          child: Column(
            crossAxisAlignment:CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(5),
                child: Text("Fresh from farm")),
              SizedBox(
                height: 200,
                child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context,index){
                return InkWell(
                  onTap: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>ProductPage()) );
                  },
                  child: Card(
                    child: SizedBox(
                      width: 120,
                      child: Column(
                        children: [
                          
                          Image.asset("./assets/p1.png",width: 100,height: 100,),
                          Text("Fresh Tomato ₹ 20/kg"),
                          GFButton(onPressed: (){
                             Navigator.push(context,MaterialPageRoute(builder: (context)=>ProductPage()) );
                          },
                          color: Colors.red,
                          text: "Add",
                          )
                        ],
                      ),
                    ),
                  ),
                );
              
              })
               ),
            ],
          ),
        )


        ],
      ),
    );
  }
}