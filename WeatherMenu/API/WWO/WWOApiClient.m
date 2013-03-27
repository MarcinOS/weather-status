//
//  WWOApiClient
//
//  Created by Marcin Swierczynski on 01.09.2012.
//  Copyright (c) 2012 Vsnap Inc. All rights reserved.
//
#import "WWOApiClient.h"
#import "AFNetworking.h"


static NSString *const API_KEY = @"ay4bmetjz74hhkb44jjdyhpy";
static NSString *const FORMAT = @"json";
static NSString *const WEATHER_ENDPOINT = @"weather.ashx";

@implementation WWOApiClient {

}

+ (WWOApiClient *)instance
{
	static WWOApiClient *_instance = nil;

	@synchronized (self) {
		if (_instance == nil) {
			_instance = [[self alloc] initWithBaseURL];
		}
	}

	return _instance;
}

- (id)initWithBaseURL
{
	self = [super initWithBaseURL:[[NSURL alloc] initWithString:@"http://api.worldweatheronline.com/free/v1/"]];
	if (self) {
		[self registerHTTPOperationClass:[AFJSONRequestOperation class]];
	}

	return self;
}

- (void)currentConditionsIn:(NSString *)city forDays:(NSInteger)daysNo responseHandler:(void (^)(NSDictionary *))success
{
	NSMutableDictionary *params = [self createParams];
	[params setObject:city forKey:@"q"];
	[params setObject:[NSNumber numberWithLong:daysNo] forKey:@"num_of_days"];

	[[WWOApiClient instance] getPath:WEATHER_ENDPOINT parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
		NSError *error;
		NSDictionary *response = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:&error];
		if (error) {
			NSLog(@"%@", error);
			success(nil);
		}
		success(response);
	} failure:^(AFHTTPRequestOperation *operation, NSError *error) {
		NSLog(@"%@", error);
	}];
}

- (NSMutableDictionary *)createParams
{
	NSMutableDictionary *params = [NSMutableDictionary dictionary];

	[params setValue:API_KEY forKey:@"key"];
	[params setValue:FORMAT forKey:@"format"];

	return params;
}


@end