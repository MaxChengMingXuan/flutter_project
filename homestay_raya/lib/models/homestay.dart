class Homestay {
  String? homestayId;
  String? userId;
  String? homestayName;
  String? homestayDesc;
  String? homestayPrice;
  String? homestayPark;
  String? homestayPax;
  String? homestayState;
  String? homestayLocal;
  String? homestayLat;
  String? homestayDate;

  Homestay(
      {this.homestayId,
      this.userId,
      this.homestayName,
      this.homestayDesc,
      this.homestayPrice,
      this.homestayPark,
      this.homestayPax,
      this.homestayState,
      this.homestayLocal,
      this.homestayLat,
      this.homestayDate});

  Homestay.fromJson(Map<String, dynamic> json) {
    homestayId = json['homestay_id'];
    userId = json['user_id'];
    homestayName = json['homestay_name'];
    homestayDesc = json['homestay_desc'];
    homestayPrice = json['homestay_price'];
    homestayPark = json['homestay_park'];
    homestayPax = json['homestay_pax'];
    homestayState = json['homestay_state'];
    homestayLocal = json['homestay_local'];
    homestayLat = json['homestay_lat'];
    homestayDate = json['homestay_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['homestay_id'] = homestayId;
    data['user_id'] = userId;
    data['homestay_name'] = homestayName;
    data['homestay_desc'] = homestayDesc;
    data['homestay_price'] = homestayPrice;
    data['homestay_park'] = homestayPark;
    data['homestay_pax'] = homestayPax;
    data['homestay_state'] = homestayState;
    data['homestay_local'] = homestayLocal;
    data['homestay_lat'] = homestayLat;
    data['product_date'] = homestayDate;
    return data;
  }
}
