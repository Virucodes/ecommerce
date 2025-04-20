import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final nameController = TextEditingController();
    final emailController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: colorScheme.primary,
        centerTitle: true,
      ),
      backgroundColor: colorScheme.surface,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 60,
              backgroundColor: Colors.grey,
              child: Icon(
                Icons.person,
                size: 60,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            _buildTextField("Full Name", nameController, Icons.person, colorScheme),
            const SizedBox(height: 10),
            _buildTextField("Email", emailController, Icons.email, colorScheme),
            const SizedBox(height: 30),
            FilledButton.icon(
              
              onPressed: () {},
              
              icon: const Icon(Icons.save),
              label: const Text("Save Profile",
              ),
              style: FilledButton.styleFrom(
                backgroundColor: colorScheme.inversePrimary,
                foregroundColor: Colors.white,
                padding:  EdgeInsets.all(20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(
    String label,
    TextEditingController controller,
    IconData icon,
    ColorScheme colorScheme,
  ) {
    return TextFormField(
      controller: controller,
      style: TextStyle(color: colorScheme.inversePrimary),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: colorScheme.inversePrimary),
        prefixIcon: Icon(icon, color: colorScheme.inversePrimary),
        filled: true,
        fillColor: colorScheme.primary,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
