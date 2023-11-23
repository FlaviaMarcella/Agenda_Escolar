import 'package:flutter/material.dart';
import 'package:agenda_escola/assets/colors.dart';

class CardLinks extends StatelessWidget {
  final Function onPressed;

  const CardLinks({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: EdgeInsets.all(16.0),
      child: Column(
        children: [
          ListTile(
            title: Text('Título do Card'),
            subtitle: Text('Descrição do Card'),
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildSubCard(context, Colors.blue, 'Link 1'),
              _buildSubCard(context, Colors.green, 'Link 2'),
              _buildSubCard(context, Colors.red, 'Link 3'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSubCard(BuildContext context, Color color, String text) {
    return GestureDetector(
      onTap: () {
        // Aqui, você pode redirecionar para outra página ou realizar uma ação
        onPressed();
      },
      child: Card(
        color: color,
        child: SizedBox(
          width: MediaQuery.of(context).size.width / 4,
          height: MediaQuery.of(context).size.width / 4,
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
