//
//  XHomeController.m
//  UILearn
//
//  Created by apple on 2021/11/23.
//


#import "XHomeController.h"
#import "X2Controller.h"
#import "X3Controller.h"
#import "X4Controller.h"
#import "X5Controller.h"
#import "XHomeCell.h"
#import "XHomeableViewController.h"



@interface XHomeController ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation XHomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    设置badgeValue
    self.tabBarItem.badgeValue = @"哇咔咔";
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, Device_Width, Device_Height*0.6) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    
    [self.view addSubview:tableView];
    
    [self setNavigationItem];
    self.view.backgroundColor = UIColor.whiteColor;
    
    [self creatButton];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    XHomeCell *cell = [XHomeCell cellModelWithTableView:tableView];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%ld",indexPath.row);
    switch (indexPath.row) {
        case 0:{
            X2Controller *VC = [X2Controller new];
            [VC setHidesBottomBarWhenPushed:YES];
            [self.navigationController pushViewController:VC animated:YES];
        }
            break;
            
        case 1:{
            X3Controller *VC = [X3Controller new];
            [VC setHidesBottomBarWhenPushed:YES];
            [self.navigationController pushViewController:VC animated:YES];
        }
            break;
            
        case 2:{
            X4Controller *VC = [X4Controller new];
            [VC setHidesBottomBarWhenPushed:YES];
            [self.navigationController pushViewController:VC animated:YES];
        }
            break;
            
        case 3:{
            X5Controller *VC = [X5Controller new];
            [VC setHidesBottomBarWhenPushed:YES];
            [self.navigationController pushViewController:VC animated:YES];
        }
            break;
            
        default:
            break;
    }
}






- (void)creatButton{
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, Device_Height * 0.6, 200, 50)];
//    btn.center = CGPointMake(Device_Width * 0.5, Device_Height * 0.5);
    [btn setTitle:@"下一步" forState:UIControlStateNormal];
    
    btn.layer.cornerRadius = 22;
    btn.layer.masksToBounds = YES;
    btn.layer.borderWidth = 1;
    btn.layer.backgroundColor = [[UIColor colorWithRed:228 / 255.0 green:228 / 255.0 blue:228 / 255.0 alpha:1.0] CGColor];
    [btn setTitleColor:[UIColor colorWithRed:102 / 255.0 green:102 / 255.0 blue:102 / 255.0 alpha:1.0] forState:UIControlStateNormal];
    
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(jumpToNext) forControlEvents:UIControlEventTouchUpInside];
}

- (void)jumpToNext{
    X2Controller *VC = [X2Controller new];
    [VC setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:VC animated:YES];
}

- (void)test {
    UIView *vi = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Device_Width, 10)];
    vi.backgroundColor = UIColor.blackColor;
    [self.view addSubview:vi];
    
}


-(void)setNavigationItem{
    
    //    设置导航栏背景色 注释掉的为错误写法
    //    self.navigationController.navigationBar.translucent = NO;
    //    self.navigationController.navigationBar.backgroundColor = [UIColor greenColor];
        self.navigationController.navigationBar.barTintColor = [UIColor greenColor];
    
    //    左侧视图
        UIBarButtonItem *left = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks target:self action:@selector(left)];
        self.navigationItem.leftBarButtonItem = left;
        
    //    右侧文字
        UIButton *right = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [right setTitle:@"右边" forState:UIControlStateNormal];
        [right setFrame:CGRectMake(0, 0, 100, 100)];
        UIBarButtonItem *rightitem = [[UIBarButtonItem alloc] initWithCustomView:right];
        self.navigationItem.rightBarButtonItem = rightitem;
        
    //    中间标题自定义视图
    self.navigationItem.title = @"主页";
//        UIView *testView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 1000)];
//            testView.backgroundColor = [UIColor orangeColor];
//            self.navigationItem.titleView = testView;
    
//    标题
    self.navigationItem.title = @"主页";
    
//    是否半透明
    self.tabBarController.tabBar.translucent = NO;
    self.navigationController.navigationBar.translucent = NO;
}


- (void)left {
    NSLog(@"左边视图");
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
