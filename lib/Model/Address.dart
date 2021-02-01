class Address{
  String streetName;
  String city;
  String state;
  String postCode;

  Address({this.streetName,this.city,this.state,this.postCode});

  String toString(){
    String fullAddress = '';
    if(this.streetName!= null){
      fullAddress += '${this.streetName} ';
    }
    fullAddress = fullAddress + this.city != null ? '${this.city} ': '' + this.state != null ? '${this.state} ': '' + this.postCode != null ? '${this.postCode} ': '';

    return fullAddress;
  }

}