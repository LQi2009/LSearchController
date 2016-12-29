//
//  UISearchBarTest.m
//  LZSearchController
//
//  Created by Artron_LQQ on 2016/12/20.
//  Copyright © 2016年 Artup. All rights reserved.
//

#import "UISearchBarTest.h"

@interface UISearchBarTest ()<UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating, UISearchBarDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UISearchController *searchController;
@end

@implementation UISearchBarTest
- (UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [self.view addSubview:_tableView];
    }
    
    return _tableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    // 创建UISearchController, 这里使用当前控制器来展示结果
    UISearchController *search = [[UISearchController alloc]initWithSearchResultsController:nil];
    // 设置结果更新代理
    search.searchResultsUpdater = self;
    // 因为在当前控制器展示结果, 所以不需要这个透明视图
    search.dimsBackgroundDuringPresentation = NO;
    // 是否自动隐藏导航
    //    search.hidesNavigationBarDuringPresentation = NO;
    self.searchController = search;
    
    search.searchBar.delegate = self;
    
//    search.searchBar.barStyle = UIBarStyleBlack;
    search.searchBar.prompt = @"这是一个prompt";
    
    
    
    
    
//    search.searchBar.tintColor = [UIColor redColor];
    // 修改取消按钮 颜色
//    [[UIBarButtonItem appearanceWhenContainedInInstancesOfClasses:@[[UISearchBar class]]] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor redColor], NSFontAttributeName: [UIFont systemFontOfSize:16]} forState:UIControlStateNormal];
//    
//    [[UIBarButtonItem appearanceWhenContainedInInstancesOfClasses:@[[UISearchBar class]]] setTitle:@"souSuo"];

    
    search.searchBar.barTintColor = [UIColor greenColor];
    search.searchBar.backgroundColor = [UIColor orangeColor];
    
    
    search.searchBar.scopeButtonTitles = @[@"A", @"B"];
//    search.searchBar.showsScopeBar = YES;
    
    self.tableView.tableHeaderView = search.searchBar;

    [search.searchBar sizeToFit];
    
    
    
    UILabel *label = [[UILabel alloc]init];
    label.text = @"这是一个inputAccessoryView";
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor blackColor];
    
    label.frame = CGRectMake(0, 0, 0, 30);
    label.backgroundColor = [UIColor redColor];
    search.searchBar.inputAccessoryView = label;
    
//    search.searchBar.backgroundImage = [UIImage imageNamed:@"40fe711f9b754b596159f3a6.jpg"];
//    search.searchBar.scopeBarBackgroundImage = [UIImage imageNamed:@"9c16fdfaaf51f3de3b5b8e0d94eef01f3b2979e9.jpg"];
    
//    [search.searchBar setBackgroundImage:[UIImage imageNamed:@"40fe711f9b754b596159f3a6.jpg"] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
//    
//    [search.searchBar setSearchFieldBackgroundImage:[UIImage imageNamed:@"aaaaa.png"] forState:UIControlStateNormal];
    
    [search.searchBar setImage:[UIImage imageNamed:@"MoreExpressionShops"] forSearchBarIcon:UISearchBarIconSearch state:UIControlStateNormal];
    
    
    // 修改偏移量
//    search.searchBar.searchTextPositionAdjustment = UIOffsetMake(20, 0);
//    search.searchBar.searchFieldBackgroundPositionAdjustment = UIOffsetMake(20, 0);
    
//    search.searchBar.showsCancelButton = YES;
    
//    UIView *backView = [search.searchBar.subviews firstObject];
//    
//    
//    UITextField *textField = nil;
//    
//    for (UIView *tmp in backView.subviews) {
//        
//        if ([tmp isKindOfClass:NSClassFromString(@"UISearchBarTextField")]) {
//            
//            textField = (UITextField *)tmp;
//            break;
//        }
//    }
//    // 找到这个textField, 就可以按UITextField类来设置了
//    if (textField) {
//        
//        textField.tintColor = [UIColor orangeColor];
//    }
    
    
    UIView *backView = [[search.searchBar.subviews firstObject].subviews firstObject];
    
    UISegmentedControl *segmentedController = nil;
    // 找到 UISegmentedControl
    for (UIView *tmp in backView.subviews) {
        
        if ([tmp isKindOfClass:[UISegmentedControl class]]) {
            
            segmentedController = (UISegmentedControl *)tmp;
            break;
        }
    }
    // 如果存在
    if (segmentedController) {
        
        [segmentedController setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor redColor]} forState:UIControlStateNormal];
        [segmentedController setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor blackColor]} forState:UIControlStateSelected];
        // 设置中颜色
        segmentedController.tintColor = [UIColor redColor];
    }

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellID"];
    }
    
    // 这里通过searchController的active属性来区分展示数据源是哪个
    cell.textLabel.text = [NSString stringWithFormat:@"%ld---%ld", (long)indexPath.section, (long)indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
}

#pragma mark - UISearchResultsUpdating
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    
}

#pragma mark - UISearchBarDelegate
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{
    
    NSLog(@"searchBarShouldBeginEditing >>%@", NSStringFromCGRect(searchBar.frame));
    
    [searchBar setShowsCancelButton:YES animated:YES];
    
    UIButton *cancelButton = nil;
    UIView *tempView = [searchBar.subviews firstObject];
    for (UIView *sub in tempView.subviews) {
        
        if ([sub isKindOfClass:NSClassFromString(@"UINavigationButton")]) {
            
            cancelButton = (UIButton*)sub;
        }
    }
    
    if (cancelButton) {
        
        [cancelButton setTitle:@"取消" forState:UIControlStateNormal];
        
//        [cancelButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    }
    
    UIButton *canceLBtn = [self.searchController.searchBar valueForKey:@"cancelButton"];
    
//    searchBar.showsCancelButton = YES;
    
    for (UIView *sub in tempView.subviews) {
        
        if ([sub isKindOfClass:NSClassFromString(@"UINavigationButton")]) {
            
            cancelButton = (UIButton*)sub;
        }
    }
    
//    [searchBar setShowsScopeBar:YES];
    

    
    return YES;
}
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    
    NSLog(@"searchBarTextDidBeginEditing >>%@", NSStringFromCGRect(searchBar.frame));
    
//    UIButton *canceLBtn = [searchBar valueForKey:@"cancelButton"];
//    [canceLBtn setTitle:@"取消" forState:UIControlStateNormal];
//    [canceLBtn setTitleColor:[UIColor colorWithRed:14.0/255.0 green:180.0/255.0 blue:0.0/255.0 alpha:1.00] forState:UIControlStateNormal];
    
//    CGRect rect = searchBar.frame;
//    rect.size.height = 88;
//    searchBar.frame = rect;
    
    
//    [searchBar sizeToFit];
    
//    [searchBar layoutIfNeeded];
    
    // 修改UISearchBar右侧的取消按钮文字颜色及背景图片
    
    
    
   
}
- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar {
    
    NSLog(@"searchBarShouldEndEditing >>%@", NSStringFromCGRect(searchBar.frame));
    return YES;
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar {
    
    NSLog(@"searchBarTextDidEndEditing >>%@", NSStringFromCGRect(searchBar.frame));
    
//    [searchBar sizeToFit];
}
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    
    NSLog(@"textDidChange >>%@", NSStringFromCGRect(searchBar.frame));
}

- (void)searchBar:(UISearchBar *)searchBar selectedScopeButtonIndexDidChange:(NSInteger)selectedScope {
    
    NSLog(@"selectedScopeButtonIndexDidChange");
    
   
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
