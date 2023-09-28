class User {
  final String id;
  final String name;
  final String avatar;

  const User({
    required this.id,
    required this.name,
    required this.avatar,
  });

  static const empty = User(id: '', name: '', avatar: '');

  User copyWith({
    String? id,
    String? name,
    String? avatar,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      avatar: avatar ?? this.avatar,
    );
  }
}
