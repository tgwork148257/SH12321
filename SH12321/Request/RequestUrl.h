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

#pragma mark ---  评论---发表评论
static NSString * const PORT_COMMENT_ADDCOMMENT = @"comment/addComment";

#pragma mark ---  博文---点赞博文
static NSString * const PORT_BLOG_PRAISE  = @"blog/praise";

#pragma mark ---  博文---取消点赞博文
static NSString * const PORT_BLOG_CANCEL_PRAISE  = @"blog/cancelPraise";

#pragma mark ---  博文---收藏博文
static NSString * const PORT_BLOG_COLLECT  = @"blog/collect";

#pragma mark ---  博文---取消收藏博文
static NSString * const PORT_BLOG_CANCEL_COLLECT  = @"blog/cancelCollect";

#pragma mark ---  博文---分享博文
static NSString * const PORT_BLOG_SHARE  = @"blog/share";

#pragma mark ---  博文---获取点赞列表
static NSString * const PORT_BLOG_GETPRAISEUSERLIST  = @"blog/getPraiseUserList";

#pragma mark ---  圈子---加入圈子
static NSString * const PORT_CLUB_JOINCLUB = @"club/joinClub";

#pragma mark ---  话题---关注话题
static NSString * const TOP_ATTRNTIONTOPIC = @"topic/attentionTopic";

#pragma mark ---  评论---评论点赞
static NSString * const PORT_COMMENT_PRAISE = @"comment/praise";

#pragma mark ---  评论---评论取消点赞
static NSString * const PORT_CANCEL_COMMENT_PRAISE = @"comment/praise";

#pragma mark ---  评论---取消评论点赞
static NSString * const PORT_COMMENT_CANCLE_PRAISE = @"comment/cancelPraise";

#pragma mark ---  评论---删除评论
static NSString * const PORT_COMMENT_DELETE_COMMENT = @"comment/deleteComment";

#pragma mark ---  圈子---帖子列表
static NSString * const PORT_CLUB_GETBLOGLIST = @"club/getBlogList";

#pragma mark ---  用户---我加入的圈子
static NSString * const PORT_USER_GETMYJOINCLUB = @"user/getUserJoinClub";

#pragma mark ---  用户---获取发布帖子圈子接口
static NSString * const PORT_USER_GETPUBLISHSELECTCLUB = @"club/getClubListOrderByJoinStatus";

#pragma mark ---  用户---热门的圈子
static NSString * const PORT_CLUB_GETHOTCLUB = @"club/getHotClub";

#pragma mark ---  帖子---推荐帖子
static NSString * const PORT_CLUB_GETRECOMMENDEDCLUB = @"club/getRecommendBlog";

#pragma mark ---  圈子---圈子首页的热门帖子
static NSString * const PORT_CLUB_GETHOTBLOG = @"club/getHotBlog";

#pragma mark ---  圈子---所有的圈子
static NSString * const PORT_CLUB_GETCLUBLIST = @"club/getClubList";

#pragma mark ---  圈子---所有的圈子
static NSString * const PORT_CLUB_GETINDEXBLOG = @"club/clubIndexBlog";

#pragma mark ---  圈子---圈子详情
static NSString * const PORT_CLUB_GETCLUBINFO = @"club/getClubInfo";

#pragma mark ---  话题---话题详情
static NSString * const TOP_TOPINFO = @"topic/getTopicInfo";

#pragma mark ---  账号---获取授权码
static NSString * const PORT_PASSPORT_AUTHORIZEBYPHONE = @"passport/authorizeByPhone";

#pragma mark ---  账号---根据code获取用户token
static NSString * const PORT_PASSPORT_ACCESSTOKEN = @"passport/accessToken";

#pragma mark ---  博文---获取用户发布过的博文
static NSString * const PORT_USER_SENDBLOG = @"club/getBlogByUser";

#pragma mark ---  博文---获取用户评论过的博文
static NSString * const PORT_USER_COMMENTBOLG = @"club/getUserCommentBolg";

#pragma mark ---  博文---获取用户收藏的博文
static NSString * const PORT_USER_MY_COLLECTBLOG = @"club/getMyCollect";

#pragma mark ---  用户---获取用户加入的圈子
static NSString * const PORT_USER_JOIN_CLUB = @"User/getUserJoinClub";

#pragma mark ---  用户---获取用户个人资料
static NSString * const PORT_USER_MY_INFO = @"User/getMyUserInfo";

