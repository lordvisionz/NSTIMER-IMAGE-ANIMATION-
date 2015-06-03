//
//  ViewController.m
//  IMAGE ANIMATION
//
//  Created by KAT on 03/06/2015.
//  Copyright (c) 2015 KAT. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setup];
}

-(void)setup {
    
    // Load images
    NSArray *imageNames = @[@"happy",@"sad",@"popeye_village"];
    
    NSMutableArray *images = [[NSMutableArray alloc] init];
    for (int i = 0; i < imageNames.count; i++) {
        [images addObject:[UIImage imageNamed:[imageNames objectAtIndex:i]]];
    }
    
    // Normal Animation
//    imageview = [[UIImageView alloc] initWithFrame:CGRectMake(60, 95, 86, 90)];
    imageview.frame = CGRectMake(60, 95, 86, 90);
    imageview.animationImages = images;
    imageview.animationDuration = 6;
    
    [imageview startAnimating];
    imageview.userInteractionEnabled = TRUE;
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(bannerTapped:)];
    singleTap.numberOfTapsRequired = 1;
    singleTap.numberOfTouchesRequired = 1;
    [imageview addGestureRecognizer:singleTap];
    
    [NSTimer scheduledTimerWithTimeInterval:((double)imageview.animationDuration / images.count)
                                                      target:self
                                                    selector:@selector(updateAnimatingImage)
                                                    userInfo:nil
                                    repeats:YES];
    
    
}

- (void)bannerTapped:(UIGestureRecognizer *)gestureRecognizer
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"Clicked on Image index %li", imageview.indexOfAnimatingImage] message:@"" delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles: nil];
    [alert show];
}

-(void)updateAnimatingImage
{
    imageview.indexOfAnimatingImage = ++imageview.indexOfAnimatingImage % (imageview.animationImages.count);
    NSLog(@"index currently showing is %li",imageview.indexOfAnimatingImage);
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
