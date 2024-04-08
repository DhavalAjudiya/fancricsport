import 'package:fancricsport/modual/dashboard/page/bottom_page.dart';
import 'package:fancricsport/modual/dashboard/page/completed/completedmatch_bottombar.dart';
import 'package:fancricsport/modual/dashboard/page/fantasy/fantasy_page.dart';
import 'package:fancricsport/modual/dashboard/page/fantasy/last_minutes_fantsay.dart';
import 'package:fancricsport/modual/dashboard/page/fantasy/team_page.dart';
import 'package:fancricsport/modual/dashboard/page/fantasy/team_view.dart';
import 'package:fancricsport/modual/dashboard/page/home/livematchdata_page.dart';
import 'package:fancricsport/modual/dashboard/page/new/newdetails.dart';
import 'package:fancricsport/modual/dashboard/page/setting/setting.dart';
import 'package:fancricsport/modual/dashboard/page/splash.dart';
import 'package:get/get.dart';

mixin Routes {
  static const defaultTransition = Transition.native;

  static const String bottomPage = "/bottomPage";
  static const String newsDetailsPage = "/newsDetailsPage";
  static const String liveMatchDataPage = "/liveMatchDataPage";
  static const String completedPageBottomPage = "/completedPageBottomPage";
  static const String splashPage = "/splashPage";
  static const String fantasyPage = "/fantasyPage";
  static const String teamPage = "/teamPage";
  static const String teamViewPage = "/teamViewPage";
  static const String settingPage = "/settingPage";
  static const String lastMinutesPage = "/lastMinutesPage";

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
    GetPage(
      name: fantasyPage,
      page: () => FantasyPage(),
      transition: defaultTransition,
    ),
    GetPage(
      name: teamPage,
      page: () => TeamPage(),
      transition: defaultTransition,
    ),
    GetPage(
      name: teamViewPage,
      page: () => TeamViewPage(),
      transition: defaultTransition,
    ),
    GetPage(
      name: settingPage,
      page: () => SettingPage(),
      transition: defaultTransition,
    ),
    GetPage(
      name: lastMinutesPage,
      page: () => LastMinutesPage(),
      transition: defaultTransition,
    ),
  ];
}
