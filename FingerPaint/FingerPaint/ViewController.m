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

@end
