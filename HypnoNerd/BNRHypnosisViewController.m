//
//  BNRHypnosisViewController.m
//  HypnoNerd
//
//  Created by Brigitte Michau on 2014/08/09.
//  Copyright (c) 2014 Big Nerd Ranch. All rights reserved.
//

#import "BNRHypnosisViewController.h"
#import "BNRHypnosisView.h"

@interface BNRHypnosisViewController ()
@property (nonatomic, strong) UISegmentedControl *segmentedControl;
@property (nonatomic, strong) BNRHypnosisView *backgroundView;
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
    self.backgroundView = [[BNRHypnosisView alloc]init];
    
    // Set it as the view of the view controller
    self.view = self.backgroundView;
    
    [self rgbSegementedControl];
}


- (void)viewDidLoad {
    // Always call the super implementation of view did load
    [super viewDidLoad];
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

#pragma mark - RGB Segmented Control
- (void)rgbSegementedControl {
    
    self.segmentedControl =
    [[UISegmentedControl alloc]initWithItems:@[@"Red", @"Green", @"Blue"]];
    
    CGFloat boundsWidth = CGRectGetWidth(self.tabBarController.view.bounds);
    self.segmentedControl.frame = CGRectMake(20, 60, boundsWidth - 40, 44);
    self.segmentedControl.backgroundColor = [UIColor whiteColor];
    self.segmentedControl.alpha = 0.992;
    self.segmentedControl.momentary = YES;
    
    [self.view addSubview:self.segmentedControl];
    
    [self. segmentedControl addTarget:self
                               action:@selector(action:)
                     forControlEvents:UIControlEventValueChanged];
}

- (void)action:(UISegmentedControl *)s {
    
    switch (s.selectedSegmentIndex) {
        case 0:
            self.backgroundView.circleColor = [UIColor redColor];
            break;
        case 1:
            self.backgroundView.circleColor = [UIColor greenColor];
            break;
        case 2:
            self.backgroundView.circleColor = [UIColor blueColor];
            break;
        default:
            break;
    }
    
}

@end
