import 'package:get/get.dart';

import '../modules/absensi/bindings/absensi_binding.dart';
import '../modules/absensi/views/absensi_view.dart';
import '../modules/add_employee/bindings/add_employee_binding.dart';
import '../modules/add_employee/views/add_employee_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/admin_view.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/mainview/bindings/mainview_binding.dart';
import '../modules/mainview/views/mainview_view.dart';
import '../modules/pengajuan/bindings/pengajuan_binding.dart';
import '../modules/pengajuan/views/pengajuan_view.dart';
import '../modules/under_dev/bindings/under_dev_binding.dart';
import '../modules/under_dev/views/under_dev_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.ADD_EMPLOYEE,
      page: () => AddEmployeeView(),
      binding: AddEmployeeBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN,
      page: () => const AdminView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.MAINVIEW,
      page: () => const MainviewView(),
      binding: MainviewBinding(),
    ),
    GetPage(
      name: _Paths.PENGAJUAN,
      page: () => PengajuanView(),
      binding: PengajuanBinding(),
    ),
    GetPage(
      name: _Paths.ABSENSI,
      page: () => AbsensiView(),
      binding: AbsensiBinding(),
    ),
    GetPage(
      name: _Paths.UNDER_DEV,
      page: () => const UnderDevView(),
      binding: UnderDevBinding(),
    ),
  ];
}
