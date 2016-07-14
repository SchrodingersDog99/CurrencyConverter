//
//  Currency.m
//  CurrencyConverter
//
//  Created by DonghuiLi on 16/7/13.
//  Copyright © 2016年 SchrodingersDog. All rights reserved.
//

#import "Currency.h"

@implementation Currency

@synthesize name;
@synthesize alphaCode;
@synthesize symbol;
@synthesize formatter;

-(Currency*) initWithName: (NSString*) aName
				alphaCode: (NSString*) aCode
				   symbol: (NSString*) aSymbol
			decimalPlaces: (NSNumber*) places
{
	Currency* aCurrency = [[Currency alloc] init];
	aCurrency.name = aName;
	aCurrency.alphaCode = aCode;
	aCurrency.symbol = aSymbol;
	aCurrency.formatter = [[NSNumberFormatter alloc] init];
	
	
	return aCurrency;
}

-(NSString*) format: (NSNumber*) quantity {
//	NSString*
	return [NSString stringWithFormat:@"%@", quantity];
}


+(NSMutableArray*) createCurrency
{
	Currency* usdCurrency = [[Currency alloc] initWithName:@"United States Dollar" alphaCode:@"USD" symbol:@"$" decimalPlaces:@(2)];
	Currency* cnyCurrency = [[Currency alloc] initWithName:@"Chinese Yuan" alphaCode:@"CNY" symbol:@"¥" decimalPlaces:@(2)];
	Currency* eurCurrency = [[Currency alloc] initWithName:@"Euro" alphaCode:@"EUR" symbol:@"€" decimalPlaces:@(2)];
	Currency* jpyCurrency = [[Currency alloc] initWithName:@"Japanese Yen" alphaCode:@"JPY" symbol:@"¥" decimalPlaces:@(0)];
	Currency* gbpCurrency = [[Currency alloc] initWithName:@"Pound Sterling" alphaCode:@"GBP" symbol:@"£" decimalPlaces:@(2)];
	
	NSMutableArray* listOfCurrency = [[NSMutableArray alloc]init];
	listOfCurrency = [[NSMutableArray alloc] init];
	[listOfCurrency addObject:cnyCurrency];
	[listOfCurrency addObject:usdCurrency];
	[listOfCurrency addObject:eurCurrency];
	[listOfCurrency addObject:jpyCurrency];
	[listOfCurrency addObject:gbpCurrency];
	
	return listOfCurrency;
}

@end


