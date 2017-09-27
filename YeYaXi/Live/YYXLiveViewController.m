//
//  FirstViewController.m
//  YeYaXi
//
//  Created by Alan.Turing on 17/9/11.
//  Copyright © 2017年 Alan.Turing. All rights reserved.
//

#import "YYXLiveViewController.h"
#import "YYXInputURLViewController.h"
#import "YYXPushStreamViewController.h"

@interface YYXLiveViewController ()

@end

@implementation YYXLiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)Live:(id)sender {
    YYXPushStreamViewController* liveViewController = [[YYXPushStreamViewController alloc] initWithNibName:@"PushStreamViewController" bundle:NULL];
    
    [self presentViewController:liveViewController animated:YES completion:NULL];
}


- (IBAction)Watch:(id)sender {
    YYXInputURLViewController* inputURL = [[YYXInputURLViewController alloc] initWithNibName:@"YYXInputURL" bundle:NULL];
    
    [self presentViewController:inputURL animated:YES completion:NULL];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
