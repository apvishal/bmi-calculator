//
//  Vishal Patel    vpatel589@csu.fullerton.edu
//  09/25/2015
//  CPSC 411

//  Person.m
//  BMIDemo
//
//  Created by vpatel589 on 9/16/15.
//  Copyright (c) 2015 vpatel589. All rights reserved.
//
//this file is the implementation file for the header file Person.h.  The implementation will initialize the
//secretperson, as well as storing his/her weight and height and will calculate the BMI when the specific method
//is called.

#import "Person.h"

static Person* _secretPerson;

@implementation Person
@synthesize p_weight;
@synthesize p_height;
@synthesize bmi;

//initilize a secretPerson
-(Person*) init
{
    self = [super init];
    if (self)
    {
        NSLog(@"HI");
    }
    return self;
}

+(void)initialize
{
    if ([Person class] == self)
    {
        _secretPerson = [self new];
    }
}

+(Person*) sharedPerson
{
 
    return _secretPerson;
    
}

//store the height and weight of the secretPerson
-(void)store_height:(NSDecimalNumber*)h and_weight:(NSDecimalNumber*)w
{
    self.p_height = h;
    self.p_weight = w;

}

//calculate the BMI in the given units
-(void) calc_bmi_in:(NSString*)unit
{
    NSDecimalNumberHandler *precision = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode: NSRoundUp
                                                                                               scale: 2
                                                                                    raiseOnExactness:NO
                                                                                     raiseOnOverflow:NO
                                                                                    raiseOnUnderflow:NO
                                                                                 raiseOnDivideByZero:YES];
    

    if ([unit isEqualToString:@"US_Units"])
    {
        NSDecimalNumber* kg = [NSDecimalNumber decimalNumberWithString: @"0.453592"];
        NSDecimalNumber* inch_in_m = [NSDecimalNumber decimalNumberWithString: @"0.0254"];
        
        self.bmi = [[p_weight decimalNumberByMultiplyingBy: kg] decimalNumberByDividingBy: [[p_height decimalNumberByMultiplyingBy: inch_in_m] decimalNumberByRaisingToPower:2] withBehavior:precision];
    }
    else
    {
        NSDecimalNumber* cm_in_m = [NSDecimalNumber decimalNumberWithString: @"0.01"];
        self.bmi = [p_weight decimalNumberByDividingBy: [[p_height decimalNumberByMultiplyingBy: cm_in_m]decimalNumberByRaisingToPower:2] withBehavior:precision];
    }
}

//return the secretPersons bmi
-(NSDecimalNumber*)get_bmi
{
        return self.bmi;
}


@end
