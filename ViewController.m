//
//  ViewController.m
//  ScrollView
//
//  Created by Alex Bearinger on 2017-01-23.
//  Copyright © 2017 Alex Bearinger. All rights reserved.
//

#import "ViewController.h"
#import "ImageDetailViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.scrollView.delegate = self;
    self.scrollView.pagingEnabled = YES;
    
    
    UIImageView *imageView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Lighthouse"]];
    UIImageView *imageView2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Lighthouse-in-Field"]];
    UIImageView *imageView3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Lighthouse-night"]];
    
    self.images = @[imageView1,imageView2,imageView3];
    self.imageXPos = 0;
    
    self.scrollView.contentMode = UIViewContentModeScaleAspectFit;
    for (UIImageView *imageView in self.images){
        imageView.clipsToBounds = YES;
        imageView.frame = CGRectMake(self.imageXPos, 0, self.view.frame.size.width, self.scrollView.frame.size.height);
        self.imageXPos += self.view.frame.size.width;
        [self.scrollView addSubview:imageView];
    }
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width*self.images.count, self.scrollView.frame.size.height);
    
    self.pageControl = [[UIPageControl alloc] initWithFrame:self.scrollView.frame];
    self.pageControl.numberOfPages = self.images.count;
    [self.pageControl addTarget:self action:@selector(changePage:) forControlEvents:UIControlEventValueChanged];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapper:)];
    
    [self.view addGestureRecognizer:tap];
    
    
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqual: @"DetailSegue"]){
        [segue.destinationViewController setViewImage:self.currentImageName];
    }
}

//-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
//    CGFloat width = self.view.frame.size.width;
//    NSInteger page = (selfs.scrollView.contentOffset.x + (0.5f * width)) / width;
// //   self.pageControl.currentPage = self.currentPage;
//}

-(void)changePage:(id)sender{
    CGFloat x = self.pageControl.currentPage * self.scrollView.frame.size.width;
    [self.scrollView setContentOffset:CGPointMake(x,0) animated:YES];
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSInteger pageNumber = roundf(self.scrollView.contentOffset.x / (self.scrollView.frame.size.width));
    self.pageControl.currentPage = pageNumber;
}

-(void)tapper:(UITapGestureRecognizer *)sender{
    CGFloat width = self.view.frame.size.width;
    NSInteger page = (self.scrollView.contentOffset.x + (0.5f * width)) / width;
    switch (page) {
        case 0:
            self.currentImageName = @"Lighthouse";
            break;
        case 1:
            self.currentImageName = @"Lighthouse-in-Field";
            break;
        case 2:
            self.currentImageName = @"Lighthouse-night";
            break;
            
        default:
            self.currentImageName = @"Lighthouse";
    }

    [self performSegueWithIdentifier:@"DetailSegue" sender:sender];
}




@end
