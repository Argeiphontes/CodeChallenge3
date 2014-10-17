//
//  DivvyStation.m
//  CodeChallenge3
//
//  Created by Christopher on 10/17/14.
//  Copyright (c) 2014 Mobile Makers. All rights reserved.
//

#import "DivvyStation.h"

@implementation DivvyStation

-(instancetype)initWithDictionary:(NSDictionary *)stationDictionary
{
    self = [super init];
    if (self)
    {
        self.stationName = stationDictionary[@"stationName"];
        self.stationAddress = stationDictionary[@"stAddress1"];
        self.latitude = stationDictionary[@"latitude"];
        self.longitude = stationDictionary[@"longitude"];
        self.availableBikes = stationDictionary[@"availableBikes"];

    }
    return self;
}

@end
