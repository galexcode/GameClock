//
//  GameClockViewController.h
//  GameClock
//
//  Created by Raj Wilhoit on 7/3/13.
//  Copyright (c) 2013 UF.rajwilhoit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GameClockViewController : UIViewController {
    NSTimer *gameClock;
    NSString *turn;
    BOOL clockStarted;
}

// View Controller functions
- (IBAction)pressedChangeTurn:(id)sender;

// Game Clock functions
-(void)startGameClock;                  // Starts the timer
-(void)stopGameClock;                  // Stops the timer
-(void)gameClockCallback;               // The timer callback (used to increment/decrement)
-(void)timeUp;                          // Called when timer runs out to kill the timer
-(void)changeTurn;                      // Changes the turn
-(void)turnGameClockUpsideDown;             // Turns the clock label upside down

@property (strong, nonatomic) IBOutlet UILabel *gameClockALabel;
@property (strong, nonatomic) IBOutlet UILabel *gameClockBLabel;
@property (nonatomic) NSTimer *gameClock;
@property (nonatomic) NSString *turn;
@property (nonatomic) BOOL clockStarted;

@end
