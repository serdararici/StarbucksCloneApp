import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starbucks_clone_app/core/localization/localization_manager.dart';
import 'package:starbucks_clone_app/core/theme/theme_manager.dart';
import 'package:starbucks_clone_app/ui/views/settings_page/language_page.dart';

import '../../../constants/colors.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context);
    final localeManager = Provider.of<LocaleManager>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AColors.mainGrey,
        elevation: 0,
        title: Text(
          localeManager.translate("settings"),
          style: TextStyle(
            color: Colors.white,
            fontSize: 18 ,
            fontWeight: FontWeight.w400,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,color: Colors.white,size: 20,),
          onPressed: (){
            Navigator.pop(context);
          },
        )


      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SettingsProfileWidget(),
              SizedBox(height: 24,),
              SettingsTitleRow(title: "My Account"),
              SettingsRowWidget(title: "Account Settings", icon: Icon(Icons.person_2_outlined),targetPage: LanguagePage()),
              Divider(color: AColors.mediumGrey), // Alt çizgi
              SettingsRowWidget(title: "Account History", icon: Icon(Icons.file_present_outlined,),targetPage: LanguagePage()),
              Divider(color: AColors.mediumGrey), // Alt çizgi
              SettingsRowWidget(title: "Invite Your Friends", icon: Icon(Icons.mail_outline,),targetPage: LanguagePage()),
              Divider(color: AColors.mediumGrey), // Alt çizgi
              SettingsRowWidget(title: "Miles&Smiles", icon: Icon(Icons.play_circle_filled_outlined,),targetPage: LanguagePage()),
              Divider(color: AColors.mediumGrey), // Alt çizgi
              SettingsRowWidget(title: "EnterStarCode", icon: Icon(Icons.star_border,),targetPage: LanguagePage()),
              Divider(color: AColors.mediumGrey), // Alt çizgi
              SettingsRowWidget(title: "Garmin", icon: Icon(Icons.mobile_friendly_outlined,),targetPage: LanguagePage()),
              Divider(color: AColors.mediumGrey), // Alt çizgi
              SizedBox(height: 24,),
              SettingsTitleRow(title: "Notification Preferences"),
              SettingsRowWidget(title: "Email & SMS & Notification", icon: Icon(Icons.mail_outline,),targetPage: LanguagePage()),
              Divider(color: AColors.mediumGrey), // Alt çizgi
              SizedBox(height: 24,),
              SettingsTitleRow(title: "Language Preferences"),
              SettingsRowWidget(title: "Change Language", icon: Icon(Icons.sort_by_alpha_outlined,), targetPage: LanguagePage(),),
              Divider(color: AColors.mediumGrey), // Alt çizgi
              SizedBox(height: 24,),
              SettingsTitleRow(title: "Theme Preferences"),
              SettingsRowWithSwitchButtonWidget(title: "Change Theme", icon: Icon(Icons.color_lens_outlined,),),
              Divider(color: AColors.mediumGrey), // Alt çizgi
              SizedBox(height: 24,),
              SettingsTitleRow(title: "F.A.Q"),
              SettingsRowWidget(title: "Frequently Asked Questions", icon: Icon(Icons.help_outline,),targetPage: LanguagePage()),
              Divider(color: AColors.mediumGrey), // Alt çizgi
              SizedBox(height: 24,),
              SettingsTitleRow(title: "Contact Us"),
              SettingsRowWidget(title: "Contact Form", icon: Icon(Icons.mail_outline,),targetPage: LanguagePage()),
              Divider(color: AColors.mediumGrey), // Alt çizgi
              SettingsRowWidget(title: "Starbucks Assitant", icon: Icon(Icons.chat_bubble_outline,),targetPage: LanguagePage()),
              Divider(color: AColors.mediumGrey), // Alt çizgi
              SizedBox(height: 24,),
              SettingsTitleRow(title: "Policies"),
              SettingsRowWidget(title: "Privacy Note", icon: Icon(Icons.handshake_outlined,),targetPage: LanguagePage()),
              Divider(color: AColors.mediumGrey), // Alt çizgi
              SettingsRowWidget(title: "Personal Data Information Notice", icon: Icon(Icons.info_outline,),targetPage: LanguagePage()),
              Divider(color: AColors.mediumGrey), // Alt çizgi
              SettingsRowWidget(title: "Commercial Information Text", icon: Icon(Icons.mail_outline,),targetPage: LanguagePage()),
              Divider(color: AColors.mediumGrey), // Alt çizgi
              SizedBox(height: 24,),
              Container(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(onPressed: (){},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AColors.secondaryGreen),
                  child: Text("SIGN OUT",style: TextStyle(
                    fontSize: 18,
                    color: AColors.white,
                  ),),
                ),
              ),
              SizedBox(height: 16,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("App version 2.4.9 Build 155 Pistachio Latte \n Made with Love in Istanbul",
                    style: TextStyle(fontSize: 12,),),
                ],
              ),
              SizedBox(height: 24,),
            ],
          ),
        ),
      ),
    );
  }
}

class SettingsProfileWidget extends StatelessWidget {
  const SettingsProfileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 25, // CircleAvatar boyutu
                backgroundColor: AColors.mediumGrey, // Gri arka plan rengi
                child: Icon(
                  Icons.person, // Profil simgesi
                  color: Colors.white, // Simgenin beyaz rengi
                  size: 40, // Simgenin boyutu
                ),
              ),
              SizedBox(height: 8), // CircleAvatar ile yazı arasında boşluk
              Text(
                "Upload",
                style: TextStyle(
                  fontSize: 12, // Yazı boyutu
                  fontWeight: FontWeight.normal, // Yazı kalınlığı
                  color: Colors.black, // Yazı rengi
                ),
              ),
            ],
          ),
          SizedBox(width: 15,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Serdar Arıcı",
                style: TextStyle(
                  fontSize: 18,
                  color: AColors.secondaryOrange,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 2,),
              Text("serdararici3@gmail.com",
                style: TextStyle(
                  fontSize: 14,
                  color: AColors.black,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SettingsRowWidget extends StatelessWidget {
  const SettingsRowWidget({
    super.key, required this.title, required this.icon, required this.targetPage,
  });
  final String title;
  final Icon icon;
  final Widget targetPage ;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: icon,
        title: Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        trailing: Icon(Icons.arrow_forward_ios, color: Colors.black, size: 20,),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => targetPage));
        },
      ),
    );
  }
}

class SettingsRowWithSwitchButtonWidget extends StatelessWidget {
  const SettingsRowWithSwitchButtonWidget({
    super.key, required this.title, required this.icon,
  });
  final String title;
  final Icon icon;
  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context);
    return Container(
      height: 45,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: icon,
        title: Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        trailing: Switch(
          value: themeManager.themeMode == ThemeMode.dark,
          onChanged: (value) {
            themeManager.toggleTheme();
          },
          activeColor: Colors.white, // Açık düğme rengi
          activeTrackColor: Colors.lightGreen, // Açık track rengi
          inactiveThumbColor: Colors.white, // Kapalı düğme rengi
          inactiveTrackColor: AColors.mediumGrey, // Kapalı track rengi
        ),
        onTap: () {
        },
      ),
    );
  }
}

class SettingsTitleRow extends StatelessWidget {
  final String title;

  const SettingsTitleRow({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: AColors.secondaryOrange,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
