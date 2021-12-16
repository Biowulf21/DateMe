import 'dart:io';

import 'package:dateme/Classes/Person.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dateme/Classes/personList.dart';
import 'package:image_picker/image_picker.dart';

class Messaging extends StatefulWidget {
  const Messaging({Key? key}) : super(key: key);

  @override
  _MessagingState createState() => _MessagingState();
}

class _MessagingState extends State<Messaging> {
  late List conversationsList;
  Users users = Users();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    conversationsList = users.itemlist;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        title: const Text('Conversations'),
      ),
      body: ListView.builder(
          itemCount: conversationsList.length,
          itemBuilder: (BuildContext context, int index) {
            //Uses the persons information to show in the conversation widget title
            final person = conversationsList[index];
            return ConversationWidget(context, person);
          }),
    );
  }
}

Widget ConversationWidget(BuildContext context, Person person) {
  Image profilePicture = person.profilePicture;

  return Card(
    shadowColor: Colors.grey,
    child: Padding(
      padding: EdgeInsets.all(5.0),
      child: ListTile(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ChatConversation(
                      person: person,
                    ))),
        title: Text(person.fname),
        subtitle: Text('Last chat sent'),
        contentPadding: EdgeInsets.all(8.0),
        leading: const CircleAvatar(radius: 25, child: Icon(Icons.person)),
        trailing: IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
      ),
    ),
  );
}

class ChatConversation extends StatefulWidget {
  Person person;

  ChatConversation({required this.person});

  @override
  _ChatConversationState createState() => _ChatConversationState();
}

class _ChatConversationState extends State<ChatConversation> {
  bool sendButtonActive = false;
  File? image;
  final chatController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        title: Text(widget.person.fname),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                      onChanged: (text) {
                        //checks if the textfield is empty, then changes the color and state of button depending on it
                        setState(() {
                          text.isNotEmpty
                              ? sendButtonActive = true
                              : sendButtonActive = false;
                        });
                      },
                      controller: chatController,
                      keyboardType: TextInputType.multiline,
                      minLines: 1,
                      maxLines: 3,
                      decoration: InputDecoration(
                          focusColor: Colors.orangeAccent,
                          hintText: 'Type a message',
                          prefixIcon: IconButton(
                            icon: Icon(Icons.emoji_emotions,
                                color: Colors.orangeAccent),
                            onPressed: () {},
                          ),
                          suffixIcon: IconButton(
                              icon: Icon(
                                FontAwesomeIcons.camera,
                                color: Colors.orangeAccent,
                              ),
                              onPressed: () => print('picking image')),
                          border: OutlineInputBorder(gapPadding: 5.0))),
                ),
                IconButton(
                    color: sendButtonActive ? Colors.orange : Colors.grey,
                    disabledColor: Colors.grey,
                    //changes the functionality of the button depending on whether or not the textfield is empty or not
                    onPressed: () =>
                        sendButtonActive ? print({sendButtonActive}) : null,
                    //changes the color of the button depending on whether or not the textfield is empty or not

                    icon: sendButtonActive
                        ? const Icon(Icons.send)
                        : const Icon(Icons.thumb_up))
              ],
            ),
          ),
        ],
      ),
    );
  }

//   Future pickImage(ImageSource source) async {
//     WidgetsFlutterBinding.ensureInitialized();
//     final cameras = await AvailableCamera();

//     final firstCamera = cameras.first;

//     final image = await ImagePicker().pickImage(source: source);
//     if (image == null) return;

//     final imagePath = File(image.path);
//     this.image = imagePath;
//   }
// }
}
