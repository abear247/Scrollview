//
//  ImageDetailViewController.m
//  ScrollView
//
//  Created by Alex Bearinger on 2017-01-23.
//  Copyright © 2017 Alex Bearinger. All rights reserved.
//

#import "ImageDetailViewController.h"

@interface ImageDetailViewController ()

@end

@implementation ImageDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.imageScrollview.delegate = self;
    [self viewForZoomingInScrollView:self.imageScrollview];
    [self.imageView setImage:self.image];
    self.imageView.frame = CGRectMake(0, 0, self.imageScrollview.bounds.size.width, self.imageScrollview.bounds.size.height);
    self.imageScrollview.contentMode = UIViewContentModeScaleAspectFit;
 
    [self.imageScrollview addSubview:self.imageView];
}

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return self.imageView;
}

-(void)setViewImage:(NSString *)imageName{
    self.image = [UIImage imageNamed:imageName];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
