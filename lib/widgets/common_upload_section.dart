import 'dart:io';

import 'package:flutter/material.dart';
import 'package:khandeshi_jodi/resources/sizes.dart';
import 'package:khandeshi_jodi/widgets/text_view.dart';
import 'package:khandeshi_jodi/widgets/upload_box.dart';

class CommonUploadSection extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  final List<File>? imagePaths;
  final bool isPdfUploaded;

  const CommonUploadSection({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    this.imagePaths,
    this.isPdfUploaded = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        TextView(text: title),

        SizedBox(height: DeviceHeight.s10),

        UploadBox(
          title: title,
          icon: icon,
          onTap: onTap,
        ),

        /// IMAGES
        if (imagePaths != null && imagePaths!.isNotEmpty) ...[
          SizedBox(height: DeviceHeight.s10),

          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: imagePaths!.map((path) {
              return Stack(
                children: [

                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.file(
                      path,
                      height: 90,
                      width: 90,
                      fit: BoxFit.cover,
                    ),
                  ),

                  Positioned(
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.check,
                        size: 14,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ],

        /// PDF
        if (isPdfUploaded) ...[
          SizedBox(height: DeviceHeight.s10),

          Container(
            padding: EdgeInsets.all(Sizes.s10),
            decoration: BoxDecoration(
              color: Colors.green.shade50,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.green),
            ),
            child: Row(
              children: [

                const Icon(
                  Icons.check_circle,
                  color: Colors.green,
                ),

                SizedBox(width: DeviceWidth.s10),

                const Expanded(
                  child: TextView(
                    text: "Uploaded Successfully",
                  ),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }
}