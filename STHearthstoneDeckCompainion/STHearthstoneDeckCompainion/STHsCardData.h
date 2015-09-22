//
//  STHsCardData.h
//  STHearthstoneDeckCompainion
//
//  Created by Steve on 6/8/15.
//  Copyright (c) 2015 Steve. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface STHsCardData : NSObject <NSCoding>

@property (strong, nonatomic) NSString *name;
@property (assign, nonatomic) NSInteger cost;
@property (strong, nonatomic) NSString *type;
@property (strong, nonatomic) NSString *rarity;
@property (strong, nonatomic) NSString *race;
@property (strong, nonatomic) NSString *playerClass;
@property (strong, nonatomic) NSString *text;
@property (strong, nonatomic) NSString *flavor;
@property (strong, nonatomic) NSString *artist;
@property (assign, nonatomic) NSInteger attack;
@property (assign, nonatomic) NSInteger health;
@property (assign, nonatomic) NSInteger durability;
@property (strong, nonatomic) NSString *cardSet;
@property (strong, nonatomic) NSString *img;


-(NSString*)cardDescription;
-(instancetype)initWithDictionary: (NSDictionary*) dict;

@end
