class MessageModel{
  String msg;
  int sentAt;
  int senderId; //0->user 1-> bot
MessageModel({required this.msg ,required this.senderId, required this.sentAt});
}