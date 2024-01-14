import 'package:flutter/material.dart';

Widget buildListTile(
    IconData icon, String title, String? subtitle, VoidCallback? onTap) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    decoration: BoxDecoration(
      border: Border.all(
        color: Color.fromARGB(255, 230, 127, 96),
        width: 1.0,
      ),
      borderRadius: BorderRadius.circular(8.0),
    ),
    child: ListTile(
      leading: Icon(
        icon,
        color: Color.fromARGB(255, 230, 127, 96),
      ),
      title: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              color: Color.fromARGB(255, 230, 127, 96),
            ),
          ),
          const SizedBox(width: 75.0), // Spacer
          if (subtitle != null)
            Text(subtitle, style: TextStyle(color: Colors.grey)),
        ],
      ),
      onTap: onTap,
    ),
  );
}

class EyeButton extends StatefulWidget {
  const EyeButton({Key? key}) : super(key: key);

  @override
  _EyeButtonState createState() => _EyeButtonState();
}

class _EyeButtonState extends State<EyeButton> {
  bool isEyeOpen = true;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isEyeOpen ? Icons.remove_red_eye : Icons.remove_red_eye_outlined,
      ),
      onPressed: () {
        setState(() {
          isEyeOpen = !isEyeOpen;
        });
      },
    );
  }
}
