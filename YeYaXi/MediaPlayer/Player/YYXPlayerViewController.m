//
//  YYXPlayerViewController.m
//  YeYaXi
//
//  Created by Alan.Turing on 17/10/5.
//  Copyright © 2017年 Alan.Turing. All rights reserved.
//

#import "YYXPlayerViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface YYXPlayerViewController ()

@property (nonatomic, strong) AVPlayerItem* playerItem;
@property (nonatomic, strong) AVPlayer* player;
@end

@implementation YYXPlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
    [self.view addGestureRecognizer:tap];
    
    [self initPlayer];
    
}

- (void) tapAction
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void) initPlayer
{
    NSString* mediaPath = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"mp4"];
    NSURL* mediaUrl = [NSURL fileURLWithPath:mediaPath];
    
    //创建播放器相关
    self.playerItem = [AVPlayerItem playerItemWithURL:mediaUrl];
    self.player = [AVPlayer playerWithPlayerItem:self.playerItem];
    AVPlayerLayer* layer = [AVPlayerLayer playerLayerWithPlayer:self.player];
    
    //设置播放器层属性
    layer.frame = self.backView.bounds;
    layer.videoGravity = AVLayerVideoGravityResizeAspectFill; //AVLayerVideoGravityResizeAspect;
    
    //添加播放器层到视图层
    [self.backView.layer addSublayer:layer];

    //添加观察者
    [self.playerItem addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];
}


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    AVPlayerItem* playItem = (AVPlayerItem*) object;
    
    if ([keyPath isEqualToString:@"status"]) {
        
        if (playItem.status == AVPlayerItemStatusReadyToPlay) {
            [self.player play];
        }
        else
        {
            NSLog(@"load break...");
        }
    }
}

- (void) dealloc
{
    [self.playerItem removeObserver:self forKeyPath:@"status"];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
