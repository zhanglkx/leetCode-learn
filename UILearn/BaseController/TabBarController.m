//
//  TabBarController.m
//  UILearn
//
//  Created by apple on 2021/11/23.
//

#import "TabBarController.h"
#import "NavigationController.h"

#import "XHomeController.h"
#import "XMessageController.h"
#import "XProfileController.h"
#import "XDiscoverController.h"

#import "XTabBar.h"

@interface TabBarController ()
@property (nonatomic, strong) NSMutableArray *items;
@end

@implementation TabBarController

+ (void)initialize
{
    // self -> CZTabBarController
    // 获取当前这个类下面的所有tabBarItem
    UITabBarItem *item = [UITabBarItem appearanceWhenContainedIn:self, nil];
    
    NSLog(@"%@",self);
    NSLog(@"%s",__func__);
    
//    创建属性字典
    NSMutableDictionary *att = [NSMutableDictionary dictionary];
    att[NSForegroundColorAttributeName] = [UIColor orangeColor];
    
//    设置模型的标题属性修改控件的文字颜色
    [item setTitleTextAttributes:att forState:UIControlStateSelected];
    
}

- (NSMutableArray *)items
{
    if (_items == nil) {
        
        _items = [NSMutableArray array];
        
    }
    return _items;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setUpAllChildVc];
    
//    self.tabBar.translucent = NO;
    
    // 自定义tabBar
//    XTabBar *tabBar = [[XTabBar alloc] initWithFrame:self.tabBar.frame];

    // 利用KVC把readly的属性改
//    前一个tabBar是 XTabBar *tabBar 后一个是自己的tabbar
//    [self setValue:tabBar forKeyPath:@"tabBar"];
//    objc_msgSend(self, @selector(setTabBar:),tabBar);
    //创建自己的tabbar，然后用kvc将自己的tabbar和系统的tabBar替换下
    UITabBar *tabBar = [[UITabBar alloc] init];
    [self setValue:tabBar forKeyPath:@"tabBar"];
    

    
}


#pragma mark - 初始化tabBar上除了中间按钮之外所有的按钮

- (void)setUpAllChildVc{
    
    
    XHomeController *home = [XHomeController new];
    [self setUpOneChildVcWithVc:home Image:@"tab_home_unselected" selectedImage:@"tab_home_unselected" title:@"主页"];

    
    XMessageController *SearVC = [XMessageController new];
    [self setUpOneChildVcWithVc:SearVC Image:@"tab_home_unselected" selectedImage:@"tab_home_unselected" title:@"消息"];
    

    XDiscoverController *logVC  =[XDiscoverController new];
    [self setUpOneChildVcWithVc:logVC Image:@"tab_home_unselected" selectedImage:@"tab_home_unselected" title:@"发现"];
    logVC.tabBarItem.badgeValue = @"速八拉稀";
    
    XProfileController *Lock = [XProfileController new];
    [self setUpOneChildVcWithVc:Lock Image:@"tab_home_unselected" selectedImage:@"tab_home_unselected" title:@"个人"];
}


#pragma mark - 初始化设置tabBar上面单个按钮的方法
/**
 *  @author li bo, 16/05/10
 *
 *  设置单个tabBarButton
 *
 *  @param Vc            每一个按钮对应的控制器
 *  @param image         每一个按钮对应的普通状态下图片
 *  @param selectedImage 每一个按钮对应的选中状态下的图片
 *  @param title         每一个按钮对应的标题
 */
- (void)setUpOneChildVcWithVc:(UIViewController *)Vc Image:(NSString *)image selectedImage:(NSString *)selectedImage title:(NSString *)title{
    NavigationController *nav = [[NavigationController alloc] initWithRootViewController:Vc];
    UIImage *myImage = [UIImage imageNamed:image];
    myImage = [myImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //tabBarItem，是系统提供模型，专门负责tabbar上按钮的文字以及图片展示
    Vc.tabBarItem.image = myImage;
    
    UIImage *mySelectedImage = [UIImage imageNamed:selectedImage];
    mySelectedImage = [mySelectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    Vc.tabBarItem.selectedImage = mySelectedImage;
    Vc.tabBarItem.title = title;
    // 保存tabBarItem模型到数组
//    [self.items addObject:Vc.tabBarItem];
    
 
    
    [self addChildViewController:nav];
    
}

-(UIUserInterfaceStyle)overrideUserInterfaceStyle{

    return UIUserInterfaceStyleLight;

}

@end
