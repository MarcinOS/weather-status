//
//  WorldWeatherOnlineService
//
//  Created by Marcin Swierczynski on 01.09.2012.
//  Copyright (c) 2012 Vsnap Inc. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "WeatherService.h"


@interface WorldWeatherOnlineService : NSObject<WeatherService>

+ (WorldWeatherOnlineService<WeatherService> *)instance;

@end