//
//  refineSearchViewController.h
//  STHearthstoneDeckCompainion
//
//  Created by Steve on 9/10/15.
//  Copyright (c) 2015 Steve. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface refineSearchViewController : UIViewController

@property IBOutlet UIButton *minion;
@property IBOutlet UIButton *spell;
@property IBOutlet UIButton *weapon;
@property IBOutlet UISegmentedControl *manaCost;
@property (weak, nonatomic) IBOutlet UIButton *classic;
@property (weak, nonatomic) IBOutlet UIButton *GvG;
@property (weak, nonatomic) IBOutlet UIButton *TGT;
@property (weak, nonatomic) IBOutlet UIButton *basic;
@property (weak, nonatomic) IBOutlet UIButton *BRK;
@property (weak, nonatomic) IBOutlet UIButton *naxx;


@property (nonatomic, strong) NSMutableArray *cards;
@property (nonatomic, strong) NSArray *filteredCards;
@property (strong,nonatomic) NSMutableArray *predicateArray;

@end
