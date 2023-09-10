class User {
  String? id;
  String? name;
  String? phone;
  String? email;
  String? password;
  String? type;

  User({this.id, this.name, this.phone, this.email, this.password, this.type});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    password = json['password'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['phone'] = phone;
    data['email'] = email;
    data['password'] = password;
    data['type'] = type;
    return data;
  }
}
