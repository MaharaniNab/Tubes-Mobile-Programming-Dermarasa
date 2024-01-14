import 'package:dermarasa/activity_page.dart';
import 'package:dermarasa/home_page.dart';
import 'package:dermarasa/user_page.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MessagePage extends StatefulWidget {
  final String title;

  const MessagePage({Key? key, required this.title}) : super(key: key);

  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  TextEditingController _messageController = TextEditingController();
  List<ChatMessage> _chatMessages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 230, 127, 96),
        title: const Center(
          child: Text('Pesan'),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _chatMessages.length,
              itemBuilder: (context, index) {
                return _chatMessages[index];
              },
            ),
          ),
          _buildMessageInput(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        type: BottomNavigationBarType.fixed,
        selectedItemColor:
            Color.fromARGB(255, 230, 127, 96), // Set selected item color
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(FeatherIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(FeatherIcons.activity),
            label: 'Activity',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FeatherIcons.messageCircle,
              color: Color.fromARGB(255, 230, 127, 96), // Ubah warna ikon
            ),
            label: 'Message',
          ),
          BottomNavigationBarItem(
            icon: Icon(FeatherIcons.user),
            label: 'User',
          ),
        ],
        onTap: (index) {
          // Change the page according to the selected index
          _onBottomNavigationBarTap(context, index);
        },
      ),
    );
  }

  Widget _buildMessageInput() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _messageController,
              decoration: InputDecoration(
                hintText: 'Ketik pesan...',
              ),
              style: GoogleFonts.poppins(),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              _sendMessage();
            },
          ),
        ],
      ),
    );
  }

  void _sendMessage() {
    String messageText = _messageController.text.trim();
    if (messageText.isNotEmpty) {
      setState(() {
        _chatMessages.add(
          ChatMessage(
            message: '$messageText',
            isSentByUser: true,
          ),
        );
        // Berikan balasan otomatis berdasarkan pertanyaan pengguna
        String autoReply = getAutoReply(messageText);
        _chatMessages.add(
          ChatMessage(
            message: '${widget.title} $autoReply',
            isSentByUser: false,
          ),
        );
        _messageController.clear();
      });
    }
  }
}

class ChatMessage extends StatelessWidget {
  final String message;
  final bool isSentByUser;

  ChatMessage({required this.message, required this.isSentByUser});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      alignment: isSentByUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSentByUser
              ? Color.fromARGB(255, 230, 127, 96)
              : Colors.grey[300],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          message,
          style: TextStyle(
            color: isSentByUser ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}

String getAutoReply(String userMessage) {
  // Logika untuk memberikan balasan otomatis
  // Anda dapat menyesuaikan logika ini sesuai dengan kebutuhan aplikasi Anda
  if (userMessage.toLowerCase().contains('halo')) {
    return 'Halo juga! Ada yang bisa saya bantu?';
  } else if (userMessage.toLowerCase().contains('terima kasih')) {
    return 'Sama-sama, semoga harimu menyenangkan!';
  } else {
    return 'Terima kasih atas pesanmu!\n Admin akan segera menghubungimu!\n';
  }
}

// Function to handle bottom navigation bar taps
void _onBottomNavigationBarTap(BuildContext context, int index) {
  switch (index) {
    case 0:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
      break;
    case 1:
      // Activity Page;
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ActivityPage()),
      );
      break;
    case 2:
      // Message Page
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //       builder: (context) => MessagePage(
      //             title: '',
      //           )),
      // );
      break;
    case 3:
      // User Page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProfilePage()),
      );
      break;
  }
}
