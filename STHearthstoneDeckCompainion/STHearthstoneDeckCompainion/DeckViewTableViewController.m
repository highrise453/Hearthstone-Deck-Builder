//
//  DeckViewTableViewController.m
//  STHearthstoneDeckCompainion
//
//  Created by Steve on 9/16/15.
//  Copyright (c) 2015 Steve. All rights reserved.
//

#import "DeckViewTableViewController.h"
#import "CustomCell.h"
#import "STHsCardData.h"

@interface DeckViewTableViewController ()


@end


@implementation DeckViewTableViewController

@synthesize deck;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = [NSString stringWithFormat:@"Cards: %lu", deck.count];

    //Save Deck
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:deck];
    [[NSUserDefaults standardUserDefaults] setObject:data forKey:@"deck"];
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return deck.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static NSString *CellIdentifier =@"customCell";
    CustomCell *cell = (CustomCell*)[tableView
                                     dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CustomCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }

    cell.nameLabel.text =[[deck objectAtIndex:indexPath.row ] valueForKey:@"name"];
    cell.cardTextLabel.text = [[deck objectAtIndex:indexPath.row] valueForKey:@"text"];
    cell.attackLabel.text =[NSString stringWithFormat:@"Attack: %@", [[deck objectAtIndex:indexPath.row] valueForKey:@"attack"]];
    cell.healthLabel.text =[NSString stringWithFormat:@"Health: %@", [[deck objectAtIndex:indexPath.row] valueForKey:@"health"]];
    cell.costLabel.text =[NSString stringWithFormat:@"Cost: %@", [[deck objectAtIndex:indexPath.row] valueForKey:@"cost"]];
    cell.durabilityLabel.text =[NSString stringWithFormat:@"Durability: %@", [[deck objectAtIndex:indexPath.row] valueForKey:@"durability"]];
    
    NSString *imgURL=[[deck objectAtIndex:indexPath.row]valueForKey:@"img"];
    imgURL = [imgURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString: imgURL]]];
    cell.imageView.image = image;

    
    return cell;
}
- (void) tableView: (UITableView *) tableView didSelectRowAtIndexPath: (NSIndexPath *) indexPath{
    [deck removeObject:[deck objectAtIndex:indexPath.row]];
    [tableView reloadData];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 152;
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
