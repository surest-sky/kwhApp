import 'package:app/res/style.dart';
import 'package:app/util/widget/ICard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class KeyPage extends StatefulWidget {
  const KeyPage({Key? key}) : super(key: key);

  @override
  State<KeyPage> createState() => _KeyPageState();
}

class _KeyPageState extends State<KeyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.styleBackgroundGray,
      appBar: AppBar(
        title: const Text("Key设置"),
        actions: [
          IconButton(onPressed: (){
            EasyLoading.showToast("重置成功");
          }, icon: const Icon(Icons.refresh))
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            SizedBox(
              child: ICard.Card(
                context,
                child: Column(
                  children: [
                    const SizedBox(height: 20),

                    const Text(
                      "请注意，请不要泄露您的key到其他地方，当被泄露后，可以从此位置, 点击右上角进行重置",
                      style: TextStyle(fontSize: 15, color: Colors.black54),
                    ),
                    const SizedBox(height: 10),

                    Row(
                      children: const [
                        Text(
                          "key: datadatadatadatadata",
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text("复制"),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
