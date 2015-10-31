//
//  ViewController.m
//  FingerPaint
//
//  Created by Kelo Akalamudo on 10/30/15.
//  Copyright © 2015 Kelo. All rights reserved.
//

#import "ViewController.h"
#import "FreeHand.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet FreeHand *freeHandView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *choices;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIPanGestureRecognizer *gestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(screenTouched:)];
    [self.freeHandView addGestureRecognizer:gestureRecognizer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)screenTouched:(UIPanGestureRecognizer *)sender {

    switch (sender.state) {
        case UIGestureRecognizerStateBegan: {
            CGPoint startLine = [sender locationInView:self.freeHandView];
            [self.freeHandView.path moveToPoint:startLine];
        }
        case UIGestureRecognizerStateChanged: {
            CGPoint currentLine = [sender locationInView:self.freeHandView];
            [self.freeHandView.path addLineToPoint:currentLine];
        }
        case UIGestureRecognizerStateEnded:{
            CGPoint endLine = [sender locationInView:self.freeHandView];
            [self.freeHandView.path addLineToPoint:endLine];
//            [self.freeHandView.path closePath];
            
//            [self.freeHandView.path fill];
        
        }
        default: break;
    }
    
    [self.freeHandView setNeedsDisplay];
    

}
- (IBAction)colorChoices:(id)sender {
    if (_choices.selectedSegmentIndex == 0){
        self.freeHandView.color = [UIColor blueColor];
        
    }else if (_choices.selectedSegmentIndex == 1){
        self.freeHandView.color = [UIColor orangeColor];
    }if (_choices.selectedSegmentIndex == 2){
        self.freeHandView.color = [UIColor redColor];
    }else if (_choices.selectedSegmentIndex == 3){
        self.freeHandView.color = [UIColor purpleColor];
    }else self.freeHandView.color = [UIColor whiteColor];
    
    [self.freeHandView setNeedsDisplay];
}

@end
