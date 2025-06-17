import 'dart:convert';

import 'package:nrollapp/Model/personaly_model.dart';
import 'package:nrollapp/Screen/Constant%20Data/config.dart';
import 'package:http/http.dart' as http;

class PersonalyRepo {
  Future<PersonalyModel> getPersonaly() async {
    final response = await http.get(Uri.parse('${Config.personalyUrl}?app_hash=${Config.personalyAppHash}&user_id=${Config.personalyUserId}&user_ip=${Config.personalyUserIp}&platform=${Config.personalyPlatform}&tag_ids=${Config.personalyTagId}'));
    var data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return PersonalyModel.fromJson(data);
    } else {
      return PersonalyModel.fromJson(data);
    }
  }
}
