//
//  ParentTableViewCell.h
//  AccordianPOC
//
//  Created by Mac Mini on 14/08/15.
//

#import <UIKit/UIKit.h>
#import "Screen.h"
@protocol ParentTableCellDelegate
-(void)expandTableViewCell:(id)childs andIndex:(id)cellIndex;
-(void)collapseTableViewCell:(id)childs andIndex:(id)cellIndex;
-(BOOL)isExpandedAt:(long)index;
@property(strong, nonatomic)NSMutableArray *arrExpanded;
@end

@interface ParentTableViewCell : UITableViewCell
@property(strong,nonatomic)    NSMutableDictionary *objScreen;
@property (strong, nonatomic) IBOutlet UIButton *btnExpand;
@property (strong, nonatomic) IBOutlet UILabel *lblName;
@property (assign, nonatomic) long cellIndex;
@property (assign)BOOL expanded;
@property(assign,nonatomic) ParentTableViewCell<ParentTableCellDelegate> *delegate;
-(IBAction)btnExpandTapped:(id)sender;
-(void)setValueInTableViewCell;
@end
