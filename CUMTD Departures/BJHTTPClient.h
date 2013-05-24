//
//  BJHTTPClient.h
//  CUMTD Departures
//
//  Created by Brett Jackson on 5/22/13.
//  Copyright (c) 2013 Brett Jackson. All rights reserved.
//

#import "AFHTTPClient.h"


@interface BJHTTPClient : AFHTTPClient
#pragma mark -
#pragma mark Shared Client

+ (BJHTTPClient *)sharedClient;

+ (NSDictionary *)parametersWithKey:(NSDictionary *)params;
- (void)requestDeparturesByStop:(NSString *)stop_id;

@end
