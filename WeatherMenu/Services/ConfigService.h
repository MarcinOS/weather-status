//
//  ConfigService
//
//  Created by Marcin Swierczynski on 06.09.2012.
//  Copyright (c) 2012 Vsnap Inc. All rights reserved.
//
#import <Foundation/Foundation.h>

static NSString *const LOCATION_SETTING_KEY = @"Location";
static NSString *const DAYS_NUMBER_SETTING_KEY = @"DaysNumber";
static NSString *const TEMERATURE_UNIT_SETTING_KEY = @"TemperatureUnit";
static NSString *const REFRESH_INTERVAL_SETTING_KEY = @"RefreshInterval";
static NSString* REFRESH_INTERVAL_KEY_PATH = @"values.RefreshInterval";

@interface ConfigService : NSObject

+ (ConfigService *)instance;

- (void)registerDefaultSettings;

@end