import 'package:realstate/Model/MainData.dart';

import 'Address.dart';

class Owner extends MainData{
  Address address;
  String firstName;
  String middleName;
  String lastName;
  String email;
  String phone;


  Owner({Address address, this.firstName,this.middleName,this.lastName,this.email,this.phone, int Id}):super(id: Id){
    this.address = address == null ? new Address() : address;
  }

}