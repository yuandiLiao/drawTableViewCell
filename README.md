# drawTableViewCell

使用方法，引入#import "UITableView+MoveCell.h"类别 \
然后将数据源绑定即可。
```Objective-c
  __weak typeof(self) weakSelf = self;
        [_tableView setDataWithArray:self.dataArray withBlock:^(NSMutableArray *newArray) {
            weakSelf.dataArray = newArray;
        }];
```
详情可见http://www.jianshu.com/p/cef0f9de0c2e
