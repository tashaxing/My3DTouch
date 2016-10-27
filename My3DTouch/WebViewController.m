//
//  WebViewController.m
//  My3DTouch
//
//  Created by yxhe on 16/10/27.
//  Copyright © 2016年 tashaxing. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"网页";
    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:webView];
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.bing.com"]]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 3D touch上滑菜单
- (NSArray<id<UIPreviewActionItem>> *)previewActionItems
{
    UIPreviewAction *entry1 = [UIPreviewAction actionWithTitle:@"entry1" style:UIPreviewActionStyleDestructive handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"entry1");
        // 进入分支函数
    }];
    
    UIPreviewAction *entry2 = [UIPreviewAction actionWithTitle:@"entry2" style:UIPreviewActionStyleSelected handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"entry2");
        // 进入分支函数
    }];
    
    NSArray *entrys = @[entry1,entry2];
    UIPreviewActionGroup *group = [UIPreviewActionGroup actionGroupWithTitle:@"group" style:UIPreviewActionStyleDefault actions:entrys];
    
    UIPreviewAction *entry3 = [UIPreviewAction actionWithTitle:@"entry2" style:UIPreviewActionStyleSelected handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"entry3");
        // 进入分支函数
    }];
    
    // 组合单项列在一起
    NSArray *actionArray = @[group, entry3];
    
    return actionArray;
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
