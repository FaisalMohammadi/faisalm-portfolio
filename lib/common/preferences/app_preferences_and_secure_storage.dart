
import 'preferences.dart';

class AppPreferencesAndSecureStorage {


  static void setRememberMeCheckbox(bool rememberMeCheckbox) {
    return Preferences.setBool("remember_me_check_box", rememberMeCheckbox);
  }

  // gets the remember me checkbox value
  static bool? getRememberMeCheckboxValue() {
    return Preferences.getBool("remember_me_check_box");
  }
}