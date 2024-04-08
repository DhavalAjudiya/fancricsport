import 'dart:convert';
import 'dart:developer';

import 'package:fancricsport/helper/network_helper.dart';
import 'package:fancricsport/modual/dashboard/modal/complete_modal.dart';
import 'package:fancricsport/modual/dashboard/modal/getallplayer_modal.dart';
import 'package:fancricsport/modual/dashboard/modal/live_matchmodal.dart';
import 'package:fancricsport/modual/dashboard/modal/livematch_datamodal.dart';
import 'package:fancricsport/modual/dashboard/modal/matchodds_modal.dart';
import 'package:fancricsport/modual/dashboard/modal/matchstatus_modal.dart';
import 'package:fancricsport/modual/dashboard/modal/sportnews_modal.dart';
import 'package:fancricsport/modual/dashboard/modal/upcomingmatch_modal.dart';
import 'package:http/http.dart' as http;

class MatchService {
  NetworkAPICall networkAPICall = NetworkAPICall();

  Future<List<LiveMatchModal>?> liveMatch() async {
    try {
      final response = await http.get(
        Uri.parse(
          "http://cricpro.cricnet.co.in/api/values/LiveLine",
        ),
      );
      if (response.statusCode == 200) {
        List jsonResponse = json.decode(response.body);
        return jsonResponse
            .map((data) => LiveMatchModal.fromJson(data))
            .toList();
      } else {}
    } catch (e, st) {
      log("e:- $e --- st:- $st");
      rethrow;
    }
  }

  Future<SportNews?> newsData() async {
    try {
      final response = await http.get(
          Uri.parse("http://onlineid.cricnet.co.in/api/values/SportsNews"));

      if (response.statusCode == 200) {
        return SportNews.fromJson(json.decode(response.body));
      } else {}
    } catch (e, st) {
      log("e:- $e --- st:- $st");
    }
  }

  Future<UpComingMatchModal?> upComingMatch() async {
    try {
      final response = await http.get(
          Uri.parse("http://cricpro.cricnet.co.in/api/values/upcomingMatches"));
      if (response.statusCode == 200) {
        return UpComingMatchModal.fromJson(json.decode(response.body));
      }
    } catch (e, st) {
      log("e:- $e --- st:- $st");

      rethrow;
    }
  }

  Future<List<LiveMatchDataModal>?> liveData(String matchId) async {
    try {
      final busTrackingBody = {"MatchId": matchId};
      final response = await http.post(
          Uri.parse("http://cricpro.cricnet.co.in/api/values/LiveLine_Match"),
          headers: {"Content-Type": "application/json", "charset": "UTF-8"},
          body: json.encode(busTrackingBody));
      if (response.statusCode == 200) {
        List jsonResponse = json.decode(response.body);
        return jsonResponse
            .map((data) => LiveMatchDataModal.fromJson(data))
            .toList();
      }
    } catch (e, st) {
      log("e:- $e --- st:- $st");

      rethrow;
    }
  }

  Future<CompletedModal?> completedData() async {
    try {
      final busTrackingBody = {"start": "1", "end": "20"};
      final response = await http.post(
          Uri.parse("http://cricpro.cricnet.co.in/api/values/MatchResults"),
          headers: {"Content-Type": "application/json"},
          body: json.encode(busTrackingBody));

      if (response.statusCode == 200) {
        return CompletedModal.fromJson(json.decode(response.body));
      }
    } catch (e, st) {
      log("e:- $e --- st:- $st");

      rethrow;
    }
  }

  Future<GetAllPlayerModal?> getAllPlayer(String id) async {
    try {
      final busTrackingBody = {"MatchId": id.toString()};
      final response = await http.post(
          Uri.parse("http://cricpro.cricnet.co.in/api/values/GetAllPlayers"),
          headers: {"Content-Type": "application/json"},
          body: json.encode(busTrackingBody));

      if (response.statusCode == 200) {
        return GetAllPlayerModal.fromJson(json.decode(response.body));
      }
    } catch (e, st) {
      log("e:- $e --- st:- $st");

      rethrow;
    }
  }

  Future<MatchOddsModal?> matchRun(String id) async {
    try {
      final busTrackingBody = {"MatchId": id.toString()};
      final response = await http.post(
          Uri.parse("http://cricpro.cricnet.co.in/api/values/MatchOdds"),
          headers: {"Content-Type": "application/json"},
          body: json.encode(busTrackingBody));
      if (response.statusCode == 200) {
        return MatchOddsModal.fromJson(json.decode(response.body));
      }
    } catch (e, st) {
      log("e:- $e --- st:- $st");

      rethrow;
    }
  }

  Future<MatchStatusModal?> matchStatus(String id) async {
    try {
      final busTrackingBody = {"MatchId": id.toString()};
      final response = await http.post(
          Uri.parse("http://cricpro.cricnet.co.in/api/values/MatchStats"),
          headers: {"Content-Type": "application/json"},
          body: json.encode(busTrackingBody));
      if (response.statusCode == 200) {
        return MatchStatusModal.fromJson(json.decode(response.body));
      }
    } catch (e, st) {
      log("e:- $e --- st:- $st");

      rethrow;
    }
  }
}
