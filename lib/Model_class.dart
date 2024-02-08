import 'dart:ffi';

class ModelClass{
  String? image;
  String? name;
  double? price;
  String? qty;


  ModelClass({required this.image,required this.name,required this.price,required this.qty,});
}

List<ModelClass> cartlist=[];
