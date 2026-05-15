import 'dart:io';

import 'package:flutter/material.dart';
import 'package:khandeshi_jodi/navigation/routes.dart';
import 'package:khandeshi_jodi/resources/base_model.dart';
import 'package:khandeshi_jodi/services/profile_services.dart';

class MakeProfileController extends BaseModel {

  final formKey = GlobalKey<FormState>();

  /// SERVICES
  final ProfileServices _services =
      ProfileServices();

  /// TEXT CONTROLLERS
  TextEditingController nameController =
      TextEditingController();

  TextEditingController ageController =
      TextEditingController();

  TextEditingController cityController =
      TextEditingController();

  TextEditingController educationController =
      TextEditingController();

  TextEditingController occupationController =
      TextEditingController();

  TextEditingController casteController =
      TextEditingController();

  TextEditingController aboutController =
      TextEditingController();

  /// GENDER
  String gender = "Male";
  

  void setGender(String value) {
    gender = value;
    notifyListeners();
  }

  /// LOADING
  bool isLoading = false;

  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  /// IMAGES
  List<File> profilePhotos = [];

  Future<void> pickImages() async {

    profilePhotos =
        await _services.pickImages();

    notifyListeners();
  }

  /// BIODATA
  File? biodataFile;

  Future<void> pickBiodata() async {

    biodataFile =
        await _services.pickBiodata();

    notifyListeners();
  }

  /// SAVE PROFILE
  Future<void> saveProfile(
      BuildContext context) async {

    try {

      setLoading(true);

      await _services.saveProfile(

        name: nameController.text.trim(),
        gender: gender,
        age: ageController.text.trim(),
        city: cityController.text.trim(),
        education:
            educationController.text.trim(),
        occupation:
            occupationController.text.trim(),
        caste: casteController.text.trim(),
        about: aboutController.text.trim(),

        images: profilePhotos,
        biodata: biodataFile,
      );

      setLoading(false);

      ScaffoldMessenger.of(context)
          .showSnackBar(

        const SnackBar(
          content:
              Text("Profile Saved"),
        ),
        
      );
      Navigator.pushNamedAndRemoveUntil(
        context,
        Routes.home,
        (route) => false,
      );

    } catch (e) {

      setLoading(false);

      ScaffoldMessenger.of(context)
          .showSnackBar(

        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
  }

  @override
  void dispose() {

    nameController.dispose();
    ageController.dispose();
    cityController.dispose();
    educationController.dispose();
    occupationController.dispose();
    casteController.dispose();
    aboutController.dispose();

    super.dispose();
  }
}