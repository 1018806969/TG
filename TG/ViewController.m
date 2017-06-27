//
//  ViewController.m
//  TG
//
//  Created by Merlin on 2017/6/27.
//  Copyright © 2017年 lq. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initSomething];
    
    [self createUI];
    
    [self xxtang];
    
    [self lzhou];
    
    [self xxtang2];
    [self lzhou2];
    
    //xxtang_1;
}
- (void)createUI
{
    UIView *view = [[UIView alloc]init];
    [self.view addSubview:view];
}
- (void)initSomething
{
    
}
- (void)xxtang
{
    self.view.backgroundColor = [UIColor orangeColor];
}
- (void)xxtang2
{
    self.view.backgroundColor = [UIColor orangeColor];
}

- (void)lzhou
{
    self.view.backgroundColor = [UIColor redColor];
}
- (void)lzhou2
{
    self.view.backgroundColor = [UIColor redColor];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
