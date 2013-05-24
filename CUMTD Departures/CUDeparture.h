//
//  CUDeparture.h
//  CUMTD Departures
//
//  Created by Brett Jackson on 5/23/13.
//  Copyright (c) 2013 Brett Jackson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface CUDeparture : NSObject
{
    NSString *destination;
    NSDate *expected;
    NSNumber *expected_mins;
    CLLocation *location;
    NSString *route_color; // Hex value of color.
    NSString *route_short_name; // Line number.
    NSString *trip_direction; // e.g. East, West, North, South, Champaign, Urbana.
}

@property (retain) NSString *destination;
@property (retain) NSDate *expected;
@property (retain) NSNumber *expected_mins;
@property (retain) CLLocation *location;
@property (retain) NSString *route_color; // Hex value of color.
@property (retain) NSString *route_short_name; // Line number.
@property (retain) NSString *trip_direction; // e.g. East, West, North, South, Champaign, Urbana.


// Returns array of departures in type CUDeparture.
+ (NSMutableArray *)initWithDeparturesDictionary:(NSDictionary *)dictionary;
- (CUDeparture *)initOnlyOneWithDictionary:(NSDictionary *)dictionary;

@end
