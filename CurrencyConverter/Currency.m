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

@end


