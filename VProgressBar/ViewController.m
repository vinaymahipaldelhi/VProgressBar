//
//  ViewController.m
//  VProgressBar
//
//  Created by Parikshit Sawhney on 16/03/16.
//  Copyright © 2016 Vinay Mahipal. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self ShowProgressBar]; //Calling
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)viewDidAppear:(BOOL)animated
{
    [self performSelector:@selector(HideProgressBar) withObject:nil afterDelay:13.0 ]; 
    
        //[self HideProgressBar];
}

#pragma mark Call ShowProgressBar
- (void)ShowProgressBar
{
    self.ProgressBarView =
    [ViewController showProgressBar:self.view];
    self.DimView = [ViewController DimViewFunc:self.view.frame];
    
    [self.view addSubview:self.DimView];
    [self.view addSubview:self.ProgressBarView];
}

#pragma mark Call HideProgressBar


- (void)HideProgressBar
{
    [self.ProgressBarView removeFromSuperview];
    [self.DimView removeFromSuperview];
}

#pragma mark --
#pragma mark --


#pragma mark Start



+ (int)GetIOSVersion
{
    int iphoneversion;
    NSArray* vComp =
    [[UIDevice currentDevice]
     .systemVersion componentsSeparatedByString:@"."];
    
    if ([[vComp objectAtIndex:0] intValue] >= 7) {
            // iOS-7 code[current] or greater
        iphoneversion = 7;
    }
    else if ([[vComp objectAtIndex:0] intValue] == 6) {
            //        // iOS-6 code
        iphoneversion = 6;
    }
    else if ([[vComp objectAtIndex:0] intValue] > 2) {
            //        // iOS-3,4,5 code
        iphoneversion = 5;
    }
    else {
            // iOS-1,2... code: incompatibility warnings, legacy-handlers, etc..
    }
    
    return iphoneversion;
}

+ (UIView*)showProgressBar:(UIView*)myView
{
    NSString* s = @"Please Wait";
    UIView* _hudView;
    UIActivityIndicatorView* _activityIndicatorView;
    UILabel* _captionLabel;
    int _oldheight;
    
        //
    _hudView = [[UIView alloc] initWithFrame:CGRectMake(70, 155, 170, 150)];
        //
    _hudView.center = CGPointMake(myView.frame.size.width / 2, myView.frame.size.height / 2);
        //
    _hudView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.8];
    _hudView.clipsToBounds = YES;
    _hudView.layer.cornerRadius = 10.0;
    _hudView.autoresizesSubviews = true;
        //
    _activityIndicatorView = [[UIActivityIndicatorView alloc]
                              initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        //
        //
    _activityIndicatorView.frame = CGRectMake(76, 30, _activityIndicatorView.bounds.size.width,
                                              _activityIndicatorView.bounds.size.height);
    
        //
        //
    _activityIndicatorView.center = CGPointMake(
                                                _hudView.frame.size.width / 2, _hudView.frame.size.height / 2 - 20);
        //
    
        //
    [_hudView addSubview:_activityIndicatorView];
        //
    [_activityIndicatorView startAnimating];
        //
        // showProgressBar
        //
    
    if ([self GetIOSVersion] > 6) {
        _captionLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 70, 150, 80)];
        _captionLabel.center = CGPointMake(_hudView.frame.size.width / 2,
                                           _hudView.frame.size.height / 2 + 30);
            //
    }
    else {
        _captionLabel = [[UILabel alloc] initWithFrame:CGRectMake(25, 70, 150, 80)];
        _captionLabel.center = CGPointMake(_hudView.frame.size.width / 2,
                                           _hudView.frame.size.height / 2 + 30);
    }
        //
    if ([self GetIOSVersion] > 6) {
        _captionLabel.adjustsLetterSpacingToFitWidth = YES;
    }
    
    else {
        _captionLabel.adjustsFontSizeToFitWidth = YES;
    }
    _captionLabel.backgroundColor = [UIColor clearColor];
    _captionLabel.textColor = [UIColor whiteColor];
        //    _captionLabel.textAlignment = NSTextAlignmentCenter;
        //
        //
    [_hudView addSubview:_captionLabel];
        //
        //
    _oldheight = _hudView.frame.size.height;
        //
    
        //   [self DimViewFunc:self.myLView];
    int msgLength = s.length;
    
    if (msgLength <= 30) {
        CGRect frame = _hudView.frame;
        
        frame.size.height = _oldheight - 21;
        _hudView.frame = frame;
    }
    else {
        CGRect frame = _hudView.frame;
        
        frame.size.height = _oldheight;
        _hudView.frame = frame;
    }
        //
    _captionLabel.text = s; // @"When travelling abroad, activate International
                            // Roaming to avoid heavy international roaming
                            // charges";
    
    [_captionLabel setMinimumFontSize:10.0];
    [_captionLabel setNumberOfLines:4];
    [_captionLabel setFont:[UIFont systemFontOfSize:14.0]];
    _captionLabel.lineBreakMode = UILineBreakModeWordWrap;
    
    _captionLabel.backgroundColor = [UIColor clearColor];
    
    _captionLabel.textAlignment = UITextAlignmentCenter;
    [_activityIndicatorView startAnimating];
    
        // [self.myLView addSubview:_hudView];
    
    return _hudView;
}

