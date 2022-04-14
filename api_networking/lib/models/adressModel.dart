class AddressModel {
  String street, city, suite;

  AddressModel({this.street = "", this.city = "", this.suite = ""});

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      street: json['street'],
      city: json['city'],
      suite: json['suite'],
    );
  }
}
