//
//  ViewController.h
//  AccordianPOC
//
//  Created by Mac Mini on 14/08/15.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource, UITabBarDelegate>
@property(strong, nonatomic)NSMutableArray *arrItems;
-(void)expandTableViewCell:(id)childs andIndex:(id)cellIndex;
-(void)collapseTableViewCell:(id)childs andIndex:(id)cellIndex;
-(BOOL)isExpandedAt:(long)index;
@property(strong, nonatomic)NSMutableArray *arrExpanded;
@end

