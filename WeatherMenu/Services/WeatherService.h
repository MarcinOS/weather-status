@class WeatherConditions;

//
//  WeatherService
//
//  Created by Marcin Swierczynski on 01.09.2012.
//  Copyright (c) 2012 Vsnap Inc. All rights reserved.
//
@protocol WeatherService <NSObject>

- (void)currentConditions:(void (^)(WeatherConditions *))conditionsBlock;

@end