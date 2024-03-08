import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerButton extends StatefulWidget {
  final Function(File)? onImagePicked;

  const ImagePickerButton({Key? key, this.onImagePicked}) : super(key: key);

  @override
  _ImagePickerButtonState createState() => _ImagePickerButtonState();
}

class _ImagePickerButtonState extends State<ImagePickerButton> {
  File? _imageFile;

  Future<void> _getImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
      if (widget.onImagePicked != null) {
        widget.onImagePicked!(_imageFile!);
      }
    }
  }

  void showImagePickerDialog(BuildContext context) {
    final size = MediaQuery.of(context).size;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _getImage(ImageSource.gallery);
              },
              child: Icon(
                Icons.image_rounded,
                size: size.height * 0.07,
                color: Colors.amber,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _getImage(ImageSource.camera);
              },
              child: Icon(
                Icons.camera_alt_rounded,
                size: size.height * 0.07,
                color: Colors.amber,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        if (_imageFile != null)
          GestureDetector(
            onTap: () {
              showImagePickerDialog(context);
            },
            child: Container(
              width: double.maxFinite,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 2,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(0),
                ),
                color: Colors.white,
              ),
              child: Image.file(
                _imageFile!,
                width: size.width * 0.8,
                height: size.height * 0.3,
                fit: BoxFit.fill,
              ),
            ),
          ),
        if (_imageFile == null)
          GestureDetector(
            onTap: () {
              showImagePickerDialog(context);
            },
            child: Container(
              height: size.height * 0.1,
              width: double.maxFinite,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                color: Colors.white,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.02,
                vertical: size.height * 0.02,
              ),
              child: Center(
                child: Text(
                  "Choose from phone/click image",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: size.shortestSide * 0.05,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
