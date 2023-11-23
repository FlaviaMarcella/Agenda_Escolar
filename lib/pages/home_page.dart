// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:agenda_escola/components/card_links.dart';
import 'package:agenda_escola/components/card_user.dart';
import 'package:agenda_escola/assets/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CardWidget(),
            const SizedBox(height: 5),
            CardLinks(
              onPressed: () {
                // Ação a ser executada quando um card menor for pressionado
                // Por exemplo: Navigator.push para outra página
                print('Card pequeno pressionado!');
              },
            ),
          ],
        ),
      ),
    );
  }
}
