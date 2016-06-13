//
//  RequestUrl.h
//  MM-Community
//
//  Created by meimi on 16/1/21.
//  Copyright © 2016年 Meime. All rights reserved.
//

#ifndef RequestUrl_h
#define RequestUrl_h

//测试
#define PORT_GETARTICLELIST @"article/getArticleList"

// URL
// 美秘测试API地址
//static NSString * const MM_COMMUNITY_APP_API = @"http://api.jason.orz.meimi.me/";
//static NSString * const MM_COMMUNITY_APP_API = @"http://api.orz.meimi.me/";
static NSString * const MM_COMMUNITY_APP_API = @"http://api.romic.orz.meimi.me/";

#pragma mark  - 获取服务端token请求
/*************************获取服务端请求端口***************************/

#pragma mark ---  获取服务端请求token
static NSString * const PORT_DEVICE_CLIENT_INSTALL_TOKEN = @"Client/install";

#pragma mark ---  获取最新版本信息
static NSString * const PORT_TOOLS_SUITE = @"Tools/suite";

#pragma mark ---  获取最新版本信息
static NSString * const PORT_VERSION_CHECKVERSION = @"Version/checkVersion";

#pragma mark ---  验证码---获取验证码
static NSString * const PORT_PASSPORT_GETVERIFICATIONCODE = @"Passport/getVerificationCode";

#pragma mark ---  验证码---获取国家区域代码
static NSString * const PORT_PASSPORT_GETCOUNTRYPHONECODE = @"Passport/getCountryPhoneCode";

#pragma mark ---  上传---获取上传语音或者图片地址
static NSString * const PORT_PASSPORT_GETUPLOADTOKEN = @"upload/getUpToken";

#pragma mark ---  上传---获取上传多个图片地址
static NSString * const PORT_PASSPORT_GETMULTIPLEUPLOADTOKEN = @"upload/getMultipleUpToken";

#pragma mark ---  搜索---热门搜索
static NSString * const PORT_SEARCH_HOT = @"search/hot";

#pragma mark ---  搜索---搜索
static NSString * const PORT_SEARCH_SEARCH = @"search/search";

#pragma mark ---  搜索---搜索圈子
static NSString * const PORT_SEARCH_CLUBWITHSTATUS = @"search/searchClubWithStatus";

#pragma mark ---  首页---首页列表
static NSString * const PORT_INDEX_LIST = @"index/getList";

#pragma mark ---  帖子---获取帖子详情
static NSString * const PORT_BLOG_INFO = @"blog/getBlogInfo";

#pragma mark ---  博文---发表博文
static NSString * const PORT_BLOG_PUBLISH = @"blog/publish";









#endif /* RequestUrl_h */
