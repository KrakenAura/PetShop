import 'package:get/get.dart';

import '../modules/Homepage/bindings/homepage_binding.dart';
import '../modules/Homepage/views/homepage_view.dart';
import '../modules/about/bindings/about_binding.dart';
import '../modules/about/views/about_view.dart';
import '../modules/appwrite/bindings/appwrite_binding.dart';
import '../modules/appwrite/views/PetView.dart';
import '../modules/appwrite/views/updatePetView.dart';
import '../modules/appwrite/views/deletePetView.dart';
import '../modules/auth/bindings/auth_binding.dart';
import '../modules/auth/views/auth_view.dart';
import '../modules/auth/views/login_page.dart';
import '../modules/auth/views/register_page.dart';
import '../modules/hewan/bindings/hewan_binding.dart';
import '../modules/hewan/views/hewan_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/welcome/bindings/welcome_binding.dart';
import '../modules/welcome/views/welcome_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  // static const INITIAL = Routes.HOME;
  // static const INITIAL = Routes.HEWAN;
  // static const INITIAL = Routes.PETVIEW;
  static const INITIAL = Routes.DELETE_PETVIEW;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.WELCOME,
      page: () => const WelcomeView(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.HOMEPAGE,
      page: () => const HomepageView(),
      binding: HomepageBinding(),
    ),
    GetPage(
      name: _Paths.HEWAN,
      page: () => HewanView(),
      binding: HewanBinding(),
    ),
    GetPage(
      name: _Paths.ABOUT,
      page: () => AboutView(),
      binding: AboutBinding(),
    ),
    GetPage(
      name: _Paths.AUTH,
      page: () => const AuthView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginPage(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterPage(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.PETVIEW,
      page: () => PetView(),
      binding: AppwriteBinding(),
    ),
    GetPage(
      name: _Paths.DELETE_PETVIEW,
      page: () => DeletePetView(),
      binding: AppwriteBinding(),
    ),
    GetPage(
      name: _Paths.UPDATE_PETVIEW,
      page: () => UpdatePetView(),
      binding: AppwriteBinding(),
    ),
  ];
}
