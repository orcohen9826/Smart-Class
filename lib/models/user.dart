class User {
  final String name;

  User(this.name);

  Map<String, dynamic> toMap() {
    Map<String, dynamic> info = {
      "name": name,
    };
    return info;
  }
}
