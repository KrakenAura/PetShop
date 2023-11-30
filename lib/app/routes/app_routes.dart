part of 'app_pages.dart';
// DO NOT EDIT. This is code generated via package:get_cli/get_cli.dart

abstract class Routes {
  Routes._();
  static const HOME = _Paths.HOME;
  static const WELCOME = _Paths.WELCOME;
  static const PROFILE = _Paths.PROFILE;
  static const HOMEPAGE = _Paths.HOMEPAGE;
  static const HEWAN = _Paths.HEWAN;
  static const ABOUT = _Paths.ABOUT;
  static const AUTH = _Paths.AUTH;
  static const LOGIN = _Paths.LOGIN;
  static const REGISTER = _Paths.REGISTER;
  static const APPWRITE = _Paths.APPWRITE;
}

abstract class _Paths {
  _Paths._();
  static const HOME = '/home';
  static const WELCOME = '/welcome';
  static const PROFILE = '/profile';
  static const HOMEPAGE = '/homepage';
  static const HEWAN = '/hewan';
  static const ABOUT = '/about';
  static const AUTH = '/auth';
  static const LOGIN = '/login';
  static const REGISTER = '/Register';
  static const APPWRITE = '/appwrite';
}

final getPages = [
  GetPage(
    name: Routes.HOME,
    page: () => const HomeView(),
  ),
  GetPage(name: Routes.ABOUT, page: () => AboutView()),
];
