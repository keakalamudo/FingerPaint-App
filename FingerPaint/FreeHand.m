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
    }
    
    return self;
}

- (void)drawRect:(CGRect)rect {
    
    
    [[UIColor orangeColor] setStroke];
    [self.path stroke];
}


@end
