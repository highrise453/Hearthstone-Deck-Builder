//
//  DeckEditorTableViewController.h
//  STHearthstoneDeckCompainion
//
//  Created by Steve on 9/13/15.
//  Copyright (c) 2015 Steve. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DeckEditorTableViewController : UITableViewController <UISearchBarDelegate, UISearchDisplayDelegate>

@property (strong, nonatomic) NSArray *cardArray;
@property (strong,nonatomic) NSMutableArray *filteredCardArray;
@property (strong,nonatomic) NSMutableArray *deckArray;


@property IBOutlet UISearchBar *deckEditorSearchBar;

@end
