import 'package:avengers/screens/answer_screen.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class UploadImageBox extends StatefulWidget {
  const UploadImageBox({super.key});

  @override
  _UploadImageBoxState createState() => _UploadImageBoxState();
}

class _UploadImageBoxState extends State<UploadImageBox> {
  File? _image;
  String _result = '';
  bool _isLoading = false;

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future<void> classifyImage() async {
    if (_image == null) return;

    setState(() {
      _isLoading = true;
      _result = '';
    });

    try {
      var uri = Uri.parse('http://localhost:5000/classify_image');
      var request = http.MultipartRequest('POST', uri)
        ..files.add(await http.MultipartFile.fromPath('image', _image!.path));

      var response = await request.send();

      if (response.statusCode == 200) {
        var responseData = await response.stream.bytesToString();
        var decodedResult = json.decode(responseData);

        if (decodedResult is List && decodedResult.isNotEmpty) {
          var firstResult = decodedResult[0];

          if (firstResult.containsKey('class') &&
              firstResult.containsKey('class_probability') &&
              firstResult['class_probability'] is List &&
              firstResult['class_probability'].isNotEmpty) {
            String predictedClass = firstResult['class'];
            double probability = firstResult['class_probability'][0].toDouble();

            setState(() {
              _isLoading = false;
            });

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ResultPage(
                  predictedClass: predictedClass,
                  probability: probability,
                ),
              ),
            );
          } else {
            throw Exception('Invalid server response structure.');
          }
        } else {
          throw Exception('Empty or invalid classification result.');
        }
      } else {
        throw Exception('Server returned status code ${response.statusCode}.');
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Oops! I'm sorry, I could not identify this person",
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        ),
      );
    }
  }

  void _removeImage() {
    setState(() {
      _image = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        GestureDetector(
          onTap: pickImage,
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[200],
            ),
            child: _image == null
                ? const Center(child: Text("Upload Image"))
                : Stack(
                    children: [
                      Hero(
                        tag: 'uploaded-image',
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.file(
                            _image!,
                            fit: BoxFit.cover,
                            width: 200,
                            height: 200,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 5,
                        left: 5,
                        child: GestureDetector(
                          onTap: _removeImage,
                          child: Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.black54,
                            ),
                            padding: const EdgeInsets.all(5),
                            child: const Icon(Icons.close,
                                color: Colors.white, size: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
        ),
        SizedBox(height: screenSize.height * 0.02),
        if (_image != null)
          InkWell(
            onTap: classifyImage,
            child: Container(
              width: screenSize.width * 0.4,
              decoration: BoxDecoration(
                color: const Color(0xff081b25),
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.all(10),
              child: const Center(
                child: Text(
                  'Who is this?',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        const SizedBox(height: 10),
        if (_isLoading)
          const CircularProgressIndicator()
        else if (_result.isNotEmpty)
          Text(
            _result,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.red),
          ),
      ],
    );
  }
}
