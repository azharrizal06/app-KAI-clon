var BAseUrl = 'http://192.168.20.74:8000/api/';

class Domain {
  static String login = '${BAseUrl}login';
  static String register = '${BAseUrl}register';
  static String forgotPassword = '${BAseUrl}forgot-password';
  static String resetPassword = '${BAseUrl}reset-password';
  static String verifyOtp = '${BAseUrl}verify-otp';
  static String getUserProfile = BAseUrl + 'user-profile';
  static String updateUserProfile = '${BAseUrl}update-profile';
}