+ (UIView*)showProgressBar:(UIView*)myView Msg:(NSString*)s
{
        // NSString* s = @"Please Wait";
    UIView* _hudView;
    UIActivityIndicatorView* _activityIndicatorView;
    UILabel* _captionLabel;
    int _oldheight;
    
        //
    _hudView = [[UIView alloc] initWithFrame:CGRectMake(70, 155, 170, 150)];
        //
    _hudView.center = CGPointMake(myView.frame.size.width / 2, myView.frame.size.height / 2);
        //
    _hudView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.8];
    _hudView.clipsToBounds = YES;
    _hudView.layer.cornerRadius = 10.0;
    _hudView.autoresizesSubviews = true;
        //
    _activityIndicatorView = [[UIActivityIndicatorView alloc]
                              initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        //
        //
    _activityIndicatorView.frame = CGRectMake(76, 30, _activityIndicatorView.bounds.size.width,
                                              _activityIndicatorView.bounds.size.height);
    
        //
        //
    _activityIndicatorView.center = CGPointMake(
                                                _hudView.frame.size.width / 2, _hudView.frame.size.height / 2 - 20);
        //
    
        //
    [_hudView addSubview:_activityIndicatorView];
        //
    [_activityIndicatorView startAnimating];
        //
        // showProgressBar
        //
    
    if ([self GetIOSVersion] > 6) {
        _captionLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 70, 150, 80)];
        _captionLabel.center = CGPointMake(_hudView.frame.size.width / 2,
                                           _hudView.frame.size.height / 2 + 30);
            //
    }
    else {
        _captionLabel = [[UILabel alloc] initWithFrame:CGRectMake(25, 70, 150, 80)];
        _captionLabel.center = CGPointMake(_hudView.frame.size.width / 2,
                                           _hudView.frame.size.height / 2 + 30);
    }
        //
    if ([self GetIOSVersion] > 6) {
        _captionLabel.adjustsLetterSpacingToFitWidth = YES;
    }
    
    else {
        _captionLabel.adjustsFontSizeToFitWidth = YES;
    }
    _captionLabel.backgroundColor = [UIColor clearColor];
    _captionLabel.textColor = [UIColor whiteColor];
        //    _captionLabel.textAlignment = NSTextAlignmentCenter;
        //
        //
    [_hudView addSubview:_captionLabel];
        //
        //
    _oldheight = _hudView.frame.size.height;
        //
    
        //   [self DimViewFunc:self.myLView];
    int msgLength = s.length;
    
    if (msgLength <= 30) {
        CGRect frame = _hudView.frame;
        
        frame.size.height = _oldheight - 21;
        _hudView.frame = frame;
    }
    else {
        CGRect frame = _hudView.frame;
        
        frame.size.height = _oldheight;
        _hudView.frame = frame;
    }
        //
    _captionLabel.text = s; // @"When travelling abroad, activate International
                            // Roaming to avoid heavy international roaming
                            // charges";
    
    [_captionLabel setMinimumFontSize:10.0];
    [_captionLabel setNumberOfLines:4];
    [_captionLabel setFont:[UIFont systemFontOfSize:14.0]];
    _captionLabel.lineBreakMode = UILineBreakModeWordWrap;
    
    _captionLabel.backgroundColor = [UIColor clearColor];
    
    _captionLabel.textAlignment = UITextAlignmentCenter;
    [_activityIndicatorView startAnimating];
    
        // [self.myLView addSubview:_hudView];
    
    return _hudView;
}

+ (UIView*)DimViewFunc:(CGRect)ViewFrame
{
    UIView* _dimView = [[UIView alloc] initWithFrame:ViewFrame];
    
    _dimView.backgroundColor = [UIColor blackColor];
    _dimView.alpha = 0;
        //
        //
        //
    [UIView animateWithDuration:0.3
                     animations:^{
                         _dimView.alpha = 0.4;
                     }];
    
    return _dimView;
}
#pragma mark End

@end
