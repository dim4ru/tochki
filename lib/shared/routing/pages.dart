import 'package:get/get.dart';
import 'package:tochki/shared/routing/routes.dart';

import '../../feature/user_profile/view.dart';

class TPages {
  static final routes = [
    // GetPage(name: TRoutes.home, page: () => HomeScreen()),
    GetPage(name: TRoutes.userProfile, page: () => UserProfile()),
  ];
}
