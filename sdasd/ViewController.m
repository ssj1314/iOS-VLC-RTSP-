//
//  ViewController.m
//  sdasd
//
//  Created by ssj on 16/11/15.
//  Copyright © 2016年 jiteng. All rights reserved.
//

#import "ViewController.h"
#import <MobileVLCKit/MobileVLCKit.h>
@interface ViewController ()
@property (nonatomic, strong)VLCMediaPlayer *player;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    UIView *videoView = [[UIView alloc] initWithFrame:CGRectMake(0, 50, self.view.bounds.size.width, 400)];
    videoView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:videoView];
    VLCMediaPlayer *player = [[VLCMediaPlayer alloc] initWithOptions:nil];
    self.player = player;
    self.player.drawable = videoView;
    NSURL *url = [NSURL URLWithString:@"rtsp://10.0.0.89/session0.mpg"];
    self.player.media = [VLCMedia mediaWithURL:url];
    [self.player play];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
