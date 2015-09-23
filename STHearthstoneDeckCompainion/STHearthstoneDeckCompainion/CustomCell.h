//
//  CustomCell.h
//  STHearthstoneDeckCompainion
//
//  Created by Steve on 9/18/15.
//  Copyright (c) 2015 Steve. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UILabel *cardTextLabel;
@property (nonatomic, weak) IBOutlet UILabel *attackLabel;
@property (nonatomic, weak) IBOutlet UILabel *healthLabel;
@property (nonatomic, weak) IBOutlet UILabel *costLabel;
@property (nonatomic, weak) IBOutlet UILabel *durabilityLabel;
@property (nonatomic, weak) IBOutlet UIImageView *cardImageView;


@end
