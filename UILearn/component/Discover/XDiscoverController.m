//
//  XDiscoverController.m
//  UILearn
//
//  Created by apple on 2021/11/23.
//

#import "XDiscoverController.h"

@interface XDiscoverController ()

@end

@implementation XDiscoverController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self setTabbatTextposition];
    self.view.backgroundColor = UIColor.purpleColor;
    //    是否半透明
        self.tabBarController.tabBar.translucent = NO;
        self.navigationController.navigationBar.translucent = NO;
}



@end
