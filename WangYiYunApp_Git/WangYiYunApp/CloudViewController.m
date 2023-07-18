 //
//  CloudViewController.m
//  WangYiYunApp
//
//  Created by 夏楠 on 2023/6/14.
//

#import "CloudViewController.h"

@interface CloudViewController ()

@end

@implementation CloudViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *customImage = [UIImage imageNamed:@"yunpan.jpg"];
    UIImageView *backgroundImageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    backgroundImageView.image = customImage;
    backgroundImageView.contentMode = UIViewContentModeScaleAspectFill;
    backgroundImageView.clipsToBounds = YES;
    [self.view addSubview:backgroundImageView];
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
