//
//  LZSearchController.m
//  LZSearchController
//
//  Created by Artron_LQQ on 2016/12/17.
//  Copyright © 2016年 Artup. All rights reserved.
//

#import "LZSearchController.h"
#import "LZResultDisplayController.h"

@interface LZSearchController ()

@property (nonatomic, strong) LZResultDisplayController *displayController;
@property (nonatomic, strong) UISearchController *searchController;
;
@end

@implementation LZSearchController
- (NSMutableArray *)datas {
    if (_datas == nil) {
        _datas = [NSMutableArray arrayWithCapacity:0];
    }
    
    return _datas;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    for (int i = 0; i < 100; i++) {
        
        NSString *str = [NSString stringWithFormat:@"测试数据%d", i];
        
        [self.datas addObject:str];
    }

    // 创建用于展示搜索结果的控制器
    LZResultDisplayController *result = [[LZResultDisplayController alloc]init];
    result.datas = [self.datas copy];
    
    // 创建搜索框
    UISearchController *search = [[UISearchController alloc]initWithSearchResultsController:result];
    
    self.tableView.tableHeaderView = search.searchBar;
    
    search.searchResultsUpdater = result;
    
    self.searchController = search;
    //是否添加半透明覆盖层
    //    search.dimsBackgroundDuringPresentation = YES;
    //    //是否隐藏导航栏
    //    search.hidesNavigationBarDuringPresentation = YES;
    
    //    self.definesPresentationContext = YES;
    
    search.searchBar.placeholder = @"搜索";
    
    //    self.definesPresentationContext = YES;
    //    search.searchBar.delegate = self;
    
     [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.datas.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class]) forIndexPath:indexPath];
    
    cell.textLabel.text = [self.datas objectAtIndex:indexPath.row];
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
