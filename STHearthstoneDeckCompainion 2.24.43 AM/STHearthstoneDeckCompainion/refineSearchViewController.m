//
//  refineSearchViewController.m
//  STHearthstoneDeckCompainion
//
//  Created by Steve on 9/10/15.
//  Copyright (c) 2015 Steve. All rights reserved.
//

#import "refineSearchViewController.h"
#import "STjsonData.h"
#import "STSearchTableViewController.h"
#import "STHsCardData.h"
@interface refineSearchViewController ()

@end

@implementation refineSearchViewController 
@synthesize cards;
@synthesize filteredCards;
@synthesize predicateArray;


- (void)viewDidLoad {
    [super viewDidLoad];
    predicateArray = [[NSMutableArray alloc]init];
    // Do any additional setup after loading the view.
    STjsonData *cardData = [[STjsonData alloc]init];
    cards = cardData.jsonData;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)weaponButtonWasTouched:(id)sender {
    
    NSPredicate *weaponPredicate = [NSPredicate predicateWithFormat:@"type==%@",@"Weapon"];
    self.weapon.selected = !self.weapon.selected;
    
    if (_weapon.selected == YES){
        [predicateArray addObject: weaponPredicate];
    }
    else
        [predicateArray removeObject: weaponPredicate];
}
- (IBAction)spellButtonWasTouched:(id)sender {
    NSPredicate *spellPredicate = [NSPredicate predicateWithFormat:@"type==%@",@"Spell"];
    self.spell.selected = !self.spell.selected;
    
    if (_spell.selected == YES){
        [predicateArray addObject: spellPredicate];
    }
    else
        [predicateArray removeObject: spellPredicate];
}
- (IBAction)minionButtonWasTouched:(id)sender {
    NSPredicate *minionPredicate = [NSPredicate predicateWithFormat:@"type==%@",@"Minion"];
    self.minion.selected = !self.minion.selected;
    
    if (_minion.selected == YES){
        [predicateArray addObject: minionPredicate];
    }
    else
        [predicateArray removeObject: minionPredicate];
}
- (IBAction)classicButtonWasTouched:(id)sender {
    NSPredicate *classicPredicate = [NSPredicate predicateWithFormat:@"cardSet==%@",@"Classic"];
    self.classic.selected = !self.classic.selected;
    
    if (_classic.selected == YES){
        [predicateArray addObject: classicPredicate];
    }
    else
        [predicateArray removeObject: classicPredicate];
}

- (IBAction)GvGbuttonWasTouched:(id)sender {
    NSPredicate *GvGPredicate = [NSPredicate predicateWithFormat:@"cardSet==%@",@"Goblins vs Gnomes"];
    self.GvG.selected = !self.GvG.selected;
    
    if (_GvG.selected == YES){
        [predicateArray addObject: GvGPredicate];
    }
    else
        [predicateArray removeObject: GvGPredicate];
    
}
- (IBAction)TGTbuttonWasTouched:(id)sender {
    NSPredicate *TGTPredicate = [NSPredicate predicateWithFormat:@"cardSet==%@",@"The Grand Tournament"];
    self.TGT.selected = !self.TGT.selected;
    
    if (_TGT.selected == YES){
        [predicateArray addObject: TGTPredicate];
    }
    else
        [predicateArray removeObject: TGTPredicate];
    
}
- (IBAction)basicButtonWasTouched:(id)sender {
    NSPredicate *basicPredicate = [NSPredicate predicateWithFormat:@"cardSet==%@",@"Basic"];
    self.basic.selected = !self.basic.selected;
    
    if (_basic.selected == YES){
        [predicateArray addObject: basicPredicate];
    }
    else
        [predicateArray removeObject: basicPredicate];
}

