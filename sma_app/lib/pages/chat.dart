import 'package:flutter/material.dart';
import 'package:sma_app/colors.dart';
import 'package:sma_app/components/clipImage.dart';
import 'package:sma_app/components/messageForms.dart';

TextEditingController _editTextController = TextEditingController();
ScrollController _scrollController = ScrollController();

class Chat extends StatelessWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    "Maulende Myrte",
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
                children: [
                  createUserMessage(
                      "what a beautiful day", "13.Nov 2021 13:20"),
                  createWritingPartnerMessage(
                      "absolutly beautiful and so on and so on and so on and so on ",
                      "13.Nov 2021 13:40"),
                  createWritingPartnerMessage(
                      "absolutly beautiful and so on and so on and so on and so on ",
                      "Gestern 13:20"),
                  createWritingPartnerMessage(
                      "absolutly beautiful and so on and so on and so on and so on ",
                      "Gestern 10:10"),
                  createWritingPartnerMessage(
                      "absolutly beautiful and so on and so on and so on and so on ",
                      "Gestern 23:44"),
                  createUserMessage("what a beautiful day", "Heute 01:31"),
                  createWritingPartnerMessage(
                      "absolutly beautiful and so on and so on and so on and so on ",
                      "Heute 01:31"),
                  createUserMessage("what a beautiful day", "Heute 01:31"),
                  createUserMessage("what a beautiful day", "Heute 01:53"),
                ]),
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
                  onPressed: () {},
                ))
              ],
            ),
          ),
        ),
      ),
    );
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
}
