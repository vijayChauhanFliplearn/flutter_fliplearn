class BaseRequest {
  Error error;
  Warning warning;
}

class Warning {
  String type;
  String title;
  String message;
  String link;
  String primaryButton;
  bool isCancelable;
}
