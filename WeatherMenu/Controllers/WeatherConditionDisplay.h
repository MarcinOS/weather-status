@class WeatherConditions;

//
//  WeatherConditionDisplay
//
//  Created by Marcin Swierczynski on 08.09.2012.
//  Copyright (c) 2012 Vsnap Inc. All rights reserved.
//
@protocol WeatherConditionDisplay <NSObject>

- (void)displayWeatherConditions:(WeatherConditions *)weatherConditions;

@end