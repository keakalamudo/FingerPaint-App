//
//  FreeHand.m
//  FingerPaint
//
//  Created by Kelo Akalamudo on 10/30/15.
//  Copyright © 2015 Kelo. All rights reserved.
//

#import "FreeHand.h"

@implementation FreeHand


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        self.path = [[UIBezierPath alloc] init];
        self.color = [UIColor orangeColor];
    }
    
    return self;
}

- (void)drawRect:(CGRect)rect {
    [self.path setLineWidth:5.0];
//    self.path.color
    
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    CGContextSetStrokeColorWithColor(context, [UIColor orangeColor].CGColor);
    
    [self.color setStroke];
    [self.path stroke];
}


@end
