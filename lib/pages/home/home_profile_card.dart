import 'package:flutter/material.dart';
import 'package:khandeshi_jodi/pages/home/card_button.dart';
import 'package:khandeshi_jodi/resources/colors.dart';
import 'package:khandeshi_jodi/resources/sizes.dart';
import 'package:shared_enums/widgets/text_view.dart';

class HomeProfileCard extends StatelessWidget {

  final Map<String, dynamic> data;

  const HomeProfileCard({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {

    final String image =
        data['profileImage'] ?? '';

    return Container(
      padding: EdgeInsets.all(Sizes.s10),

      decoration: BoxDecoration(
        border: Border.all(
          color: CColors.borderGrey,
        ),

        borderRadius: BorderRadius.circular(
          DeviceRadius.s15,
        ),
      ),

      child: Row(
        crossAxisAlignment:
            CrossAxisAlignment.start,

        children: [

          ClipRRect(
            borderRadius: BorderRadius.circular(
              DeviceRadius.s15,
            ),

            child: image.isNotEmpty

                ? Image.network(
                    image,
                    height: DeviceHeight.s160,
                    width: DeviceWidth.s120,
                    fit: BoxFit.cover,
                  )

                : Container(
                    height: DeviceHeight.s160,
                    width: DeviceWidth.s120,
                    color: Colors.grey.shade300,

                    child: const Icon(
                      Icons.person,
                    ),
                  ),
          ),

          SizedBox(width: DeviceWidth.s10),

          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,

              children: [

                TextView(
                  text: data['name'] ?? '',
                  fontSize: Sizes.s20,
                  fontWeight:
                      FontWeight.bold,
                ),

                SizedBox(
                  height: DeviceHeight.s4,
                ),

                TextView(
                  text:'${data['age'] ?? ''} वर्षे',
                  fontSize: Sizes.s16,
                ),

                SizedBox(
                  height: DeviceHeight.s4,
                ),

                Row(
                  children: [

                    Icon(
                      Icons.location_on,
                      size: Sizes.s18,
                    ),

                    SizedBox(
                      width: DeviceWidth.s3,
                    ),

                    Expanded(
                      child: TextView(
                        text: data['city'] ?? '',
                        fontSize:
                            Sizes.s16,
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: DeviceHeight.s4,
                ),

                TextView(
                  text: 'शिक्षण: ${data['education'] ?? ''}',
                  fontSize: Sizes.s16,
                ),

                SizedBox(
                  height: DeviceHeight.s12,
                ),

                Row(
                  children: [

                    CardButton(
                      icon: Icons.remove_red_eye,
                      text: 'Profile',
                      onTap: () {},
                    ),

                    SizedBox(
                      width: DeviceWidth.s6,
                    ),

                    CardButton(
                      icon:Icons.favorite,
                      text: 'Interest',
                      bgColor: Colors.red,
                      onTap: () {},
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}