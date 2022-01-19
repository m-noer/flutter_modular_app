import 'package:auth/auth.dart';
import 'package:get/route_manager.dart';

class Routes {
  static List<GetPage> page = <GetPage>[
    GetPage<void>(
      name: LoginPage.route,
      page: () => LoginPage(),
    ),
  ];
}
