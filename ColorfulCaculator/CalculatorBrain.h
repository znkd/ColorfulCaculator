//
//  CalculatorBrain.h
//  ColorfulCaculator
//
//  Created by ufida on 12-11-4.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CalculatorBrain : NSObject

-(void) pushOperand:(double)operand;
-(double)performOperation:(NSString*)operation;
@end
