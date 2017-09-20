//
//  YYXInputURLViewController.m
//  YeYaXi
//
//  Created by Alan.Turing on 17/9/16.
//  Copyright © 2017年 Alan.Turing. All rights reserved.
//

#import "YYXInputURLViewController.h"
//#import <IJKVideoViewController.h>
#import "IJKMoviePlayerViewController.h"

@interface YYXInputURLViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textView;

@end

@implementation YYXInputURLViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)ClickPlayButton:(id)sender {
        NSURL *url = [NSURL URLWithString:self.textView.text];
        NSString *scheme = [[url scheme] lowercaseString];
    
        if ([scheme isEqualToString:@"http"]
            || [scheme isEqualToString:@"https"]
            || [scheme isEqualToString:@"rtmp"]) {
            [IJKVideoViewController presentFromViewController:self withTitle:[NSString stringWithFormat:@"URL: %@", url] URL:url completion:^{
                //            [self.navigationController popViewControllerAnimated:NO];
            }];
        }
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end


