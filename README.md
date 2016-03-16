# NHKeyboardPro
Custom keyboard for ios(Objc)
#### Effect:
对安全性要求比较高的应用（银行、支付宝）可能会需要自定义键盘，demo风格类似招商银行：
![GIF](https://raw.githubusercontent.com/iFindTA/screenshots/master/keyboard_0.gif)

#### Description:
###### 数字键盘（有无小数点均有）:
每次出现均是随机布局键盘
###### 字母键盘（ASIIC）：
可作为密码输入键盘

#### Usage:
```
pod 'NHKeyboard', '~> 0.0.3'
```
**导入后：三行代码**
```ObjectiveC
	NHKeyboard *kb = [NHKeyboard keyboardWithType:NHKBTypeNumberPad];
    kb.enterprise = @"共时代安全输入";//1,设置显示名称
    kb.icon = @"security_logo.jpg";//2,设置logo图片
    self.fd.inputView = kb;//3,设置输入源
    kb.inputSource = tfd;
```