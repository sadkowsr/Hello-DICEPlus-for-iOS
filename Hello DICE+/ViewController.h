//
//  ViewController.h
//  Hello DICE+
//
//  Created by Dawid Gatti on 7/19/13.
//  Copyright (c) 2013 Game Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <DicePlus/DicePlus.h>

@interface ViewController : UIViewController <DPDiceManagerDelegate, DPDieDelegate> {
    DPDiceManager* diceManager;
    DPDie* dice;
}

@end
