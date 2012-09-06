//
//  ConfigService
//
//  Created by Marcin Swierczynski on 06.09.2012.
//  Copyright (c) 2012 Vsnap Inc. All rights reserved.
//
#import <Foundation/Foundation.h>

static NSString *const LOCATION_SETTING_KEY = @"Location";
static NSString *const DAYS_NUMBER_SETTING_KEY = @"DaysNumber";

@interface ConfigService : NSObject

+ (ConfigService *)instance;

- (void)registerDefaultSettings;

@end