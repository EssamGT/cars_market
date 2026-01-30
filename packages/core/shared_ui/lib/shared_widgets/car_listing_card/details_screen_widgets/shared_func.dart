import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

String priceFormater(String price) {
  final formatter = NumberFormat('#,###');
  String formattedPrice = formatter.format(int.parse(price));
  return formattedPrice;
}

String mileageFormater(String mileage) {
  final formatter = NumberFormat('#,###');
  String formattedMileage = formatter.format(int.parse(mileage));
  return formattedMileage;
}

Future<void> dialPhone(String phoneNumber) async {
  final Uri uri = Uri(scheme: 'tel', path: phoneNumber);

  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    // throw 'Could not launch $uri';
  }
}

Future<void> dialSms(String phoneNumber) async {
  final Uri uri = Uri(scheme: 'sms', path: phoneNumber);

  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    // throw 'Could not launch $uri';
  }
}

Future<void> whatsapp(String phoneNumber) async {
  final Uri uri = Uri.parse("https://wa.me/$phoneNumber");
  await launchUrl(uri, mode: LaunchMode.externalApplication);
}
