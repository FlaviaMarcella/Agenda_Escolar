import 'package:agenda_escola/assets/colors.dart';
import 'package:flutter/material.dart';
import 'package:agenda_escola/pages/user_settings.dart';
import 'package:agenda_escola/assets/images_path.dart';
import 'package:agenda_escola/components/user_data.dart';

class MyCard extends StatelessWidget {
  const MyCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CardWidget();
  }
}

class CardWidget extends StatefulWidget {
  const CardWidget({Key? key}) : super(key: key);

  @override
  _CardWidgetState createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  UserData? _userData;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.accentColor,
      margin: const EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 100,
              height: 100,
              margin: const EdgeInsets.only(right: 12),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(8.0),
                image: _userData != null && _userData!.imageFile != null
                    ? DecorationImage(
                        image: FileImage(_userData!.imageFile!),
                        fit: BoxFit.cover,
                      )
                    : const DecorationImage(
                        image: AssetImage(ImagePaths.avatarImage),
                        fit: BoxFit.cover,
                      ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(height: 16.0),
                Text(
                  _userData != null ? _userData!.userName : 'UserName',
                  style: const TextStyle(
                      fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color?>(AppColors.secondaryColor),
                    ),
                  onPressed: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfileEditor(userData: _userData ?? UserData(imageFile: null, userName: 'Texto Padrão')),
                      ),
                    );

                    if (result != null && result is UserData) {
                      setState(() {
                        _userData = result;
                      });
                    }
                  },
                  child: const Text('Editar Perfil',
                  style: TextStyle(
                    color: Colors.white
                  ),),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}