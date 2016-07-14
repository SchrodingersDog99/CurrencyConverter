//
//  ExchangeRate.m
//  CurrencyConverter
//
//  Created by DonghuiLi on 16/7/13.
//  Copyright © 2016年 SchrodingersDog. All rights reserved.
//

#import "ExchangeRate.h"

@implementation ExchangeRate

@synthesize home;
@synthesize foreign;
@synthesize rate;
@synthesize expiresOn;
@synthesize completionHandlerDictionary;
@synthesize ephemeralConfigObject;

-(ExchangeRate*) initWithHome:(Currency*) aHome foreign:(Currency*) aForeign {
	self = [super init];
	if (self) {
		self.home = aHome;
		self.foreign = aForeign;
		self.completionHandlerDictionary = [NSMutableDictionary dictionaryWithCapacity:0];
		self.ephemeralConfigObject = [NSURLSessionConfiguration ephemeralSessionConfiguration];
	}
	
	return self;
}

-(bool) updateRate {
	NSString* urlString = [NSString stringWithFormat: @"https://query.yahooapis.com/v1/public/yql?q=select%%20*%%20from%%20yahoo.finance.xchange%%20where%%20pair%%20in%%20(%%22%@%@%%22)&format=json&env=store%%3A%%2F%%2Fdatatables.org%%2Falltableswithkeys&callback=", self.home.alphaCode, self.foreign.alphaCode];
	NSOperationQueue *mainQueue = [NSOperationQueue mainQueue];
	NSURLSession *delegateFreeSession = [NSURLSession sessionWithConfiguration: self.ephemeralConfigObject delegate: nil delegateQueue: mainQueue];
	NSLog(@"dispatching %@", [self description]);
	NSURLSessionTask* task = [delegateFreeSession dataTaskWithURL: [NSURL URLWithString: urlString]
												completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
													//NSLog(@"Got response %@ with error %@.\n", response, error);
													id obj = [NSJSONSerialization JSONObjectWithData: data
																							 options: 0
																							   error: nil];
													if( [obj isKindOfClass: [NSDictionary class]] ){
														NSDictionary *dict = (NSDictionary*)obj;
														NSDictionary *dictQuery = (NSDictionary*) [dict objectForKey:@"query"];
														NSDictionary *dictResult = (NSDictionary*) [dictQuery objectForKey:@"results"];
														NSDictionary *dictRate = (NSDictionary*) [dictResult objectForKey:@"rate"];
														NSString* tmp = (NSString*)[dictRate objectForKey:@"Rate"];
														self.rate = @(tmp.floatValue);
														//NSLog(@"%@", [dict objectForKey:@"results"]);
														NSLog(@"%@", tmp);
													}else{
														NSLog(@"Not a dictionary.");
														exit(1);
													}
												}];
	[task resume];
	[[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:1]];

	return YES;
}

-(NSString*) exchangeToHome: (NSNumber*) value {
	return [self.home format: @(value.floatValue / self.rate.floatValue)];
}

-(NSString*) exchangeToForeign: (NSNumber*) value {
	return [self.foreign format: @(value.floatValue * self.rate.floatValue)];
}

-(void) reverse {
	self.rate = @(1.0 / (self.rate).floatValue);
	Currency* tmp = self.home;
	self.home = self.foreign;
	self.foreign = tmp;
}

-(NSString*) name {
	return [home.alphaCode stringByAppendingString:foreign.alphaCode];
}

-(NSString*) description {
	return [NSString stringWithFormat:@"%@ to %@ at rate:%@",self.home.alphaCode, self.foreign.alphaCode, self.rate];
}



@end
