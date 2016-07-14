//
//  ViewController.m
//  CurrencyConverter
//
//  Created by DonghuiLi on 16/7/12.
//  Copyright © 2016年 SchrodingersDog. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
//@property (strong, nonatomic) NSMutableArray* listOfRates;
@property (strong, nonatomic) NSMutableArray* listOfCurrency;
@end

@implementation ViewController
//@synthesize listOfRates;
@synthesize listOfCurrency;
- (void)viewDidLoad {
	[super viewDidLoad];
	Currency* usdCurrency = [[Currency alloc] initWithName:@"United States Dollar" alphaCode:@"USD" symbol:@"$" decimalPlaces:@(2)];
	Currency* cnyCurrency = [[Currency alloc] initWithName:@"Chinese Yuan" alphaCode:@"CNY" symbol:@"¥" decimalPlaces:@(2)];
	Currency* eurCurrency = [[Currency alloc] initWithName:@"Euro" alphaCode:@"EUR" symbol:@"€" decimalPlaces:@(2)];
	Currency* jpyCurrency = [[Currency alloc] initWithName:@"Japanese Yen" alphaCode:@"JPY" symbol:@"¥" decimalPlaces:@(0)];
	Currency* gbpCurrency = [[Currency alloc] initWithName:@"Pound Sterling" alphaCode:@"GBP" symbol:@"£" decimalPlaces:@(2)];
	
	listOfCurrency = [[NSMutableArray alloc] init];
	[listOfCurrency addObject:cnyCurrency];
	[listOfCurrency addObject:usdCurrency];
	[listOfCurrency addObject:eurCurrency];
	[listOfCurrency addObject:jpyCurrency];
	[listOfCurrency addObject:gbpCurrency];
	
	// Do any additional setup after loading the view, typically from a nib.
/*	listOfRates = [[NSMutableArray alloc] init];
	//[listOfRates addObject:[[ExchangeRate alloc] initWithHome:cnyCurrency foreign:cnyCurrency]];
	[listOfRates addObject:[[ExchangeRate alloc] initWithHome:cnyCurrency foreign:usdCurrency]];
	[listOfRates addObject:[[ExchangeRate alloc] initWithHome:cnyCurrency foreign:eurCurrency]];
	[listOfRates addObject:[[ExchangeRate alloc] initWithHome:cnyCurrency foreign:jpyCurrency]];
	[listOfRates addObject:[[ExchangeRate alloc] initWithHome:cnyCurrency foreign:gbpCurrency]];
	[listOfRates addObject:[[ExchangeRate alloc] initWithHome:usdCurrency foreign:eurCurrency]];
	[listOfRates addObject:[[ExchangeRate alloc] initWithHome:usdCurrency foreign:jpyCurrency]];
	[listOfRates addObject:[[ExchangeRate alloc] initWithHome:usdCurrency foreign:gbpCurrency]];
*/
	//[listOfRates addObject:[[ExchangeRate alloc] initWithHome:cnyCurrency foreign:usdCurrency]];
	
	self.homePickerView.delegate = self;
	self.homePickerView.dataSource = self;
	[self.homePickerView selectRow:0 inComponent:0 animated:NO];
	[self.homePickerView selectRow:1 inComponent:0 animated:NO];
	[self.homePickerView selectRow:2 inComponent:0 animated:NO];
	[self.homePickerView selectRow:3 inComponent:0 animated:NO];
	[self.homePickerView selectRow:4 inComponent:0 animated:NO];
	
	self.foreignPickerView.delegate = self;
	self.foreignPickerView.dataSource = self;
	[self.foreignPickerView selectRow:0 inComponent:0 animated:NO];
	[self.foreignPickerView selectRow:1 inComponent:0 animated:NO];
	[self.foreignPickerView selectRow:2 inComponent:0 animated:NO];
	[self.foreignPickerView selectRow:3 inComponent:0 animated:NO];
	[self.foreignPickerView selectRow:4 inComponent:0 animated:NO];
	
/*	for (int i=0;i<5;i++) {
		ExchangeRate* tmpRate = [listOfRates objectAtIndex:i];
		[tmpRate updateRate];
	}
*/
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
	return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component  {
	return 5;
}

- (NSString *)pickerView:(UIPickerView *)pickerView
			 titleForRow:(NSInteger)row
			forComponent:(NSInteger)component {
	//return ((Currency)[listOfRates objectAtIndex:row]).name;
/*	if (row == 0) return @"Chinese Yuan";
	if (row == 1) return @"United States Dollar";
	if (row == 2) return @"Euro";
	if (row == 3) return @"Japanese Yen";
	if (row == 4) return @"Pound Sterling";
	else return @"";*/
	
	Currency* tmp = [listOfCurrency objectAtIndex:row];
	return tmp.name;
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (IBAction)convertButton:(id)sender {
	NSInteger homeIndex = [self.homePickerView selectedRowInComponent:0];
	NSInteger foreignIndex = [self.foreignPickerView selectedRowInComponent:0];
	Currency* pickerHomeCurrency = [listOfCurrency objectAtIndex:homeIndex];
	Currency* pickerForeignCurrency = [listOfCurrency objectAtIndex:foreignIndex];
	
	ExchangeRate* currentExchangeRate = [[ExchangeRate alloc] initWithHome:pickerHomeCurrency foreign:pickerForeignCurrency];
	[currentExchangeRate updateRate];
	
	self.foreignCurrency.text = [pickerForeignCurrency format:@([currentExchangeRate exchangeToForeign:@(self.homeCurrency.text.floatValue)].floatValue)];
	//self.foreignCurrency.text = [tmp format: @([[listOfRates objectAtIndex:[self.foreignPickerView selectedRowInComponent:0]] exchangeToForeign:@(self.homeCurrency.text.floatValue)].floatValue) ];
}
@end
