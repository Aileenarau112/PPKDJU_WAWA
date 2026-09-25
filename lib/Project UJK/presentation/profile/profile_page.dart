import 'package:flutter/material.dart';

import '../../data/services/profile_service.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Map<String, dynamic>? user;

  final nameController = TextEditingController();

  bool loading = true;

  @override
  void initState() {
    super.initState();

    loadProfile();
  }

  Future<void> loadProfile() async {
    final data = await ProfileService().getProfile();

    setState(() {
      user = data;

      nameController.text = data["name"];

      loading = false;
    });
  }

  Future<void> updateProfile() async {
    final result = await ProfileService().updateProfile(nameController.text);

    setState(() {
      user = result;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Profile berhasil diperbarui")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),

      body: loading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
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

                  const SizedBox(height: 20),

                  Text(
                    "Email : ${user!["email"]}",

                    style: const TextStyle(fontSize: 16),
                  ),

                  const SizedBox(height: 30),

                  SizedBox(
                    width: double.infinity,

                    child: ElevatedButton(
                      onPressed: updateProfile,

                      child: const Text("SIMPAN"),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
