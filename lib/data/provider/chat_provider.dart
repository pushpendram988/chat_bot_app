


import 'package:chat_bot_app/data/remote/api/ui_helper.dart';
import 'package:chat_bot_app/modals/ai_generated_model.dart';
import 'package:flutter/cupertino.dart';

import '../../modals/message_model.dart';
import '../remote/api/url.dart';

class ChatProvider extends ChangeNotifier{
  
  //user asking

  List<MessageModel> listMsg = [];

  Future<void> sendMyPrompt({required String prompt}) async {
    listMsg.insert(0 ,
    MessageModel(msg: prompt, senderId: 0, sentAt: DateTime.now().millisecondsSinceEpoch));

    notifyListeners();
    //ai answering
    
    try{
      
      var mData = await ApiHelper().generateAImsg(url: Urls.CHAT_COMPLETION_API, prompt: prompt);
      AIGeneratedModel aiModel = AIGeneratedModel.fromJson(mData);
      listMsg.insert(0, MessageModel(msg: aiModel.choices![0].message!.content!,
          senderId: 1, sentAt: DateTime.now().millisecondsSinceEpoch));

      notifyListeners();

    } catch(e){
      listMsg.insert(0, MessageModel(msg: e.toString(),
          senderId: 1, sentAt: DateTime.now().millisecondsSinceEpoch));

      notifyListeners();
    }
  }

  List<MessageModel> getAllMessage()
  {
    return listMsg;
  }
}