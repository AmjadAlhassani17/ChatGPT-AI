import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../utils/theme/theme_service.dart';
import '../../../../view_model/auth_view_model/auth_view_model.dart';
import '../../../../view_model/home_view_model/home_view_model.dart';
import '../privicy_and_policy/privicy_and_policy_screen.dart';
import 'list_tile_item_widget.dart';

class MenuItemDrawer extends StatelessWidget {
  const MenuItemDrawer({super.key});

  static final HomeViewModel homeViewModel = Get.find<HomeViewModel>();

  static final AuthViewModel authViewModel = Get.find<AuthViewModel>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Wrap(
        runSpacing: 5.h,
        children: [
          GetBuilder<HomeViewModel>(
              init: HomeViewModel(),
              builder: (logic) {
                return ListTileItem(
                  icon: Icons.delete_outline_rounded,
                  onTap: () {
                    logic.restChat();
                    Get.back();
                  },
                  title: 'Clear conversations',
                );
              }),
          ListTileItem(
            icon: ThemeService().getThemeMode() == ThemeMode.dark
                ? Icons.light_mode_outlined
                : Icons.dark_mode_outlined,
            onTap: () {
              ThemeService().changeTheme();
            },
            title: ThemeService().getThemeMode() == ThemeMode.dark
                ? 'Light mode'
                : 'Dark mode',
          ),
          ListTileItem(
            icon: Icons.privacy_tip_outlined,
            onTap: () {
              Get.to(() => const PrivicyAndPolicyView());
            },
            title: 'Privicy and policy',
          ),
          Divider(
            thickness: 2,
            color: Theme.of(context).focusColor,
          ),
          GetBuilder<AuthViewModel>(
              init: AuthViewModel(),
              builder: (logic) {
                return ListTileItem(
                  icon: Icons.logout_rounded,
                  onTap: () {
                    logic.signOut();
                    ThemeService().getThemeMode() == ThemeMode.dark ? ThemeService().changeTheme() : null;
                  },
                  title: 'Log out',
                );
              }),
        ],
      ),
    );
  }
}
