//
//  BNRHypnosisViewController.m
//  HypnoNerd
//
//  Created by Brigitte Michau on 2014/08/09.
//  Copyright (c) 2014 Big Nerd Ranch. All rights reserved.
//

#import "BNRHypnosisViewController.h"
#import "BNRHypnosisView.h"

@implementation BNRHypnosisViewController

- (void)loadView {
    // Create a view
    BNRHypnosisView *backgroundView = [[BNRHypnosisView alloc]init];
    
    // Set it as the view of the view controller
    self.view = backgroundView;
}

@end
