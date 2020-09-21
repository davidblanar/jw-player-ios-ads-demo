//
//  ObjCViewController.m
//  JWPlayer-SDK-iOS-Demo
//
//  Created by Amitai Blickstein on 2/26/19.
//  Copyright © 2019 JWPlayer. All rights reserved.
//

#import "ObjCViewController.h"
#import "JWPlayer_SDK_iOS_Demo-Swift.h"
#import <JWPlayer_iOS_SDK/JWPlayerController.h>

@interface ObjCViewController ()

@property (weak, nonatomic) IBOutlet UIView *playerContainerView;
@property (nonatomic) JWPlayerController *player;

@end

@implementation ObjCViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    JWAdBreak *adBreak = [JWAdBreak adBreakWithTag:@"https://playertest.longtailvideo.com/vast-30s-ad.xml" offset:@"pre"];

    // Create the Ad Config
    JWAdConfig *adConfig = [JWAdConfig new];
    adConfig.client = JWAdClientVast;
    adConfig.schedule = @[adBreak];
    
    JWConfig *config = [JWConfig configWithContentURL:@"http://content.bitsontherun.com/videos/3XnJSIm4-injeKYZS.mp4"];
    
    config.advertising = adConfig;
    
    self.player = [[JWPlayerController alloc]initWithConfig:config];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    UIView *playerView = self.player.view;
    [self.playerContainerView addSubview:playerView];
    [playerView constrainToSuperview];
}

@end
