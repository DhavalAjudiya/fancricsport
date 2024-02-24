import 'package:fancricsport/modual/dashboard/page/bottom_page.dart';
import 'package:fancricsport/modual/dashboard/page/completed/completedmatch_bottombar.dart';
import 'package:fancricsport/modual/dashboard/page/home/livematchdata_page.dart';
import 'package:fancricsport/modual/dashboard/page/new/newdetails.dart';
import 'package:fancricsport/modual/dashboard/page/splash.dart';
import 'package:get/get.dart';

mixin Routes {
  static const defaultTransition = Transition.native;

  static const String bottomPage = "/bottomPage";
  static const String newsDetailsPage = "/newsDetailsPage";
  static const String liveMatchDataPage = "/liveMatchDataPage";
  static const String completedPageBottomPage = "/completedPageBottomPage";
  static const String splashPage = "/splashPage";

  static List<GetPage<dynamic>> routes = [
    GetPage(
      name: splashPage,
      page: () => const SplashPage(),
      transition: defaultTransition,
    ),
    GetPage(
      name: bottomPage,
      page: () => const BottomPage(),
      transition: defaultTransition,
    ),
    GetPage(
      name: newsDetailsPage,
      page: () => NewsDetailsPage(),
      transition: defaultTransition,
    ),
    GetPage(
      name: liveMatchDataPage,
      page: () => LiveMatchDataPage(),
      transition: defaultTransition,
    ),
    GetPage(
      name: completedPageBottomPage,
      page: () => CompletedPageBottomPage(),
      transition: defaultTransition,
    ),
  ];
}
