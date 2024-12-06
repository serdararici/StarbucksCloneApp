import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starbucks_clone_app/constants/colors.dart';
import 'package:starbucks_clone_app/models/authentication_model.dart';
import 'package:starbucks_clone_app/ui/views/authantication/forget_password_page.dart';
import 'package:starbucks_clone_app/ui/views/authantication/register_page.dart';
import 'package:starbucks_clone_app/ui/views/mainScreen.dart';

import '../../../core/localization/localization_manager.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthenticationModel _authModel = AuthenticationModel();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = false;

  Future<void> _login() async{

    try{
      final localeManager = Provider.of<LocaleManager>(context, listen: false);
      final user = await _authModel.loginWithEmailAndPassword(emailController.text, passwordController.text);
      //Kullanıcı dğrulanmış mı ?
      if(user != null && !user.emailVerified){
        await user.sendEmailVerification();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(localeManager.translate("verifyYourEmail"))),
        );
        await _authModel.signOut();
      }else if(user != null){
        Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => MainScreen()),
        );
      }
    }catch(e){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final localeManager = Provider.of<LocaleManager>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,  // Bu özelliği false yapıyoruz, böylece klavye açıldığında buton yukarı kaymaz
      appBar: AppBar(
        title: Text(localeManager.translate("signIn")),
      ),
      body: SingleChildScrollView(  // Sayfanın tamamının kaymasını sağlıyoruz
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.asset(
                        "assets/images/starbucks.png",
                        width: 120,
                        height: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 24),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        localeManager.translate("loginInformation"),
                        style: TextStyle(
                          color: AColors.secondaryOrange,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 18),
                      TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          labelText: localeManager.translate("email"),
                          labelStyle: TextStyle(color: AColors.black),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(height: 32),
                      TextField(
                        controller: passwordController,
                        obscureText: !isPasswordVisible,
                        decoration: InputDecoration(
                          labelText: localeManager.translate("password"),
                          labelStyle: TextStyle(color: AColors.black),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              isPasswordVisible
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              setState(() {
                                isPasswordVisible = !isPasswordVisible;
                              });
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 32),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => ForgetPasswordPage()));
                        },
                        child: Text(
                          localeManager.translate("forgetPassword!"),
                          style: TextStyle(
                            color: AColors.secondaryGreen,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            // Kayıt olma sayfasına yönlendirme
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => RegisterPage()), // RegisterPage'i kendi widget'ınızla değiştirin
                            );
                          },
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: "${localeManager.translate("notMember")} ", // Normal stil
                                  style: TextStyle(
                                    color: AColors.black,
                                    fontSize: 16,
                                    decoration: TextDecoration.underline, // Alt çizgi ekler
                                  ),
                                ),
                                TextSpan(
                                  text: localeManager.translate("joinNow"), // Daha kalın stil
                                  style: TextStyle(
                                    color: AColors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    //decoration: TextDecoration.underline, // Alt çizgi ekler
                                  ),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 100), // Bu, sayfa altındaki boşluğu sağlar
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32), // Butonun çevresindeki boşluk
        child: ElevatedButton(
          onPressed: () {
            _login();
          },
          style: ElevatedButton.styleFrom(
            elevation: 7,
            backgroundColor: AColors.secondaryGreen,
            minimumSize: Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32.0),
            ),
          ),
          child: Text(
            localeManager.translate("signIn"),
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AColors.white,
            ),
          ),
        ),
      ),
    );
  }
}
