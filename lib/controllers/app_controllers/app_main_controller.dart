class AppController {
  static String? _accessToken;
  static String? _message;

  static get accessToken => _accessToken;
  static setaccessToken(value) {
    _accessToken = value;
  }

  static get message => _message;
  static setmessage(value) {
    _message = value;
  }
}
