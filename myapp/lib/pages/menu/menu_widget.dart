import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/main.dart';
import 'package:myapp/pages/login/login_screen.dart';
import 'package:myapp/pages/my_page/my_page.dart';
import 'package:myapp/pages/setting/setting_page.dart';

class MenuWidget extends StatelessWidget {
  final Function(String)? onItemClick;

  const MenuWidget({Key? key, this.onItemClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pink.shade200,
      padding: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          CircleAvatar(
            radius: 65,
            backgroundColor: Colors.white,
            backgroundImage: AssetImage('myapp/icons/computer.png'),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            '일병 홍길동',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30,
                fontFamily: 'BalsamiqSans'),
          ),
          SizedBox(
            height: 20,
          ),
          Divider(),
          sliderItem('홈 페이지', Icons.home, context),
          sliderItem('시설 예약하기', Icons.add_circle, context),
          sliderItem('나의 예약', Icons.notifications_active, context),
          sliderItem('신고하기', Icons.question_answer_rounded, context),
          sliderItem('앱 설정', Icons.settings, context),
          sliderItem('마이 페이지', Icons.person, context),
          sliderItem('로그아웃', Icons.logout, context),
        ],
      ),
    );
  }

  Widget sliderItem(String title, IconData icons, BuildContext context) => ListTile(
    title: Text(
      title,
      style: TextStyle(color: Colors.white, fontFamily: 'BalsamiqSans_Regular'),
    ),
    leading: Icon(
      icons,
      color: Colors.white,
    ),
    onTap: () {
      onItemClick!(title);
      if(title == "홈페이지"){
        PageRoute: () => Get.to(MyApp());
      } else if(title == "시설 예약하기"){
        PageRoute: () => Get.to(MyApp());
      } else if(title == "나의 예약"){
        PageRoute: () => Get.to(MyApp());
      } else if(title == "신고하기"){
        PageRoute: () => Get.to(MyApp());
      } else if(title == "앱 설정"){
        Get.to(SettingPage());
      } else if(title == "마이 페이지"){
        Get.to(MyPage());
      }else if(title == "로그아웃"){
        CoolAlert.show(
          context: context,
          type: CoolAlertType.confirm,
          text: "로그아웃 하시겠습니까?",
          confirmBtnColor: Colors.pink.shade200,
          onConfirmBtnTap: () async {
            Get.to(LoginPage());
          }
        );
      }
    }
  );
}