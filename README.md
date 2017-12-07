# drawTableViewCell

使用方法，引入#import "UITableView+MoveCell.h"类别 \n
然后将数据源绑定即可。\n
```
  __weak typeof(self) weakSelf = self;
        [_tableView setDataWithArray:self.dataArray withBlock:^(NSMutableArray *newArray) {
            weakSelf.dataArray = newArray;
        }];
```
