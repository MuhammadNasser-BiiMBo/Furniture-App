class NotificationSettingsModel {
  bool? sales;
  bool? newArrivals;
  NotificationSettingsModel(
    this.newArrivals,
    this.sales,
  );

  NotificationSettingsModel.fromJson(Map<String,dynamic> json){
    sales = json['sales'];
    newArrivals = json['newArrivals'];
  }
  Map<String,dynamic> toJson(){
    return{
      'sales':sales,
      'newArrivals':newArrivals,
    };
  }
}
