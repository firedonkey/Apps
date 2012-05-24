//
//  CalculatorBrain.h
//  Calculator
//
//  Created by skip on 5/23/12.
//
//

#import <Foundation/Foundation.h>

@interface CalculatorBrain : NSObject

-(void) pushOperand: (double) operand;
-(double) performOperation: (NSString *)operation;
@end
