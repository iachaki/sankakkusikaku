//
//  ViewController.h
//  sankakkusikaku
//
//  Created by ia on 2015/03/26.
//  Copyright (c) 2015年 Life is tech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>


@interface ViewController : UIViewController
{
    MPMoviePlayerController *player;
}

@property (nonatomic, retain) MPMoviePlayerController *player;

-(IBAction)touch;
@end

