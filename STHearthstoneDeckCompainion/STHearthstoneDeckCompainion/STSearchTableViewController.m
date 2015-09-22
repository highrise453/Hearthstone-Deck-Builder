//
//  STSearchTableViewController.m
//  STHearthstoneDeckCompainion
//
//  Created by Steve on 8/17/15.
//  Copyright (c) 2015 Steve. All rights reserved.
//

#import "STSearchTableViewController.h"
#import "STjsonData.h"
#import "CustomCell.h"



@interface STSearchTableViewController ()

@end

@implementation STSearchTableViewController

@synthesize cardArray;
@synthesize cardSearchBar;
@synthesize filteredCardArray;


- (void)viewDidLoad {
    [super viewDidLoad];

    STjsonData *jsonData = [[STjsonData alloc] init];
   
    if(cardArray == nil){

        cardArray = jsonData.jsonData;
    }
    
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
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return [filteredCardArray count];
    } else {
        return [cardArray count];
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    
    // Configure the cell..
    static NSString *CellIdentifier =@"customCell";
    CustomCell *cell = (CustomCell*)[tableView
                             dequeueReusableCellWithIdentifier:CellIdentifier];
        if (!cell) {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CustomCell" owner:self options:nil];
            cell = [nib objectAtIndex:0];
        }
        if (tableView == self.searchDisplayController.searchResultsTableView) {
            
            cell.nameLabel.text =[[filteredCardArray objectAtIndex:indexPath.row ] valueForKey:@"name"];
            cell.cardTextLabel.text = [[filteredCardArray objectAtIndex:indexPath.row] valueForKey:@"text"];
            cell.attackLabel.text =[NSString stringWithFormat:@"Attack: %@", [[filteredCardArray objectAtIndex:indexPath.row] valueForKey:@"attack"]];
            cell.healthLabel.text =[NSString stringWithFormat:@"Health: %@", [[filteredCardArray objectAtIndex:indexPath.row] valueForKey:@"health"]];
            cell.costLabel.text =[NSString stringWithFormat:@"Cost: %@", [[filteredCardArray objectAtIndex:indexPath.row] valueForKey:@"cost"]];
            cell.durabilityLabel.text =[NSString stringWithFormat:@"Durability: %@", [[filteredCardArray objectAtIndex:indexPath.row] valueForKey:@"durability"]];
            
            NSString *imgURL=[[filteredCardArray objectAtIndex:indexPath.row]valueForKey:@"img"];
            imgURL = [imgURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
            UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString: imgURL]]];
            cell.imageView.image = image;
        }
        else {
            cell.nameLabel.text =[[cardArray objectAtIndex:indexPath.row ] valueForKey:@"name"];
            cell.cardTextLabel.text = [[cardArray objectAtIndex:indexPath.row] valueForKey:@"text"];
            cell.attackLabel.text =[NSString stringWithFormat:@"Attack: %@", [[cardArray objectAtIndex:indexPath.row] valueForKey:@"attack"]];
            cell.healthLabel.text =[NSString stringWithFormat:@"Health: %@", [[cardArray objectAtIndex:indexPath.row] valueForKey:@"health"]];
            cell.costLabel.text =[NSString stringWithFormat:@"Cost: %@", [[cardArray objectAtIndex:indexPath.row] valueForKey:@"cost"]];
            cell.durabilityLabel.text =[NSString stringWithFormat:@"Durability: %@", [[cardArray objectAtIndex:indexPath.row] valueForKey:@"durability"]];
            
            NSString *imgURL=[[cardArray objectAtIndex:indexPath.row]valueForKey:@"img"];
            imgURL = [imgURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
            UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString: imgURL]]];
            cell.imageView.image = image;
        }
    return cell;
}

#pragma mark Content Filtering
-(void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope {
    // Update the filtered array based on the search text and scope.
    // Remove all objects from the filtered search array
    [self.filteredCardArray removeAllObjects];
    // Filter the array using NSPredicate
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF.name contains[c] %@",searchText];
    filteredCardArray = [NSMutableArray arrayWithArray:[cardArray filteredArrayUsingPredicate:predicate]];
}
#pragma mark - UISearchDisplayController Delegate Methods
-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString {
    // Tells the table data source to reload when text changes
    [self filterContentForSearchText:searchString scope:
     [[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:[self.searchDisplayController.searchBar selectedScopeButtonIndex]]];
    // Return YES to cause the search result table view to be reloaded.
    return YES;
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchScope:(NSInteger)searchOption {
    // Tells the table data source to reload when scope bar selection changes
    [self filterContentForSearchText:self.searchDisplayController.searchBar.text scope:
    [[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:searchOption]];
    // Return YES to cause the search result table view to be reloaded.
    return YES;
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
