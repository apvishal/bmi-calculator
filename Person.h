//
//  Vishal Patel    vpatel589@csu.fullerton.edu
//  09/25/2015
//  CPSC 411

//  Person.h
//  BMIDemo
//
//  Created by vpatel589 on 9/16/15.
//  Copyright (c) 2015 vpatel589. All rights reserved.
//
//  This is a header file that contains an NSObject for a Person.  We declare the weight, height, and a bmi in
//this object.

#import <Foundation/Foundation.h>

@interface Person : NSObject
@property (strong, nonatomic) NSDecimalNumber* p_weight;
@property (strong, nonatomic) NSDecimalNumber* p_height;
@property (strong, nonatomic) NSDecimalNumber* bmi;

+(Person*) sharedPerson;
-(void)store_height:(NSNumber*)h and_weight:(NSNumber*)w;
-(void)calc_bmi_in:(NSString*)unit;
-(NSDecimalNumber*)get_bmi;
@end
