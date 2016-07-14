//
//  Currency.h
//  CurrencyConverter
//
//  Created by DonghuiLi on 16/7/13.
//  Copyright © 2016年 SchrodingersDog. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Currency : NSObject// <NSCoding>

@property (strong, nonatomic) NSString* name;
@property (strong, nonatomic) NSString* alphaCode;
@property (strong, nonatomic) NSString* symbol;
@property (strong, nonatomic) NSNumberFormatter* formatter;

-(Currency*) initWithName: (NSString*) aName
				alphaCode: (NSString*) aCode
				   symbol: (NSString*) aSymbol
			decimalPlaces: (NSNumber*) places;

-(NSString*) format: (NSNumber*) quantity;

+(NSMutableArray*) createCurrency;
@end
