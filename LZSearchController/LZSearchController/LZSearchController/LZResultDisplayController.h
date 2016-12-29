//
//  LZResultDisplayController.h
//  LZSearchController
//
//  Created by Artron_LQQ on 2016/12/17.
//  Copyright © 2016年 Artup. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LZResultDisplayController : UITableViewController<UISearchResultsUpdating>

@property (nonatomic, strong) NSMutableArray *datas;
@end
