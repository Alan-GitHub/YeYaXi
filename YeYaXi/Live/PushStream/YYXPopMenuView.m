//
//  YYXPopMenuView.m
//  YeYaXi
//
//  Created by Alan.Turing on 17/10/1.
//  Copyright © 2017年 Alan.Turing. All rights reserved.
//

#import "YYXPopMenuView.h"
#import "LFLivePreview.h"

@interface YYXPopMenuView()

//弹出的菜单那部分视图区域
@property (nonatomic, strong) UIView* menuBackground;
@end

@implementation YYXPopMenuView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {

        self.menuItem = @[@"设定服务器地址", @"帮助"];
        self.menuItemHight = 40.0f;
        self.menuItemMultiple = 0.4f;
        
        UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
        [self addGestureRecognizer:tap];
    }
    return self;
}

- (void) showPopMenu: (UIButton*) btn
{
    CGFloat menuBackgroundW = self.bounds.size.width * self.menuItemMultiple;
    CGFloat menuBackgroundH = self.menuItemHight * self.menuItem.count;
    CGFloat menuBackgroundX = btn.frame.origin.x - (menuBackgroundW/2 - btn.frame.size.width/2);
    CGFloat menuBackgroundY = btn.frame.origin.y + btn.frame.size.height + 14;
    
    
    
    //Add pop menu option item
    self.menuBackground = [[UIView alloc] init];
    self.menuBackground.layer.cornerRadius = 5;
    self.menuBackground.layer.masksToBounds = YES;
    self.menuBackground.frame = CGRectMake(menuBackgroundX, menuBackgroundY, menuBackgroundW, menuBackgroundH);
    self.menuBackground.backgroundColor = [UIColor redColor];
    
    for (NSInteger i = 0; i < self.menuItem.count; i++) {
        
        UIButton* optionBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        optionBtn.frame = CGRectMake(0, self.menuItemHight * i, menuBackgroundW, self.menuItemHight);
        optionBtn.backgroundColor = [UIColor greenColor];
        [optionBtn setTitleColor:[UIColor darkTextColor] forState:UIControlStateNormal];
        [optionBtn setTitle:self.menuItem[i] forState:UIControlStateNormal];
        optionBtn.tag = i;
        [optionBtn addTarget:self action:@selector(optionBtnTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
        [self.menuBackground addSubview:optionBtn];
        
        if(optionBtn.tag != 0) {
            UIView *lineView = [UIView new];
            lineView.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.3];
            lineView.frame = CGRectMake(0, self.menuItemHight * optionBtn.tag, menuBackgroundW, 1);
            [self.menuBackground addSubview:lineView];
        }
    }
    

    //增加小三角指示器
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"select"]];
    [self addSubview:imageView];
    imageView.frame = CGRectMake(btn.frame.origin.x + btn.frame.size.width/2 -12,
                                 btn.frame.origin.y + btn.frame.size.height - 10,
                                 24, 24);
    
    [self addSubview:self.menuBackground];
}

- (void) optionBtnTouchUpInside:(UIButton*) btn
{
    switch (btn.tag) {
        case 0:  //更改服务器地址
        {
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle: UIAlertControllerStyleAlert];
            
            alertController.title = @"更改服务器地址";
            
            LFLivePreview* livePreview = (LFLivePreview*) self.superview;
            alertController.message = [NSString stringWithFormat: @"当前服务器地址：%@", livePreview.serverAddr];
            
            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
            UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                if (alertController.textFields.firstObject.text.length != 0) {
                    livePreview.serverAddr = alertController.textFields.firstObject.text;
                }
            }];
            
            [alertController addAction:cancelAction];
            [alertController addAction:okAction];
            
            [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
                textField.placeholder = @"请输入服务器的新地址";
            }];
            
            UIViewController* control = [self getTopViewController];
            [control presentViewController:alertController animated:YES completion:nil];
            break;
        }
        case 1:  //点击帮助菜单
            NSLog(@"help");
            break;
            
        default:
            break;
    }
    
}

- (void) tapAction
{
    [self removeFromSuperview];
}

- (UIViewController*) getTopViewController
{
    UIResponder* resp = [self nextResponder];
    
    do {
        if ([resp isKindOfClass: [UIViewController class]]) {
            return (UIViewController*)resp;
        }
        
        resp = [resp nextResponder];
    } while (resp);

    return nil;
}



@end
