import 'package:app/model/note_item.dart';
import 'package:app/util/enum_util.dart';
import 'package:app/util/widget/CustomWidget.dart';
import 'package:app/util/widget/url_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NoteDetail extends StatefulWidget {
  final NoteItem item;

  const NoteDetail({Key? key, required this.item}) : super(key: key);

  @override
  State<NoteDetail> createState() => _NoteDetailState();
}

class _NoteDetailState extends State<NoteDetail> {
  bool verticalGallery = false;
  final WebViewController webviewController =
  WebViewController.fromPlatformCreationParams(
      const PlatformWebViewControllerCreationParams());
  

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    webviewController.loadHtmlString(widget.item.fullText);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          height: 800,
          padding: const EdgeInsets.only(
            top: 20,
            right: 10,
            left: 10,
            bottom: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.item.title,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 10)),
              Text(
                "添加时间: ${widget.item.uat} ${widget.item.type}",
                style: const TextStyle(fontSize: 12, color: Colors.black45),
              ),
              if (widget.item.url.isNotEmpty)
                Row(
                  children: [
                    urlWidget(),
                    Expanded(child: UrlButton(item: widget.item)),
                  ],
                ),
              if (widget.item.remark.isNotEmpty)
                Container(
                  constraints: BoxConstraints(
                    minWidth: MediaQuery.of(context).size.width
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    border: const Border(
                      left: BorderSide(width: 2, color: Colors.blueAccent),
                    ),
                  ),
                  padding: const EdgeInsets.all(5),
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "备注:",
                        style: TextStyle(fontSize: 14, color: Colors.black45),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        widget.item.remark,
                      ),
                    ],
                  ),
                ),
              if (widget.item.tags.isNotEmpty)
                const SizedBox(height: 10),
                Wrap(children: [
                  ...widget.item.tags.map((e) => CustomWidget.tag(e)).toList(),
                ]),
              if (widget.item.remark.isNotEmpty || widget.item.tags.isNotEmpty)
                const SizedBox(height: 5),
              const Divider(),
              const SizedBox(height: 5),
              Expanded(child: contentText(widget.item)),
            ],
          ),
        )
      ],
    );
  }

  Widget contentText(NoteItem item) {
    if (item.type == EnumUtil.ocr) {
      return Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.grey.shade100),
        ),
        child: InkWell(
          onTap: () {
            open(context, item.url);
          },
          child: Image.network(
            item.url,
            alignment: Alignment.center,
          ),
        ),
      );
    }

    return WebViewWidget(controller: webviewController);
  }

  Widget urlWidget() {
    return Padding(
      padding: const EdgeInsets.only(right: 5),
      child: InkWell(
        onTap: () {
          Clipboard.setData(
            ClipboardData(text: widget.item.url),
          );
          EasyLoading.showToast("复制成功");
        },
        child: const Icon(
          Icons.copy,
          size: 16,
          color: Colors.blueAccent,
        ),
      ),
    );
  }

  void open(BuildContext context, String url) {
    // final List<GalleryExampleItem> galleryItems = [
    //   GalleryExampleItem(
    //     id: "tag1",
    //     resource: url,
    //   ),
    // ];
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => GalleryPhotoViewWrapper(
    //       galleryItems: galleryItems,
    //       backgroundDecoration: const BoxDecoration(
    //         color: Colors.black,
    //       ),
    //       initialIndex: 0,
    //       scrollDirection: verticalGallery ? Axis.vertical : Axis.horizontal,
    //     ),
    //   ),
    // );
  }
}
