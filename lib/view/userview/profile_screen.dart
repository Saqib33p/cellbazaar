import 'package:cellbazar/utils/appconstants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            Container(
              margin: EdgeInsets.only(right: 12),
              child: Text(
                'Favourite',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              //profile picture and name
              SizedBox(
                height: 20,
              ),
              Container(
                height: Get.height / 3.7,
                width: Get.width / 1,
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/images/profile.jpg'),
                      radius: 60,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Jonathan Patterson',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text('hello@reallygreatsite.com')
                  ],
                ),
              ),
              //General setting
              Container(
                height: Get.height / 15,
                width: Get.width / 1,
                decoration: BoxDecoration(color: AppConstants.appMainColor),
                child: Container(
                  margin: EdgeInsets.only(left: 20),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'General Settings',
                    style: TextStyle(
                        color: AppConstants.textColorWhite, fontSize: 16),
                  ),
                ),
              ),
              //mode, change password, language
              Container(
                height: Get.height / 3.6,
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(
                        Icons.sunny,
                        color: AppConstants.appMainColor,
                        size: 35,
                      ),
                      title: Text('Mode'),
                      subtitle: Text("Dark light"),
                      trailing: Switch(
                        value: true,
                        onChanged: (value) {},
                      ),
                    ),
                    ListTile(
                        leading: Icon(
                          Icons.key,
                          size: 35,
                          color: AppConstants.appMainColor,
                        ),
                        title: Text('Change Password'),
                        trailing: Icon(
                          Icons.navigate_next_outlined,
                          color: AppConstants.appMainColor,
                        )),
                    ListTile(
                        leading: Icon(
                          Icons.abc,
                          color: AppConstants.appMainColor,
                          size: 35,
                        ),
                        title: Text('Leanguage'),
                        trailing: Icon(
                          Icons.navigate_next_outlined,
                          color: AppConstants.appMainColor,
                        ))
                  ],
                ),
              ),
              // heding information
              Container(
                height: Get.height / 15,
                width: Get.width / 1,
                decoration: BoxDecoration(
                  color: AppConstants.appMainColor,
                ),
                child: Container(
                  margin: EdgeInsets.only(left: 20),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Information',
                    style: TextStyle(
                        color: AppConstants.textColorWhite, fontSize: 16),
                  ),
                ),
              ),
              Container(
                height: Get.height / 3.6,
                child: Column(
                  children: [
                    ListTile(
                        leading: Icon(
                          Icons.phone_android,
                          color: AppConstants.appMainColor,
                          size: 35,
                        ),
                        title: Text('About App'),
                        trailing: Icon(
                          Icons.navigate_next_outlined,
                          color: AppConstants.appMainColor,
                        )),
                    ListTile(
                        leading: Icon(
                          Icons.insert_drive_file_outlined,
                          color: AppConstants.appMainColor,
                          size: 35,
                        ),
                        title: Text('Terms and Conditions'),
                        trailing: Icon(
                          Icons.navigate_next_outlined,
                          color: AppConstants.appMainColor,
                        )),
                    ListTile(
                        leading: Icon(
                          Icons.privacy_tip,
                          color: AppConstants.appMainColor,
                          size: 35,
                        ),
                        title: Text('Privacy and policy'),
                        trailing: Icon(
                          Icons.navigate_next_outlined,
                          color: AppConstants.appMainColor,
                        ))
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
