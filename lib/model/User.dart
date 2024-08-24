class User {
  int? id;
  String firstName;
  String lastName;
  String position;
  String email;
  String image;

  User({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.position,
    required this.email,
    required this.image,
  });
}
