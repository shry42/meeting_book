class AppController {
  static String? _accessToken;
  static String? _message;
  static int? _meetingId;
  static int? _participantId;
  static int? _mainUid;
  static String? _role;
  static String? _userName;
  static String? _email;
  static String? _mobile;

  static get mobile => _mobile;
  static setMobile(value) {
    _mobile = value;
  }

  static get userName => _userName;
  static setUserName(value) {
    _userName = value;
  }

  static get email => _email;
  static setEmail(value) {
    _email = value;
  }

  // static String? _noOfUsers;
  // static String? _noOfRooms;
  // static int? _noOfMeetings;

  // static get noOfUsers => _noOfUsers;
  // static setNoOfUsers(value) {
  //   _noOfUsers = value;
  // }

  // static get noOfRooms => _noOfRooms;
  // static setNoOfRooms(value) {
  //   _noOfRooms = value;
  // }

  // static get noOfMeetings => _noOfMeetings;
  // static setNoOfMeetings(value) {
  //   _noOfMeetings = value;
  // }

  static get role => _role;
  static setRole(value) {
    _role = value;
  }

  //For meeting Participants list
  static get meetingId => _meetingId;
  static setmeetingId(value) {
    _meetingId = value;
  }

  //for participant id
  static get participantId => _participantId;
  static setParticipantId(value) {
    _participantId = value;
  }

  //For mainUid

  static get mainUid => _mainUid;
  static setMainUid(value) {
    _mainUid = value;
  }

  static get accessToken => _accessToken;
  static setaccessToken(value) {
    _accessToken = value;
  }

  static get message => _message;
  static setmessage(value) {
    _message = value;
  }
}
