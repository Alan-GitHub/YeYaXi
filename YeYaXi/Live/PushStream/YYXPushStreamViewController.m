//
//  ViewController.m
//  LFLiveKitDemo
//
//  Created by admin on 16/8/30.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "YYXPushStreamViewController.h"
#import "LFLivePreview.h"

@interface YYXPushStreamViewController ()

@end

@implementation YYXPushStreamViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    LFLivePreview* view = [[LFLivePreview alloc] initWithFrame:self.view.bounds];
    
    view.viewContr = self;
    
    [self.view addSubview: view];
}


//- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
//    return UIInterfaceOrientationMaskLandscape;
//}
//
//- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
//    return YES;
//}

@end
