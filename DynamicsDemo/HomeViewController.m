//
//  HomeViewController.m
//  DynamicsDemo
//
//  Created by Ren Guohua on 14-6-10.
//  Copyright (c) 2014年 Ren Guohua. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setNavigationBar];
    [self initSubView];
    [self initLeftButton];
    [self initMiddleButton];
    [self initRightButton];
}

- (void)setNavigationBar
{
    self.navigationItem.title = @"UIKit动力学简单demo";
}

- (void)initLeftButton
{
    _leftButton = [UIButton buttonWithType:UIButtonTypeSystem];
    _leftButton.frame = (CGRect){
    
        .origin.x =   0.0f,
        .origin.y =   65.0f,
        .size.width = 100.0f,
        .size.height = 44.0f,
    
    };
    [_leftButton setTitle:@"gravity" forState:UIControlStateNormal];
    [_leftButton addTarget:self action:@selector(leftButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_leftButton];

}

- (void)initMiddleButton
{
    _leftButton = [UIButton buttonWithType:UIButtonTypeSystem];
    _leftButton.frame = (CGRect){
        
        .origin.x =   100.0f,
        .origin.y =   65.0f,
        .size.width = 120.0f,
        .size.height = 44.0f,
        
    };
    [_leftButton setTitle:@"gravityCollision" forState:UIControlStateNormal];
    [_leftButton addTarget:self action:@selector(middleButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_leftButton];
    
}


- (void)initRightButton
{
    _leftButton = [UIButton buttonWithType:UIButtonTypeSystem];
    _leftButton.frame = (CGRect){
        
        .origin.x =   220.0f,
        .origin.y =   65.0f,
        .size.width = 100.0f,
        .size.height = 44.0f,
        
    };
    [_leftButton setTitle:@"snap" forState:UIControlStateNormal];
    [_leftButton addTarget:self action:@selector(rightButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_leftButton];
    
}

/**
 *  初始化subView
 */
- (void)initSubView
{
    _subView = [[UIView alloc] initWithFrame:(CGRect){
        
        .origin.x =   100.0f,
        .origin.y =   108.0f,
        .size.width = 100.0f,
        .size.height = 100.0f,
        
    }
];
    _subView.backgroundColor = UIColorFromRGB(0xea9c30);
   
    [self.view addSubview:_subView];
}

/**
 *  简单的重力行为
 *
 *  @param sender leftButton
 */
- (void)leftButtonClicked:(id)sender
{
    
    _subView.frame =  (CGRect){
        
        .origin.x =   100.0f,
        .origin.y =   108.0f,
        .size.width = 100.0f,
        .size.height = 100.0f,
        
    };

    if (!_animator)
    {
        // 1 假如animator为空的话，就初始化一个animator
        _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    }
    
        // 2 移除animator上所有的力学行为
    [_animator removeAllBehaviors];

        // 3 初始化重力行为
    UIGravityBehavior *gravityBeahvior = [[UIGravityBehavior alloc] initWithItems:@[_subView]];
    
       // 4 添加重力行为到animator上，使重力行为生效
    [_animator addBehavior:gravityBeahvior];

}

/**
 *  带重力的碰撞行为
 *
 *  @param sender middleButton
 */
- (void)middleButtonClicked:(id)sender
{
    
    _subView.frame =  (CGRect){
        
        .origin.x =   100.0f,
        .origin.y =   108.0f,
        .size.width = 100.0f,
        .size.height = 100.0f,
        
    };
    
    if (!_animator)
    {
        _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    }
    
    [_animator removeAllBehaviors];

    //初始化一个碰撞的行为
    UICollisionBehavior *collisionBehavior = [[UICollisionBehavior alloc] initWithItems:@[_subView]];
    
    //配置碰撞的边界，下述代码设置碰撞边界为参考系(self.view)的边框作为碰撞边界
    collisionBehavior.translatesReferenceBoundsIntoBoundary = YES;
    
    //添加碰撞行为到animator
    [_animator addBehavior:collisionBehavior];
    
    //重力行为
    UIGravityBehavior *gravityBeahvior = [[UIGravityBehavior alloc] initWithItems:@[_subView]];
    [_animator addBehavior:gravityBeahvior];
    
}

/**
 *  吸附行为
 *
 *  @param sender rightButton
 */
- (void)rightButtonClicked:(id)sender
{
    
    _subView.frame =  (CGRect){
        
        .origin.x =   100.0f,
        .origin.y =   108.0f,
        .size.width = 100.0f,
        .size.height = 100.0f,
        
    };
    
    if (!_animator)
    {
        _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    }
    
    [_animator removeAllBehaviors];
    
    //初始化一个吸附行为
    UISnapBehavior *snap = [[UISnapBehavior alloc] initWithItem:_subView snapToPoint:(CGPoint){100.0f,300.0f}];
    //添加吸附行为到animator
    [_animator addBehavior:snap];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
   
}



@end
