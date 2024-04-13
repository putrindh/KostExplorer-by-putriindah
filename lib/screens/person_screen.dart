import 'package:flutter/material.dart';

class PersonScreen extends StatefulWidget {
  const PersonScreen({Key? key}) : super(key: key);

  @override
  _PersonScreenState createState() => _PersonScreenState();
}

class _PersonScreenState extends State<PersonScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Person"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
             Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text("Username"),
            ),
            SizedBox(height: 10,),
            Center(
              child: Container(
                width: 370,
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.person,
                      size: 25,
                    ),
                    hintText: "Putri Indah",
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black87)),
                    suffixIcon: InkWell(
                      child: Icon(
                        Icons.edit,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text("Email"),
            
            ),
            SizedBox(height: 10,),
            Center(
              child: Container(
                width: 370,
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.person,
                      size: 25,
                    ),
                    hintText: " putri.indah@gmail.com",
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black87)),
                    suffixIcon: InkWell(
                      child: Icon(
                        Icons.edit,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ),
              ),
            ),
             SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text("Tanggal Lahir"),
            ),
            SizedBox(height: 10,),
            Center(
              child: Container(
                width: 370,
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.person,
                      size: 25,
                    ),
                    hintText: "1 Januari 2003",
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black87)),
                    suffixIcon: InkWell(
                      child: Icon(
                        Icons.edit,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
