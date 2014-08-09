//
//  BNRViewController.m
//  Quiz
//
//  Created by Brigitte Michau on 2014/07/29.
//  Copyright (c) 2014 Big Nerd Ranch. All rights reserved.
//
//  Quiz


#import "BNRViewController.h"

@interface BNRViewController ()

@property (nonatomic) int currentQuestionIndex;

@property (nonatomic, copy) NSArray *questions;
@property (nonatomic, copy) NSArray *answers;

@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@property (weak, nonatomic) IBOutlet UILabel *answerLabel;

@end

@implementation BNRViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil
                         bundle:(NSBundle *)nibBundleOrNil {
    
    // Call the init method implemented by the superclass
    
    self = [super initWithNibName:nibNameOrNil
                           bundle:nibBundleOrNil];
    
    if (self) {
        
        UITabBarItem *tbi = self.tabBarItem;
        tbi.title = @"Quiz";
        
        UIImage * i = [UIImage imageNamed:@"Quiz.png"];
        tbi.image = i;
        
        // Create two arrays filled with questions and answers
        // and make the pointers point to them
        
        self.questions = @[@"From what is cognac made?",
                           @"What is 7 + 7?",
                           @"What is the capital of Vermont?"];
        
        self.answers = @[@"Grapes",
                         @"14",
                         @"Montpelier"];
    }
    
    // Return the address of the new object
    return self;
}

- (IBAction)showQuestion:(id)sender {
    
    // Step to the next question
    self.currentQuestionIndex++;
    
    // Am I past the last question?
    if (self.currentQuestionIndex == self.questions.count) {
        // Go back to the first question
        self.currentQuestionIndex = 0;
    }
    
    // Get the string at the index in the question array
    NSString *question = self.questions[self.currentQuestionIndex];
    
    // Display the string in the question label
    self.questionLabel.text = question;
    
    // Reset the answerLabel
    self.answerLabel.text = @"???";
    
}

- (IBAction)showAnswer:(id)sender {
    
    // What is the answer to the current question
    NSString *answer = self.answers[self.currentQuestionIndex];
    
    // Display it in the answerLabel
    self.answerLabel.text = answer;
}

@end