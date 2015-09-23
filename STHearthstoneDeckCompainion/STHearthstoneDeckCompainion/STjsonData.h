//
//  STjsonData.h
//  STHearthstoneDeckCompainion
//
//  Created by Steve on 8/21/15.
//  Copyright (c) 2015 Steve. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface STjsonData : NSObject


@property (nonatomic, strong) NSMutableArray* sortedCards;
-(NSMutableArray*)jsonData;


@end
