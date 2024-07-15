import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

//Imported to use the authServiceProvider method
//
import "package:funkyfitness/features/auth/repository/auth_service.dart";

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  "assets/images/dumbbell-logo.png",
                  height: 250,
                ),
              ),

              const Text(
                "Welcome To Funky Fitness", 
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              const Spacer(),

              Padding(
                padding: const EdgeInsets.only(bottom: 45),
                child: GestureDetector(
                  onTap: () async {
                    await ref.read(authServiceProvider).signInWithGoogle();
                  },
                  child:Image. asset(
                    "assets/images/google-signin.png",
                    height: 70, 
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