#pragma mark ---  用户---通过用户ID获取用户资料
static NSString * const PORT_USER_USERID_INFO = @"User/getUserInfoByUserId";

#pragma mark ---  搜索---搜索用户
static NSString * const PORT_SEARCH_SEARCHUSER = @"search/searchUser";

#pragma mark ---  搜索---搜索圈子
static NSString * const PORT_SEARCH_SEARCHClUB = @"search/searchClub";

#pragma mark ---  搜索---搜索帖子
static NSString * const PORT_SEARCH_SEARCHBLOG = @"search/searchBlog";

#pragma mark ---  搜索---搜索商品
static NSString * const PORT_SEARCH_SEARCHPRODUCT = @"search/searchProduct";

#pragma mark ---  搜索---搜索计划
static NSString * const PORT_SEARCH_SEARCHPLAN = @"search/searchPlan";

#pragma mark ---  消息---获取系统消息
static NSString * const PORT_MESSAGE_SYSTEMMESSAGELIST = @"message/getSystemMessageList";

#pragma mark ---  消息---获取点赞消息
static NSString * const PORT_MESSAGE_PRAISEMESSAGELIST = @"message/getPraiseMessageList";

#pragma mark ---  消息---获取点赞消息
static NSString * const PORT_MESSAGE_COMMENTMESSAGELIST = @"message/getCommentMessageList";

#pragma mark ---  消息---设置一条系统消息为已读
static NSString * const PORT_MESSAGE_READSYSTEMMESSAGE = @"message/readSystemMessage";

#pragma mark ---  消息---设置所有消息为已读
static NSString * const PORT_MESSAGE_READSYSTEMMESSAGEALL = @"message/readSystemMessageAll";

#pragma mark ---  消息---设置一条点赞消息为已读
static NSString * const PORT_MESSAGE_READPRAISEMESSAGE = @"message/readPraiseMessage";

#pragma mark ---  消息---设置所有点赞消息为已读
static NSString * const PORT_MESSAGE_READPRAISEMESSAGEALL = @"message/readPraiseMessageAll";

#pragma mark ---  消息---设置一条评论消息为已读
static NSString * const PORT_MESSAGE_READCOMMENTMESSAGE = @"message/readCommentMessage";

#pragma mark ---  消息---设置所有评论消息为已读
static NSString * const PORT_MESSAGE_READCOMMENTMESSAGEALL = @"message/readCommentMessageAll";

#pragma mark ---  消息---获取所有未读消息数量
static NSString * const PORT_MESSAGE_NEWMESSAGENUMBER = @"message/getNewMessageNumber";

#pragma mark ---  举报---获取举报类型列表
static NSString * const PORT_COMPLAINT_COMPLAINTTYPELIST = @"complaint/getComplaintTypeList";

#pragma mark ---  举报---举报
static NSString * const PORT_COMPLAINT_COMPLAINT = @"complaint/complaint";

#pragma mark ---  圈子---获取圈子用户列表
static NSString * const PORT_CLUB_GETCLUBUSERLIST = @"club/getClubUserList";

#pragma mark ---  评论---获取最新的评论列表
static NSString * const PORT_COMMENT_GETCOMMENTLISTNEW = @"comment/getCommentListNew";

#pragma mark ---  评论---获取最新的评论列表
static NSString * const PORT_COMMENT_GETCOMMENTLISTHISTORY = @"comment/getCommentListHISTORY";

#pragma mark ---  用户---保存用户昵称
static NSString * const PORT_USER_SVEUSERNAME = @"User/saveUserName";

#pragma mark ---  用户---保存用户昵称
static NSString * const PORT_PASSPORT_COUNTRYPHONECODE = @"Passport/getCountryPhoneCode";

#pragma mark ---  商品---获取品牌
static NSString * const PORT_BRAND_GETBRANDLIST = @"Product/getBrandList";

#pragma mark ---  商品---获取商品
static NSString * const PORT_BRAND_GETGOODSLIST = @"Product/getProductList";

#pragma mark ---  圈子---获取圈子分类列表
static NSString * const PORT_CLUB_GETCLUBCATEGORYLIST = @"Club/getClubCategoryList";

#pragma mark ---  圈子---创建圈子
static NSString * const PORT_CLUB_CREATECLUB = @"Club/createClub";

#pragma mark ---  圈子---我创建的圈子列表user/getUserJoinClub
static NSString * const PORT_CLUB_GETMYCLUBLIST = @"Club/getMyClubList";

