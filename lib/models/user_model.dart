class UserModel {
  UserModel({
    this.name,
    this.phone,
  });

  final String? name;
  final String? phone;


  static UserModel fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json["name"],
      phone: json["phone"],
    );
  }


  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "phone": phone,
    };
  }
}