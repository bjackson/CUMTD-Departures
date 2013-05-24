//
//  CUDeparture.m
//  CUMTD Departures
//
//  Created by Brett Jackson on 5/23/13.
//  Copyright (c) 2013 Brett Jackson. All rights reserved.
//

#import "CUDeparture.h"

@implementation CUDeparture

@synthesize destination;
@synthesize expected;
@synthesize expected_mins;
@synthesize location;
@synthesize route_color; // Hex value of color.
@synthesize route_short_name; // Line number.
@synthesize trip_direction; // e.g. East, West, North, South, Champaign, Urbana.


+ (NSMutableArray *)initWithDeparturesDictionary:(NSDictionary *)dictionary
{
    NSMutableArray *departureArray = [[NSMutableArray alloc] init];
    for (NSDictionary *departureDict in dictionary)
    {
        [departureArray addObject:[[CUDeparture alloc] initOnlyOneWithDictionary:departureDict]];

    }

    return departureArray;
}

- (CUDeparture *)initOnlyOneWithDictionary:(NSDictionary *)dictionary
{
    self = [CUDeparture alloc];
    if (self)
    {
        self.route_short_name = [dictionary objectForKey:@"route_short_name"];
        self.destination = [[dictionary objectForKey:@"destination"] objectForKey:@"stop_id"];
        self.expected = [dictionary objectForKey:@"expected"];
        self.expected_mins = [dictionary objectForKey:@"expected_mins"];
        self.location = [self.location initWithLatitude:[[[dictionary objectForKey:@"location"] objectForKey:@"lat"] doubleValue]
                               longitude:[[[dictionary objectForKey:@"location"] objectForKey:@"lon"] doubleValue]];

    }
    return self;
}




@end
