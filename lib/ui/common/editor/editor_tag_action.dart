import 'package:app/model/tag_simple_model.dart';
import 'package:app/ui/common/controller/editor_action_controller.dart';
import 'package:app/ui/core/editor/editor_controller.dart';
import 'package:app/util/widget/CustomWidget.dart';
import 'package:app/util/widget/i_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditorTagAction extends StatelessWidget {
  const EditorTagAction({Key? key}) : super(key: key);

  EditorActionController get controller => Get.put(EditorActionController());
  EditorController get editorController => Get.find();

  Widget buildListItem(String tag) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: Text("# $tag")),
            SizedBox(
              width: 50,
              child: Obx(
                () => CustomWidget.iCheckBox(
                  value: controller.selectTags.contains(tag),
                  fillColor: MaterialStateProperty.all(Colors.green),
                  onChanged: (_) {
                    controller.toggleSelectTag(tag);
                  },
                ),
              ),
            ),
          ],
        ),
        const Divider(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      color: Colors.grey.shade200,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            CustomWidget.bottomSheetBar(centerTitle: "编辑标签", actions: [
              CustomWidget.AppButton(
                height: 30,
                width: 50,
                child: const Text(
                  "确认",
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  editorController.setTags(controller.selectTags);
                  Get.back();
                },
              ),
            ]),
            const SizedBox(height: 10),
            Expanded(
              child: ICard.Card(
                context,
                child: Column(
                  children: [
                    CustomWidget.iTextField(
                      controller: controller.tagController,
                      hintText: "添加新的标签",
                      suffix: GestureDetector(
                        onTap: () {
                          controller.addTag(controller.tagController.text);
                          controller.tagController.clear();
                        },
                        child: const Icon(
                          Icons.add_circle,
                          size: 20,
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Expanded(
                      child: Obx(
                        () => ListView.builder(
                          itemBuilder: (context, int index) {
                            return buildListItem(controller.tags[index]);
                          },
                          itemCount: controller.tags.length,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
