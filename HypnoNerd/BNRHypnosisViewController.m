//
//  BNRHypnosisViewController.m
//  HypnoNerd
//
//  Created by Brigitte Michau on 2014/08/09.
//  Copyright (c) 2014 Big Nerd Ranch. All rights reserved.
//

#import "BNRHypnosisViewController.h"
#import "BNRHypnosisView.h"

@interface BNRHypnosisViewController () <UITextFieldDelegate>

@end

@implementation BNRHypnosisViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];

    if (self) {
        // Set the tab bar item's title
        self.tabBarItem.title = @"Hypnotize";
        
        // Create a UIImage from a file
        // This will use Hypno@2x.png on retina devices
        UIImage *i = [UIImage imageNamed:@"Hypno.png"];
        
        // Put that image on the tab bar item
        self.tabBarItem.image = i;
    }
    
    return self;
}

- (void)loadView {
    // Create a view
    BNRHypnosisView *backgroundView = [[BNRHypnosisView alloc]init];
    
    // Set it as the view of the view controller
    self.view = backgroundView;
    
    CGRect textFieldRect = CGRectMake(40, 70, 240, 30);
    UITextField *textField = [[UITextField alloc]initWithFrame:textFieldRect];
    
    // Setting the border style on the text field
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.placeholder = @"Hypnotize me!";
    textField.returnKeyType = UIReturnKeyDone;
    
    textField.delegate = self;
    
    [self.view addSubview:textField];
}

- (void)viewDidLoad {
    // Always call the super implementation of view did load
    [super viewDidLoad];
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    NSLog(@"%@", textField.text);
    return YES;
}

@end
