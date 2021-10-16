class User {
  String name = '';
  String email = '';
  String password = '';

  User({required this.name, required this.email, required this.password});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'], 
      email: json['email'],
      password: json['title'],
      );
  }
  
}