//
//  CalculatorBrain.m
//  Calculator
//
//  Created by Ki-Yong Kim on 7/22/13.
//  Copyright (c) 2013 Ki-Yong Kim. All rights reserved.
//

#import "CalculatorBrain.h"
@interface CalculatorBrain()
@property (nonatomic, strong) NSMutableArray *programStack;
@end

@implementation CalculatorBrain
@synthesize programStack = _programStack;

- (NSMutableArray *)programStack
{
    if(_programStack ==nil) _programStack = [[NSMutableArray alloc] init];   
    return _programStack;
}

- (void)pushOperand:(double)operand
{
    [self.programStack addObject:[NSNumber numberWithDouble:operand]];
}

- (double)performOperation:(NSString *)operation
{
    [self.programStack addObject:operation];
    return [CalculatorBrain runProgram:self.program];
}  

- (id)program
{
    return [self.programStack copy];
}

+ (NSString *)descriptionOfProgram:(id)program
{
    return @"Implement this in Assignment 2";
}

+ (double)popOperandOffStack:(NSMutableArray *)stack
{
    double result = 0;
    
    id topOfStack = [stack lastObject];
    if (topOfStack) [stack removeLastObject];
    
    if ([topOfStack isKindOfClass:[NSNumber class]]){
        result = [topOfStack doubleValue];
    }
    else if([topOfStack isKindOfClass:[NSString class]]){
        NSString *operation = topOfStack;
        if([operation isEqualToString:@"+"])
        {
            result = [self popOperandOffStack:stack] + [self popOperandOffStack:stack];
            NSLog(@"+ operand");
        }
        else if([@"*" isEqualToString:operation])
        {
            result = [self popOperandOffStack:stack] * [self popOperandOffStack:stack];
            NSLog(@"* operand");
        }
        else if([@"/" isEqualToString:operation])
        {
            double divisor = [self popOperandOffStack:stack];
            if(divisor) result = [self popOperandOffStack:stack] / divisor;
            NSLog(@"/ operand");
        }
        else if([@"-" isEqualToString:operation])
        {
            double subtrahend = [self popOperandOffStack:stack];
            result = [self popOperandOffStack:stack] - subtrahend;
            NSLog(@"- operand");
        }
        
    }
    
    return result;
}

+ (double)runProgram:(id)program
{
    NSMutableArray *stack;
    if ([program isKindOfClass:[NSArray class]]){
        stack = [program mutableCopy];
    }
    return [self popOperandOffStack:stack];
}

@end
