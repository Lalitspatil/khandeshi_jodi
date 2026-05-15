import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';

class ProfileServices {

  /// CLOUDINARY
  final String cloudName = "drujddjqq";
  final String uploadPreset = "khandeshi_shadi";

  /// FIREBASE
  final FirebaseFirestore _firestore =
      FirebaseFirestore.instance;

  final FirebaseAuth _auth =
      FirebaseAuth.instance;

  /// IMAGE PICKER
  final ImagePicker _picker = ImagePicker();

  /// PICK MULTIPLE IMAGES
  Future<List<File>> pickImages() async {

    final List<XFile> images =
        await _picker.pickMultiImage();

    if (images.isNotEmpty) {
      return images.map((e) => File(e.path)).toList();
    }

    return [];
  }

  /// PICK BIODATA
  Future<File?> pickBiodata() async {

    FilePickerResult? result =
        await FilePicker.pickFiles(
      type: FileType.custom,
      allowedExtensions: [
        'pdf',
        'jpg',
        'jpeg',
        'png',
      ],
    );

    if (result != null &&
        result.files.single.path != null) {

      return File(result.files.single.path!);
    }

    return null;
  }

  /// UPLOAD SINGLE FILE TO CLOUDINARY
  Future<String?> uploadFile(File file) async {

    try {

      final mimeType =
          lookupMimeType(file.path)?.split('/');

      FormData formData = FormData.fromMap({

        "file": await MultipartFile.fromFile(
          file.path,
          contentType: MediaType(
            mimeType![0],
            mimeType[1],
          ),
        ),

        "upload_preset": uploadPreset,
      });

      final response = await Dio().post(
        "https://api.cloudinary.com/v1_1/$cloudName/auto/upload",
        data: formData,
      );

      return response.data["secure_url"];

    } catch (e) {

      print("UPLOAD ERROR: $e");

      return null;
    }
  }

  /// SAVE PROFILE
  Future<void> saveProfile({

    required String name,
    required String gender,
    required String age,
    required String city,
    required String education,
    required String occupation,
    required String caste,
    required String about,

    required List<File> images,
    required File? biodata,

  }) async {

    final user = _auth.currentUser;

    if (user == null) return;

    /// IMAGE URLS
    List<String> imageUrls = [];

    for (File image in images) {

      String? url =
          await uploadFile(image);

      if (url != null) {
        imageUrls.add(url);
      }
    }

    /// BIODATA URL
    String? biodataUrl;

    if (biodata != null) {

      biodataUrl =
          await uploadFile(biodata);
    }

    /// SAVE FIRESTORE
    await _firestore
        .collection("profiles")
        .doc(user.uid)
        .set({

      "uid": user.uid,
      "phone": user.phoneNumber,
      "email": user.email,

      "name": name,
      "gender": gender,
      "age": age,
      "city": city,
      "education": education,
      "occupation": occupation,
      "caste": caste,
      "about": about,

      "images": imageUrls,
      "biodata": biodataUrl,

      "createdAt":
          FieldValue.serverTimestamp(),

    });
  }
}