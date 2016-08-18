//  Vishal Patel    vpatel589@csu.fullerton.edu
//  09/25/2015
//  CPSC 411
//  ViewController.h
//  BMIDemo
//
//  Created by vpatel589 on 9/16/15.
//  Copyright (c) 2015 ___FULLUSERNAME___. All rights reserved.
// This file will contain the textfields, labels, and image views for the
//  the user to view and use for input information. 

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *weight;
@property (weak, nonatomic) IBOutlet UITextField *height;

@property (weak, nonatomic) IBOutlet UILabel *bmi_label;
@property (weak, nonatomic) IBOutlet UISegmentedControl *metric_or_us;
@property (weak, nonatomic) IBOutlet UILabel *weight_label;
@property (weak, nonatomic) IBOutlet UILabel *height_label;
@property (weak, nonatomic) IBOutlet UILabel *weight_unit;
@property (weak, nonatomic) IBOutlet UILabel *height_unit;
@property (weak, nonatomic) IBOutlet UIButton *calc_button;
@property (weak, nonatomic) IBOutlet UIImageView *display_image;
@property (weak, nonatomic) IBOutlet UILabel *bmi_text;

@end
