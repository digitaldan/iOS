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
#import "Image.h"
#import "Definition.h"
#import "SensorState.h"
#import "Definition.h"
#import "Sensor.h"

@implementation Image

- (id)initWithId:(int)anId src:(NSString *)srcValue style:(NSString *)styleValue
{
    self = [super init];
    if (self) {
        self.componentId = anId;
        self.src = srcValue;
        self.style = styleValue;
    }
    return self;
}

- (int)sensorId
{
    return self.sensor.sensorId;
    /*
     TODO: does not handle the linked label feature, see when sensorId method can be removed alltogether
     
    int sid = self.sensor.sensorId;
    return (sid > 0)?sid:self.label.sensorId;
     */
}

@synthesize src, style, label;

@end