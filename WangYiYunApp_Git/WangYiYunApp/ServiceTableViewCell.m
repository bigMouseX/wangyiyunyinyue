//
//  serviceTableViewCell.m
//  WangYiYunApp
//
//  Created by 夏楠 on 2023/6/6.
//

#import "ServiceTableViewCell.h"

@implementation ServiceTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if ([self.reuseIdentifier isEqualToString:@"service"]) {
        self.icon = [[UIImageView alloc] init];
        [self.contentView addSubview:self.icon];
        
        self.name = [[UILabel alloc] init];
        [self.contentView addSubview:self.name];
    }
    return self;
}

- (void)layoutSubviews {
    self.name.frame = CGRectMake(50, 0, 200, 60);
    self.icon.frame = CGRectMake(15, 20, 20, 20);
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
