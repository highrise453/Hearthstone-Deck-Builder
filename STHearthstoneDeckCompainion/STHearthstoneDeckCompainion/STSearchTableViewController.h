//
//  STSearchTableViewController.h
//  STHearthstoneDeckCompainion
//
//  Created by Steve on 8/17/15.
//  Copyright (c) 2015 Steve. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface STSearchTableViewController : UITableViewController <UISearchBarDelegate, UISearchDisplayDelegate>

@property (strong, nonatomic) NSMutableArray *cardArray;
@property (strong,nonatomic) NSMutableArray *filteredCardArray;

@property IBOutlet UISearchBar *cardSearchBar;



@end
