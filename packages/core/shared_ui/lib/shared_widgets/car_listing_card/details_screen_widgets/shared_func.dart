import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

String priceFormater(int price) {
  if (price == 0) {
    return '';
  }
  final formatter = NumberFormat('#,###');
  String formattedPrice = formatter.format(price);
  return formattedPrice;
}

String mileageFormater(int mileage) {
  if (mileage == 0) {
    return '';
  }
  final formatter = NumberFormat('#,###');
  String formattedMileage = formatter.format(mileage);
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
