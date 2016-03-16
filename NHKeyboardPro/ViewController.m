//
//  ViewController.m
//  NHKeyboardPro
//
//  Created by hu jiaju on 16/3/14.
//  Copyright © 2016年 hu jiaju. All rights reserved.
//

#import "ViewController.h"
#import "NHKeyboard.h"
#import <Masonry.h>

@interface ViewController ()<UITextFieldDelegate,UITextViewDelegate>

@property (nonatomic, strong) UITextField *fd,*decimal;
@property (nonatomic, strong) NHKeyboard *kb;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //纯数字随机键盘
    UITextField *tfd = [[UITextField alloc] init];
    tfd.font = [UIFont systemFontOfSize:15];
    tfd.placeholder = @"input numbers";
    //tfd.delegate = self;
    tfd.borderStyle = UITextBorderStyleBezel;
    [self.view addSubview:tfd];
    [tfd mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(50);
        make.leading.equalTo(self.view).offset(30);
        make.trailing.equalTo(self.view).offset(-30);
        make.height.mas_greaterThanOrEqualTo(@30);
    }];
    self.fd = tfd;
    NHKeyboard *kb = [NHKeyboard keyboardWithType:NHKBTypeNumberPad];
    kb.enterprise = @"共时代安全输入";
    kb.icon = @"security_logo.jpg";
    self.fd.inputView = kb;
    kb.inputSource = tfd;
    self.kb = kb;
    
    //带小数点随机键盘
    tfd = [[UITextField alloc] init];
    tfd.font = [UIFont systemFontOfSize:15];
    tfd.placeholder = @"input numbers with decimal";
    //tfd.delegate = self;
    tfd.borderStyle = UITextBorderStyleBezel;
    [self.view addSubview:tfd];
    [tfd mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.fd.mas_bottom).offset(10);
        make.leading.equalTo(self.view).offset(30);
        make.trailing.equalTo(self.view).offset(-30);
        make.height.mas_greaterThanOrEqualTo(@30);
    }];
    self.decimal = tfd;
    kb = [NHKeyboard keyboardWithType:NHKBTypeDecimalPad];
    self.decimal.inputView = kb;
    kb.inputSource = tfd;
    
    //字符键盘
    tfd = [[UITextField alloc] init];
    tfd.font = [UIFont systemFontOfSize:15];
    tfd.placeholder = @"say somthing";
    //tfd.delegate = self;
    tfd.borderStyle = UITextBorderStyleBezel;
    [self.view addSubview:tfd];
    [tfd mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.decimal.mas_bottom).offset(10);
        make.leading.equalTo(self.view).offset(30);
        make.trailing.equalTo(self.view).offset(-30);
        make.height.mas_greaterThanOrEqualTo(@30);
    }];
    kb = [NHKeyboard keyboardWithType:NHKBTypeASCIICapable];
    tfd.inputView = kb;
    kb.inputSource = tfd;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(kbWillShow:) name:UIKeyboardWillChangeFrameNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(kbWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:true];
}

- (void)kbWillShow:(NSNotification *)noti {
    //NSLog(@"%s--info:%@",__FUNCTION__,noti);
}

- (void)kbWillHide:(NSNotification *)noti {
    //NSLog(@"%s--info:%@",__FUNCTION__,noti);
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    BOOL ret = true;
    if (textField.text.length > 6) {
        ret = false;
    }
    return ret;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
