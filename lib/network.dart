import 'package:flutter/material.dart';
import 'package:local_ip_plugin/local_ip_plugin.dart';

Future<String> generateCode() async {
  String localIp = "192.168.0.5";

  try {
    localIp = await LocalIpPlugin.getLocalIP();
  } catch (error) {
    debugPrint(error.toString());
  }

  var nums = localIp.split(".");

  var result = "";

  for (var i = 0; i < nums.length; i++) {
    result += int.parse(nums[i]).toRadixString(16);
  }

  return result;
}
