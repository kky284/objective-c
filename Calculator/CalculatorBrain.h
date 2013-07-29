//
//  CalculatorBrain.h
//  Calculator
//
//  Created by Ki-Yong Kim on 7/22/13.
//  Copyright (c) 2013 Ki-Yong Kim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorBrain : NSObject

- (void)pushOperand:(double)operand;
- (double)performOperation:(NSString *)operation;

@property (readonly) id program;

//test git
//test mac
//test myMacbook
+ (double)runProgram:(id)program;
+ (NSString *)descriptionOfProgram:(id)program;

@end
