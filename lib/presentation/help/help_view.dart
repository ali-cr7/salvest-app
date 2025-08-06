import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:salvest_app/presentation/help/widgets/help_view_item.dart';
import 'package:salvest_app/utility/app_colors.dart';
import 'package:salvest_app/utility/router.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpView extends StatelessWidget {
  const HelpView({super.key});

  void _showContactBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      backgroundColor: Colors.white,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Contact Us',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              ListTile(
                leading: const Icon(Icons.email, color: Colors.redAccent),
                title: const Text('support@salvest.com'),
                onTap: () async {
                  final uri = Uri(scheme: 'mailto', path: 'support@salvest.com');
                  if (await canLaunchUrl(uri)) {
                    launchUrl(uri);
                  }
                },
              ),
              ListTile(
                leading: const Icon(Icons.phone, color: Colors.green),
                title: const Text('+123 456 7890'),
                onTap: () async {
                  final uri = Uri(scheme: 'tel', path: '+1234567890');
                  if (await canLaunchUrl(uri)) {
                    launchUrl(uri);
                  }
                },
              ),
              ListTile(
                leading: const Icon(Icons.message, color: Colors.green),
                title: const Text('WhatsApp'),
                onTap: () async {
                  final uri = Uri.parse("https://wa.me/1234567890");
                  if (await canLaunchUrl(uri)) {
                    launchUrl(uri, mode: LaunchMode.externalApplication);
                  }
                },
              ),
              ListTile(
                leading: const Icon(Icons.send, color: Colors.blue),
                title: const Text('Telegram'),
                onTap: () async {
                  final uri = Uri.parse("https://t.me/salvest_support");
                  if (await canLaunchUrl(uri)) {
                    launchUrl(uri, mode: LaunchMode.externalApplication);
                  }
                },
              ),
              const SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            GoRouter.of(context).pop();
          },
        ),
        title: const Text(
          'Help',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            InkWell(
              onTap: () {
                GoRouter.of(context).push(AppRouter.kCommonQuestionView);
              },
              child: const HelpViewItem(text: 'Common Questions'),
            ),
            const SizedBox(height: 20),
            InkWell(
              onTap: () {
                _showContactBottomSheet(context);
              },
              child: const HelpViewItem(text: 'Contact With Us'),
            ),
          ],
        ),
      ),
    );
  }
}
