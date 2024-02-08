import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:invoiceproject/Model_class.dart';
import 'package:invoiceproject/globel.dart';
import 'package:invoiceproject/pdfdemo.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  double subtotal = 0;

  @override
  void initState() {
    // TODO: implement initState
    for (int i = 0; i < cartlist.length; i++) {
      sum1(int.parse(cartlist[i].qty!), cartlist[i].price!);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: 780,
          width: double.infinity,
          color: Colors.pinkAccent.shade100,
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0),
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
                          )),
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Container(
                          height: 692,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              // image: DecorationImage(image: AssetImage(widget.image)),
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(50),
                                  topLeft: Radius.circular(50))),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 20.0,
                                  ),
                                  child: Container(
                                    height: 500,
                                    width: 330,
                                    color: Colors.grey.shade200,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 510.0),
                                  child: Container(
                                    height: 200,
                                    width: 350,
                                    color: Colors.white,
                                    child: Align(
                                      alignment: Alignment.topCenter,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(top: 10.0),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 15.0),
                                                  child: Text('Subtotal'),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 15.0),
                                                  child: Text('$subtotal'.toString()),
                                                ),
                                              ],
                                            ),
                                            Divider(
                                              color: Colors.black,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 15.0),
                                                  child: Text('Delivery'),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 15.0),
                                                  child: Text('3.50'),
                                                ),
                                              ],
                                            ),
                                            Divider(
                                              color: Colors.black,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 15.0),
                                                  child: Text(
                                                    'Total',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 15.0),
                                                  child: Text(Total().toString()),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: InkWell(
                                                onTap: () {
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              PdfDemo(
                                                                cartList:
                                                                    cartlist, data: total,
                                                              ),),);
                                                },
                                                child: Container(
                                                  height: 35,
                                                  width: 300,
                                                  decoration: BoxDecoration(
                                                      color: Colors.black),
                                                  child: Center(
                                                      child: Text(
                                                    'CHECKOUT',
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  )),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 20.0,
                                  ),
                                  child: Column(
                                    children: cartlist
                                        .map(
                                          (e) => Center(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 8.0),
                                              child: Container(
                                                height: 70,
                                                width: 330,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      height: 60,
                                                      width: 100,
                                                      decoration: BoxDecoration(
                                                        color: Colors.pink,
                                                        shape: BoxShape.circle,
                                                        image: DecorationImage(
                                                          image: AssetImage(e
                                                              .image
                                                              .toString()),
                                                        ),
                                                      ),
                                                    ),
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  right: 2.0),
                                                          child: Container(
                                                            height: 20,
                                                            width: 80,
                                                            color: Colors.white,
                                                            child: Align(
                                                                alignment: Alignment
                                                                    .centerLeft,
                                                                child: Text(
                                                                    e.name!)),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  right: 60.0),
                                                          child: Text(e.price!
                                                              .toString()),
                                                        ),
                                                      ],
                                                    ),
                                                    Container(
                                                      height: 50,
                                                      width: 80,
                                                      color: Colors.white,
                                                      child: Column(
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    top: 8.0),
                                                            child: Row(
                                                              children: [
                                                                Container(
                                                                  height: 20,
                                                                  width: 30,
                                                                  decoration: BoxDecoration(
                                                                      color: Colors
                                                                          .black,
                                                                      shape: BoxShape
                                                                          .circle),
                                                                  child: Icon(
                                                                    Icons
                                                                        .remove,
                                                                    color: Colors
                                                                        .white,
                                                                    size: 15,
                                                                  ),
                                                                ),
                                                                Text(e.qty!),
                                                                Container(
                                                                  height: 20,
                                                                  width: 30,
                                                                  decoration: BoxDecoration(
                                                                      color: Colors
                                                                          .black,
                                                                      shape: BoxShape
                                                                          .circle),
                                                                  child: Icon(
                                                                    Icons.add,
                                                                    color: Colors
                                                                        .white,
                                                                    size: 15,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Text(sum1(int.parse(e.qty!), e.price!)
                                                              .toString()),
                                                        ],
                                                      ),
                                                    ),
                                                    IconButton(
                                                        onPressed: () {
                                                          setState(() {
                                                            cartlist.remove(e);
                                                          });
                                                        },
                                                        icon: Icon(Icons.close))
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  var total;
  sum1(int qty, double price) {
    var ans = qty * price;
    subTotal(ans.toInt());
    return ans;
  }
  subTotal(int ans) {
    subtotal = subtotal + ans;
    return subtotal;
  }
  Total(){
   total=subtotal+3.50;
     return total;
  }

// sum2(){
//   for(int i=0;i<;i++){
//     var ans1=sum1();
//     return ans1;
//   }
// }
// sum3(){
//   for(int i=0;i<sum2();i++){
//
//   }
// }
}
