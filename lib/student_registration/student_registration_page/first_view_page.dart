import 'package:flutter/material.dart';
import 'package:notification/widgets/general_text_form_fields.dart';
import 'package:provider/provider.dart';
import 'package:notification/student_registration/student_registration_controllers/first_view_controller.dart';
import 'package:notification/configuration.dart' as config;

class FirstViewPage extends StatelessWidget {
  const FirstViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final firstViewController = context.watch<FirstViewController>();
    firstViewController.size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Imagen superior ocupando toda la parte superior
              Container(
                width: firstViewController.size.width,
                height: firstViewController.size.height * 0.3,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image:
                        AssetImage('assets/logos/secondary_logo_unilife.png'),
                  ),
                ),
              ),
              SizedBox(
                height: firstViewController.size.height * 0.075,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: firstViewController.size.width * 0.05,
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'CREATE AN ACCOUNT',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Register for discounts on all your fave brands',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 5),
              TextFormFieldEmail(
                mediaWidth: firstViewController.size.width * 0.05,
                controller: firstViewController.emailController,
                enabled: true,
              ),
              const Divider(color: Colors.transparent),
              TextFormFieldPassword(
                mediaWidth: firstViewController.size.width * 0.05,
                controller: firstViewController.passwordController,
                enabled: true,
                validator: config.passwordValidator,
                labelText: 'PASSWORD',
              ),
              const Divider(color: Colors.transparent),
              // Otros campos de entrada
              TextFormFieldGeneral(
                mediaWidth: firstViewController.size.width * 0.05,
                controller: TextEditingController(),
                enabled: true,
                labelText: 'FIRST NAME',
              ),
              const Divider(color: Colors.transparent),
              TextFormFieldGeneral(
                mediaWidth: firstViewController.size.width * 0.05,
                controller: TextEditingController(),
                enabled: true,
                labelText: 'LAST NAME',
              ),
              const Divider(color: Colors.transparent),
              TextFormFieldGeneral(
                mediaWidth: firstViewController.size.width * 0.05,
                controller: TextEditingController(),
                enabled: true,
                labelText: 'WHAT ARE YOU PRONOUNS',
              ),
              const Divider(color: Colors.transparent),
              TextFormFieldGeneral(
                mediaWidth: firstViewController.size.width * 0.05,
                controller: TextEditingController(),
                enabled: true,
                labelText: 'DATE OF BIRTH',
                inputType: TextInputType.datetime,
              ),
              const Divider(color: Colors.transparent),
              // Checkboxes and buttons
              Row(
                children: [
                  Checkbox(
                    value: firstViewController.acceptTerms,
                    onChanged: (value) {
                      firstViewController.setAcceptTerms(value ?? false);
                    },
                  ),
                  const Text('I Accept Terms & Conditions'),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: firstViewController.receiveEmail,
                    onChanged: (value) {
                      firstViewController.setReceiveEmail(value ?? false);
                    },
                  ),
                  const Text('I want to receive email news'),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  // Handle continue to login
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(
                    firstViewController.size.width * 0.9,
                    50,
                  ),
                  backgroundColor: config.primaryColor,
                ),
                child: const Text('CONTINUE'),
              ),
              TextButton(
                onPressed: () {
                  // Handle go back
                },
                child: const Text('GO BACK'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
