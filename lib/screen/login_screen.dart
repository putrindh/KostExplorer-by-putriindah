import 'package:flutter/material.dart';
import 'package:kosku/screen/home_page.dart';
import 'package:kosku/screen/register_screen.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
    // Implement build method to build the UI for login screen
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.all(8),
      color: Color.fromARGB(255, 232, 224, 138),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Login',
            style: TextStyle(
                fontSize: 25,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Hai, Welcome!, silahkan masukan data diri anda untuk kembali ke aplikasi Kost Explorer.",
            textAlign: TextAlign.center,
            style: TextStyle(fontFamily: 'poppins'),
          ),
          const SizedBox(
            height: 10,
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
                hintStyle: const TextStyle(color: Color.fromARGB(221, 0, 0, 0)),
                labelText: "Username",
                labelStyle: const TextStyle(color: Colors.black87)),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            obscureText: _isObscurePassword,
            decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color.fromARGB(221, 73, 11, 11))),
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
            height: 20,
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
                "Tidak Punya Akun?",
              ),
              GestureDetector(
                onTap: () {
                  // Tambahkan navigasi ke halaman pendaftaran di sini
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RegisterScreen()));
                },
                child: const Text(
                  " Sign Up.",
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
    ));
  }
}
