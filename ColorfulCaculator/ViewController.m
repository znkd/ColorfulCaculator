//
//  ViewController.m
//  ColorfulCaculator
//
//  Created by ufida on 12-11-4.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "CalculatorBrain.h"
@interface ViewController ()
@property (nonatomic) BOOL userIsInTheMiddleOfEnteringANumber;
@property (nonatomic,strong) CalculatorBrain* brain;
@end

@implementation ViewController
@synthesize display = _display;
@synthesize displayexpressions = _displayexpressions;
@synthesize userIsInTheMiddleOfEnteringANumber = _userIsInTheMiddleOfEnteringANumber;
@synthesize brain = _brain;

-(CalculatorBrain*) brain
{
    if (!_brain) {
        _brain = [[CalculatorBrain alloc]init];
        
    }
    return _brain;
}
- (IBAction)digitPressed:(UIButton *)sender {
    NSString *digit = [sender currentTitle];
    if(self.userIsInTheMiddleOfEnteringANumber)
    {
        self.display.text = [self.display.text stringByAppendingString:digit];
        
    } else {
        self.display.text = digit;
        self.userIsInTheMiddleOfEnteringANumber = YES;
    }
    
    self.displayexpressions.text = [self.displayexpressions.text stringByAppendingString:digit];
}
- (IBAction)enterPressed {
    [self.brain pushOperand:[self.display.text doubleValue]];
    self.userIsInTheMiddleOfEnteringANumber = NO;
}
- (IBAction)operationPressed:(UIButton*)sender 
{
    self.displayexpressions.text = [self.displayexpressions.text stringByAppendingString:sender.titleLabel.text];
    
    if(self.userIsInTheMiddleOfEnteringANumber) return [self enterPressed];
    double result = [self.brain performOperation:sender.currentTitle];
    NSString* resultString = [NSString stringWithFormat:@"%g",result];
    self.display.text = resultString;
}
- (IBAction)cleanResult:(UIButton *)sender {
    self.userIsInTheMiddleOfEnteringANumber = NO;
    self.display.text = @"0";
    self.displayexpressions.text = @"";
    [self.brain cleanOperandStack];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setDisplay:nil];
    [self setDisplayexpressions:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

@end
