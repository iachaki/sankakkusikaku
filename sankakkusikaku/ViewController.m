//
//  ViewController.m
//  sankakkusikaku
//
//  Created by ia on 2015/03/26.
//  Copyright (c) 2015年 Life is tech. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@property (nonatomic, strong) MPMoviePlayerController *moviePlayerController;


@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"sankaku" ofType:@"m4v"];
    NSURL *url = [NSURL fileURLWithPath:path];
    
//    MPMoviePlayerController *moviePlayer = [[MPMoviePlayerController alloc] initWithContentURL:url];
    
    player = [[MPMoviePlayerController alloc]initWithContentURL:url];
    player.controlStyle = MPMovieControlStyleNone; //下のbar消える
    player.scalingMode = MPMovieScalingModeNone;
    
    CGRect movieSize = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    [player.view setFrame:movieSize];
    player.backgroundView.backgroundColor = [UIColor whiteColor];
    
    CGAffineTransform transform = player.view.transform;
    
    player.view.transform = CGAffineTransformIdentity;
    
//    transform = CGAffineTransformTranslate(transform, 30, 120);
    transform = CGAffineTransformScale(transform, 2, 2);
//    
    player.view.transform = transform;
    
    [self.view addSubview:player.view];
    
    //playerが終わったら、MPMoviePlayerPlaybackDidFinishNotificationをよぶ(callbackする)
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(movieFinishedCallback:)
                                                 name:MPMoviePlayerPlaybackDidFinishNotification
                                               object:player];// callback
    
    
    [player prepareToPlay];
    [player play];
    
}

-(void) moviePlayerLoadStateDidChangeNotification
{
    NSLog(@"moviePlayerLoadStateDidChangeNotification");
}

-(void)movieFinishedCallback:(NSNotification*)notification
{

    UIImageView *sankakuImageView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 50, 100, 100)];
    [sankakuImageView setImage:[UIImage imageNamed:@"sankaku1.png"]];
    [self.view addSubview:sankakuImageView];
    
    [UIView beginAnimations:nil context:nil];
    //アニメーション
    
    sankakuImageView.frame = CGRectMake(50, 300, 100, 100);
    //100×100の大きさで、x=50、y=150の位置まで動かす
    
    [UIView commitAnimations];

    
}


-(void) finishPlayback:(NSNotification *) aNotification
{
    [player play];
}
    
    

//    moviePlayer.view.frame = CGRectMake(0,0,320,480);
//    moviePlayer.controlStyle = MPMovieControlStyleEmbedded;
//    moviePlayer.scalingMode = MPMovieScalingModeAspectFit;
//    [self.view addSubview:moviePlayer.view];
//    [moviePlayer prepareToPlay];
//    [moviePlayer play];
//    
//    // メンバとして保持する
//    _moviePlayerController = moviePlayer;
//    
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(moviePlayBackDidFinished:)
//                                                 name:MPMoviePlayerPlaybackDidFinishNotification
//                                               object:_moviePlayerController];


- (void)moviePlayBackDidFinished:(NSNotification *)notification
{
    NSDictionary *userInfo = [notification userInfo];
    switch([[userInfo objectForKey:MPMoviePlayerPlaybackDidFinishReasonUserInfoKey] intValue]) {
        case MPMovieFinishReasonPlaybackEnded:
            NSLog(@"playback ended");
            break;
        case MPMovieFinishReasonPlaybackError:
            NSLog(@"playback error");
            break;
    }
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