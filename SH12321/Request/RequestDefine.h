//
//  RequestDefine.h
//  MM-Community
//
//  Created by meimi on 16/1/21.
//  Copyright © 2016年 Meime. All rights reserved.
//

#ifndef RequestDefine_h
#define RequestDefine_h

//网络请求时限
#define REQUEST_TIMEOUT     10

// 设备token
#define EQUIPMENT_TOKEN  @"equipmentToken"
// 登录用accessToken
//#define ACCESS_TOKEN  @"accessToken"


// 网络请求表头
#define HTTP_VERSION_KEY      @"VERSION"         //服务端接口版本key
#define HTTP_VERSION_VALUE    @"1.0"             //服务端接口版本value

#define HTTP_DEVICETOKEN_KEY        @"DEVICETOKEN"     //服务端要求必传token key
#define HTTP_DEVICETOKEN_VALUE      [[NSUserDefaults standardUserDefaults] valueForKey:EQUIPMENT_TOKEN]   //服务端要求必传token

#define HTTP_USERTOKEN_KEY    @"USERTOKEN"                      // 登录用accessTokenkey
#define HTTP_USERTOKEN_VALUE  [[NSUserDefaults standardUserDefaults] valueForKey:ACCESSTOKEN_KEY]   // 登录用accessToken




#endif /* RequestDefine_h */
