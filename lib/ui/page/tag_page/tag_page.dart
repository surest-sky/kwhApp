import 'package:app/base/get/get_common_view.dart';
import 'package:azlistview/azlistview.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../model/ContactInfo.dart';
import '../../../res/r.dart';
import 'tag_controller.dart';

class TagPage extends GetCommonView<TagController> {
  const TagPage({Key? key}) : super(key: key);

  Widget _buildSusWidget(String susTag) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      height: 40,
      width: double.infinity,
      alignment: Alignment.centerLeft,
      child: Row(
        children: <Widget>[
          Text(
            '$susTag',
            textScaleFactor: 1.2,
          ),
          Expanded(
              child: Divider(
            height: .0,
            indent: 10.0,
          ))
        ],
      ),
    );
  }

  Widget _buildListItem(ContactInfo model) {
    String susTag = model.getSuspensionTag();
    return Column(
      children: <Widget>[
        Offstage(
          offstage: model.isShowSuspension != true,
          child: _buildSusWidget(susTag),
        ),
        ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.blue[700],
            child: Text(
              model.name[0],
              style: TextStyle(color: Colors.white),
            ),
          ),
          title: Text(model.name),
          onTap: () {
            print("OnItemClick: $model");
          },
        )
      ],
    );
  }

  Widget _buildHeader() {
    return Container(
      // height: 150,
      padding: const EdgeInsets.only(left: 20, top: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const[
           Text(
            "我的标签",
            style: TextStyle(fontSize: 40),
          ),
          SizedBox(height: 20),

          Text("最近收藏", style: TextStyle(color: Colors.black45, fontSize: 18)),
          SizedBox(height: 10),
          Text("Flutter的使用do2koe22223238322"),
          Text("Flutter的使用do2koe22223238322"),
          Text("Flutter的使用do2koe22223238322"),
          Text("Flutter的使用do2koe22223238322"),
          Text("Flutter的使用do2koe22223238322"),
          SizedBox(height: 10),
          Divider(),

          SizedBox(height: 20),
          Text("标签列表", style: TextStyle(color: Colors.black45, fontSize: 18)),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      top: true,
      child: AzListView(
        data: controller.contacts,
        itemCount: controller.contacts.length,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) return _buildHeader();
          ContactInfo model = controller.contacts[index];
          return _buildListItem(model);
        },
        physics: BouncingScrollPhysics(),
        indexBarData: SuspensionUtil.getTagIndexList(controller.contacts),
        indexHintBuilder: (context, hint) {
          return Container(
            alignment: Alignment.center,
            width: 60.0,
            height: 60.0,
            decoration: BoxDecoration(
              color: Colors.blue[700]!.withAlpha(200),
              shape: BoxShape.circle,
            ),
            child: Text(hint,
                style: TextStyle(color: Colors.white, fontSize: 30.0)),
          );
        },
        indexBarMargin: EdgeInsets.all(10),
        indexBarOptions: IndexBarOptions(
          needRebuild: true,
        ),
      ),
    ));
  }
}
