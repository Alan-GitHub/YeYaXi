//
//  YYXPopMenuView.h
//  YeYaXi
//
//  Created by Alan.Turing on 17/10/1.
//  Copyright © 2017年 Alan.Turing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YYXPopMenuView : UIView

@property (nonatomic, strong) NSArray *menuItem;   // 内容数组 必要
@property (nonatomic, assign) CGFloat menuItemHight;
@property (nonatomic, assign) CGFloat menuItemMultiple;


- (void) showPopMenu: (UIButton*) btn;
- (UIViewController*) getTopViewController;
@end
