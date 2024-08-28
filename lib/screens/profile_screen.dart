import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; 

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ImagePicker _picker = ImagePicker();
  XFile? _imageFile;
  bool _receiveNotifications = false;

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _imageFile = pickedFile;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor, 
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/cambio_chaco_assets/Logo-chico-transparente.png',
              fit: BoxFit.contain,
              height: screenHeight * 0.06,
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
              ),
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
            ),
          ),
        ],
      ),
      body: Center(
        child: Container(
          height: screenHeight * 0.9,
          margin: EdgeInsets.only(
            right: screenHeight * 0.01,
            left: screenHeight * 0.01,
            bottom: screenHeight * 0.03,
          ),
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30.0), 
              bottomRight: Radius.circular(30.0),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 5,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Column(
            children: [
              SizedBox(height: screenHeight * 0.03),
              Text(
                AppLocalizations.of(context)!.profileTitle, 
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: screenHeight * 0.03),
              Stack(
                children: [
                  CircleAvatar(
                    radius: screenWidth * 0.1,
                    backgroundColor: Theme.of(context).primaryColor,
                    backgroundImage: _imageFile == null
                        ? null
                        : FileImage(File(_imageFile!.path)),
                    child: _imageFile == null
                        ? Image.asset(
                            'assets/general_icons/icono-Usuario.png', 
                            color: Colors.white, 
                            width: screenWidth * 0.15,
                          )
                        : null,
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) => BottomSheet(
                            onClosing: () {},
                            builder: (context) => Wrap(
                              children: [
                                ListTile(
                                  leading: const Icon(Icons.camera_alt),
                                  title: Text(AppLocalizations.of(context)!.cameraOption), 
                                  onTap: () {
                                    _pickImage(ImageSource.camera);
                                    Navigator.of(context).pop();
                                  },
                                ),
                                ListTile(
                                  leading: const Icon(Icons.photo_library),
                                  title: Text(AppLocalizations.of(context)!.galleryOption), 
                                  onTap: () {
                                    _pickImage(ImageSource.gallery);
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      child: CircleAvatar(
                        backgroundColor: Theme.of(context).primaryColor,
                        child: const Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.08),
              Text(
                AppLocalizations.of(context)!.fullNamePlaceholder, 
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(height: screenHeight * 0.08),
              ListTile(
                title: Text(
                  AppLocalizations.of(context)!.receiveNotifications, 
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                trailing: Switch(
                  value: _receiveNotifications,
                  onChanged: (value) {
                    setState(() {
                      _receiveNotifications = value;
                    });
                  },
                  activeColor: Theme.of(context).primaryColor,
                  inactiveTrackColor: Colors.grey, 
                ),
              ),
              SizedBox(height: screenHeight * 0.08),
              ElevatedButton(
                onPressed: () {
                  // Acción para Datos Personales
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  padding: EdgeInsets.symmetric(vertical: screenHeight * 0.003),
                  minimumSize: Size(screenWidth * 0.8, screenHeight * 0.07),
                ),
                child: Text(
                  AppLocalizations.of(context)!.personalDataButton, 
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              ElevatedButton(
                onPressed: () {
                  // Acción para Cambiar Contraseña
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  padding: EdgeInsets.symmetric(vertical: screenHeight * 0.003),
                  minimumSize: Size(screenWidth * 0.8, screenHeight * 0.07),
                ),
                child: Text(
                  AppLocalizations.of(context)!.changePasswordButton, 
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              ElevatedButton(
                onPressed: () {
                  // Acción para Cambiar PIN
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  padding: EdgeInsets.symmetric(vertical: screenHeight * 0.003),
                  minimumSize: Size(screenWidth * 0.8, screenHeight * 0.07),
                ),
                child: Text(
                  AppLocalizations.of(context)!.changePinButton, 
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
