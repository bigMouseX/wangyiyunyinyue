//
//  noonTableViewCell.m
//  WangYiYunApp
//
//  Created by 夏楠 on 2023/6/8.
//

#import "NightTableViewCell.h"

@implementation NightTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if ([self.reuseIdentifier isEqualToString:@"noon"]) {
        self.icon = [[UIImageView alloc] init];
        [self.contentView addSubview:self.icon];
        
        self.name = [[UILabel alloc] init];
        [self.contentView addSubview:self.name];
        
        self.s = [[UISwitch alloc] init];
        [self.contentView addSubview:self.s];
        
    }
    return self;
}

- (void)layoutSubviews {
    self.name.frame = CGRectMake(50, 0, 200, 60);
    self.icon.frame = CGRectMake(15, 20, 20, 20);
    self.s.frame = CGRectMake(330, 10, 80, 40);
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
