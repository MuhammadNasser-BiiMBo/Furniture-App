class AddressModel {
  String? fullName;
  String? address;
  String? postalCode;
  String? country;
  String? city;
  String? district;
  AddressModel({
    this.address,
    this.fullName,
    this.country,
    this.district,
    this.city,
    this.postalCode,
  });
  AddressModel.fromJson(Map<String,dynamic> json){
    address = json['address'];
    fullName = json['fullName'];
    country = json['country'];
    district = json['district'];
    city = json['city'];
    postalCode = json['postalCode'];
  }
  Map<String,dynamic> toJson(){
    return{
      'address':address,
      'fullName':fullName,
      'country':country,
      'district':district,
      'city':city,
      'postalCode':postalCode,
    };
  }
}
