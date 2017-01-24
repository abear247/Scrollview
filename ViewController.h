//
//  ViewController.h
//  ScrollView
//
//  Created by Alex Bearinger on 2017-01-23.
//  Copyright © 2017 Alex Bearinger. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ViewController : UIViewController <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (nonatomic) CGSize contentSize;
@property CGFloat imageXPos;
@property NSArray *images;
@property NSString *currentImageName;
//@property UIPageControl *pageControl;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property NSInteger *currentPage;



@end

