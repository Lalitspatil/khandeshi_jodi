import 'package:flutter/material.dart';
import 'package:khandeshi_jodi/navigation/base_scaffold.dart';
import 'package:khandeshi_jodi/pages/profile/make_profile_controller.dart';
import 'package:khandeshi_jodi/resources/colors.dart';
import 'package:khandeshi_jodi/resources/sizes.dart';
import 'package:khandeshi_jodi/widgets/app_bar.dart';
import 'package:khandeshi_jodi/widgets/common_form_field.dart';
import 'package:khandeshi_jodi/widgets/common_gender_tile.dart';
import 'package:khandeshi_jodi/widgets/common_upload_section.dart';
import 'package:khandeshi_jodi/widgets/text_button.dart';
import 'package:khandeshi_jodi/widgets/text_view.dart';
import 'package:provider/provider.dart';

class MakeProfileView extends StatelessWidget {
  const MakeProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MakeProfileController>(
      builder: (_, vm, __) {
        return BaseScaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(Sizes.s50),
            child: CommanAppBar(
              text: vm.getValue('tittle'),
              color: CColors.themeBg,
            ),
          ),

          body: Form(
            key: vm.formKey,
            child: SingleChildScrollView(
              padding: EdgeInsets.all(Sizes.s15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  /// NAME
                  CommonFormField(
                    text: vm.getValue('name'),
                    hintText: vm.getValue('enter_name'),
                    controller: vm.nameController,
                  ),

                  SizedBox(height: DeviceHeight.s20),

                  /// GENDER
                  TextView(text: vm.getValue('gender')),
                  SizedBox(height: DeviceHeight.s10),

                  Row(
                    children: [

                      CommonGenderTile(
                        value: "Male",
                        title: vm.getValue('male'),
                        groupValue: vm.gender,
                        onChanged: (value) {
                          vm.setGender(value);
                        },
                      ),

                      SizedBox(width: DeviceWidth.s10),

                      CommonGenderTile(
                        value: "Female",
                        title: vm.getValue('female'),
                        groupValue: vm.gender,
                        onChanged: (value) {
                          vm.setGender(value);
                        },
                      ),
                    ],
                  ),

                  SizedBox(height: DeviceHeight.s20),

                  /// AGE & CITY
                  Row(
                    children: [

                      Expanded(
                        child: CommonFormField(
                          text: vm.getValue('age'),
                          hintText: vm.getValue('enter_age'),
                          controller: vm.ageController,
                          keyboardType: TextInputType.number,
                        ),
                      ),

                      SizedBox(width: DeviceWidth.s10),

                      Expanded(
                        child: CommonFormField(
                          text: vm.getValue('city'),
                          hintText: vm.getValue('enter_city'),
                          controller: vm.cityController,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: DeviceHeight.s20),

                  /// EDUCATION
                  CommonFormField(
                    text: vm.getValue('education'),
                    hintText: vm.getValue('enter_education'),
                    controller: vm.educationController,
                  ),

                  SizedBox(height: DeviceHeight.s20),

                  /// OCCUPATION
                  CommonFormField(
                    text: vm.getValue('occupation'),
                    hintText: vm.getValue('enter_occupation'),
                    controller: vm.occupationController,
                  ),

                  SizedBox(height: DeviceHeight.s20),

                  /// CASTE
                  CommonFormField(
                    text: vm.getValue('caste'),
                    hintText: vm.getValue('enter_caste'),
                    controller: vm.casteController,
                  ),

                  SizedBox(height: DeviceHeight.s20),

                  /// ABOUT
                  CommonFormField(
                    text: vm.getValue('about_you'),
                    hintText: vm.getValue('enter_about_you'),
                    controller: vm.aboutController,
                    maxLines: 4,
                  ),

                  SizedBox(height: DeviceHeight.s30),

                  /// PHOTO UPLOAD
                  CommonUploadSection(
                    title: vm.getValue('upload_photos'),
                    icon: Icons.photo_library_outlined,
                    onTap: () => vm.pickImages(),
                    imagePaths: vm.profilePhotos,
                  ),

                  SizedBox(height: DeviceHeight.s20),

                  /// BIODATA UPLOAD
                  CommonUploadSection(
                    title: vm.getValue('upload_biodata'),
                    icon: Icons.picture_as_pdf_outlined,
                    onTap: () => vm.pickBiodata(),
                    isPdfUploaded: vm.biodataFile != null,
                  ),

                  SizedBox(height: DeviceHeight.s30),

                  /// SAVE BUTTON
                  SizedBox(
                    width: double.infinity,
                    height: DeviceHeight.s50,
                    child: AppButton(
                  
                      text: vm.isLoading
                          ? "Saving..."
                          : vm.getValue('save'),
                  
                      onPressed: vm.isLoading
                          ? null
                          : () {
                              vm.saveProfile(context);
                            },
                    ),
                  ),

                  SizedBox(height: DeviceHeight.s20),

                ],
              ),
            ),
          ),
        );
      },
    );
  }
}