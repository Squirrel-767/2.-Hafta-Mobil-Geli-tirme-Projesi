import 'package:flutter/material.dart';
import '../main.dart'; // darkThemeNotifier'ı kullanabilmek için
import 'login_screen.dart'; 

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool notification = true;
  late bool darkMode = darkThemeNotifier.value;
  String gender = "Erkek";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ayarlar"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          SwitchListTile(
            title: const Text("Bildirimler"),
            value: notification,
            onChanged: (bool value) {
              setState(() {
                notification = value;
              });
            },
          ),

          SwitchListTile(
            title: const Text("Karanlık Mod"),
            value: darkMode,
            onChanged: (bool value) {
              setState(() {
                darkMode = value;
              });
              darkThemeNotifier.value = value;
            },
          ),
          const SizedBox(height: 10),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: darkMode ? Colors.blue.shade900 : Colors.blue.shade100,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Seçmiş Olduğunuz Ayarlar",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text("Bildirimler: ${notification ? "Açık" : "Kapalı"}"),
                Text("Karanlık Mod: ${darkMode ? "Açık" : "Kapalı"}"),
              ],
            ),
          ),
          const SizedBox(height: 30),

          // Çıkış Yap (Log Out) Butonu
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              icon: const Icon(Icons.logout),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                  (route) => false,
                );
              },
              label: const Text('Çıkış Yap', style: TextStyle(fontSize: 16)),
            ),
          ),
        ],
      ),
    );
  }
}