#pragma mark ---  圈子---我关注的圈子列表
static NSString * const PORT_CLUB_GETUSERJOINCLUB = @"user/getUserJoinClub";

#pragma mark ---  圈子---全部圈子列表
static NSString * const PORT_CLUB_GETALLCLUBLIST = @"Club/getAllClubList";

#pragma mark ---  圈子---我的圈子列表
static NSString * const PORT_BRANDS_MYLIST = @"Product/getMyBrandList";

#pragma mark ---  圈子---全部圈子列表
static NSString * const PORT_BRANDS_RECOMMENDEDLIST = @"Product/getHotBrandList";

#pragma mark ---  博文---获取图片标签
static NSString * const PORT_BLOG_GETPICTAGLIST = @"blog/getPictureTagList";

#pragma mark - 圈子---下拉获取圈子首页最新数据
static NSString * const PORT_CLUB_CLUBINDEXBLOGNEW = @"club/clubIndexBlogNew";

#pragma mark - 帖子---删除帖子
static NSString * const PORT_BLOG_DELETEBLOG = @"blog/deleteBlog";

#pragma mark - 圈子---退出圈子
static NSString * const PORT_CLUB_CANCELJOINCLUB = @"club/cancelJoin";

#pragma mark - 圈子----朋友圈获取最新的帖子列表
static NSString * const PORT_CLUB_GetBLOGLISTNEW = @"club/getBlogListNew";

/***************************
 *计划部分
 ***************************/
#pragma mark - 计划 --- 获取计划详情
static NSString * const PORT_PLAN_GETPLANINFO = @"plan/getPlanInfo";

#pragma mark - 计划 --- 获取计划分类
static NSString * const PORT_PLAN_GETPLANCATEGORYLIST = @"plan/getPlanCategoryList";

#pragma mark - 计划 --- 获取计划列表
static NSString * const PORT_PLAN_GETPLANLIST = @"plan/getPlanList";

#pragma mark - 计划 --- 获取用户加入计划数量
static NSString * const PORT_PLAN_GETUSERPLANCOUNT = @"plan/getUserPlanCount";

#pragma mark - 计划---我加入的计划
static NSString * const PORT_PLAN_MYPLAN = @"plan/myPlan";

#pragma mark - 计划 --- 用户加入计划
static NSString * const PORT_PLAN_JOINPLAN = @"plan/joinPlan";

#pragma mark - 计划 --- 获取勋章列表
static NSString * const PORT_PLAN_GETMEDALLIST = @"plan/myMedal";

#pragma mark - 计划 --- 完成计划的步骤
static NSString * const PORT_PLAN_COMPLETEDPLANSTEP = @"plan/checkPlanItem";

#pragma mark - 计划 --- 获取加入计划的用户列表
static NSString * const PORT_PLAN_GETPLANUSERLIST = @"plan/getPlanUser";

#pragma mark - 计划 --- 获取推荐计划
static NSString * const PORT_PLAN_GETRECOMMENDEDPLAN = @"plan/recommendPlan";

#pragma mark - 计划 --- 获取计划的每一天详情
static NSString * const PORT_PLAN_GETPLANSTEPDETAIL = @"plan/getPlanItemList";

#pragma mark - 计划 --- 获取一个月的日历列表
static NSString * const PORT_PLAN_GETPLANMONTHLIST = @"plan/getPlanItemListMonth";

#pragma mark - 计划 --- 获取当天的计划列表
static NSString * const PORT_PLAN_GETPLANDAYLIST = @"plan/getPlanItemDay";

#pragma mark - 计划 --- 修改计划设置时间
static NSString * const PORT_PLAN_UPDATESETTINGTIME = @"plan/updatePlan";

#pragma mark - 计划 --- 退出计划
static NSString * const PORT_PLAN_CANCELPLAN = @"plan/cancelPlan";

#pragma mark - 计划 --- 获取计划评论帖子
static NSString * const PORT_PLAN_COMMENTPOST = @"plan/getPlanLinkBlog";

#pragma mark - 分享 --- 获取计划分享内容
static NSString * const SHARE_SHAREQUESTION = @"ShareQuestion/getShareQuestionList";

#pragma mark ---  首页---获取首页每天推荐
static NSString * const PLAN_DAILY_RECOMMEND_BLOG = @"club/getRecommendBlogOneDay";

#pragma mark ---  首页---获取首页关注和签到活动
static NSString * const INDEX_GET_BANNER_LIST = @"index/getBannerList";

