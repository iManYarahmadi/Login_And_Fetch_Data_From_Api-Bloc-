class UserModel {
  int? id;
  String? email;

  String? firstName;
  String? lastName;
  String? avatar;

  UserModel({this.id, this.firstName, this.lastName, this.avatar, this.email});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    avatar = json['avatar'];
  }
}
