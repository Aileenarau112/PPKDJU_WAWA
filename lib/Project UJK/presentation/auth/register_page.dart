import 'package:flutter/material.dart';

import '../../data/services/auth_service.dart';
import '../../data/local/local_storage.dart';

import '../dashboard/dashboard_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final nameController = TextEditingController();

  final emailController = TextEditingController();

  final batchController = TextEditingController();

  final trainingController = TextEditingController();

  final passwordController = TextEditingController();

  bool loading = false;

  Future<void> register() async {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Nama, Email, dan Password wajib diisi")),
      );

      return;
    }

    setState(() {
      loading = true;
    });

    try {
      final result = await AuthService().register(
        name: nameController.text,

        email: emailController.text,

        password: passwordController.text,
      );

      if (result["data"] != null) {
        final token = result["data"]["token"];

        await LocalStorage.saveToken(token);

        if (!mounted) return;

        Navigator.pushReplacement(
          context,

          MaterialPageRoute(
            builder: (context) => DashboardPage(user: result["data"]["user"]),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    } finally {
      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Register")),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            TextField(
              controller: nameController,

              decoration: const InputDecoration(
                labelText: "Nama",

                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: emailController,

              decoration: const InputDecoration(
                labelText: "Email",

                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: batchController,

              decoration: const InputDecoration(
                labelText: "Batch",

                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: trainingController,

              decoration: const InputDecoration(
                labelText: "Training ID",

                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: passwordController,

              obscureText: true,

              decoration: const InputDecoration(
                labelText: "Password",

                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,

              child: ElevatedButton(
                onPressed: loading ? null : register,

                child: loading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text("REGISTER"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
