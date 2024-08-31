class UserModel {
  UserModel({
    this.image,
    this.name,
    this.phone,
  });

  final String? image;
  final String? name;
  final String? phone;


  static UserModel fromJson(Map<String, dynamic> json) {
    return UserModel(
      image: json["image"],
      name: json["name"],
      phone: json["phone"],
    );
  }


  Map<String, dynamic> toJson() {
    return {
      "image": image,
      "name": name,
      "phone": phone,
    };
  }
}