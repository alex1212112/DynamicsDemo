//
//  HomeViewController.h
//  DynamicsDemo
//
//  Created by Ren Guohua on 14-6-10.
//  Copyright (c) 2014年 Ren Guohua. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController

@property (nonatomic, strong) UIDynamicAnimator *animator;
@property (nonatomic, strong) UIButton *leftButton;
@property (nonatomic, strong) UIButton *middleButton;
@property (nonatomic, strong) UIButton *rightButton;
@property (nonatomic, strong) UIView *subView;
@end
