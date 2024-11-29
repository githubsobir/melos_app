import 'package:common/base_textfield.dart';
import 'package:common/path_images.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Авторизоваться"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(PathImages.carLogin,height: 212,width: 212,),
              BaseTextField(
                title: "Контактный телефон",
                hint: "+998 __ ___ __ __",
              ),
              SizedBox(height: 16),
              BaseTextField(
                title: "Пароль",
              ),
              SizedBox(height: 16),
              Text(
                "Забыли пароль?",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
