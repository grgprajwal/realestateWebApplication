import 'package:realstate/Model/Address.dart';

import 'Model/Owner.dart';
import 'Model/Property.dart';
import 'Model/User.dart';

class TestFile {


//   static List<User> getTestUsers(){
//     List<User> testUsers = [
//       User(Id: 1, firstName: 'Aaron',email: 'aaron@gmail.com',password: '123456', mobile: '26262626', status: 'Active', address1: new Address(streetName: 'thomastown',city: 'thom', state: 'vic' , postCode: '3074')),
//
//       User(Id: 2, firstName: 'Aron',email: 'arron@gmail.com',password: '123456', mobile: '123456798', status: 'Active', address1: new Address(streetName: 'sydney road',city: 'brunswick', state: 'vic' , postCode: '3011')),
//       User(Id: 3, firstName: 'Baron',email: 'baron@gmail.com',password: '123456', mobile: '159573456', status: 'Active', address1: new Address(streetName: 'tottenham',city: 'tottenham', state: 'vic' , postCode: '2589')),
//       User(Id: 4, firstName: 'Maron',email: 'maron@gmail.com',password: '123456', mobile: '46579813', status: 'Inactive', address1: new Address(streetName: 'flinders',city: 'CBD', state: 'vic' , postCode: '3626')),
//
//     ];
//     return testUsers;
// }
  static List<User> getTestUsers(){
    List<User> testUsers = [    ];
    return testUsers;
  }


  static List<User> getTestUsers2(){
    List<User> testUsers2 = [
      User(firstName: 'Takme',email: 'earon@gmail.com', mobile: '26262626', status: 'Agent'),

      User(firstName: 'Lakme',email: 'arron@gmail.com', mobile: '123456798', status: 'Agent'),
      User(firstName: 'Makme',email: 'baron@gmail.com', mobile: '159573456', status: 'Agent'),
      User(firstName: 'Sakme',email: 'maron@gmail.com', mobile: '46579813', status: 'Agent'),
      User(firstName: 'Nidhan',email: 'caron@gmail.com', mobile: '98765431', status: 'Agent'),
      User(firstName: 'Daron',email: 'daron@gmail.com', mobile: '321654987', status: 'Agent'),
      User(firstName: 'Earon',email: 'earon@gmail.com', mobile: '26262626', status: 'Agent'),

      User(firstName: 'faron',email: 'earon@gmail.com', mobile: '26262626', status: 'Agent'),
      User(firstName: 'garon',email: 'earon@gmail.com', mobile: '26262626', status: 'Agent'),
      User(firstName: 'haron',email: 'earon@gmail.com', mobile: '26262626', status: 'Agent'),
      User(firstName: 'jaron',email: 'earon@gmail.com', mobile: '26262626', status: 'Agent'),
      User(firstName: 'karon',email: 'earon@gmail.com', mobile: '26262626', status: 'Agent'),
      User(firstName: 'laron',email: 'earon@gmail.com', mobile: '26262626', status: 'Agent'),
      User(firstName: 'oaron',email: 'earon@gmail.com', mobile: '26262626', status: 'Agent'),


    ];
    return testUsers2;
  }

  static List<Property> getProperty1(){
    List<Property> testProperty = [
      Property(Id: 1, agentId: 1, ownerId: 1, address: new Address(streetName: 'flinders',city: 'CBD', state: 'vic' , postCode: '3626'),description: 'desc 1',price: 1500 ,isFeatured: true),
      Property(Id: 2, agentId: 1, ownerId: 1, address: new Address(streetName: 'thomastown',city: 'North', state: 'vic' , postCode: '3626'),description: 'small house with 2 parking area',price: 700 ,isFeatured: false),
      Property(Id: 3, agentId: 2, ownerId: 2, address: new Address(streetName: 'Smith',city: 'Brunswick', state: 'vic' , postCode: '3626'),description: 'building with 2 bathroom',price: 1200,isFeatured: false ),
      Property(Id: 4, agentId: 3, ownerId: 4, address: new Address(streetName: 'Woolert',city: 'Dandenong', state: 'vic' , postCode: '3626'),description: 'Very good area',price: 2000, isFeatured: true ),

    ];
    return testProperty;
  }

  static List<Owner> getOwners1(){
    List<Owner> testOwner = [
      Owner(Id: 1,firstName: 'Samrak' , middleName: 'Raj' , lastName: 'Bond' ,email: 'samrak26@gmail.com', phone: '025352265',address: new Address(streetName: 'Woolert',city: 'Dandenong', state: 'vic' , postCode: '3626')),
      Owner(Id: 2,firstName: 'Aaron' , middleName: 'M' , lastName: 'Bond' ,email: 'aaron@gmail.com', phone: '362259526',address: new Address(streetName: 'Thomas',city: 'Thomastown', state: 'vic' , postCode: '6525')),

    ];

    return testOwner;
  }

}