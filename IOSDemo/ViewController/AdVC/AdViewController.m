//
//  AdViewController.m
//  IOSDemo
//
//  Created by Jack on 15/11/30.
//  Copyright © 2015年 UWO. All rights reserved.
//

#import "AdViewController.h"
#import "UIImageView+WebCache.h"
#import "CommonService.h"
#import "AppDelegate.h"
#import "WebViewController.h"
#import "MainTabBarController.h"

@interface AdViewController ()

@property(nonatomic,copy) NSString *img_url;
@property(nonatomic,copy) NSString *url;
@property(nonatomic,strong) NSTimer *myTimer;
@property(nonatomic,strong) UIImageView *myImageView;
@property(nonatomic,strong) UIImageView *imageLogo;

@end

@implementation AdViewController
@synthesize img_url,myImageView,url,imageLogo;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self getImgData];
    if (iPhone4s) {
        imageLogo =[[UIImageView alloc]initWithFrame:CGRectMake(0, -88, 320, 568)];
        myImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width,371)];
    }else{
        myImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH,SCREEN_HEIGHT*464/568)];
        imageLogo =[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH,SCREEN_HEIGHT)];
    }
    
    myImageView.userInteractionEnabled = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    
    [imageLogo setImage:[UIImage imageNamed:@"lauchen_image"]];
    [self.view addSubview:imageLogo];
    [self.view addSubview:myImageView];
    _myTimer = [NSTimer timerWithTimeInterval:3.0 target:self selector:@selector(timerFired) userInfo:nil repeats:NO];
    [[NSRunLoop  currentRunLoop] addTimer:_myTimer forMode:NSDefaultRunLoopMode];
    [self.navigationController setNavigationBarHidden: YES];
    
    self.myImageView.alpha = 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)getImgData{
    CommonService *service = [[CommonService alloc] init];
    NSDictionary *param = nil;
    [service getNetWorkData:param
                       Path:ADIMAGE
                  Successed:^(id entity) {
                      
                      NSDictionary *dic = (NSDictionary *)entity;
                      url = [dic valueForKeyPath:@"url"];
                      if (iPhone4s) {
                          img_url = [dic valueForKeyPath:@"s4_img_url"];
                      }else{
                          img_url = [dic valueForKeyPath:@"img_url"];
                      }
                      
                      if (img_url) {
                          NSString *imgUrl =[NSString stringWithFormat:@"%@/%@",IMAGE_URL,img_url];
                          [myImageView sd_setImageWithURL:[NSURL URLWithString:imgUrl]
                                                completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL)
                           {
                               [UIView beginAnimations:nil context:nil];
                               [UIView setAnimationDuration:1];
                               myImageView.alpha  = 1;
                               [UIView commitAnimations];
                           }];
                      }
                      
                      
                      if (url) {
                          UITapGestureRecognizer *click = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(show)];
                          
                          [myImageView addGestureRecognizer:click];
                      }
                      dispatch_async(dispatch_get_main_queue(), ^{
                      });
                  } Failed:^(NSInteger errorCode, NSString *message) {
                      NSLog(@"===");
                  }];
}

-(void)show
{
    WebViewController *vc = [[WebViewController alloc] init];
     vc.url =url;
    vc.vcTitle=@"APP－启动广告";
    [self.navigationController pushViewController:vc animated:YES];
    
    DebugLog(@"ok");
}

-(void)timerFired
{
    MainTabBarController *vc =[[MainTabBarController alloc]init];
    [[AppDelegate instance].window changeRootViewController:vc];
    [_myTimer invalidate];
    //    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    //    UINavigationController * nav = [[UINavigationController alloc ]initWithRootViewController:[[WrapperMainViewController alloc] init]];
    //    window.rootViewController = nav;
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES];
}

@end
