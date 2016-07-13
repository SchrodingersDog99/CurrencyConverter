//
//  ViewController.h
//  CurrencyConverter
//
//  Created by DonghuiLi on 16/7/12.
//  Copyright © 2016年 SchrodingersDog. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *homeCurrency;

@property (weak, nonatomic) IBOutlet UITextField *foreignCurrency;

- (IBAction)convertButton:(id)sender;

@end

