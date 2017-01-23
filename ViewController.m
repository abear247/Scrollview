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
    self.scrollView.pagingEnabled = YES;
  
//    UIImageView *image1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
//    UIImageView *image2 = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMinX(image1.frame), 0, self.view.frame.size.width, self.view.frame.size.height)];
//    UIImageView *image3 = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMinX(image2.frame), 0, self.view.frame.size.width, self.view.frame.size.height)];
    
    
    UIImageView *imageView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Lighthouse"]];
    UIImageView *imageView2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Lighthouse-in-Field"]];
    UIImageView *imageView3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Lighthouse-night"]];
    
    self.images = @[imageView1,imageView2,imageView3];
    self.imageXPos = 0;
 
    self.scrollView.contentMode = UIViewContentModeScaleAspectFit;
    for (UIImageView *imageView in self.images){
        imageView.frame = CGRectMake(self.imageXPos, 0, self.view.bounds.size.width, self.view.bounds.size.height);
        self.imageXPos += self.view.bounds.size.width;
        [self.scrollView addSubview:imageView];
    }
    self.scrollView.contentSize = CGSizeMake(self.imageXPos, self.view.frame.size.height);
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapper:)];
    
    
}


-(void)tapper:(UITapGestureRecognizer *)sender{
    
    [self performSegueWithIdentifier:@"DetailSegue" sender:sender];
}




@end
