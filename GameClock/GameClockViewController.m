//
//  GameClockViewController.m
//  GameClock
//
//  Created by Raj Wilhoit on 7/3/13.
//  Copyright (c) 2013 UF.rajwilhoit. All rights reserved.
//

#import "GameClockViewController.h"


@interface GameClockViewController () 

@end

@implementation GameClockViewController

@synthesize gameClockALabel;
@synthesize gameClockBLabel;
@synthesize gameClock;
@synthesize clockStarted;
@synthesize turn;

NSString *TURN_A = @"gameClockA";
NSString *TURN_B = @"gameClockB";

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Turn game clock B upside-down
    [self turnGameClockUpsideDown];
    
    // Set the default turn
    [self setTurn:TURN_A];
    
    // Set default for the clock
    clockStarted = YES;
    
    // Start the clock
    [self startGameClock];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pressedChangeTurn:(id)sender
{
    [self changeTurn];
}

// Starts the game clock
-(void)startGameClock
{
    self.gameClock = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(gameClockCallback) userInfo:nil repeats:YES];
}

// Stops the game clock
-(void)stopGameClock
{
    [gameClock invalidate];
}

// The timer callback (used to increment/decrement)
-(void)gameClockCallback
{
    NSString *result = [[NSString alloc] init];
    int iMinutes = 25;
    int iSeconds = 0;
    
    if([turn isEqualToString:TURN_A])
    {
        // Convert the minutes and seconds to integers
        iMinutes = [[gameClockALabel.text substringToIndex:2] integerValue];
        iSeconds = [[gameClockALabel.text substringFromIndex:3] integerValue];
    
        // Check if time has run out
        if(iMinutes < 0)
        {
            [self timeUp];
        }
        // Check if we have less than a minute less
        else if(iSeconds <= 0)
        {
            iMinutes--;
            iSeconds = 59;
        }
        else
        {
            iSeconds--;
        }
    
        // If we have run out of time, call timeUp and invalidate the clock
        if(iMinutes < 0)
        {
            [self timeUp];
        }
        // Else set the new time
        else
        {
            result = [NSMutableString stringWithFormat:@"%.2d:%.2d",iMinutes,iSeconds];
            [gameClockALabel setText:result];
        }
    }
    else if([turn isEqualToString:TURN_B])
    {
        // Convert the minutes and seconds to integers
        iMinutes = [[gameClockBLabel.text substringToIndex:2] integerValue];
        iSeconds = [[gameClockBLabel.text substringFromIndex:3] integerValue];
        
        // Check if time has run out
        if(iMinutes < 0)
        {
            [self timeUp];
        }
        // Check if we have less than a minute less
        else if(iSeconds <= 0)
        {
            iMinutes--;
            iSeconds = 59;
        }
        else
        {
            iSeconds--;
        }
        
        // If we have run out of time, call timeUp and invalidate the clock
        if(iMinutes < 0)
        {
            [self timeUp];
        }
        // Else set the new time
        else
        {
            result = [NSMutableString stringWithFormat:@"%.2d:%.2d",iMinutes,iSeconds];
            [gameClockBLabel setText:result];
        }
    }
    else
    {
        // Else nothing
    }
    
}

// Called when timer runs out to invalidate the NSTimer
-(void)timeUp
{
    // Stop the game clocks
    [self stopGameClock];
    
    // Add any extra code here for when the timer runs out
    if([turn isEqualToString:@"gameClockA"])
    {
        NSLog(@"Timer expired for clock A");
    }
    else if([turn isEqualToString:@"gameClockB"])
    {
        NSLog(@"Timer expired for clock B");
    }
    else
    {
        // Else nothing
    }

}

// Change the turn
-(void)changeTurn
{
    if([turn isEqualToString:TURN_A])
    {
        turn = [[NSString alloc] init];
        turn = TURN_B;
    }
    else
    {
        turn = [[NSString alloc] init];
        turn = TURN_A;
    }
}

-(void)turnGameClockUpsideDown
{
    //rotate labels in 180 degrees
    self.gameClockBLabel.transform = CGAffineTransformMakeRotation(M_PI);
}

@end
