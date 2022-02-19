class UserF {
  final String uid;

  UserF(
    this.uid,
  );
}

class UserDataF {
  final String uid;
  final String fullName;
  final String address;
  final int age;

  UserDataF({
    required this.uid,
    required this.fullName,
    required this.address,
    required this.age,
  });
}
