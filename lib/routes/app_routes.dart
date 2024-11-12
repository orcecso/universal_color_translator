import 'package:get/get.dart';
import 'package:universal_color_translator/ui/home/home_binding.dart';
import 'package:universal_color_translator/ui/home/home_view.dart';

const String homeView = '/';

List<GetPage> getRootPage() {
  List<GetPage> list = [];

  list.add(GetPage(
    name: homeView,
    page: () => const HomeView(),
    transition: Transition.fadeIn,
    binding: HomeBinding(),
  ));

  return list;
}
