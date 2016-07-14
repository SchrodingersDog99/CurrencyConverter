//
//  ViewController.h
//  CurrencyConverter
//
//  Created by DonghuiLi on 16/7/12.
//  Copyright © 2016年 SchrodingersDog. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ExchangeRate.h"
#import "Currency.h"

@interface ViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>

@property (weak, nonatomic) IBOutlet UITextField *homeCurrency;

@property (weak, nonatomic) IBOutlet UIPickerView *homePickerView;
@property (weak, nonatomic) IBOutlet UITextField *foreignCurrency;
@property (weak, nonatomic) IBOutlet UIPickerView *foreignPickerView;

- (IBAction)convertButton:(id)sender;

@end

