class User {
  final String name;
  final String mail;
  final String? password;

  User({required this.name, required this.mail, this.password});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      mail: json['mail'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'mail': mail,
      if (password != null) 'password': password,
    };
  }
} 