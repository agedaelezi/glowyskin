class User {
  final String id;
  final String email;
  final String name;
  List<String> favorites;
  
  User({
    required this.id,
    required this.email,
    required this.name,
    this.favorites = const [],
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'favorites': favorites,
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      name: json['name'],
      favorites: List<String>.from(json['favorites'] ?? []),
    );
  }
} 