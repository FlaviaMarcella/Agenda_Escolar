import 'package:flutter/material.dart';
import 'package:agenda_escola/assets/colors.dart';
import 'package:agenda_escola/assets/images_path.dart';

class CardLinks extends StatelessWidget {
  final Function onPressed;

  const CardLinks({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.accentColor,
      elevation: 4.0,
      margin: const EdgeInsets.only(left: 16, right: 16),
      child: Padding(
        padding: EdgeInsets.only(bottom: 8, top: 8),
        child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: AppColors.accentColor,
            ),
            child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildSubCard(context, AppColors.secondaryColor, 'Horários',
                  ImagePaths.calendarImage),
              _buildSubCard(
                  context, Colors.red, 'Links', ImagePaths.linkBrokenImage),
              _buildSubCard(
                  context, AppColors.darkColor, 'SUAP', ImagePaths.suapImage),
            ],
          ),
          )
        ],
      ),
    ));
  }

  Widget _buildSubCard(
      BuildContext context, Color color, String text, String src) {
    return GestureDetector(
        onTap: () {
          // Aqui, você pode redirecionar para outra página ou realizar uma ação
          onPressed();
        },
        child: Card(
          
          color: color,
          margin: EdgeInsets.zero,
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Adicione a imagem aqui
                    Image.asset(
                      src, // Substitua pelo caminho da sua imagem
                      width: 50, // Largura da imagem
                      height: 50, // Altura da imagem
                      fit: BoxFit.contain, // Ajuste da imagem
                    ),
                    const SizedBox(
                        height: 4), // Espaçamento entre a imagem e o texto
                    Text(
                      text,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
