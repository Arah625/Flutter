import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AboutApplication extends StatelessWidget {
  const AboutApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 30.0, right: 30.0),
          child: Text(AppLocalizations.of(context).aboutApplicationInfo),
        ),
      ),
    );
  }
}
