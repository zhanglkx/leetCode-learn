//
//  XHomeCell.m
//  UILearn
//
//  Created by apple on 2021/11/26.
//

#import "XHomeCell.h"

@implementation XHomeCell

+ (instancetype)cellModelWithTableView:(UITableView *)tableView {
    static NSString *ID = @"cellModel";
    XHomeCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"XHomeCell" owner:nil options:nil] firstObject];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor colorWithRed:242/255.0 green:246/255.0 blue:247/255.0 alpha:1.0];
    return cell;
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
