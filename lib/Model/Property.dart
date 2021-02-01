import 'package:realstate/Model/Images.dart';
import 'package:realstate/Model/MainData.dart';

import 'Address.dart';

class Property extends MainData{

  int agentId;
  int ownerId;
  Address address;
  String type;
  String description;
  int bedroom;
  int garage;
  int bathroom;
  String createdAt;
  bool isPublished;
  String availableFrom;
  String availableTo;
  double price;
  String status;
  int viewsCount;
  bool isFeatured;
  List<Images> images;

  Property({int Id,this.agentId,this.ownerId,Address address,this.type,this.bedroom,this.bathroom,this.garage , this.description,this.createdAt,this.isPublished,this.availableFrom,this.availableTo,this.price,this.status,this.images,this.isFeatured,this.viewsCount}) : super(id: Id){
    this.address = address == null ? new Address(): address ;

  }

}