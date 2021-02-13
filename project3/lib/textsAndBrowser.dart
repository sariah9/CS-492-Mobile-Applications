import 'package:url_launcher/url_launcher.dart';

class TextsAndBrowser {
  void call(String number) => launch('tel:$number');
  void sendSms(String number) => launch('sms:$number');
  void sendEmail(String email) => launch('mailto:$email');
  void launchURL(String url) => launch('https:$url');
}