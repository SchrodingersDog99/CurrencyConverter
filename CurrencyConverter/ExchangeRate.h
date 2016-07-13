//
//  ExchangeRate.h
//  CurrencyConverter
//
//  Created by DonghuiLi on 16/7/13.
//  Copyright © 2016年 SchrodingersDog. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Currency.h"

@interface ExchangeRate : NSObject //<NSCoding>

@property (strong, nonatomic) Currency* home;
@property (strong, nonatomic) Currency* foreign;
@property (strong, nonatomic) NSNumber* rate;
@property (strong, nonatomic) NSDate* expiresOn;
@property (strong, nonatomic) NSMutableDictionary *completionHandlerDictionary;
@property (strong, nonatomic) NSURLSessionConfiguration *ephemeralConfigObject;


-(bool) updateRate;
-(NSString*) exchangeToHome: (NSNumber*) value;
-(NSString*) exchangeToForeign: (NSNumber*) value;
-(void) reverse;
-(NSString*) name;
-(NSString*) description;
-(ExchangeRate*) initWithHome:(Currency*) aHome foreign:(Currency*) aForeign;

@end
