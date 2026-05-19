import 'package:flutter/material.dart';
import 'package:khandeshi_jodi/pages/home/home_controller.dart';
import 'package:khandeshi_jodi/pages/home/home_profile_card.dart';
import 'package:khandeshi_jodi/resources/colors.dart';
import 'package:khandeshi_jodi/resources/sizes.dart';
import 'package:khandeshi_jodi/widgets/app_bar.dart';
import 'package:khandeshi_jodi/widgets/comman_search_bar.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeController>(
      builder: (_, vm, __) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(Sizes.s50),
            child: CommanAppBar(
              text: vm.getValue('tittle'),
              color: CColors.themeBg,
              isLogoutIconShow: true,
              onLogout:() => vm.logout(context),
            ),
          ),

          body: Padding(
            padding: EdgeInsets.all(Sizes.s12),
            child: Column(
              children: [

                CommanSearchBar(
                  hintText: 'गाव, वय, शिक्षण शोधा...',
                  onChanged: (value) {
                    vm.searchProfiles(value);
                  },
                ),

                SizedBox(height: DeviceHeight.s10),

                Expanded(
                  child: StreamBuilder(
                    stream: vm.getProfiles(),
                    builder: (context, snapshot) {

                     return snapshot.connectionState == ConnectionState.waiting

                      ? const Center(
                          child:CircularProgressIndicator(),)                       : !snapshot.hasData ||snapshot.data!.docs.isEmpty
                                  
                      ? const Center(
                          child: Text(
                            "No Profiles Found",
                          ),
                        )
                      : ListView.builder(itemCount:snapshot.data!.docs.length,
                        itemBuilder: (_, index) {
                         final data = snapshot.data!.docs[index].data();
                         return Padding(
                            padding:EdgeInsets.only(
                              bottom:DeviceHeight.s12,
                            ),
                           child:HomeProfileCard(
                              data: data,
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}