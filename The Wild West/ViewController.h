//
//  ViewController.h
//  The Wild West
//
//  Created by Mark on 2013. 12. 9..
//  Copyright (c) 2013년 iOS Developer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController
{
    int winner;
    int start;
    float time;
    NSTimer* timer;
    AVAudioPlayer* player;
    int intscore1,intscore2;
}
@property (weak, nonatomic) IBOutlet UIButton *button1outlet;
@property (weak, nonatomic) IBOutlet UIButton *button2outlet;

@property (weak, nonatomic) IBOutlet UILabel *score1;
@property (weak, nonatomic) IBOutlet UILabel *score2;


@end
