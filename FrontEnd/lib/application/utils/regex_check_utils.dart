class RegexCheckUtils {
  const RegexCheckUtils._();
  static final RegExp passwordRegex = RegExp(
      r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[\.!@#\$&*~]).{8,20}$");
  static final RegExp usernameRegex = RegExp(r'^[a-zA-Z0-9_\.]{3,20}$');
  static final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  static final RegExp phoneRegex = RegExp(r'^\+?[0-9]{8,15}$');
}
