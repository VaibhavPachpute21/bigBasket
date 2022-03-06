// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:sanjaymart/Screen/DeliveryTracking/TrackingMapPage.dart';
import 'package:sanjaymart/Screen/Product/ProductScreen.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({ Key? key }) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

   int defaultChoiceIndex=8;
List<String> _choicesList = ['rice', 'wheat', 'rice', 'wheat','rice', 'wheat', 'rice', 'wheat','rice', 'wheat', 'rice', 'wheat',];

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
      appBar: AppBar(
        elevation: 0,
        titleSpacing: 5,
        title: Center( child:const Text("Search Product",),),
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
        preferredSize: Size.fromHeight(50)), //IconButton  
      ),
      drawer: Column(
        children:[
        ]
      ),
      body:ListView(
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                Container(
                  padding: EdgeInsets.all(5),
                  child: Text("Popular Searches",style:TextStyle(fontSize: 18,color: Colors.grey.shade600) ,)),
                SizedBox(height: 2,),
                popularChoiceChips()
              ]
            ),
          ),
          Card(elevation: 2,
            child: Container(
              height: 50,
              child:Center(child: Text("Trending Now",style:TextStyle(fontSize: 18,color: Colors.grey.shade600,fontWeight: FontWeight.w700 ) ,)),
            ),
          ),
          Container(
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(10)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            Container(
                padding: EdgeInsets.all(5),
                child: Text("Fresh from farm",style:TextStyle(fontSize: 18,color: Colors.grey.shade600,fontWeight: FontWeight.w500) ,)),
            trendingProducts()
          ],),)
        ],),
    );
  }
popularChoiceChips(){
    return  Container(
      padding:EdgeInsets.only(left: 2,right: 2),
      child: Wrap(
        children: List.generate(_choicesList.length, (index) {
          return Container(
            constraints: BoxConstraints(maxHeight: 30,maxWidth: 85),
            padding: EdgeInsets.only(left: 2,right: 2,),
            margin: EdgeInsets.only(top: 4),
            child: GFButton(
              elevation: 1,
              shape: GFButtonShape.pills,
             // constraints: BoxConstraints(maxHeight: 10,minHeight: 10),
              padding: EdgeInsets.all(0),
              color: Colors.white,
              child: Text(
              _choicesList[index],
              style: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(color: Colors.black, fontSize: 14),
            ),
              onPressed: (){},
              //size: 20,
              icon: Icon(Icons.restore_outlined,color: Colors.black,size: 20,),
            ),
          );
        }),
      ),
    );

}

trendingProducts(){
    return  Container(
      child: Wrap(
        children: List.generate(6, (index) {
          return  InkWell(
                  onTap: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>ProductPage()) );
                  },
                  child: Container(
                    padding: EdgeInsets.all(4),
                    margin: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)
                    ),
                    child: SizedBox(
                      width: 100,
                      child: Column(
                        children: [
                          
                          Image.asset("./assets/p1.png",width: 100,height: 100,),
                          Text("Fresh Tomato ₹ 20/kg",style: TextStyle(fontSize: 12),),
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
              
        }),
      ),
    );

}

}