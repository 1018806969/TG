//
//  ViewController.m
//  TG
//
//  Created by Merlin on 2017/6/27.
//  Copyright © 2017年 lq. All rights reserved.
//

#import "ViewController.h"
#import "MainViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) UIImageView *titleImageView;
@property (nonatomic, strong) UIImageView *barbgImageView;
@property (nonatomic, assign) CGFloat      barAlpha;
@end

@implementation ViewController
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    _barbgImageView.alpha = _barAlpha;
    [self.navigationController.navigationBar addSubview:self.titleImageView];

}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    _barbgImageView.alpha = 1;
    [self.titleImageView removeFromSuperview];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    _barbgImageView = self.navigationController.navigationBar.subviews.firstObject;
    _barbgImageView.alpha = 0;
    
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    UIImageView *headImageView = [[UIImageView alloc]init];
    headImageView.backgroundColor = [UIColor orangeColor];
    headImageView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 100);
    _tableView.tableHeaderView = headImageView;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld-%ld",(long)indexPath.row,(long)indexPath.section];
    cell.backgroundColor = [UIColor grayColor];
    return cell;
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat y = scrollView.contentOffset.y;
    NSLog(@"%f",y);
    
    CGFloat scale = 0 ;
    if (y/64 > 0) {
        scale = y/64 > 1 ? 1 : y/64;
    }else
    {
        scale = 0;
    }
    _barbgImageView.alpha = scale;
    _barAlpha = scale;
    _titleImageView.bounds = CGRectMake(0, 0, scale * 40, scale * 40);
    NSLog(@"%f--%@",scale,NSStringFromCGRect(_titleImageView.frame));
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MainViewController *mainvc = [[MainViewController alloc]init];
    [self.navigationController pushViewController:mainvc animated:YES];
}
- (UIImageView *)titleImageView
{
    if (!_titleImageView) {
        _titleImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"1.jpg"]];
        _titleImageView.bounds = CGRectMake(0, 0, 0, 0);
        _titleImageView.center = CGPointMake(182.5, 17);
    }
    return _titleImageView;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
