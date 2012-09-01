//
//  WWOApiClient
//
//  Created by Marcin Swierczynski on 01.09.2012.
//  Copyright (c) 2012 Vsnap Inc. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "AFHTTPClient.h"


@interface WWOApiClient : AFHTTPClient

+ (WWOApiClient *)instance;

- (void)currentConditionsIn:(NSString *)city forDays:(int)daysNo responseHandler:(void (^)(NSDictionary *))success;


@end