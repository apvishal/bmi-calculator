//
//  Vishal Patel    vpatel589@csu.fullerton.edu
//  09/25/2015
//  CPSC 411

//  ViewController.m
//  BMIDemo
//
//  Created by vpatel589 on 9/16/15.
//  Copyright (c) 2015 ___FULLUSERNAME___. All rights reserved.
//
//This viewcontroller will handle the information inputted by the user in the text fields and allow the user to view their bmi when they choose to calculate it.  As they input the required
//information, the calculate button will be enabled and the user may click it to find their BMI.  The viewcontroller will display the BMI via label along with a stick figure that describes their bmi.

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "Person.h"

@interface ViewController ()
{
    //audio to play when displaying bmi
    AVAudioPlayer *_audioPlayer;
    
    //an array of images to display with the bmi result
    NSArray *_imgArr;
}

@end

@implementation ViewController


-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //disable keyboard when clicking outside of the two textfields
    [self.height resignFirstResponder];
    [self.weight resignFirstResponder];
}

- (IBAction)calcButtonPressed:(id)sender
{
    //re-enable the calculate button when the user inputs their information
    [self.view endEditing:YES];

    //disable keyboard when clicking the calculate button
    [self.calc_button resignFirstResponder];

    //initialize sharedPerson
    Person* p = [Person sharedPerson];
    
    //grab the two inputs from the text fields and call store_height and_weight to store the information
    [p store_height:[NSDecimalNumber decimalNumberWithString:self.height.text] and_weight:[NSDecimalNumber decimalNumberWithString:self.weight.text]];


    //perform a test to see which units the user chose to use.  (US or Metric)
    //make a method call using the appropriate units.
    if([self.weight_unit.text isEqualToString:@"lbs"])
    {
        [p calc_bmi_in:@"US_Units"];
    }
    else
    {
        [p calc_bmi_in:@"Metric_Units"];
    }
    
    //display the BMI via label by calling the get_bmi method
    self.bmi_label.text = [[p get_bmi] stringValue];
    
    //define values to test if the user is skinny, normal, or obese.
    NSDecimalNumber* skinnyVal = [NSDecimalNumber decimalNumberWithString: @"18.50"];
    NSDecimalNumber* normalVal = [NSDecimalNumber decimalNumberWithString: @"25.00"];
    
    //test to see which category the user falls into
    if ([[p get_bmi] compare: skinnyVal] == NSOrderedAscending)
    {
        self.bmi_text.text = @"TOO THIN!!";
        [self.display_image setImage:[_imgArr objectAtIndex:0]];
    }
    
    else if ([[p get_bmi] compare: normalVal] == NSOrderedAscending)
    {
        self.bmi_text.text = @"NORMAL RANGE!";
        
        [self.display_image setImage:[_imgArr objectAtIndex:1]];
        [_audioPlayer play];
    }
    else
    {
        self.bmi_text.text = @"YOU ARE OBESE!";
        [self.display_image setImage:[_imgArr objectAtIndex:2]];
    }
    
    
}


-(IBAction)enable_disable_calcButton
{
    //if either of the textfields are empty, then the calculate button will be disabled.
    if(![self.weight.text isEqualToString: @""] && ![self.height.text isEqualToString: @""])
    {
        [self.calc_button setEnabled:YES];
    }
    
}

- (IBAction)unit_control:(id)sender {
    
    UISegmentedControl *segmentedControl = (UISegmentedControl *) sender;
    NSInteger selectedSegment = segmentedControl.selectedSegmentIndex;
    
    //choose which of the two sets of units to display on the app for calculation
    if (selectedSegment == 0)
    {
        self.weight_unit.text = @"lbs";
        self.height_unit.text = @"in";
    }
    else
    {
        self.weight_unit.text = @"kg";
        self.height_unit.text = @"cm";
    }
}

-(void) didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void) viewDidAppear:(BOOL)animated
{
    //#1
    NSLog(@"view did appear!!");
}


- (void) viewWillAppear:(BOOL)animated
{
    //#2
    NSLog(@"the view will appear");
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //#3
    NSLog(@"view did load");

    //set the background color to black
    self.view.backgroundColor = [UIColor blackColor];
    
    //disable the calculate button when starting the app
    [self.calc_button setEnabled:NO];

    //define the path to the mp3 to be used when displaying the BMI
    NSString* whistle_path = [NSString stringWithFormat: @"%@/flirting_whistle.mp3",[[NSBundle mainBundle] resourcePath]];
    
    //define an NSURLfor the audio file
    NSURL* whistle_url = [NSURL fileURLWithPath:whistle_path];
    
    //create the audio variable
    _audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:whistle_url error:nil];
    
    //declare an NSArray containing three images to be used for displaying the result.  
    _imgArr = [NSArray arrayWithObjects:
               [UIImage imageNamed:@"stickman.png"],
               [UIImage imageNamed:@"curvy.png"],
               [UIImage imageNamed:@"fatman.jpg"],
               nil];

    

}
@end
