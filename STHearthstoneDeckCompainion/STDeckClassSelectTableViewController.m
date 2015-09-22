//
//  STDeckClassSelectTableViewController.m
//  STHearthstoneDeckCompainion
//
//  Created by Steve on 8/17/15.
//  Copyright (c) 2015 Steve. All rights reserved.
//

#import "STDeckClassSelectTableViewController.h"
#import "STjsonData.h"
#import "DeckEditorTableViewController.h"

@interface STDeckClassSelectTableViewController ()

@end

@implementation STDeckClassSelectTableViewController

@synthesize classes;
@synthesize classImages;
@synthesize cards;
@synthesize deckCards;

- (void)viewDidLoad {
    [super viewDidLoad];
    STjsonData *cardData = [[STjsonData alloc]init];
    deckCards = [[NSArray alloc] init];
    cards = cardData.jsonData;
    
    self.classes= [[NSArray alloc] initWithObjects: @"Paladin", @"Priest", @"Shaman",
                  @"Warrior", @"Mage", @"Warlock", @"Hunter", @"Druid", @"Rogue",  nil];
    
   
    self.classImages =[[NSArray alloc] initWithObjects:
      [UIImage imageNamed:@"Paladin.jpeg"],
      [UIImage imageNamed:@"Priest.jpg"],
      [UIImage imageNamed:@"Shaman.jpg"],
      [UIImage imageNamed:@"Warrior.jpg"],
      [UIImage imageNamed:@"mage.jpg"],
      [UIImage imageNamed:@"Warlock.jpeg"],
      [UIImage imageNamed:@"Hunter.png"],
      [UIImage imageNamed:@"Druid.jpeg"],
      [UIImage imageNamed:@"Rogue.jpg"],
      nil];
    
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.classes count];
}

- (UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
    static NSString* CellIdentifier = @"Cell";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text=[self.classes objectAtIndex:indexPath.row];
    cell.imageView.image = [self.classImages objectAtIndex:indexPath.row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSString *selectedCell = cell.textLabel.text;
    

    
    NSUserDefaults *savedClass = [NSUserDefaults standardUserDefaults];
    
    if ([selectedCell  isEqual: @"Paladin"]){
        NSPredicate *paladinPredicate = [NSPredicate predicateWithFormat:@"playerClass==%@ OR playerClass==NULL",@"Paladin"];
        deckCards = [cards filteredArrayUsingPredicate:paladinPredicate];
    [self performSegueWithIdentifier:@"classSelectSegue" sender:indexPath];
    }
    if ([selectedCell  isEqual: @"Priest"]){
        NSPredicate *paladinPredicate = [NSPredicate predicateWithFormat:@"playerClass==%@ OR playerClass==NULL",@"Priest"];
        deckCards = [cards filteredArrayUsingPredicate:paladinPredicate];
        [self performSegueWithIdentifier:@"classSelectSegue" sender:indexPath];
    }
    if ([selectedCell  isEqual: @"Shaman"]){
        NSPredicate *paladinPredicate = [NSPredicate predicateWithFormat:@"playerClass==%@ OR playerClass==NULL",@"Shaman"];
        deckCards = [cards filteredArrayUsingPredicate:paladinPredicate];
        [self performSegueWithIdentifier:@"classSelectSegue" sender:indexPath];
    }
    if ([selectedCell  isEqual: @"Warrior"]){
        NSPredicate *paladinPredicate = [NSPredicate predicateWithFormat:@"playerClass==%@ OR playerClass==NULL",@"Warrior"];
        deckCards = [cards filteredArrayUsingPredicate:paladinPredicate];
        [self performSegueWithIdentifier:@"classSelectSegue" sender:indexPath];
    }
    if ([selectedCell  isEqual: @"Mage"]){
        NSPredicate *paladinPredicate = [NSPredicate predicateWithFormat:@"playerClass==%@ OR playerClass==NULL",@"Mage"];
        deckCards = [cards filteredArrayUsingPredicate:paladinPredicate];
        [self performSegueWithIdentifier:@"classSelectSegue" sender:indexPath];
    }
    if ([selectedCell  isEqual: @"Warlock"]){
        NSPredicate *paladinPredicate = [NSPredicate predicateWithFormat:@"playerClass==%@ OR playerClass==NULL",@"Warlock"];
        deckCards = [cards filteredArrayUsingPredicate:paladinPredicate];
        [self performSegueWithIdentifier:@"classSelectSegue" sender:indexPath];
    }
    if ([selectedCell  isEqual: @"Hunter"]){
        NSPredicate *paladinPredicate = [NSPredicate predicateWithFormat:@"playerClass==%@ OR playerClass==NULL",@"Hunter"];
        deckCards = [cards filteredArrayUsingPredicate:paladinPredicate];
        [self performSegueWithIdentifier:@"classSelectSegue" sender:indexPath];
    }
    if ([selectedCell  isEqual: @"Druid"]){
        NSPredicate *paladinPredicate = [NSPredicate predicateWithFormat:@"playerClass==%@ OR playerClass==NULL",@"Druid"];
        deckCards = [cards filteredArrayUsingPredicate:paladinPredicate];
        [self performSegueWithIdentifier:@"classSelectSegue" sender:indexPath];
    }
    if ([selectedCell  isEqual: @"Rogue"]){
        NSPredicate *paladinPredicate = [NSPredicate predicateWithFormat:@"playerClass==%@ OR playerClass==NULL",@"Rogue"];
        deckCards = [cards filteredArrayUsingPredicate:paladinPredicate];
        [self performSegueWithIdentifier:@"classSelectSegue" sender:indexPath];
    }
    [savedClass setObject:selectedCell forKey:@"class"];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"classSelectSegue"]) {
        DeckEditorTableViewController *vc = [segue destinationViewController];
        [vc setCardArray:[self deckCards]];
    }
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
