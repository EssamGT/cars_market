import 'package:image_picker/image_picker.dart';

class UserDetails {
  String name = '';
  // String email = '';
  String phoneNumber = '';
  XFile? profileImage;
  set profilePic(XFile image) {
    profileImage = image;
  }

  UserDetails();
}
