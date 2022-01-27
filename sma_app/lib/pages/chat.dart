import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sma_app/colors.dart';
import 'package:sma_app/components/clipImage.dart';
import 'package:sma_app/components/messageForms.dart';
import 'package:sma_app/services/authservice.dart';
import 'package:sma_app/services/userservice.dart';

import '../globals.dart';

TextEditingController _editTextController = TextEditingController();
ScrollController _scrollController = ScrollController();

class Chat extends StatefulWidget {
  Chat({Key? key}) : super(key: key);
  final UserService userService = UserService();
  // final user = userService.getUserById(id)
  @override
  ChatState createState() => ChatState();

}

class ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    var userId = int.tryParse(ModalRoute.of(context)?.settings.arguments.toString() ?? "");
    var user = widget.userService.getUserById(userId);
    TextEditingController messageController = TextEditingController();
    
    return Scaffold(
      //header
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: ClipPath(
                  clipper: TriangleClipper(),
                  child: Image.network(
                    "https://pbs.twimg.com/profile_images/1068948865477423110/rvexcOpY_400x400.jpg",
                  ),
                ),
              ),
            ),
            Expanded(
                flex: 4,
                child: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    user.firstName + " " + user.lastName,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ))
          ],
        ),
        backgroundColor: Colors.grey[50],
        elevation: 0.15,
      ),
      //chat
      body: SizedBox.expand(
        child: Container(
          margin: EdgeInsets.only(bottom: 80),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/chatBackground.png"),
                fit: BoxFit.cover),
          ),
          child: SingleChildScrollView(
            padding: EdgeInsets.all(10),
            child: ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: createMessages(userId, widget)),
          ),
        ),
      ),
      //writeField
      bottomSheet: Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: BoxDecoration(
            border: Border.all(
          color: Colors.grey[200]!,
        )),
        child: ClipPath(
          clipper: UserMessageForm(),
          child: Container(
            constraints: BoxConstraints(minHeight: 70, maxHeight: 160),
            padding: EdgeInsets.all(7),
            decoration: BoxDecoration(
              color: pmBlue50.withOpacity(0.9),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 9,
                  child: Scrollbar(
                    controller: _scrollController,
                    isAlwaysShown: true,
                    child: TextField(
                      controller: messageController,
                      scrollController: _scrollController,
                      autofocus: false,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      autocorrect: true,
                      onSubmitted: (text) {},
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        isDense: true,
                      ),
                    ),
                  ),
                ),
                Expanded(
                    child: IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    widget.userService.sendMessage(userId, messageController.text);
                    this.setState(() {
                    });
                  },
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Padding createUserMessage(String text, String time) {
  return Padding(
    padding: const EdgeInsets.symmetric(
      vertical: 2,
    ),
    child: Align(
      alignment: Alignment.topRight,
      child: ClipPath(
          clipper: UserMessageForm(),
          child: Container(
              constraints: BoxConstraints(maxWidth: 300),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: pmBlue50.withOpacity(0.7),
              ),
              child: MessageText(text, time))),
    ),
  );
}

Padding createWritingPartnerMessage(String text, String time) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 2),
    child: Align(
      alignment: Alignment.topLeft,
      child: ClipPath(
          clipper: WritingPartnerMessageForm(),
          child: Container(
              constraints: BoxConstraints(maxWidth: 280),
              padding: EdgeInsets.fromLTRB(15, 15, 15, 10),
              decoration: BoxDecoration(
                color: pmGrey300.withOpacity(0.8),
              ),
              child: MessageText(text, time))),
    ),
  );
}

List<Widget> createMessages(int? userId, Chat widget) {
  List<Widget> messages = [];
  for (var message in widget.userService.getUserById(userId).messages) {
    final now = DateTime.now();
    String dateToDisplay = "";
    DateFormat formatter = DateFormat('hh:mm');
    if (message.date.day == now.day - 1) {
      dateToDisplay = "Yesterday " + formatter.format(message.date);
    } else if (message.date.day == now.day) {
      dateToDisplay = "Heute " + formatter.format(message.date);
    } else {
      formatter = DateFormat("HH:mm dd.MM.yyyy");
      dateToDisplay = formatter.format(message.date);
    }

    if (message.received == true) {
      messages.add(createWritingPartnerMessage(message.message, dateToDisplay));
    } else {
      messages.add(createUserMessage(message.message, dateToDisplay));
    }
  }

  return messages;
}

Column MessageText(String text, String time) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      Text(
        text,
        softWrap: true,
        style: TextStyle(fontWeight: FontWeight.w300),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Text(
          time,
          style: TextStyle(
              color: pmGrey500, fontWeight: FontWeight.w300, fontSize: 12),
        ),
      ),
    ],
  );
}
