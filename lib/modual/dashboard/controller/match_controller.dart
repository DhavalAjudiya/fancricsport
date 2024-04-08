import 'dart:async';
import 'dart:developer';

import 'package:fancricsport/modual/dashboard/modal/complete_modal.dart';
import 'package:fancricsport/modual/dashboard/modal/fantasy_model.dart';
import 'package:fancricsport/modual/dashboard/modal/getallplayer_modal.dart';
import 'package:fancricsport/modual/dashboard/modal/live_matchmodal.dart';
import 'package:fancricsport/modual/dashboard/modal/livematch_datamodal.dart';
import 'package:fancricsport/modual/dashboard/modal/matchodds_modal.dart';
import 'package:fancricsport/modual/dashboard/modal/matchstatus_modal.dart'
    as status;
import 'package:fancricsport/modual/dashboard/modal/sportnews_modal.dart';
import 'package:fancricsport/modual/dashboard/modal/upcomingmatch_modal.dart';
import 'package:fancricsport/modual/dashboard/service/live_matchservice.dart';
import 'package:get/get.dart';

class MatchController extends GetxController {
  List<LiveMatchModal> cricketModalList = <LiveMatchModal>[];
  List<LiveMatchDataModal> liveMatchDataList = <LiveMatchDataModal>[];
  Rx<SportNews?> sportNewsList = SportNews().obs;
  Rx<UpComingMatchModal?> upComingMatchModalList = UpComingMatchModal().obs;
  Rx<CompletedModal?> completedList = CompletedModal().obs;
  Rx<GetAllPlayerModal?> getAllPlayerList = GetAllPlayerModal().obs;
  RxList<Playerslist> teamAPlayersList = <Playerslist>[].obs;
  RxList<Playerslist> teamBPlayersList = <Playerslist>[].obs;

  Rx<MatchOddsModal?> matchOddsModal = MatchOddsModal().obs;
  RxList<Matchst> firstInningList = <Matchst>[].obs;
  RxList<Matchst> secondInningList = <Matchst>[].obs;

  Rx<status.MatchStatusModal?> matchStatusModal = status.MatchStatusModal().obs;
  RxList<status.Matchst?> matchStatusList = <status.Matchst>[].obs;

  Rx<GetAllPlayerModal?> liveRunPlayer = GetAllPlayerModal().obs;
  RxList<Playerslist> liveRunPlayerListA = <Playerslist>[].obs;
  RxList<Playerslist> liveRunPlayerListB = <Playerslist>[].obs;

  RxList<Fantasy> fantasyList = <Fantasy>[].obs;
  RxList<Fantasy> megaFantasyList = <Fantasy>[].obs;
  RxList<Fantasy> headFantasyList = <Fantasy>[].obs;
  RxList<Fantasy> smallFantasyList = <Fantasy>[].obs;
  RxList<Playerstate> playerStateList = <Playerstate>[].obs;
  RxString fantasyFTeam = "".obs;
  RxString fantasySTeam = "".obs;
  RxString fantasyTeamView = "".obs;
  RxString fantasyTeamVImage = "".obs;
  RxInt mega = 0.obs;
  RxInt head = 0.obs;
  RxInt small = 0.obs;

  RxString completedMatchId = "".obs;
  RxString completedTeamA = "".obs;
  RxString completedType = "".obs;
  RxString completedImage = "".obs;
  RxBool itBall = false.obs;

  Future<SportNews?> sportNews() async {
    sportNewsList.value = await MatchService().newsData();
  }

  Future<UpComingMatchModal?> upComingMatcg() async {
    try {
      upComingMatchModalList.value = await MatchService().upComingMatch();
    } catch (e, st) {
      log("e:- $e --- st:- $st");
    }
  }

  Future<CompletedModal?> completedMatch() async {
    try {
      completedList.value = await MatchService().completedData();
    } catch (e, st) {
      log("ess:- $e --- st:- $st");
    }
  }

  Future<GetAllPlayerModal?> getAllPlayer(String id) async {
    try {
      teamAPlayersList.clear();
      teamBPlayersList.clear();
      getAllPlayerList.value = await MatchService().getAllPlayer(id);
      if (getAllPlayerList.value?.playerslist?.isNotEmpty ?? false) {
        getAllPlayerList.value?.playerslist?.forEach((element) {
          if (element.teamName == completedTeamA.value) {
            teamAPlayersList.add(element);
          } else {
            teamBPlayersList.add(element);
          }
        });
      } else {}
    } catch (e, st) {
      log("ess:- $e --- st:- $st");
    }
  }

  Future<MatchOddsModal?> matchRunData(String id) async {
    try {
      firstInningList.clear();
      secondInningList.clear();
      matchOddsModal.value = await MatchService().matchRun(id);
      if (matchOddsModal.value?.matchst?.isNotEmpty ?? false) {
        matchOddsModal.value?.matchst?.forEach((element) {
          if (element.isfirstinning == "1") {
            firstInningList.add(element);
          } else {
            secondInningList.add(element);
          }
        });
      } else {}
    } catch (e, st) {
      log("ess:- $e --- st:- $st");
    }
  }

  Future<status.MatchStatusModal?> matchStatus(String id) async {
    try {
      matchStatusList.clear();
      matchStatusModal.value = await MatchService().matchStatus(id);
      if (matchStatusModal.value?.matchst?.isNotEmpty ?? false) {
        matchStatusModal.value?.matchst?.forEach((element) {
          matchStatusList.add(element);
        });
      } else {}
    } catch (e, st) {
      log("ess:- $e --- st:- $st");
    }
  }

  RxString matchTile = "".obs;
  RxString teamAImage = "".obs;
  RxString teamBImage = "".obs;
  RxString teamAName = "".obs;
  RxString teamBName = "".obs;
  RxString matchId = "".obs;
  RxString newsTitle = "".obs;
  RxString newsAuthor = "".obs;
  RxString newsDescription = "".obs;
  RxString newsURL = "".obs;
  RxString newsURLToImage = "".obs;
  RxString publishedAT = "".obs;
  RxString content = "".obs;
  RxInt index = 0.obs;
  RxInt showAd = 0.obs;
}
