class User {
  String name = '';
  String email = '';
  String userId = '';

  User({required this.name, required this.email, required this.userId});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'], 
      email: json['email'],
      userId: json['userId'],
      );
  }

  Map<String, dynamic> toJson() {
        return {
          "name": this.name,
          "email": this.email,
          "userId":this.userId
        };
      }
  
}