#pragma mark ---  发现---获取发现话题列表
static NSString * const TOPIC_GET_TOPIC_LIST = @"topic/getTopicList";




#pragma mark ---  用户---保存用户昵称
static NSString * const PORT_USER_SVEUSERSIGNATRUE = @"User/saveUserSignature";
#pragma mark ---  用户---获取保存头像的七牛token
static NSString * const PORT_USER_HEADERIMAGETOKEN = @"User/getHeaderImageToken";
#pragma mark ---  用户---获取保存用户背景token
static NSString * const PORT_USER_BGIMAGETOKEN = @"User/getBackgroundImageToken";
#pragma mark ---  账号---设置个人资料背景
static NSString * const PORT_USER_SETBACKGROUND = @"User/setBackground";
#pragma mark ---  用户---设置用户头像
static NSString * const PORT_USER_USERHEAD = @"User/setUserHead";
#pragma mark ---  账号---绑定手机
static NSString * const PORT_USER_BINDPHONE = @"Passport/bindPhone";
#pragma mark ---  账号---获取授权code
static NSString * const PORT_PASSPORT_AUTHORIZE = @"Passport/authorize";
#pragma mark ---  用户---检查用户名是否填写
static NSString * const PORT_USER_CHECKUSERNAME = @"User/checkUserName";
#pragma mark ---  用户---关注用户
static NSString * const PORT_USER_CONCERNUSER = @"User/concernUser";
#pragma mark ---  用户---取消关注用户
static NSString * const PORT_USER_CANCELCONCERNUSER = @"User/cancelConcernUser";
#pragma mark ---  用户---关注用户
static NSString * const PORT_CLUB_BLOGLISTBYPRODUCTID = @"club/getBlogListByProductId";
#pragma mark ---  账号---第三方登陆
static NSString * const PORT_PASSPORT_REGISTERCONNECT = @"Passport/loginConnect";
#pragma mark ---  账号---解除第三方绑定
static NSString * const PORT_PASSPORT_REMOVEBIND = @"Passport/removeBind";
#pragma mark ---  账号---绑定第三方账号
static NSString * const PORT_PASSPORT_BINDCONNECT = @"Passport/bindConnect";
#pragma mark ---  商品---收藏商品
static NSString * const PORT_PRODUCT_COLLECT = @"product/collect";
#pragma mark ---  商品---取消收藏商品
static NSString * const PORT_BLOG_CANCELCOLLECT = @"blog/cancelCollect";
#pragma mark ---  圈子---设置圈子描述
static NSString * const PORT_CLUB_CLUBDESC = @"club/setClubDesc";
#pragma mark ---  圈子---设置圈子背景
static NSString * const PORT_CLUB_CLUBBACKGROUND = @"club/setClubBackground";
#pragma mark ---  用户---获取用户关注的用户
static NSString * const USER_MYCONCERNUSER = @"User/getMyConcernUser";
#pragma mark ---  用户---获取关注我的用户（粉丝）
static NSString * const USER_MYFANSUSER = @"User/getFansList";
#pragma mark ---  消息---我的消息
static NSString * const MESSAGE_BLOGMESSAGE = @"message/getBlogMessage";
#pragma mark ---  消息---我的蜕变
static NSString * const MESSAGE_PLANMESSAGE = @"message/getPlanMessage";
#pragma mark ---  消息---系统消息
static NSString * const MESSAGE_NOTTICELIST = @"message/getNoticelist";
#pragma mark ---  消息---系统消息个数
static NSString * const MESSAGE_BLOGMESSAGE_COUNT  = @"message/getNoticeCount";
#pragma mark ---  幻灯片---获取幻灯片列表
static NSString * const SLIDE_SLIDELISY = @"slide/getSlideList";
#pragma mark ---  用户---获取一组用户信息
static NSString * const USER_USERLISTBYIDS = @"User/getUserListByIds";
#pragma mark ---  计划---获取计划用户排行榜
static NSString * const PLAN_GETPLANUSERLIST_RANK = @"plan/getPlanUserRank";
#pragma mark ---  话题---话题列表
static NSString * const TOPOC_TOPICLIST = @"topic/getTopicList";
#pragma mark ---  计划---获取计划用户排行榜
static NSString * const PLAN_COMPLETETODAY = @"plan/completeTodayPlanUser";
#pragma mark ---  话题---话题列表
static NSString * const TOPOC_MYATTENTIONTOPLIST = @"topic/getMyAttentionTopicList";


#endif /* RequestUrl_h */
