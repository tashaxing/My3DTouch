//
//  ViewController.m
//  My3DTouch
//
//  Created by yxhe on 16/10/26.
//  Copyright © 2016年 tashaxing. All rights reserved.
//

// ---- 3D Touch简单应用---- //

#import "ViewController.h"
#import "DetailViewController.h"
#import "WebViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource, UIViewControllerPreviewing>
{
    UITableView *tableView;
    NSArray *tableArray;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"3DTouch 测试";
    
    tableArray = @[@"page1",
                   @"page2",
                   @"page3",
                   @"page4",
                   @"web5",
                   @"web6",
                   @"page7",
                   @"page8",
                   @"page9"];
    tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
}

#pragma mark - tableview delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return tableArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identityCell = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identityCell];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identityCell];
    }
    cell.textLabel.text = tableArray[indexPath.row];
    
    // 如果设备支持3d touch功能就注册
    if (self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable)
    {
        [self registerForPreviewingWithDelegate:self sourceView:cell];
    }
    
    return cell;

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row != 4 && indexPath.row != 5)
    {
        // 进入普通界面
        DetailViewController *detailVC = [[DetailViewController alloc] init];
        [self.navigationController pushViewController:detailVC animated:YES];
    }
    else
    {
        // 进入web加载页面
        WebViewController *webVC = [[WebViewController alloc] init];
        [self.navigationController pushViewController:webVC animated:YES];
    }
}

#pragma mark - UIViewControllerPreviewingDelegate

// 稍微按压peek
- (UIViewController *)previewingContext:(id <UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location
{
    // 根据坐标确定点击的行数索引
    CGPoint locationInTableView = [tableView convertPoint:location fromView:[previewingContext sourceView]];
    NSIndexPath *indexPath = [tableView indexPathForRowAtPoint:locationInTableView];
    
    // 进入对应的VC，其实可以加个判断是否冲入
    if (indexPath.row != 4 && indexPath.row != 5)
    {
        if ([self.presentedViewController isKindOfClass:[DetailViewController class]])
        {
            return nil;
        }
        else
        {
            DetailViewController *detailVC = [[DetailViewController alloc] init];
            return detailVC;
        }
    }
    else
    {
        if ([self.presentedViewController isKindOfClass:[WebViewController class]])
        {
            return nil;
        }
        else
        {
            WebViewController *webVC = [[WebViewController alloc] init];
            return webVC;
        }
    }
}

// 加重按压pop
- (void)previewingContext:(id<UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit
{
    [self.navigationController pushViewController:viewControllerToCommit animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
