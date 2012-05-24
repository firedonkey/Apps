//
//  CalculatorBrain.m
//  Calculator
//
//  Created by skip on 5/23/12.
//
//

#import "CalculatorBrain.h"

@interface CalculatorBrain()
@property (nonatomic, strong) NSMutableArray *operandStack;

@end

@implementation CalculatorBrain

@synthesize operandStack = _operandStack;

- (NSMutableArray *) operandStack
{
    if (!_operandStack) {
        _operandStack = [[NSMutableArray alloc] init];
    }
    return _operandStack;
}

-(void) pushOperand: (double) operand
{
    [self.operandStack addObject:[NSNumber numberWithDouble:operand]];
}

- (double) popOperand
{
    NSNumber *operand = [self.operandStack lastObject];
    if (operand) {
        [self.operandStack removeLastObject];
    }
    return [operand doubleValue];
}

-(double) performOperation: (NSString *)operation
{
    double result = 0;
    double operand2 = [self popOperand];
    double operand1 = [self popOperand];

    if ([operation isEqualToString:@"+"]) {
        result = operand1 + operand2;
    }
    if ([operation isEqualToString:@"-"]) {
        result = operand1 - operand2;
    }
    if ([operation isEqualToString:@"*"]) {
        result = operand1 * operand2;
    }
    if ([operation isEqualToString:@"/"]) {
        if (operand2) {
            result = operand1 / operand2;
        }
        else
        {
            result = 0;
        }
    }
    [self pushOperand:result];
    
    return result;
}

@end
