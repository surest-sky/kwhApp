## 路由跳转

```
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => const LoginCodePage()),
);
```

## 按钮样式

```
ButtonStyle(
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
)
```

```
style: ElevatedButton.styleFrom(
    primary: Colors.blue,
)
```

```
style: ButtonStyle(
    fixedSize: MaterialStateProperty.all<Size>(
      Size(double.infinity, 50), // 设置高度为50，宽度为最大
    ),
 ),
```

## 按钮保持最大宽度

```
SizedBox(
    width: double.infinity,
    child: ElevatedButton()
)
```

## 容器下划线

```
Container(
    decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: Colors.grey.withOpacity(0.2),
          width: 1.0,
        ),
      ),
    )
)
```

## 去除 input 边框 | TextField

```
TextField(
    style: const TextStyle(
      fontSize: 18,
    ),
    inputFormatters: <TextInputFormatter>[
      FilteringTextInputFormatter.digitsOnly // 过滤规则
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

```

## 定时函数

```
TimeUtil.setInterval((periodicTime) {
    verifyCodeText = "请稍后重试 ${total}s";
    getCodeLoading = true;
    if(total <= 0) {
      periodicTime.cancel();
      verifyCodeText = "获取验证码";
      getCodeLoading = false;
    }
    update();
    total --;
}, 1000);

```

## TextField 值

```
final myController = TextEditingController(text: "");
```
