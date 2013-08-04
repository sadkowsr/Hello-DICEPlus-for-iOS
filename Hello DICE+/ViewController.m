//
//  ViewController.m
//  Hello DICE+
//
//  Created by Dawid Gatti on 7/19/13.
//  Copyright (c) 2013 Game Technologies. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    uint8_t key[8] = {0x83, 0xed, 0x60, 0x0e, 0x5d, 0x31, 0x8f, 0xe7};
    
    diceManager = [DPDiceManager sharedDiceManager];
    diceManager.delegate = self;
    
    [diceManager setKey:key];
    [diceManager startScan];
}

-(void)diceManager:(DPDiceManager *)manager didDiscoverDie:(DPDie *)die {
    dice = die;
    
    die.delegate = self;
    [diceManager stopScan];
    [diceManager connectDie:dice];
}

-(void)dieConnected:(DPDie *)die {
    [dice startRollUpdates];
}

-(void)die:(DPDie *)die didRoll:(DPRoll *)roll error:(NSError *)error {
    NSLog(@"Good and bad rolls: %i", roll.result);
    
    // Checking for good rolls
    if (roll.flags == DPRollFlagOK) {
        NSLog(@"Good rolls: %i", roll.result);
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dieFailedAuthorization:(DPDie *)die error:(NSError *)error {}
-(void)diceManagerStoppedScan:(DPDiceManager *)manager {}
-(void)centralManagerDidUpdateState:(CBCentralManagerState)state {}
-(void)diceManager:(DPDiceManager *)manager didConnectDie:(DPDie *)die {}
-(void)diceManager:(DPDiceManager *)manager didDisconnectDie:(DPDie *)die error:(NSError *)error {}
-(void)diceManager:(DPDiceManager *)manager failedConnectingDie:(DPDie *)die error:(NSError *)error {}

@end
