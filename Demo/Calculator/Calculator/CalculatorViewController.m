//
//  CalculatorViewController.m
//  Calculator
//
//  Created by skip on 5/23/12.
//
//

#import "CalculatorViewController.h"
#import "CalculatorBrain.h"

@interface CalculatorViewController ()
@property BOOL userIsInTheMiddleOfEnterANumber;
@property (nonatomic, strong) CalculatorBrain *brain;
@end

@implementation CalculatorViewController

@synthesize display = _display;
@synthesize userIsInTheMiddleOfEnterANumber = _userIsInTheMiddleOfEnterANumber;
@synthesize brain = _brain;

- (CalculatorBrain *) brain
{
    if (!_brain) {
        _brain = [[CalculatorBrain alloc] init];
    }
    return _brain;
}

- (IBAction)digitPressed:(UIButton *)sender
{
    NSString *digit = [sender currentTitle ];
    if (self.userIsInTheMiddleOfEnterANumber) {
        NSString *currentText = self.display.text;
        self.display.text = [currentText stringByAppendingString:digit];
    }
    else{
        self.display.text = digit;
    }
    self.userIsInTheMiddleOfEnterANumber = TRUE;
}

- (IBAction)operationPressed:(UIButton *)sender {
    [self enterPressed:nil];
    double result = [self.brain performOperation:[sender currentTitle]];
    self.display.text = [NSString stringWithFormat:@"%.1f", result];
    self.userIsInTheMiddleOfEnterANumber = FALSE;
}

- (IBAction)enterPressed:(id)sender {
    double operand = [self.display.text doubleValue];
    [self.brain pushOperand:operand];
    self.userIsInTheMiddleOfEnterANumber = FALSE;
}


@end
