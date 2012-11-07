//
//  CalculatorBrain.m
//  ColorfulCaculator
//
//  Created by ufida on 12-11-4.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "CalculatorBrain.h"

@interface CalculatorBrain ()
@property (nonatomic,strong) NSMutableArray *programStack;
@end

@implementation CalculatorBrain
@synthesize programStack = _programStack;//,program = _program;

-(NSMutableArray*)operandStack
{
    if (_programStack == nil) {
        _programStack = [[NSMutableArray alloc]init ];
    }
    return _programStack;
}

-(void)setOperandStack:(NSMutableArray *)operandStack
{
    _programStack = operandStack;
}

-(void) pushOperand:(double)operand
{
    [self.programStack addObject:[NSNumber numberWithDouble:operand]];
}

-(void) cleanOperandStack
{
    [self.operandStack removeAllObjects];
}

-(double) popOperand
{
    NSNumber*operandObject = [self.operandStack lastObject];
    if (operandObject) {
        [self.operandStack removeLastObject];
    }
    
    return [operandObject doubleValue];
}
-(double)performOperation:(NSString*)operation
{
    [self.programStack addObject:operation];
    return [CalculatorBrain runProgram:self.program];
}

-(id)program
{
    return [self.programStack copy];
}

+(NSString*)descriptionOfProgam:(id)program
{
    return @"asdfas";
}

+(double)popOperandOffStack:(NSMutableArray*)stack
{
    double result = 0;
    
    id topOfStack = [stack lastObject];
    if (topOfStack) {
        [stack removeLastObject];
    }
    
    if ([topOfStack isKindOfClass: [NSNumber class]]) {
        result = [topOfStack doubleValue];
    }else if([topOfStack isKindOfClass:[NSString class]]){
        NSString*operation = topOfStack;
        if ([operation isEqualToString:@"+"]) {
            //double number = [self popOperandOffStack:stack];
            result =  [self popOperandOffStack:stack] + [self popOperandOffStack:stack];
        } else if ([@"*" isEqualToString:operation]) {
            result = [self popOperandOffStack:stack] * [self popOperandOffStack:stack];
        }
    }
    
    return result;
}

+(double) runProgram:(id) program
{
    NSMutableArray *stack;
    if ([program isKindOfClass:[NSArray class]])
    {
        stack = [program mutableCopy];
    }
    
return [self popOperandOffStack:stack ];
}



@end
