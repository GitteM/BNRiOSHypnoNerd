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
    textField.autocapitalizationType = UITextAutocapitalizationTypeWords;
    textField.autocorrectionType = UITextAutocorrectionTypeYes;
    
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
    
    [self drawHypnoticMassage:textField.text];
    textField.text = @"";
    [textField resignFirstResponder];
    
    return YES;
}

- (void)drawHypnoticMassage:(NSString *)message {
    for (int i = 0; i < 20; i++) {
        UILabel *messageLabel = [[UILabel alloc]init];
        
        // Configure the label's color and text
        messageLabel.backgroundColor = [UIColor clearColor];
        messageLabel.textColor = [UIColor whiteColor];
        messageLabel.text = message;
    
        // This method resizes the label, which will be relative
        // to the text that is displaying
        [messageLabel sizeToFit];
        
        // Get a random x value that fits within the view's width
        int width = (int)(self.view.bounds.size.width - messageLabel.bounds.size.width);
        int x = arc4random() % width;
        
        // Get a random y value that fist within the view's height
        int height = (int)(self.view.bounds.size.height - messageLabel.bounds.size.height);
        int y = arc4random() % height;
        
        // Update the label's frame
        CGRect frame = messageLabel.frame;
        frame.origin = CGPointMake(x, y);
        messageLabel.frame = frame;
        
        // Add the label to the hierarchy
        [self.view addSubview:messageLabel];
        
        // Add motion effect
        UIInterpolatingMotionEffect *motionEffect =
        [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.x"
                                                        type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
        motionEffect.minimumRelativeValue = @(-25);
        motionEffect.maximumRelativeValue = @(25);
        [messageLabel addMotionEffect:motionEffect];
        
        motionEffect =
        [[UIInterpolatingMotionEffect alloc]initWithKeyPath:@"center.y"
                                                       type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
        motionEffect.minimumRelativeValue = @(-25);
        motionEffect.maximumRelativeValue = @(25);
    }
}

@end
