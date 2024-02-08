import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:invoiceproject/Model_class.dart';

import 'cartscreen.dart';
import 'globel.dart';

class ViewScreen extends StatefulWidget {
  final String image;
  final Color colors;
  final String name;
  final double price;
  final String about;
  final String desc;

  const ViewScreen({Key? key, required this.image, required this.colors, required this.name, required this.price, required this.about, required this.desc})
      : super(key: key);

  @override
  State<ViewScreen> createState() => _ViewScreenState();
}

class _ViewScreenState extends State<ViewScreen> {

  int sum=1;
  double? GST;
  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;

    return Scaffold(
      // appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          height: 780,
          width: double.infinity,
          decoration: BoxDecoration(
            color: widget.colors,
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(
                            CupertinoIcons.back,
                            size: 35,
                          ))
                    ],
                  ),

                  CircleAvatar(backgroundImage: AssetImage(widget.image),radius: 90,),

                  Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: Container(
                      height: 452,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50))),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(widget.name,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                                    Text(widget.price.toString(),style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 30.0),
                                  child: Row(
                                    children: [
                                      Text('1 each * 12 nos.',style: TextStyle(fontSize: 20,color: Colors.grey.shade400),),
                                      SizedBox(width: 20,),
                                      Container(
                                        height: 50,
                                        width: 150,
                                        decoration: BoxDecoration(color: widget.colors,borderRadius: BorderRadius.circular(15)),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                           InkWell(
                                               onTap: (){
                                                 setState(() {
                                                   if(sum>1){
                                                     sum--;
                                                   }
                                                 });
                                               },
                                               child: Icon(Icons.remove)),
                                            Text('$sum',style: TextStyle(fontSize: 15),),
                                            InkWell(
                                                onTap: (){
                                                  setState(() {
                                                    sum++;
                                                  });
                                                },
                                                child: Icon(Icons.add)),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                // Padding(
                                //   padding: const EdgeInsets.all(20.0),
                                //   child: Container(
                                //     height: 50,
                                //     width: 200,
                                //     decoration:BoxDecoration(color: Colors.red),
                                //   ),
                                // ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 40.0),
                                  child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(widget.about,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                                ),
                                SizedBox(height: 20,),
                                Text(widget.desc,style: TextStyle(fontSize: 15),),
                                SizedBox(height: 10,),
                                Container(

                                  height: 50,
                                  width: 350,
                                  decoration: BoxDecoration(color: widget.colors,borderRadius: BorderRadius.circular(15)),
                                  child: Center(child: InkWell(
                                      onTap: (){
                                        setState(() {
                                          cartlist.add(ModelClass(image: widget.image, name: widget.name, price: widget.price, qty: '$sum',));
                                          print(cartlist.length);
                                        });
                                        Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>CartScreen(),));

                                      },
                                      child: Text('Add Cart',style: TextStyle(fontSize: 15,),))),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
