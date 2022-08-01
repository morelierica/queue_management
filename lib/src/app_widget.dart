import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:queue_management/src/configuration/configuration_module.dart';
import 'package:queue_management/src/queue/queue_module.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ...queueModule,
        ...configurationModule,
      ],
      child: const MaterialApp(),
    );
  }
}
