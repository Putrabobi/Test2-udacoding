import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  State<LoginPage>createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late Color mycolor;
  late Size MediaSize;
  TextEditingController EmailController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();
  bool rememberUser = false;

  Widget build(BuildContext context) {
  mycolor = Theme.of(context).primaryColor;
  MediaSize = MediaQuery.of(context).size;
  return Container(
    decoration: BoxDecoration(
      color: mycolor,
      image: DecorationImage(
        image: const AssetImage("assets/images/kt.jpg"),
        fit: BoxFit.cover,
        colorFilter: ColorFilter.mode(mycolor.withOpacity(0.2), BlendMode.dstATop),
      ),
    ),
    child: Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        alignment: Alignment.center, // Menambah alignment untuk memastikan tengah
        children: [
          Positioned(top: 80, child:  Center(
              child: Image.asset(
                "assets/images/12.png",
                width: 150,
                height: 150,
              ),
            ),
            ),
          Positioned(bottom: -5, child: _buildBattom()),
        ],
      ),
    ),
  );
}


   

  Widget _buildBattom(){
    return SizedBox(
      width: MediaSize.width,
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),

          )

        ),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: _buildFrom(),
        ),
      )
    );
  }

  Widget _buildFrom(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "WELCOME",
          style: TextStyle(
            color: mycolor, fontSize: 20, fontWeight: FontWeight.w500),
            
        ),
        _buildGreyText("Silahkan Login"),
        const SizedBox(height: 60,),
        _buildGreyText("Email Addres"),
        _buildInputField(EmailController),
        const SizedBox(height: 40,),
        _buildGreyText("Password"),
        _buildInputField(PasswordController, isPassword: true),
        const SizedBox(height: 20,),
        _buildRememberForgot(),
        const SizedBox(height: 20,),
        _buildLoginButton(),
        const SizedBox(height: 20,),
        _buiildOtherLogin(),
        
      ],
    );
  }
  Widget _buildGreyText(String text){
    return Text(
      text,
      style: const TextStyle(
        color: Colors.grey,
        fontSize: 12,
      ),
    );
  }
  Widget _buildInputField(TextEditingController controller,{isPassword = false}){
    return TextField(
      controller: controller,
      decoration:  InputDecoration(
        suffixIcon: isPassword ? Icon(Icons.remove_red_eye) : Icon(Icons.done),
      ),
      obscureText: isPassword,
    );
  }
  Widget _buildRememberForgot(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(value: rememberUser, 
            onChanged: (value){
              setState(() {
                rememberUser = value!;
              });
            }),
          _buildGreyText("Remember me"),
          ],
        ),
        TextButton(
              onPressed: (){},
              child: _buildGreyText(" i forgot my password")
              
              ),
      ],

    );  

  
  }
 Widget _buildLoginButton(){
  return ElevatedButton(
    onPressed: () {
      debugPrint("Email : ${EmailController.text}");
      debugPrint("Password: ${PasswordController.text}");

      // Tampilkan popup alert
      _showLoginAlert();
    },
    style: ElevatedButton.styleFrom(
      shape: const StadiumBorder(),
      elevation: 20,
      shadowColor: mycolor,
      minimumSize: const Size.fromHeight(60),
    ),
    child: const Text("LOGIN"),
  );
}

void _showLoginAlert() {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Login Successful"),
        content: Text("Welcome, ${EmailController.text}!"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Tutup dialog
            },
            child: Text("OK"),
          ),
        ],
      );
    },
  );
}

  Widget _buiildOtherLogin(){
    return Center(
      child: Column(
      
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               _buildGreyText("Don't you have an account yet?"),
               GestureDetector(
              onTap: () {
                // Pindah ke halaman registrasi
                Navigator.pushNamed(context, '/register');
              },
              child: Text(
                "Register now",
                style: TextStyle(
                  color: Colors.blue, // Atur warna teks sesuai keinginan Anda
                ),
              ),
            ),

            ],
          ),
         
          const SizedBox(height: 10,), 
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Tab(icon: Image.asset("assets/images/11.png")),
              Tab(icon: Image.asset("assets/images/99.png")),
              Tab(icon: Image.asset("assets/images/90.png")),             
            ],
          )
        ],
        ),
    );
  }
}
 