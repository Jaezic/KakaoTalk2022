import 'package:KakaoTalk/common/widget/common_button.dart';
import 'package:KakaoTalk/pages/resetPassword/page/resetPassword_view_page.dart';
import 'package:KakaoTalk/pages/userLogin/controller/userlogin_view_controller.dart';
import 'package:KakaoTalk/pages/userRegister/page/userRegister_view_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserLoginViewPage extends StatelessWidget {
  const UserLoginViewPage({super.key});

  static const String url = '/user_login';

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserLoginViewController());
    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
        child: Center(
          child: SizedBox(
            width: GetPlatform.isMobile ? null : 500,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Kakao',
                    style: TextStyle(fontSize: 30),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  UserLoginViewController.textField(
                    textEditController: controller.idFieldController,
                    hintText: '아이디',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  UserLoginViewController.textField(textEditController: controller.passFieldController, hintText: '비밀번호', pass: true),
                  const SizedBox(
                    height: 45,
                  ),
                  CommonButton(
                      padding: EdgeInsets.zero,
                      onTap: () {
                        controller.userLogin();
                      },
                      child: Container(
                          width: GetPlatform.isMobile ? null : 460,
                          height: 50,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(2.5), color: const Color.fromARGB(255, 254, 229, 0)),
                          child: const Center(
                              child: Text(
                            '로그인',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )))),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () => Get.toNamed(UserRegisterViewPage.url),
                        child: const Text(
                          '회원가입',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.black54),
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () => Get.toNamed(ResetPasswordViewPage.url),
                        child: const Text(
                          '비밀번호 찾기',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.black54),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
