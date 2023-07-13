class Users {
  final String? uid;
  Users({this.uid});
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
    };
  }
}
