//
//  ViewController.m
//  AccordianPOC
//
//  Created by Mac Mini on 14/08/15.
//

#import "ViewController.h"
#import "ParentTableViewCell.h"
@interface ViewController ()
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation ViewController{
    NSMutableArray *arrTask;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _arrExpanded = [NSMutableArray array];
    _arrItems = [NSMutableArray array];
    NSString *strJson = @"{  \"childsList\" : [    {\"childsList\" : [      ],            \"groupName\" : \"GRoup2\"},{\"childsList\":[ {\"childsList\":[],  \"groupName\":\"GRoup3\"},{\"childsList\":[{ \"childsList\":[ ],\"groupName\":\"GRoup4\"},{\"childsList\":[ ],\"groupName\":\"GRoup5\"} ], \"groupName\":\"GRoup6\"}],\"groupName\":\"GRoup7\"},{\"childsList\" : [{ \"childsList\" : [{\"childsList\" : [ { \"childsList\":[ ],\"groupName\":\"GRoup8\" },{ \"childsList\":[ {\"childsList\":[{ \"childsList\":[],\"groupName\":\"GRoup9\" } ], \"groupName\":\"GRoup10\" } ],\"groupName\":\"GRoup11\" },{\"childsList\":[],\"groupName\":\"GRoup12\" } ], \"groupName\" : \"Group13\" }], \"groupName\" : \"Group14\"}], \"groupName\" : \"GRoup15\"}],\"groupName\" : \"group1\"}";
    
    NSError *error;
    NSData *dataJson = [strJson dataUsingEncoding:NSUTF8StringEncoding];
    NSMutableDictionary *dictItems = [NSJSONSerialization JSONObjectWithData:dataJson options:NSJSONReadingAllowFragments error:&error];
    _arrItems = [NSMutableArray arrayWithObjects:dictItems, nil];
    arrTask = [[NSMutableArray alloc] initWithArray:_arrItems];
    NSLog(@"json data : %@ ",_arrItems);
 }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return arrTask.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    static NSString *cellIdentifier = @"ParentTableViewCell";
    ParentTableViewCell *cell = (ParentTableViewCell*)[tableView dequeueReusableCellWithIdentifier:nil];
    if(cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"ParentTableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
        cell.delegate = self;
        cell.cellIndex = indexPath.row;
        NSLog(@"indexpath : %@",indexPath);
        cell.objScreen = [[arrTask objectAtIndex:indexPath.row] mutableCopy];
        
        if ([self.arrExpanded containsObject:cell.objScreen]) {
            cell.expanded = YES;
        }else{
            cell.expanded = NO;
        }
        
    }
    return cell;
}
-(void)expandTableViewCell:(id)childs andIndex:(id)cellIndex{

    [self.arrExpanded addObject:cellIndex];
    NSMutableArray *indexPaths = [NSMutableArray new];
    [self.tableView beginUpdates];
    NSArray *childArray = (NSArray*)childs;
    int insertPos = [cellIndex intValue];
    insertPos ++;
    for (int x=0; x<childArray.count; x++) {
        [indexPaths addObject:[NSIndexPath indexPathForRow:insertPos inSection:0]];
        [arrTask insertObject:childArray[x] atIndex:insertPos];
        insertPos++;
    }
    [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade];
    [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:[cellIndex intValue] inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:YES];
    [self.tableView endUpdates];
    for (int i = insertPos; i < arrTask.count; i++) {
        ParentTableViewCell *cell = (ParentTableViewCell*)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
        NSLog(@"Old Index : %ld",cell.cellIndex);
        cell.cellIndex = i;
        NSLog(@"new Index : %ld",cell.cellIndex);
    }
}
-(void)collapseTableViewCell:(id)childs andIndex:(id)cellIndex{
    int index = [cellIndex intValue];
    NSArray *childArray = (NSArray*)childs;
    NSMutableArray *indexPaths = [NSMutableArray new];
    int x= 0;
    NSRange range;
    range.location = index+1;
    range.length = 0;
    for (long i = index + 1; i <= index + [childArray count]; i++) {
        ParentTableViewCell* cell = (ParentTableViewCell*)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
        [self.arrExpanded removeObject:cell.objScreen];
        if (cell.expanded) {
        [self collapseTableViewCell:[childArray[x] valueForKey:@"childsList"]  andIndex:[NSNumber numberWithLong:i]];
        }
        [indexPaths addObject:[NSIndexPath indexPathForRow:i inSection:0]];
        x++;
    }
    range.length = x;
    [arrTask removeObjectsInRange:range];
    [self.tableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade];
    
    long indexPathCount = indexPaths.count;
    for (long i = 0; i < indexPathCount; i++) {
        ParentTableViewCell *cell = (ParentTableViewCell*)[self.tableView cellForRowAtIndexPath:[indexPaths objectAtIndex:i]];
        NSLog(@"Old Index : %ld",cell.cellIndex);
        cell.cellIndex  -= indexPathCount;
        NSLog(@"new Index : %ld",cell.cellIndex);
        [self.arrExpanded removeObject:cell.objScreen];
    }
}
@end
