class UserModel {
  late String uid;
  late String fullName;
  late String email;
  late String? img;

  UserModel({
    required this.uid,
    required this.fullName,
    required this.email,
    this.img,
  });

  UserModel.fromMap(Map map) {
    uid = map['uid'];
    fullName = map['fullName'];
    email = map['email'];
    img = map['img'];
  }

  Map toJson() => {
        'uid': uid,
        'fullName': fullName,
        'email': email,
      };
  // UserModel.toMap(Map map) {
  //   uid = map['uid'];
  //   fname = map['fname'];
  //   lname = map['lname'];
  //   email = map['email'];
  //   occupation = map['occupation'];
  //   status = map['status'];
  //   goal = map['goal'];
  // }
}
