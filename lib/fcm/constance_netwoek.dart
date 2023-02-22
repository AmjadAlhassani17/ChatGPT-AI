
abstract class ConstantsNetwork {

  static String baseUrl = "https://fcm.googleapis.com/fcm/send";

  static Map<String, dynamic> notificationHeader = {
    'Content-Type': 'application/json',
    'Authorization': 'key=AAAAfbVNOHY:APA91bFEd3xKty6OS9ECSxKQfeCZg1zPxlG5xxLzs6dP0llXGImS6yOWnju_lbRO85peArZMiXhELQ0j7ZBOBG-sCRVnm65ClwQRg1zsQ7Fo_xcmETjIux2O6HVoevWF8sq7F8UadVGZ'
  };

  static var notification = "notification";
  static var body = "body";
  static var title = "title";
  static var topic = "/topics/";
  static var to = "to";
  static var data = "data";
  static var image = "image";
  static var senderAvatar = "avatar";
  static var route = "route";
  static var type = "type";
  static var contentType = "type";

}
