/*
 * OpenRemote, the Home of the Digital Home.
 * Copyright 2008-2012, OpenRemote Inc.
 *
 * See the contributors.txt file in the distribution for a
 * full listing of individual contributors.
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Affero General Public License as
 * published by the Free Software Foundation, either version 3 of the
 * License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU Affero General Public License for more details.
 *
 * You should have received a copy of the GNU Affero General Public License
 * along with this program. If not, see <http://www.gnu.org/licenses/>.
 */
#import "GridLayoutContainerSubController.h"
#import "ORControllerClient/GridLayoutContainer.h"
#import "ORControllerClient/GridCell.h"
#import "ORControllerClient/Component.h"
#import "ComponentSubController.h"

@interface GridLayoutContainerSubController()

// TODO: have properties from superclass in specific .h
@property (nonatomic, weak) ORControllerConfig *controller;
@property (nonatomic, weak) ImageCache *imageCache;

@property (nonatomic, readwrite, strong) UIView *view;
@property (nonatomic, strong) NSMutableArray *cells;

@end

@implementation GridLayoutContainerSubController

- (id)initWithController:(ORControllerConfig *)aController imageCache:(ImageCache *)aCache layoutContainer:(LayoutContainer *)aLayoutContainer
{
    self = [super initWithController:aController imageCache:aCache layoutContainer:aLayoutContainer];
    if (self) {
        GridLayoutContainer *container = (GridLayoutContainer *)aLayoutContainer;
        self.view = [[UIView alloc] initWithFrame:CGRectMake(container.left, container.top, container.width, container.height)];
        self.view.backgroundColor = [UIColor clearColor];
        self.cells = [[NSMutableArray alloc] initWithCapacity:[container.cells count]];
        int h = container.height / container.rows;				
        int w = container.width / container.cols;
        for (GridCell *cell in container.cells) {
            Component *aComponent = cell.component;
            ComponentSubController *ctrl;
            ctrl = [[[ComponentSubController subControllerClassForModelObject:aComponent] alloc] initWithController:self.controller imageCache:aCache component:aComponent];
            [self.cells addObject:ctrl];
            ctrl.view.frame = CGRectMake(cell.x * w, cell.y * h, w * cell.colspan, h * cell.rowspan);
            [self.view addSubview:ctrl.view];
        }
    }
    return self;
}


@synthesize view;
@synthesize cells;

@end
