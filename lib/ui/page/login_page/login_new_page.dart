import 'package:app/base/get/get_common_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'login_controller.dart';

class LoginNewPage extends GetCommonView<LoginController> {
  const LoginNewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 40, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "你好, ",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const Text(
              "欢迎登录斑点熊",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 50),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey.withOpacity(0.2),
                    width: 1.0,
                  ),
                ),
              ),
              child: Row(
                children: [
                  const Text(
                    "+86",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(width: 30),
                  Expanded(
                    child: TextField(
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                        hintText: '请输入手机号码',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 40,
              child: ElevatedButton(
                onPressed: () async {
                  if (await controller.getCode()) {
                    controller.setVerifyCodeDisable();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginCodePage()),
                    );
                  }
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith(
                    (states) => Colors.blueAccent,
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(50.0),
                      ),
                    ),
                  ),
                ),
                child: Text(controller.verifyCodeText),
                // style: ElevatedButton.styleFrom(
                //   backgroundColor: Colors.blue,
                // ),
              ),
            )
            // ElevatedButton(onPressed: () => {}, child: const Text("登录&注册"))
          ],
        ),
      ),
    );
  }
}

class LoginCodePage extends GetCommonView<LoginController> {
  const LoginCodePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 40, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              child: const Icon(Icons.arrow_back_ios),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            const SizedBox(height: 20),
            const Text(
              "请输入验证码",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 50),
            OtpTextField(
              numberOfFields: 5,
              borderColor: Color(0xFF512DA8),
              showFieldAsBox: true,
              onCodeChanged: (String code) {},
              onSubmit: (String code) {
                  controller.login(code);
              }, // end onSubmit
            ),
            const SizedBox(height: 50),
            // Container(
            //   padding: EdgeInsets.symmetric(horizontal: 50),
            //   width: double.infinity,
            //   height: 40,
            //   child: ElevatedButton(
            //     onPressed: () => {
            //
            //     },
            //     style: ButtonStyle(
            //       backgroundColor: MaterialStateProperty.resolveWith(
            //           (states) => Colors.blueAccent),
            //       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            //         const RoundedRectangleBorder(
            //           borderRadius: BorderRadius.all(
            //             Radius.circular(50.0),
            //           ),
            //         ),
            //       ),
            //     ),
            //     child: const Text("登录 & 注册"),
            //     // style: ElevatedButton.styleFrom(
            //     //   backgroundColor: Colors.blue,
            //     // ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
