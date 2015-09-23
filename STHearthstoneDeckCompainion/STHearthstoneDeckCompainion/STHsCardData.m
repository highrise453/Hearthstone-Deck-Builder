//
//  STHsCardData.m
//  STHearthstoneDeckCompainion
//
//  Created by Steve on 6/8/15.
//  Copyright (c) 2015 Steve. All rights reserved.
//

#import "STHsCardData.h"

@implementation STHsCardData

@synthesize name;
@synthesize cost;
@synthesize type;
@synthesize rarity;
@synthesize race;
@synthesize playerClass;
@synthesize text;
@synthesize flavor;
@synthesize artist;
@synthesize attack;
@synthesize health;
@synthesize durability;
@synthesize img;
@synthesize cardSet;

-(instancetype)initWithDictionary: (NSDictionary*) dict{
    self = [super init];
    if (self != nil) {
        name = [dict objectForKey:@"name"];
        cost = [[dict objectForKey:@"cost"] integerValue];
        type = [dict objectForKey:@"type"];
        rarity = [dict objectForKey:@"rarity"];
        race = [dict objectForKey:@"race"];
        playerClass = [dict objectForKey:@"playerClass"];
        text = [dict objectForKey:@"text"];
        flavor = [dict objectForKey:@"flavor"];
        artist = [dict objectForKey:@"artist"];
        attack = [[dict objectForKey:@"attack"] integerValue];
        health = [[dict objectForKey:@"health"] integerValue];
        durability = [[dict objectForKey:@"durability"] integerValue];
        img = [dict objectForKey:@"img"];
        cardSet = [dict objectForKey:@"cardSet"];

    }
    return self;
}
/*
- (NSString*)cardDescription {
    return [NSString stringWithFormat:@"%@",name];
}*/
- (void)encodeWithCoder:(NSCoder *)coder{
        
        [coder encodeObject:self.name forKey:@"name"];
        [coder encodeInteger:self.cost forKey:@"cost"];
        [coder encodeObject:self.type forKey:@"type"];
        [coder encodeObject:self.rarity forKey:@"rarity"];
        [coder encodeObject:self.race forKey:@"race"];
        [coder encodeObject:self.playerClass forKey:@"playerClass"];
        [coder encodeObject:self.text forKey:@"text"];
        [coder encodeObject:self.flavor forKey:@"flavor"];
        [coder encodeObject:self.artist forKey:@"artist"];
        [coder encodeInteger:self.attack forKey:@"attack"];
        [coder encodeInteger:self.health forKey:@"health"];
        [coder encodeInteger:self.durability forKey:@"durability"];
        [coder encodeObject:self.img forKey:@"img"];
        [coder encodeObject:self.cardSet forKey:@"cardSet"];
    
}

- (id)initWithCoder:(NSCoder *)decoder {
    if (self == [super init]) {
        self.name = [decoder decodeObjectForKey:@"name"];
        self.cost = [decoder decodeIntegerForKey:@"cost"];
        self.type =[decoder decodeObjectForKey:@"type"];
        self.rarity =[decoder decodeObjectForKey:@"rarity"];
        self.race =[decoder decodeObjectForKey:@"race"];
        self.playerClass =[decoder decodeObjectForKey:@"playerClass"];
        self.text =[decoder decodeObjectForKey:@"text"];
        self.flavor =[decoder decodeObjectForKey:@"flavor"];
        self.artist =[decoder decodeObjectForKey:@"artist"];
        self.attack =[decoder decodeIntegerForKey:@"attack"];
        self.health =[decoder decodeIntegerForKey:@"health"];
        self.durability =[decoder decodeIntegerForKey:@"durability"];
        self.img =[decoder decodeObjectForKey:@"img"];
        self.cardSet =[decoder decodeObjectForKey:@"cardSet"];
    }
    return self;
}

@end