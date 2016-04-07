//
//  ParentTableViewCell.m
//  AccordianPOC
//
//  Created by Mac Mini on 14/08/15.
//

#import "ParentTableViewCell.h"

@implementation ParentTableViewCell{
 
}
-(void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    [self setValueInTableViewCell];
}
- (void)awakeFromNib {
    
    // Initialization code
}

-(void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}
-(void)setValueInTableViewCell{
    if ([[self.objScreen valueForKey:@"childsList"] count] == 0) {
        [_btnExpand setImage:nil forState:UIControlStateNormal];
    }else{
        if (_expanded) {
            [_btnExpand setImage:[UIImage imageNamed:@"minus"] forState:UIControlStateNormal];
        }else{
            [_btnExpand setImage:[UIImage imageNamed:@"plus"] forState:UIControlStateNormal];
        }
    }
    _lblName.text = [_objScreen valueForKey:@"groupName"];
}

- (IBAction)btnExpandTapped:(id)sender{
     NSArray *arrChilds = [self.objScreen valueForKey:@"childsList"];
    if (arrChilds.count){
        if (_expanded) {
            _expanded = NO;
            [self.delegate.arrExpanded removeObject:self.objScreen];
            [_btnExpand setImage:[UIImage imageNamed:@"plus"] forState:UIControlStateNormal];
            if ([self.delegate respondsToSelector:@selector(collapseTableViewCell:andIndex:)])
            {
                [self.delegate performSelector:@selector(collapseTableViewCell:andIndex:) withObject:arrChilds          withObject:[NSNumber numberWithLong:self.cellIndex]];
            }
     }else{
         _expanded = YES;
         [self.delegate.arrExpanded addObject:self.objScreen];
         [_btnExpand setImage:[UIImage imageNamed:@"minus"] forState:UIControlStateNormal];
          if ([self.delegate respondsToSelector:@selector(expandTableViewCell:andIndex:)]) {
                [self.delegate performSelector:@selector(expandTableViewCell:andIndex:) withObject:arrChilds          withObject:[NSNumber numberWithLong:self.cellIndex]];
            }
         }
    }
}
@end
