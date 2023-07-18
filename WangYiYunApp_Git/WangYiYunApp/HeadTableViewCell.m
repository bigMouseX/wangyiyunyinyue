//
//  headTableViewCell.m
//  WangYiYunApp
//
//  Created by 夏楠 on 2023/6/6.
//

#import "HeadTableViewCell.h"

@implementation HeadTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    self.p1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _p1.backgroundColor = [UIColor clearColor];
    [_p1 setTitle:@"我的消息" forState:UIControlStateNormal];
    
    UIImage *t1 = [UIImage imageNamed:@"p1"];
    t1 = [t1 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];//原彩显示
    [_p1 setImage:t1 forState:UIControlStateNormal];
    
    [_p1 setTintColor:[UIColor blackColor]];
    _p1.imageEdgeInsets = UIEdgeInsetsMake(-_p1.titleLabel.intrinsicContentSize.height + 10, 0, 0, -_p1.titleLabel.intrinsicContentSize.width);
    _p1.titleEdgeInsets = UIEdgeInsetsMake(_p1.currentImage.size.height + 30, -_p1.currentImage.size.width, 0, 0);
    [self.contentView addSubview:self.p1];
    
    self.p2 = [UIButton buttonWithType:UIButtonTypeSystem];
    _p2.backgroundColor = [UIColor clearColor];
    [_p2 setTitle:@"我的好友" forState:UIControlStateNormal];
    
    UIImage *t2 = [UIImage imageNamed:@"p2"];
    t2 = [t2 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [_p2 setImage:t2 forState:UIControlStateNormal];
    
    [_p2 setTintColor:[UIColor blackColor]];
    _p2.imageEdgeInsets = UIEdgeInsetsMake(-_p2.titleLabel.intrinsicContentSize.height + 10, 0, 0, -_p2.titleLabel.intrinsicContentSize.width);
    _p2.titleEdgeInsets = UIEdgeInsetsMake(_p2.currentImage.size.height + 30, -_p2.currentImage.size.width, 0, 0);
    [self.contentView addSubview:self.p2];
    
    self.p3 = [UIButton buttonWithType:UIButtonTypeSystem];
    _p3.backgroundColor = [UIColor clearColor];
    [_p3 setTitle:@"个人主页" forState:UIControlStateNormal];
    
    UIImage *t3 = [UIImage imageNamed:@"p3"];
    t3 = [t3 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [_p3 setImage:t3 forState:UIControlStateNormal];
    
    [_p3 setTintColor:[UIColor blackColor]];
    _p3.imageEdgeInsets = UIEdgeInsetsMake(-_p3.titleLabel.intrinsicContentSize.height + 10, 0, 0, -_p3.titleLabel.intrinsicContentSize.width);
    _p3.titleEdgeInsets = UIEdgeInsetsMake(_p3.currentImage.size.height + 30, -_p3.currentImage.size.width, 0, 0);
    [self.contentView addSubview:self.p3];
    
    self.p4 = [UIButton buttonWithType:UIButtonTypeSystem];
    _p4.backgroundColor = [UIColor clearColor];
    [_p4 setTitle:@"个性装扮" forState:UIControlStateNormal];
    
    UIImage *t4 = [UIImage imageNamed:@"p4"];
    t4 = [t4 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [_p4 setImage:t4 forState:UIControlStateNormal];
    
    [_p4 setTintColor:[UIColor blackColor]];
    _p4.imageEdgeInsets = UIEdgeInsetsMake(-_p4.titleLabel.intrinsicContentSize.height + 10, 0, 0, -_p4.titleLabel.intrinsicContentSize.width);
    _p4.titleEdgeInsets = UIEdgeInsetsMake(_p4.currentImage.size.height + 30, -_p4.currentImage.size.width, 0, 0);
    [self.contentView addSubview:self.p4];
    
    self.head = [UIButton buttonWithType:UIButtonTypeSystem];
    UIImage *hs = [UIImage imageNamed:@"hs.jpeg"];
    hs = [hs imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self.head setImage:hs forState:UIControlStateNormal];
    [self.contentView addSubview:self.head];
    
    self.yunbei = [[UIButton alloc] init];
    [self.contentView addSubview:self.yunbei];
    
    self.name = [[UILabel alloc] init];
    self.name.text = @"孙笑川😭";
    [self.contentView addSubview:self.name];
    
    
    
    return self;
}

- (void)layoutSubviews {
    float wid = [UIScreen mainScreen].bounds.size.width / 4;
    _p1.frame = CGRectMake(0, 55, wid, wid);
    _p2.frame = CGRectMake(wid, 55, wid, wid);
    _p3.frame = CGRectMake(wid * 2, 55, wid, wid);
    _p4.frame = CGRectMake(wid * 3, 55, wid, wid);
    self.head.frame = CGRectMake(10, 5, 50, 50);
    self.name.frame = CGRectMake(75, 10, 160, 45);
    
    self.head.layer.cornerRadius = self.head.frame.size.width / 2;
    self.head.layer.masksToBounds = YES;
    self.head.clipsToBounds = YES;
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