- (IBAction)BRKbuttonWasTouched:(id)sender {
    NSPredicate *BRKPredicate = [NSPredicate predicateWithFormat:@"cardSet==%@",@"Blackrock Mountain"];
    [predicateArray addObject: BRKPredicate];
    self.BRK.selected = !self.BRK.selected;
    
    if (_BRK.selected == YES){
        [predicateArray addObject: BRKPredicate];
    }
    else
        [predicateArray removeObject: BRKPredicate];
    
}
- (IBAction)naxxButtonWasTouched:(id)sender {
    NSPredicate *naxxPredicate = [NSPredicate predicateWithFormat:@"cardSet==%@",@"Naxxramas"];
    self.naxx.selected = !self.naxx.selected;
    
    if (_naxx.selected == YES){
        [predicateArray addObject: naxxPredicate];
    }
    else
        [predicateArray removeObject: naxxPredicate];
    
}
- (IBAction)manaCostwasChanged:(UISegmentedControl *)sender {
    
    switch (sender.selectedSegmentIndex) {
        case 0:
        {
            NSPredicate *allManaPredicate = [NSPredicate predicateWithFormat:@"cost>=0"];
            [predicateArray addObject: allManaPredicate];
        }
            break;
        case 1:
        {
            NSPredicate *zeroManaPredicate = [NSPredicate predicateWithFormat:@"cost==0"];
            [predicateArray addObject: zeroManaPredicate];
        }
            break;
        case 2:
        {
            NSPredicate *oneManaPredicate = [NSPredicate predicateWithFormat:@"cost==1"];
            [predicateArray addObject: oneManaPredicate];
        }
            break;
        case 3:
        {
            NSPredicate *twoManaPredicate = [NSPredicate predicateWithFormat:@"cost==2"];
            [predicateArray addObject: twoManaPredicate];
        }
            break;
        case 4:
        {
            NSPredicate *threeManaPredicate = [NSPredicate predicateWithFormat:@"cost==3"];
            [predicateArray addObject: threeManaPredicate];
        }
            break;
        case 5:
        {
            NSPredicate *fourManaPredicate = [NSPredicate predicateWithFormat:@"cost==4"];
            [predicateArray addObject: fourManaPredicate];
        }
            break;
        case 6:
        {
            NSPredicate *fiveManaPredicate = [NSPredicate predicateWithFormat:@"cost==5"];
            [predicateArray addObject: fiveManaPredicate];
        }
            break;
        case 7:
        {
            NSPredicate *sixManaPredicate = [NSPredicate predicateWithFormat:@"cost==6"];
            [predicateArray addObject: sixManaPredicate];
        }
            break;
        default:
        {
            NSPredicate *sevenUpManaPredicate = [NSPredicate predicateWithFormat:@"cost>=7"];
            [predicateArray addObject: sevenUpManaPredicate];
        }
            break;
    }
}
- (IBAction)attackWasChanged:(UISegmentedControl*)sender {
    
    switch (sender.selectedSegmentIndex) {
        case 0:
        {
            NSPredicate *allAttackPredicate = [NSPredicate predicateWithFormat:@"(type==%@ OR type==%@) AND attack>=0",@"Minion", @"Weapon"];
            [predicateArray addObject: allAttackPredicate];
        }
            break;
        case 1:
        {
            NSPredicate *zeroAttackPredicate = [NSPredicate predicateWithFormat:@"(type==%@ OR type==%@) AND attack==0",@"Minion", @"Weapon"];
            [predicateArray addObject: zeroAttackPredicate];
        }
            break;
        case 2:
        {
            NSPredicate *oneAttackPredicate = [NSPredicate predicateWithFormat:@"(type==%@ OR type==%@) AND attack==1",@"Minion", @"Weapon"];
            [predicateArray addObject: oneAttackPredicate];
        }
            break;
        case 3:
        {
            NSPredicate *twoAttackPredicate = [NSPredicate predicateWithFormat:@"(type==%@ OR type==%@) AND attack==2",@"Minion", @"Weapon"];
            [predicateArray addObject: twoAttackPredicate];
        }
            break;
        case 4:
        {
            NSPredicate *threeAttackPredicate = [NSPredicate predicateWithFormat:@"(type==%@ OR type==%@) AND attack==3",@"Minion", @"Weapon"];
            [predicateArray addObject: threeAttackPredicate];
        }
            break;
        case 5:
        {
            NSPredicate *fourAttackPredicate = [NSPredicate predicateWithFormat:@"(type==%@ OR type==%@) AND attack==4",@"Minion", @"Weapon"];
            [predicateArray addObject: fourAttackPredicate];
        }
            break;
        case 6:
        {
            NSPredicate *fiveAttackPredicate = [NSPredicate predicateWithFormat:@"(type==%@ OR type==%@) AND attack==5",@"Minion", @"Weapon"];
            [predicateArray addObject: fiveAttackPredicate];
        }
            break;
        case 7:
        {
            NSPredicate *sixAttackPredicate = [NSPredicate predicateWithFormat:@"(type==%@ OR type==%@) AND attack==6",@"Minion", @"Weapon"];
            [predicateArray addObject: sixAttackPredicate];
        }
            break;
        case 8:
        {
            NSPredicate *sevenAttackPredicate = [NSPredicate predicateWithFormat:@"(type==%@ OR type==%@) AND attack==7",@"Minion", @"Weapon"];
            [predicateArray addObject: sevenAttackPredicate];
        }
            break;
        default:
        {
            NSPredicate *eightUpAttackPredicate = [NSPredicate predicateWithFormat:@"(type==%@ OR type==%@) AND attack>=8",@"Minion", @"Weapon"];
            [predicateArray addObject: eightUpAttackPredicate];
        }
            break;
    }

}
- (IBAction)healthWasChanged:(UISegmentedControl*)sender {
    
    switch (sender.selectedSegmentIndex) {
        case 0:
        {
            NSPredicate *allHealthPredicate = [NSPredicate predicateWithFormat:@"type==%@ AND health>=0",@"Minion"];

            [predicateArray addObject: allHealthPredicate];
        }
            break;
        case 1:
        {
            NSPredicate *zeroHealthPredicate = [NSPredicate predicateWithFormat:@"type==%@ AND health==0",@"Minion"];

            [predicateArray addObject: zeroHealthPredicate];
        }
            break;
        case 2:
        {
            NSPredicate *oneHealthPredicate = [NSPredicate predicateWithFormat:@"type==%@ AND health==1",@"Minion"];

            [predicateArray addObject: oneHealthPredicate];
        }
            break;
        case 3:
        {
            NSPredicate *twoHealthPredicate = [NSPredicate predicateWithFormat:@"type==%@ AND health==2",@"Minion"];

            [predicateArray addObject: twoHealthPredicate];
        }
            break;
        case 4:
        {
            NSPredicate *threeHealthPredicate = [NSPredicate predicateWithFormat:@"type==%@ AND health==3",@"Minion"];

            [predicateArray addObject: threeHealthPredicate];
        }
            break;
        case 5:
        {
            NSPredicate *fourHealthPredicate = [NSPredicate predicateWithFormat:@"type==%@ AND health==4",@"Minion"];
            [predicateArray addObject: fourHealthPredicate];
        }
            break;
        case 6:
        {
            NSPredicate *fiveHealthPredicate = [NSPredicate predicateWithFormat:@"type==%@ AND health==5",@"Minion"];
            [predicateArray addObject: fiveHealthPredicate];
        }
            break;
        case 7:
        {
            NSPredicate *sixHealthPredicate = [NSPredicate predicateWithFormat:@"type==%@ AND health==6",@"Minion"];
            [predicateArray addObject: sixHealthPredicate];
        }
            break;
        case 8:
        {
            NSPredicate *sevenHealthPredicate = [NSPredicate predicateWithFormat:@"type==%@ AND health==7",@"Minion"];
            [predicateArray addObject: sevenHealthPredicate];
        }
            break;
        default:
        {
            NSPredicate *eightUpHealthPredicate = [NSPredicate predicateWithFormat:@"type==%@ AND health>=8",@"Minion"];
            [predicateArray addObject: eightUpHealthPredicate];
        }
            break;
    }
}

