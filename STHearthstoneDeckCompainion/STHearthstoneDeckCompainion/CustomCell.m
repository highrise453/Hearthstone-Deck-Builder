//
//  CustomCell.m
//  STHearthstoneDeckCompainion
//
//  Created by Steve on 9/18/15.
//  Copyright (c) 2015 Steve. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell

@synthesize nameLabel;
@synthesize textLabel;
@synthesize attackLabel;
@synthesize healthLabel;
@synthesize costLabel;
@synthesize durabilityLabel;
@synthesize cardImageView;

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
