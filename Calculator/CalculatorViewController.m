//
//  CalculatorViewController.m
//  Calculator
//
//  Created by Ki-Yong Kim on 7/22/13.
//  Copyright (c) 2013 Ki-Yong Kim. All rights reserved.
//

#import "CalculatorViewController.h"
#import "CalculatorBrain.h"

@interface CalculatorViewController ()
@property (nonatomic) BOOL userIsInTheMiddelOfEnteringANumber;
@property (nonatomic, strong) CalculatorBrain *brain;
@end

@implementation CalculatorViewController

@synthesize display = _display;
@synthesize userIsInTheMiddelOfEnteringANumber = _userIsInTheMiddelOfEnteringANumber;
@synthesize brain = _brain;

- (CalculatorBrain *)brain
{
    if (!_brain) _brain = [[CalculatorBrain alloc] init];
    return _brain; 
}

- (IBAction)digitPressed:(UIButton *)sender
{
    NSString *digit = sender.currentTitle;
    if(self.userIsInTheMiddelOfEnteringANumber){
        self.display.text = [self.display.text stringByAppendingString:digit];
    }
    else{
        self.display.text = digit;
        self.userIsInTheMiddelOfEnteringANumber = YES;
    }
}

- (IBAction)enterPressed
{
    [self.brain pushOperand:[self.display.text doubleValue]];
    self.userIsInTheMiddelOfEnteringANumber = NO;
}

- (IBAction)operationPressed:(UIButton *)sender
{
    if(self.userIsInTheMiddelOfEnteringANumber) [self enterPressed];
    double result = [self.brain performOperation:sender.currentTitle];
    NSString *resultString = [NSString stringWithFormat:@"%g", result];
    self.display.text = resultString;
}

@end
