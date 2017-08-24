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
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
