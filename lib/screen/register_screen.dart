import 'package:flutter/material.dart';
import 'package:kosku/screen/home_page.dart';
import 'package:kosku/screen/login_screen.dart';


class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _isObscureUser = true; // Keadaan awal teks sandi tersembunyi
  void _toggleObscureUser() {
    setState(() {
      _isObscureUser = !_isObscureUser;
    });
  }

  bool _isObscurePassword = true;
  void _toggleObscureUserPassword() {
    setState(() {
      _isObscurePassword = !_isObscurePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(8),
        color: const Color.fromARGB(255, 253, 253, 253),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Register',
              style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              "Create New Account",
              textAlign: TextAlign.center,
              style: TextStyle(fontFamily: 'poppins'),
            ),
            const SizedBox(
              height: 5,
            ),
            const Divider(),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [],
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              obscureText: false,
              decoration: const InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black87)),
                  prefixIcon: Icon(
                    Icons.email,
                    size: 25,
                  ),
                  hintText: "Masukkan Email",
                  hintStyle: TextStyle(color: Colors.black87),
                  labelText: "Email",
                  labelStyle: TextStyle(color: Colors.black87)),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              obscureText: _isObscureUser,
              decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black87)),
                  prefixIcon: const Icon(
                    Icons.person,
                    size: 25,
                  ),
                  suffixIcon: InkWell(
                    onTap: _toggleObscureUser,
                    child: Icon(
                      _isObscureUser ? Icons.visibility_off : Icons.visibility,
                      color: Colors.black87,
                    ),
                  ),
                  hintText: "Masukkan Username",
                  hintStyle: const TextStyle(color: Colors.black87),
                  labelText: "Username",
                  labelStyle: const TextStyle(color: Colors.black87)),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              obscureText: _isObscurePassword,
              decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black87)),
                  prefixIcon: const Icon(
                    Icons.lock,
                    size: 25,
                  ),
                  suffixIcon: InkWell(
                    onTap: _toggleObscureUserPassword,
                    child: Icon(
                      _isObscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: Colors.black87,
                    ),
                  ),
                  hintText: "Masukkan Password",
                  hintStyle: const TextStyle(color: Colors.black87),
                  labelText: "Password",
                  labelStyle: const TextStyle(color: Colors.black87)),
            ),
            const SizedBox(
              height: 10,
            ),
            Card(
              color: Colors.black87,
              elevation: 5,
              child: InkWell(
                splashColor: Colors.white,
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyHomePage(
                                title: 'Home',
                              ))); // Navigasi ke HomePage
                },
                child: const Center(
                  child: Text(
                    'Masuk',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Jika Anda sudah memiliki akun",
                ),
                GestureDetector(
                  onTap: () {
                    // Tambahkan navigasi ke halaman pendaftaran di sini
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Login()));
                  },
                  child: const Text(
                    " silakan masuk.",
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
