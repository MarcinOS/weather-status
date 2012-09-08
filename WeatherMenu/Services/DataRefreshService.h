//
//  DataRefreshService
//
//  Created by Marcin Swierczynski on 08.09.2012.
//  Copyright (c) 2012 Vsnap Inc. All rights reserved.
//
#import <Foundation/Foundation.h>

@protocol WeatherConditionDisplay;


@interface DataRefreshService : NSObject

@property(strong) id <WeatherConditionDisplay> weatherConditionDisplay;
@property(strong) NSTimer *refreshTimer;

- (id)initWithWeatherConditionDisplay:(id <WeatherConditionDisplay>)weatherConditionDisplay;

- (void)presentCurrentConditions;


@end