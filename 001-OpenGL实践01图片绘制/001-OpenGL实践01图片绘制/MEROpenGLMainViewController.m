//
//  MEROpenGLMainViewController.m
//  001-OpenGL实践01图片绘制
//
//  Created by 马遥 on 2018/1/19.
//  Copyright © 2018年 mervin. All rights reserved.
//

#import "MEROpenGLMainViewController.h"
#import "MEROpenGLView.h"

@interface MEROpenGLMainViewController ()
@property (nonatomic, strong) MEROpenGLView *landscapeView;
@property (nonatomic, strong) MEROpenGLView *portraitView;
@end

@implementation MEROpenGLMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.landscapeView = [[MEROpenGLView alloc] initWithType:MEROpenGLViewTypeLandscape];
    self.portraitView = [[MEROpenGLView alloc] initWithType:MEROpenGLViewTypePortrait];
    [self.view addSubview:self.landscapeView];
    [self.view addSubview:self.portraitView];
    self.landscapeView.translatesAutoresizingMaskIntoConstraints = NO;
    self.portraitView.translatesAutoresizingMaskIntoConstraints = NO;
    
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.landscapeView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.landscapeView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.landscapeView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.landscapeView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.portraitView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.portraitView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.portraitView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.portraitView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1 constant:0]];

    
    BOOL isLandscape = CGRectGetWidth([UIScreen mainScreen].bounds) > CGRectGetHeight([UIScreen mainScreen].bounds);
    
    self.landscapeView.alpha = isLandscape ? 1 : 0;
    self.portraitView.alpha = !isLandscape ? 1 : 0;
}

#pragma mark - 旋转

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    BOOL isLandscape = size.width > size.height;
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.landscapeView.alpha = isLandscape ? 1 : 0;
        self.portraitView.alpha = !isLandscape ? 1 : 0;
    } completion:nil];

}

@end
