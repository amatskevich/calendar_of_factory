import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mailto/mailto.dart';
import 'package:url_launcher/url_launcher.dart';

class MailtoDeveloper extends StatelessWidget {
  static const appMail = 'calendar.of.factory@gmail.com';

  const MailtoDeveloper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          text: appMail,
          style: const TextStyle(color: Colors.blue, fontSize: 20),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              launchMailto();
            },
        ),
      ),
    );
  }

  launchMailto() async {
    final mailtoLink = Mailto(
      to: [appMail],
      subject: 'Письмо от пользователя',
    );
    await launch('$mailtoLink');
  }
}
