import 'package:flutter_fliplearn/Model/BaseRequest.dart';

class LoginRequest extends BaseRequest {
  LoginData login = new LoginData();
}

class LoginData {
  String loginId;

  String uuid;

  String mobileNumber;

  String token;

  String password;

  String macAddress;

  String imeiNumber;

  String deviceName;

  String platform;

  String osName;

  String osVersion;

  String buildVersion;

  String deviceCode;
}
