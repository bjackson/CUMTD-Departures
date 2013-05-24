
//
//  BJHTTPClient.m
//  CUMTD Departures
//
//  Created by Brett Jackson on 5/22/13.
//  Copyright (c) 2013 Brett Jackson. All rights reserved.
//

#import "BJHTTPClient.h"
#import "AFNetworking/AFNetworking.h"
#import "CUDeparture.h"
#import "CUAppDelegate.h"
NSString * const BJAPIKey = @"b7e39526445d48318fcff9d2a041e73b";

@implementation BJHTTPClient

+ (BJHTTPClient *)sharedClient {
    static dispatch_once_t predicate;
    static BJHTTPClient *_sharedClient = nil;
    dispatch_once(&predicate, ^{
        _sharedClient = [self alloc];
        _sharedClient = [_sharedClient initWithBaseURL:[self baseURL]];
    });
    return _sharedClient;
}

- (id)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    if (self) {
        // Accept HTTP Header
        [self setDefaultHeader:@"Accept" value:@"application/json"];
        // Register HTTP Operation Class
        [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
    }
    return self;
}

+ (NSURL *)baseURL {
    return [NSURL URLWithString:[NSString stringWithFormat:@"http://developer.cumtd.com/api/v2.2/json/"]];
}

+ (NSDictionary *)parametersWithKey:(NSDictionary *)params
{
    NSMutableDictionary *intermediateDictionary = [NSMutableDictionary dictionaryWithDictionary:params];
    [intermediateDictionary setObject:@"b7e39526445d48318fcff9d2a041e73b" forKey:@"key"];
    return [NSDictionary dictionaryWithDictionary:intermediateDictionary];
}

- (void)requestDeparturesByStop:(NSString *)stop_id
{
    __block NSMutableArray *departures;

    [self getPath:@"GetDeparturesByStop" parameters:[BJHTTPClient parametersWithKey:[NSDictionary dictionaryWithObject:stop_id forKey:@"stop_id"]]
          success:^(AFHTTPRequestOperation *operation, NSDictionary *responseObject) {
              departures = [CUDeparture initWithDeparturesDictionary:[responseObject objectForKey:@"departures"]];
              [CUAppDelegate updateDepartures:departures];
          }
          failure:^(AFHTTPRequestOperation *operation, NSError *error) {
              NSLog(@"%@", [error description]);
          }];
    


}

@end