- (IBAction)durabilityWasChanged:(UISegmentedControl*)sender {
    switch (sender.selectedSegmentIndex) {
        case 0:
        {
            NSPredicate *allDurabilityPredicate = [NSPredicate predicateWithFormat:@"type==%@ AND durability>=0",@"Weapon"];
            [predicateArray addObject: allDurabilityPredicate];
        }
            break;
        case 1:
        {
            NSPredicate *zeroDurabilityPredicate = [NSPredicate predicateWithFormat:@"type==%@ AND durability==0",@"Weapon"];
            [predicateArray addObject: zeroDurabilityPredicate];
        }
            break;
        case 2:
        {
            NSPredicate *oneDurabilityPredicate = [NSPredicate predicateWithFormat:@"type==%@ AND durability==1",@"Weapon"];
            [predicateArray addObject: oneDurabilityPredicate];
        }
            break;
        case 3:
        {
            NSPredicate *twoDurabilityPredicate = [NSPredicate predicateWithFormat:@"type==%@ AND durability==2",@"Weapon"];
            [predicateArray addObject: twoDurabilityPredicate];
        }
            break;
        case 4:
        {
            NSPredicate *threeDurabilityPredicate = [NSPredicate predicateWithFormat:@"type==%@ AND durability==3",@"Weapon"];
            [predicateArray addObject: threeDurabilityPredicate];
        }
            break;
        case 5:
        {
            NSPredicate *fourDurabilityPredicate = [NSPredicate predicateWithFormat:@"type==%@ AND durability==4",@"Weapon"];
            [predicateArray addObject: fourDurabilityPredicate];
        }
            break;
        case 6:
        {
            NSPredicate *fiveUpDurabilityPredicate = [NSPredicate predicateWithFormat:@"type==%@ AND durability==5",@"Weapon"];
            [predicateArray addObject: fiveUpDurabilityPredicate];
        }
            break;
    }
}

///***** NEED TO MAKE ALL BUTTONS TOGGLES
///***** ONLY ALLOW BUTTONS TO BE PRESSED ONCE
///***** SEGMENTEDCONTROLS -- Only stores the last selected value, not multiple values. selecting multiple values breaks button

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"save"]) {
        STSearchTableViewController *vc = [segue destinationViewController];
        NSCompoundPredicate *compoundPredicate = [NSCompoundPredicate andPredicateWithSubpredicates:predicateArray];
        filteredCards = [cards filteredArrayUsingPredicate:compoundPredicate];
        [vc setCardArray:[self filteredCards]];
    }
}

@end
