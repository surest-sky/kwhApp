import 'package:app/res/colors.dart';
import 'package:app/ui/common/FloatModal.dart';
import 'package:app/ui/page/webview_page/webview_action.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// @page : ToolBar
/// @name : jhf
/// @description :公共标题栏
class ToolBar extends StatefulWidget {
  ///标题文字
  String title;

  // 链接
  String link;

  ///右侧文字
  String endText;

  ///是否显示右侧
  bool isShowEnd = false;

  ///背景颜色
  Color backgroundColor = Colors.white;

  ///背景颜色
  Color backColor = ColorStyle.color_B8C0D4;

  VoidCallback? backOnTap;

  ToolBar(
      {Key? key,
      this.title = "",
      this.link = "",
      this.endText = "",
      this.isShowEnd = false,
      this.backgroundColor = Colors.white,
      this.backOnTap,
      this.backColor = ColorStyle.color_B8C0D4})
      : super(key: key);

  @override
  State<ToolBar> createState() => _ToolBarState();
}

class _ToolBarState extends State<ToolBar> {

  // 操作更多
  void actionSheet() {
    showFloatingModalBottomSheet(
      context: context,
      builder: (context) => WebviewAction(url: widget.link),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: widget.backgroundColor,
        child: SafeArea(
          top: true,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10, bottom: 6, left: 15),
                child: InkWell(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                  onTap: widget.backOnTap ?? () => Get.back(),
                  splashColor: ColorStyle.color_E2E3E8_66,
                  highlightColor: ColorStyle.color_E2E3E8_66,
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    child: Icon(
                      Icons.arrow_back,
                      color: widget.backColor,
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  widget.title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: const TextStyle(color: Colors.black87, fontSize: 16),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(15),
                child: IconButton(
                  onPressed: actionSheet,
                  icon: const Icon(Icons.more_horiz),
                ),
              ),
            ],
          ),
        ));
  }
}
