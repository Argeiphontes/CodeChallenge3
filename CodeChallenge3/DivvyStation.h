//
//  DivvyStation.h
//  CodeChallenge3
//
//  Created by Christopher on 10/17/14.
//  Copyright (c) 2014 Mobile Makers. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DivvyStation : NSObject


@property NSString *stationName;
@property NSString *stationAddress;
@property NSNumber *latitude;
@property NSNumber *longitude;
@property  NSNumber *availableBikes;

-(instancetype)initWithDictionary: (NSDictionary *)stationDictionary;

@end
