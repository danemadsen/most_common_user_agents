import 'dart:convert';

import 'package:dio/dio.dart';
import 'user_agents.data.dart';

class UserAgents {
  static Dio dioClient = Dio();

  static Map<String, dynamic> _agentReducer(Map<String, dynamic> value, Map<String, dynamic> element) {
    if (value['pct'] > element['pct']) {
      return value;
    } 
    else {
      return element;
    }
  }

  static Future<List<Map<String, dynamic>>> _getUserAgents(String url, List<Map<String, dynamic>> fallback) async {
    final response = await dioClient.get(url);

    if (response.statusCode != 200) {
      return fallback;
    }

    final list = jsonDecode(response.data);

    return List<Map<String, dynamic>>.from(list);
  }

  static Future<List<Map<String, dynamic>>> get desktop async {
    final url = 'https://raw.githubusercontent.com/danemadsen/most-common-user-agents/refs/heads/main/desktop.json';

    return _getUserAgents(url, desktopUserAgents);
  }

  static Future<List<Map<String, dynamic>>> get mobile async {
    final url = 'https://raw.githubusercontent.com/danemadsen/most-common-user-agents/refs/heads/main/mobile.json';

    return _getUserAgents(url, mobileUserAgents);
  }

  static Future<String> get mostCommonDesktop async {
    List<Map<String, dynamic>> agents = await desktop;

    return agents.reduce(_agentReducer)['ua'];
  }

  static Future<String> get mostCommonMobile async {
    List<Map<String, dynamic>> agents = await mobile;

    return agents.reduce(_agentReducer)['ua'];
  }
}