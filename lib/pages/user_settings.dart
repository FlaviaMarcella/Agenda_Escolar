// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:agenda_escola/components/user_data.dart';

class ProfileEditor extends StatefulWidget {
  final UserData userData;

  const ProfileEditor({Key? key, required this.userData}) : super(key: key);

  @override
  _ProfileEditorState createState() => _ProfileEditorState();
}

class _ProfileEditorState extends State<ProfileEditor> {
  final ImagePicker _picker = ImagePicker();
  late File? _imageFile;
  late String _userName;
  late TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _imageFile = widget.userData.imageFile;
    _userName = widget.userData.userName;
    _textEditingController = TextEditingController(text: _userName);
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  Future<void> _getImageFromGallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _imageFile = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editor de Perfil'),
      ),
      body: Center(
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: _getImageFromGallery,
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(75),
                  image: _imageFile != null
                      ? DecorationImage(
                          image: FileImage(_imageFile!),
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
                child: _imageFile == null
                    ? const Icon(Icons.add_a_photo, size: 50, color: Colors.grey)
                    : null,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              
              onChanged: (value) {
                setState(() {
                  _userName = value;
                });
              },
              decoration: const InputDecoration(
                hintText: 'Digite seu nome',
                labelText: 'Nome',
                border: OutlineInputBorder(),
              ),
              controller: _textEditingController,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _saveImageAndText(_imageFile, _userName);
              },
              child: const Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }

  void _saveImageAndText(File? imageFile, String userName) {
    print('Imagem salva: $imageFile');
    print('Texto salvo: $userName');

    Navigator.pop(context, UserData(imageFile: imageFile, userName: userName));
  }
}
