//
//  STjsonData.m
//  STHearthstoneDeckCompainion
//
//  Created by Steve on 8/21/15.
//  Copyright (c) 2015 Steve. All rights reserved.
//
//TRY TO DESERIALIZE THIS SHIT
#import "STjsonData.h"
#import "STHsCardData.h"

@implementation STjsonData

@synthesize sortedCards;

-(NSMutableArray*)jsonData{
    
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"https://omgvamp-hearthstone-v1.p.mashape.com/cards?collectible=1"]];
    [request setValue:@"szSMlNTNQ9msh5zykqdJkIW3bZYip1W52bBjsnBxohi2y1d5jA" forHTTPHeaderField:@"X-Mashape-Key"];
    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSError *jsonParsingError = nil;
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:response options:0 error:&jsonParsingError];
    
    
    NSArray *data = json.allValues;
    
    NSMutableArray *cardArray = [[NSMutableArray alloc] init];
    NSArray *sortedCards = [[NSArray alloc] init];
    
    for (NSDictionary *expansion in data)
        
        for (NSDictionary *cardObj in expansion){
            
                if(nil != cardObj) {
                    STHsCardData *newCard = [[STHsCardData alloc]initWithDictionary:cardObj];
                    [cardArray addObject: newCard];
        }
    }
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
    sortedCards =[cardArray sortedArrayUsingDescriptors:@[sort]];
    
    return sortedCards;
}


@end
