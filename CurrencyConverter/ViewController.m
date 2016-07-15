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
	
	// Do any additional setup after loading the view, typically from a nib.
	
	listOfCurrency = [Currency createCurrency];
	
	self.homePickerView.delegate = self;
	self.homePickerView.dataSource = self;
	[self.homePickerView selectRow:0 inComponent:0 animated:NO];
	/*[self.homePickerView selectRow:1 inComponent:0 animated:NO];
	[self.homePickerView selectRow:2 inComponent:0 animated:NO];
	[self.homePickerView selectRow:3 inComponent:0 animated:NO];
	[self.homePickerView selectRow:4 inComponent:0 animated:NO];*/
	
	self.foreignPickerView.delegate = self;
	self.foreignPickerView.dataSource = self;
	[self.foreignPickerView selectRow:0 inComponent:0 animated:NO];
	/*[self.foreignPickerView selectRow:1 inComponent:0 animated:NO];
	[self.foreignPickerView selectRow:2 inComponent:0 animated:NO];
	[self.foreignPickerView selectRow:3 inComponent:0 animated:NO];
	[self.foreignPickerView selectRow:4 inComponent:0 animated:NO];*/
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
	//NSLog(@"%ld", row);
	if (pickerView == self.homePickerView) {
		self.homeSymbol.text = ((Currency*)[listOfCurrency objectAtIndex:[self.homePickerView selectedRowInComponent:0]]).symbol;
	}
	if (pickerView == self.foreignPickerView) {
		self.foreignSymbol.text = ((Currency*)[listOfCurrency objectAtIndex:[self.foreignPickerView selectedRowInComponent:0]]).symbol;
		NSLog(@"%ld", row);
	}
	Currency* tmp = [listOfCurrency objectAtIndex:row];
	return tmp.name;
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (IBAction)convertButton:(id)sender {
	[self.foreignCurrency resignFirstResponder];
	[self.homeCurrency resignFirstResponder];

	
	NSInteger homeIndex = [self.homePickerView selectedRowInComponent:0];
	NSInteger foreignIndex = [self.foreignPickerView selectedRowInComponent:0];
	Currency* pickerHomeCurrency = [listOfCurrency objectAtIndex:homeIndex];
	Currency* pickerForeignCurrency = [listOfCurrency objectAtIndex:foreignIndex];
	
	ExchangeRate* currentExchangeRate = [[ExchangeRate alloc] initWithHome:pickerHomeCurrency foreign:pickerForeignCurrency];
	[currentExchangeRate updateRate];

	
	self.foreignCurrency.text = [currentExchangeRate exchangeToForeign:@(self.homeCurrency.text.floatValue)];
}

- (IBAction)switchButton:(id)sender {
	[self.foreignCurrency resignFirstResponder];
	[self.homeCurrency resignFirstResponder];

	NSString* tmp = self.foreignCurrency.text;
	self.foreignCurrency.text = self.homeCurrency.text;
	self.homeCurrency.text = tmp;
	
	NSInteger tmpInt = [self.homePickerView selectedRowInComponent:0];
	[self.homePickerView selectRow:[self.foreignPickerView selectedRowInComponent:0] inComponent:0 animated:NO];
	[self.foreignPickerView selectRow: tmpInt inComponent:0 animated:NO];
	[self convertButton:sender];
}

- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
	[self.foreignCurrency resignFirstResponder];
	[self.homeCurrency resignFirstResponder];
}

@end
