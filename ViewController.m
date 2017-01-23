//
//  ViewController.m
//  ScrollView
//
//  Created by Alex Bearinger on 2017-01-23.
//  Copyright © 2017 Alex Bearinger. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.scrollView.delegate = self;
    UIImageView *image1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    UIImageView *image2 = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMinX(image1.frame), 0, self.view.frame.size.width, self.view.frame.size.height)];
    UIImageView *image3 = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMinX(image2.frame), 0, self.view.frame.size.width, self.view.frame.size.height)];
    self.contentSize = CGSizeMake(CGRectGetMaxX(image3.frame), self.view.frame.size.height);
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
