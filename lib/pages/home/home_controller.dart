import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:khandeshi_jodi/navigation/routes.dart';
import 'package:khandeshi_jodi/resources/base_model.dart';
import 'package:khandeshi_jodi/services/home_servies.dart';
import 'package:khandeshi_jodi/services/login_services.dart';

class HomeController extends BaseModel {

  Stream<QuerySnapshot<Map<String, dynamic>>>
      getProfiles() {

    return HomeServices().getProfiles();
  }

  void searchProfiles(String value) {}

  Future<void> logout(BuildContext context) async {

    await LoginServices().logout();

    Navigator.pushNamedAndRemoveUntil(
      context,Routes.login,(route) => false,
    );
  }
}