import 'package:KakaoTalk/common/api_service.dart';
import 'package:KakaoTalk/common/common.dart';
import 'package:KakaoTalk/common/service_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordViewController extends GetxController {
  static TextStyle get _hintStyle => const TextStyle(color: Colors.black54, fontSize: 14);
  static TextStyle get _textStyle => const TextStyle(color: Colors.black, fontSize: 14);

  Rxn<DateTime> birthday = Rxn();
  RxString birthdayString = RxString('');
  TextEditingController idFieldController = TextEditingController();
  TextEditingController nameFieldController = TextEditingController();

  static Widget textField({required textEditController, required String hintText, bool pass = false}) {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 0.6, color: Colors.black.withOpacity(0.3))),
      ),
      child: TextField(
        controller: textEditController,
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          hintStyle: _hintStyle,
          suffix: GestureDetector(
            onTap: textEditController.clear,
            child: const Icon(
              Icons.clear_outlined,
              size: 17,
            ),
          ),
        ),
        obscureText: pass,
        cursorColor: Colors.black38,
        style: _textStyle,
      ),
    );
  }

  Future<void> findPassword() async {
    if (idFieldController.text.isEmpty || nameFieldController.text.isEmpty || birthday.value == null) {
      Common.showSnackBar(messageText: "모든 항목을 작성해주세요.");
      return;
    }
    ApiResponse<String> response = await ApiService.instance.findPassword(
      id: idFieldController.text,
      name: nameFieldController.text,
      birthday: birthday.value!,
    );
    if (response.result) {
      Get.back();
      Common.showSnackBar(messageText: "비밀번호가 \"0000\"으로 초기화되었습니다.");
    } else {
      Common.showSnackBar(messageText: response.errorMsg);
    }
  }

  void onBirthDayDateChanged(DateTime dateTime) {
    birthday.value = dateTime;
    birthdayString.value = "${dateTime.year}-${dateTime.month}-${dateTime.day}";
  }

  Future<T?> openBirthDayPickerPopup<T>({required BuildContext context}) {
    return showCupertinoModalPopup(
      barrierColor: Colors.black54,
      context: context,
      builder: ((context) {
        return Container(
          color: Colors.white,
          height: 300,
          child: SafeArea(
            top: false,
            child: CupertinoDatePicker(
              onDateTimeChanged: onBirthDayDateChanged,
              mode: CupertinoDatePickerMode.date,
            ),
          ),
        );
      }),
    );
  }

  @override
  void onClose() {
    idFieldController.dispose();
    nameFieldController.dispose();
    super.onClose();
  }
}
