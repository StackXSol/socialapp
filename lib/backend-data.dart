class current_user {
  current_user(
      {required this.name,
      required this.email,
      required this.uid,
      this.phone = "Add Phone!"});
  String name, email, uid;
  String phone;
}
