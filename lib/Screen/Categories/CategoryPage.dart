// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:sanjaymart/Screen/DeliveryTracking/TrackingMapPage.dart';
import 'package:sanjaymart/Screen/Product/ProductScreen.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({ Key? key }) : super(key: key);

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {

List categories=["Fruits & Vegetables","Foodgrains, Oil & Masala","Bakery, Cakes & Dairy","Beverages","Snaks & Branded Foods","Beauty & Hygiene","Cleaning & Household","Kitchen, Garden & Pets","Eggs, Meat & Fish","Gourmet & World Food","Baby Care"];


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
        title: Center(
          child:const Text("Shop by Category",),
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
        preferredSize: Size.fromHeight(50)), //IconButton
         
        
      ),
      drawer: Column(
        children:[
            
        ]
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context,index){
        return Column(
          children: [
            ExpansionTile(
              leading: Icon(Icons.brunch_dining ),
              title: Text(categories[index].toString()),
              trailing: Icon(Icons.arrow_drop_down_circle_outlined),
              children: [
                SizedBox(
                  height: 200,
                  child: ListView.builder(itemCount:3,
                    itemBuilder: (context,index){
                    return Padding(
                      padding: const EdgeInsets.only(left:12.0),
                      child: ListTile(
                        leading: Icon(Icons.brunch_dining),
                        title: Text(categories[index].toString()),
                        
                      ),
                    );
                  }),
                )
              ],
            ),
            Divider(indent: 20,endIndent: 20,thickness: 2,)
          ],
        );
      }),
    );
  }
}