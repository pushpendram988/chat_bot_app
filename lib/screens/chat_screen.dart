import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chat_bot_app/data/provider/chat_provider.dart';
import 'package:chat_bot_app/data/remote/api/ui_helper.dart';
import 'package:chat_bot_app/data/remote/api/url.dart';
import 'package:chat_bot_app/util/util_helper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatefulWidget{
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
  }
  @override
  Widget build(BuildContext context) {
    var  promptController = TextEditingController();
    var mtDate = DateFormat.Hm();

    return Scaffold(
      backgroundColor: AppColor.bgColor,

      appBar: AppBar(
        backgroundColor: Colors.amberAccent,

        title: Text('Pushpendra_Chat_Bot'),
      ),
      body: Column(
        children: [
          Expanded(child:
          Consumer<ChatProvider>(builder: (_,provider, child) {
            var listMsg = provider.getAllMessage();
            return ListView.builder(
              reverse: true,
                itemCount: listMsg.length,

                itemBuilder: (_, index) {
                  var msgModel = listMsg[index];

                  return msgModel.senderId==1 ?


                      Container(
                        padding: const EdgeInsets.all(11.0),
                        color: Colors.black,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 20,
                              child: Text("AI"),
                            ),
                            SizedBox(width: 10,),
                            Expanded(child: DefaultTextStyle(
                              style: mTextStyle16(mColor: Colors.white),
                              child: AnimatedTextKit(
                                totalRepeatCount: 1,
                                repeatForever: false,
                                animatedTexts: [

                                  TypewriterAnimatedText(msgModel.msg,)
                                ],
                              ),
                            ),
                            ),
                          ],
                        ))

                  //user UI
                   : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        
                        Text(
                          msgModel.msg, style: mTextStyle16(mColor: Colors.grey),
                        ),
                        Text(mtDate.format(DateTime.fromMillisecondsSinceEpoch(msgModel.sentAt)), style: TextStyle(color: Colors.white),)
                      ],
                    ),
                  );

                });

          }
          )
          ),
          TextField(cursorColor: Colors.white,
            style: TextStyle(color: AppColor.mGreyColor),
            controller: promptController,
            enableSuggestions: true,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.mic),
              suffixIcon: InkWell(
                  onTap: (){

                    Provider.of<ChatProvider>( context ,listen: false).sendMyPrompt(prompt: promptController.text);
                    promptController.clear();


                    promptController.clear();
                  },
                  child: Icon(Icons.send)),
              hintText: 'Enter your questions...',
              hintStyle: mTextStyle16(mColor: AppColor.mGreyColor),
              fillColor: AppColor.secondaryColor,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(21))
              )
            ),
          )
        ],
      )
    );
  }
}