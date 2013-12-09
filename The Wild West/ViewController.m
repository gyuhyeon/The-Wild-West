//
//  ViewController.m
//  The Wild West
//
//  Created by Mark on 2013. 12. 9..
//  Copyright (c) 2013년 iOS Developer. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    winner=0;
    start=0;
    intscore1=0, intscore2=0;
    time=(float)(arc4random()%50)/10+2;
    timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(timelogic) userInfo:nil repeats:YES];
}

- (void) timelogic
{
    time = time - 0.1;
    if (time <=0)
    {
        int fake=arc4random()%2;
        if(fake==0)
        {
            start=1;
            [timer invalidate];
            NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"beep" ofType:@"mp3"]];
            NSError *error;
            player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
            player.numberOfLoops = 0;
            [player play];
        }
        else
        {
            [timer invalidate];
            NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"gunshot" ofType:@"mp3"]];
            NSError *error;
            player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
            player.numberOfLoops = 0;
            [player play];
            time=(float)(arc4random()%50)/10+2;
            timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(timelogic) userInfo:nil repeats:YES];
        }
        
    }
    

}

- (IBAction)button1:(id)sender
{
    if(winner!=2&&start==1)
    {
        [self player1win];
    }
    else if(start==0)
    {
        [self player2win];
        [timer invalidate];
    }
}


- (IBAction)button2:(id)sender
{
    if(winner!=1&&start==1)
    {
        [self player2win];
    }
    else if(start==0)
    {
        [self player1win];
        [timer invalidate];
    }
}

- (void)player1win
{
    winner=1;
    _button2outlet.backgroundColor=[UIColor redColor];
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"gunshot" ofType:@"mp3"]];
    NSError *error;
    player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    player.numberOfLoops = 0;
    [player play];
    
    ++intscore1;
    _score1.text=[NSString stringWithFormat:@"%i", intscore1];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @"Player 1 won!" message:nil delegate:self cancelButtonTitle:@"Okay" otherButtonTitles:nil];
    [alert show];
}

- (void)player2win
{
    winner=2;
    _button1outlet.backgroundColor=[UIColor redColor];
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"gunshot" ofType:@"mp3"]];
    NSError *error;
    player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    player.numberOfLoops = 0;
    [player play];
    
    ++intscore2;
    _score2.text=[NSString stringWithFormat:@"%i", intscore2];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @"player 2 won!" message:nil delegate:self cancelButtonTitle:@"Okay" otherButtonTitles:nil];
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    winner=0;
    start=0;
    _button1outlet.backgroundColor=[UIColor whiteColor];
    _button2outlet.backgroundColor=[UIColor whiteColor];
    time=(float)(arc4random()%50)/10+2;
    timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(timelogic) userInfo:nil repeats:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
