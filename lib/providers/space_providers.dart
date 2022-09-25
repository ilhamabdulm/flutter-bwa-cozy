import 'dart:convert';

import 'package:cozy_app/models/space.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SpaceProvider extends ChangeNotifier {
  Future getRecommendedSpaces() async {
    var result = await http.get(Uri(
        host: 'bwa-cozy.herokuapp.com',
        path: '/recommended-spaces',
        scheme: 'https'));

    if (result.statusCode == 200) {
      List data = jsonDecode(result.body);
      List<Space> spaces = data.map((item) => Space.fromJson(item)).toList();

      return spaces;
    } else {
      return <Space>[];
    }
  }
}
