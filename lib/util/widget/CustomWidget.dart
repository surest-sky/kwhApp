import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomWidget {
  static Widget buildSliverAppBar(String text,
      {Widget? leading, List<Widget>? actions}) {
    return SliverAppBar(
      expandedHeight: 80.0,
      pinned: true,
      leading: leading,
      actions: actions,
      flexibleSpace: FlexibleSpaceBar(
        //伸展处布局
        centerTitle: false,
        title: Text(
          text,
        ),
        titlePadding: const EdgeInsets.only(left: 15, bottom: 15),
        //标题边距
        collapseMode: CollapseMode.parallax,
        //视差效果
        stretchModes: const [
          StretchMode.blurBackground,
          StretchMode.zoomBackground
        ],
      ),
    );
  }

  static Widget tag(String tagName, {Function()? onTap}) {
    return Container(
      color: Colors.grey.shade200,
      padding: const EdgeInsets.all(6),
      margin: const EdgeInsets.only(left: 5),
      child: InkWell(
        onTap: onTap,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('#$tagName', style: const TextStyle(color: Colors.orange)),
            const Padding(
              padding: EdgeInsets.only(left: 10),
            ),
            // const Icon(
            //   Icons.close,
            //   size: 12,
            // )
          ],
        ),
      ),
    );
  }

  static PopupMenuItem<String> buildPopupItem(String name, IconData _icon) {
    return PopupMenuItem<String>(
      value: name,
      child: Wrap(
        spacing: 10,
        children: <Widget>[
          Icon(_icon, color: Colors.blue),
          Text(name),
        ],
      ),
    );
  }

  static Widget AppButton({
    required Widget child,
    required Function() onTap,
    double? width,
    double? height,
    Color? color,
  }) {
    return Ink(
      width: width,
      decoration: BoxDecoration(
        color: color ?? Colors.blueAccent,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: color ?? Colors.blueAccent,
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          padding: const EdgeInsets.all(5),
          child: Center(child: child),
        ),
      ),
    );
  }

  static Widget bottomSheetBar({
    required String centerTitle,
    required List<Widget> actions,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          child: const Text(
            "取消",
            style: TextStyle(
              color: Colors.black54,
              fontSize: 15,
            ),
          ),
          onTap: () {
            Get.back();
          },
        ),
        Text(
          centerTitle,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        Row(
          children: actions,
        ),
      ],
    );
  }

  static Widget iTextField({
    Widget? suffix,
    TextEditingController? controller,
    String? hintText,
    int? maxLines,
    bool autofocus = false,
    TextInputType? keyboardType,
    Color? fillColor,
  }) {
    return TextField(
      maxLines: maxLines,
      autofocus: autofocus,
      keyboardType: keyboardType,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: const EdgeInsets.all(10),
        suffix: suffix,
        fillColor: fillColor ?? Colors.grey.shade200,
        filled: true,
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8), //边角为5
          ),
          borderSide: BorderSide(
            color: Colors.white, //边线颜色为白色
            width: 0, //边线宽度为2
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white, //边框颜色为白色
            width: 0, //宽度为5
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(8), //边角为30
          ),
        ),
      ),
    );
  }

  static Widget iCheckBox(
      {bool? value,
      ValueChanged<bool?>? onChanged,
      MaterialStateProperty<Color?>? fillColor}) {
    return Checkbox(
      fillColor: fillColor,
      value: value,
      onChanged: onChanged,
    );
  }

  static AppBar iAppBar({required String title, actions}) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
        ),
      ),
      actions: actions,
      toolbarHeight: 50,
    );
  }
}
