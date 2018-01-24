function SetGlobal()   --设置游戏内部使用的全程变量   
   JY={};

   JY.Status=0--GAME_INIT;  --游戏当前状态
   --JY.IN=GAME_INIT
   --保存R×数据
   JY.Base={};           --基本数据
   JY.PersonNum=0;      --人物个数
   JY.Person={};        --人物数据
   JY.ThingNum=0        --物品数量
   JY.Thing={};         --物品数据
   JY.SceneNum=0        --物品数量
   JY.Scene={};         --物品数据
   JY.WugongNum=0        --物品数量
   JY.Wugong={};         --物品数据
   JY.ShopNum=0        --商店数量
   JY.Shop={};         --商店数据
         
   JY.Data_Base=nil;     --实际保存R*数据
   JY.Data_Person=nil;
   JY.Data_Thing=nil;
   JY.Data_Scene=nil;
   JY.Data_Wugong=nil;
   JY.Data_Shop=nil;
   
   CC.SBL_Base={};
   CC.SBL_Person={};
   CC.SBL_Thing={};
   CC.SBL_Scene={};
   CC.SBL_Wugong={};
   CC.SBL_Shop={};

   JY.MyCurrentPic=0;       --主角当前走路贴图在贴图文件中偏移
   JY.MyPic=0;              --主角当前贴图
   JY.MyTick=0;             --主角没有走路的持续帧数
   JY.MyTick2=0;            --显示事件动画的节拍
   JY.CDD=0;
   JY.LOADTIME=0;
   JY.SAVETIME=0;
   JY.GTIME=0;
   JY.JB=1;
   JY.GOLD=0;  
   JY.WGLVXS=0; 
   JY.MY=0  
   JY.ZJSL=0  
   
   JY.XZSPD=1 
   JY.MV=0 
   JY.MAPKJ=0 
   JY.HEADXZ=1 
   JY.SZJPJC={}; 
   JY.LEQ=CC.T1[1]..CC.T1[4]..CC.T1[6]
   JY.SQ=CC.T1[7]..CC.T1[2]..CC.T1[5]..CC.T1[3]  
   JY.XYK=CC.T1[10]..CC.T1[8]..CC.T1[9]   
  
   JY.EnterSceneXY=nil;     --保存进入场景的坐标，有值可以进入，为nil则重新计算。

   JY.oldMMapX=-1;          --上次显示主地图的坐标。用来判断是否需要全部重绘屏幕
   JY.oldMMapY=-1;
   JY.oldMMapPic=-1;        --上次显示主地图主角贴图

   JY.SubScene=-1;          --当前子场景编号
   JY.SubSceneX=0;          --子场景显示位置偏移，场景移动指令使用
   JY.SubSceneY=0;

   JY.Darkness=0;             --=0 屏幕正常显示，=1 不显示，屏幕全黑

   JY.CurrentD=-1;          --当前调用D*的编号
   JY.OldDPass=-1;          --上次触发路过事件的D*编号, 避免多次触发
   JY.CurrentEventType=-1   --当前触发事件的方式 1 空格 2 物品 3 路过

   JY.oldSMapX=-1;          --上次显示场景地图的坐标。用来判断是否需要全部重绘屏幕
   JY.oldSMapY=-1;
   JY.oldSMapXoff=-1;       --上次场景偏移
   JY.oldSMapYoff=-1;
   JY.oldSMapPic=-1;        --上次显示场景地图主角贴图

   JY.D_Valid=nil           --记录当前场景有效的D的编号，提高速度，不用每次显示都计算了。若为nil则重新计算
   JY_D_Valld_Num=0;        --当前场景有效的D个数

   JY.D_PicChange={}        --记录事件动画改变，以计算Clip
   JY.NumD_PicChange=0;     --事件动画改变的个数

   JY.CurrentThing=-1;      --当前选择物品，触发事件使用

   JY.MmapMusic=-1;         --切换大地图音乐，返回主地图时，如果设置，则播放此音乐

   JY.CurrentMIDI=-1;       --当前播放的音乐id，用来在关闭音乐时保存音乐id。
   JY.EnableMusic=1;        --是否播放音乐 1 播放，0 不播放
   JY.EnableSound=1;        --是否播放音效 1 播放，0 不播放
   JY.TF=0;

   JY.ThingUseFunction={};          --物品使用时调用函数，SetModify函数使用，增加新类型的物品
   JY.SceneNewEventFunction={};     --调用场景事件函数，SetModify函数使用，定义使用新场景事件触发的函数
   
   
   WAR={};     --战斗使用的全程变量。。这里占个位置，因为程序后面不允许定义全局变量了。具体内容在WarSetGlobal函数中
   AutoMoveTab={[0]=0}
   Bright={}
   CC.Light=200
   CC.Sight=120
   --setBright(light,sight) 
   --WAR.LT=light
   --WAR.ST=sight 
end
