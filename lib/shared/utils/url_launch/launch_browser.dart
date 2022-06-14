import 'package:url_launcher/url_launcher.dart';

class LaunchBrowser {
  Future<void> openBrowser({required Uri url}) async {
    await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    );
  }

  Future<bool> canOpenBrowser({required Uri url}) async {
    return await canLaunchUrl(url);
  }
}
