//
//  X5Controller.m
//  UILearn
//
//  Created by apple on 2021/11/25.
//

#import "X5Controller.h"
#import "XHomeController.h"
#import "X2Controller.h"
@interface X5Controller ()

@end

@implementation X5Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"主页5";
    
    self.view.backgroundColor = UIColor.systemPinkColor;
    
    // Do any additional setup after loading the view.
    [self setControllerview];
  
}

- (void)setControllerview{
    UIView *views = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Device_Width, Device_Height / 0.8)];
    [self.view addSubview:views];
    [self creatButton];
}

- (void)creatButton{
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 200, 50)];
    btn.center = CGPointMake(Device_Width * 0.5, Device_Height * 0.5);
    [btn setTitle:@"返回首页" forState:UIControlStateNormal];
    
    btn.layer.cornerRadius = 22;
    btn.layer.masksToBounds = YES;
    btn.layer.borderWidth = 1;
    btn.layer.backgroundColor = [[UIColor colorWithRed:228 / 255.0 green:228 / 255.0 blue:228 / 255.0 alpha:1.0] CGColor];
    [btn setTitleColor:[UIColor colorWithRed:102 / 255.0 green:102 / 255.0 blue:102 / 255.0 alpha:1.0] forState:UIControlStateNormal];
    
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(jumpToNext) forControlEvents:UIControlEventTouchUpInside];
}

- (void)jumpToNext{
    for (UIViewController *vc in self.navigationController.viewControllers) {
        if ([vc isKindOfClass:[X2Controller class]]) {
            [self.navigationController popToViewController:vc animated:YES];
        }
    }
    
    
    
//    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
