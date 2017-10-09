//
//  SecondViewController.m
//  YeYaXi
//
//  Created by Alan.Turing on 17/9/11.
//  Copyright © 2017年 Alan.Turing. All rights reserved.
//

#import "YYXMediaPlayerViewController.h"
#import "YYXPlayerViewController.h"

@interface YYXMediaPlayerViewController ()

@end

@implementation YYXMediaPlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (IBAction)playNetworkMedia:(id)sender {

    [self playLocalMedia:sender];
}


- (IBAction)playLocalMedia:(id)sender {

    YYXPlayerViewController* playViewControl = [[YYXPlayerViewController alloc] initWithNibName:@"YYXPlayerViewController" bundle:nil];
    [self presentViewController:playViewControl animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
