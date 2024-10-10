class User {
  final int id;
  final String username;
  final String email;
  final String? lastname;
  final String? gender;
  final String? image;


  User({
    required this.id,
    required this.username,
    required this.email,
    this.lastname,
    this.gender,
    this.image

  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      lastname: json["lastName"],
      gender: json["gender"],
      image: json["image"],

    );
  }
}
