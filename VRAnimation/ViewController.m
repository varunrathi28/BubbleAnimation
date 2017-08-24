//
//  ViewController.m
//  VRAnimation
//
//  Created by Varun Rathi on 24/08/17.
//  Copyright © 2017 vrat28. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.center.x - 100, self.view.center.y - 100, 200, 200)];
    self.imageView.image = [UIImage imageNamed:@""];
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(createBubble)];
    singleTap.numberOfTapsRequired = 1;
    [self.imageView setUserInteractionEnabled:YES];
    [self.imageView addGestureRecognizer:singleTap];
    
    [self.view addSubview:_imageView];
}
    

-(void)createBubble
{
    UIImageView *bubbleImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bubble"]];
    [bubbleImageView setFrame:CGRectMake((self.imageView.frame.size.width / 2), self.imageView.frame.origin.y, 5, 5)];
    [self.view addSubview:bubbleImageView];
    
    UIBezierPath * bubblePath = [self getBubblePath];
    CAKeyframeAnimation * keyAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    keyAnimation.duration = 2.0;
    keyAnimation.path = bubblePath.CGPath;
    keyAnimation.removedOnCompletion = true;
    keyAnimation.fillMode = kCAFillModeForwards;
    
    [self.imageView.layer addAnimation:keyAnimation forKey:@"movingAnimation"];
    
    
    
}

-(UIBezierPath *)getBubblePath
{
    UIBezierPath * zigzagPath = [[UIBezierPath alloc]init];
    
    CGFloat ox = _imageView.frame.origin.x;
    CGFloat oy = _imageView.frame.origin.y;
    
    CGFloat ex = ox;
    CGFloat ey = oy - 40;
    
    CGFloat t = 20;
    CGPoint cp1 = CGPointMake(ox - t , (ey + oy)/2);
    CGPoint cp2 = CGPointMake(ox + t, cp1.y);
    
    [zigzagPath moveToPoint:(CGPointMake(ox, oy))];
    [zigzagPath addCurveToPoint:CGPointMake(ex, ey) controlPoint1:cp1 controlPoint2:cp2];
    
    
    return zigzagPath;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
