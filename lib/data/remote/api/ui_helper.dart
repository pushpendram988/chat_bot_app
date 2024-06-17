import 'dart:convert';

import 'dart:io';
import 'package:chat_bot_app/data/remote/api/url.dart';
import 'package:http/http.dart' as httpClient;
class ApiHelper {

  Future<dynamic> generateAImsg({required String url, required String prompt}) async {

  try{
  var mUri = Uri.parse(url);

  var response =  await httpClient.post(mUri , body:jsonEncode({

      "model": "gpt-3.5-turbo",
      "messages": [
        {
          "role": "user",
          "content": prompt
        }
      ],
      "temperature": 0.7
    }
  )  , headers: {
    "Content-Type": "application/json",
    "Authorization": "Bearer ${Urls.CHAT_COMPLETION_API_KEY}"
  });

  print(response.body.toString());

  if(response.statusCode==200){

    var mData = jsonDecode(response.body);

    if(mData['error']!=null){
      throw(HttpException('error: ${mData['error']['message']}'));
    } else {
      return mData;
    }
  } else {
    throw(HttpException("Server error: ${response.statusCode}"));
  }

  }catch(e){
  throw(HttpException(e.toString()));
  }

  }
}