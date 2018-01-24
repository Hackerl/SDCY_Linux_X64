local Role_info = {}

function Role_info.talent_des()
    TFNLJS={};
    TFNLJS["胡斐"]="Ｇ【天赋：魂系一刀】ＨＷ胡家刀招式发动率大幅提升，增加三招胡刀秘传技ＰＧ【称号：雪山飞狐】ＨＷ集气速度增加十点"
    TFNLJS["程灵素"]="Ｇ【称号：毒手药仙】ＨＷ用毒上限五百，攻击时敌全体中毒二十点"
    TFNLJS["田归农"]="Ｇ【称号：天龙掌门】ＨＷ亲手杀掉苗人凤，攻，防，轻各增长二十点，雷震剑法换为苗剑一级"
    TFNLJS["阎基"]="Ｇ【称号：雁过拨毛】ＨＷ击退敌人获得银两"
    TFNLJS["狄云"]="Ｇ【天赋：赤心连城】ＨＷ攻击效果受主角品德影响，越高加成越多ＰＧ【称号：真名神照】ＨＷ神照功满血复活，复活后立即行动"
    TFNLJS["花铁干"]="Ｇ【称号：中平神枪】ＨＷ中平枪法攻击额外追加杀集气能力"       
     
    TFNLJS["萧峰"]="Ｇ【天赋：奋英雄怒】ＨＷ暴击机率百分之百；二连击机率百分之六十ＰＧ【称号：狂龙天征】ＨＷ降龙十八掌极意发动率百分之百"                        
    TFNLJS["虚竹"]="Ｇ【天赋：福缘深厚】ＨＷ攻击后百分之五十机率从集气槽五分之一处开始集气ＰＧ【称号：逍遥掌门】ＨＷ使用天山六阳掌一定机率打出生死符，大幅杀集气"                        
    TFNLJS["段誉"]="Ｇ【天赋：磊落仁心】ＨＷ无视资质对内力上限的影响ＰＧ【称号：六脉真传】ＨＷ六脉神剑大招发动率百分之六十"                  
    TFNLJS["慕容复"]="Ｇ【天赋：离合参商】ＨＷ斗转发动机率大幅提升ＰＧ【称号：姑苏慕容】ＨＷ斗转星移耗内力值减少"
    TFNLJS["王语嫣"]="Ｇ【天赋：博闻强记】ＨＷ无视任何限制条件修炼任何秘籍ＰＧ【称号：琅嬛仙子】ＨＷ提升队伍武常及队伍特效发动机率"     
    TFNLJS["鸠摩智"]="Ｇ【称号：大轮明王】ＨＷ使用火焰刀攻击时使对手附加受伤三十点"                                
    TFNLJS["游坦之"]="Ｇ【天赋：心无所住】ＨＷ能使用任意内功攻击ＰＧ【称号：冰毒怪客】ＨＷ所有攻击带毒兩百四十点"  
    TFNLJS["阿紫"]="Ｇ【称号：铁丑之主】ＨＷ与游坦之同在战场时，游坦之攻击必暴击"                          
    TFNLJS["岳老三"]="Ｇ【称号：凶神恶煞】ＨＷ暴击时伤害效果两倍"
    TFNLJS["薛慕华"]="Ｇ【称号：阎王敌】ＨＷ医疗上限五百点　复活同伴一次"
     
    TFNLJS["郭靖"]="Ｇ【天赋：大器晚成】ＨＷ最后五级成长时，每级能力加成点数增加五点ＰＧ【称号：侠之大者】ＨＷ降龙十八掌极意发动率百分之三十"  
    TFNLJS["黄蓉"]="Ｇ【天赋：兰心慧质】ＨＷ修炼秘籍成功时兵器值成长两倍ＰＧ【称号：奇术无双】ＨＷ战前可进行布阵"
                     
    TFNLJS["周伯通"]="Ｇ【天赋：童真永留】ＨＷ左右互搏必发动ＰＧ【称号：顽童武痴】ＨＷ每行动一次攻击效果提升百分之十"
    TFNLJS["黄药师"]="Ｇ【称号：桃花岛主】ＨＷ攻击时敌全体内力减少一千，如内力不足时，内力变为零，再减生命一百"
    TFNLJS["欧阳峰"]="Ｇ【天赋：倒行逆施】ＨＷ被攻击必定进入走火入魔状态ＰＧ【称号：西毒】ＨＷ攻击时无视对方抗毒能力追加三十点中毒"
    TFNLJS["洪七公"]="Ｇ【称号：北丐】ＨＷ降龙十八掌极意发动率百分之五十"
    TFNLJS["梅超风"]="Ｇ【称号：铁尸魔煞】ＨＷ九阴白骨爪威力两倍"
    TFNLJS["苏荃"]="Ｇ【天赋：媚眼如丝】ＨＷ敌全体攻击效果降百分之十"
    TFNLJS["阿珂"]="Ｇ【天赋：倾国倾城】ＨＷ敌全体防御效果降百分之十"
    TFNLJS["令狐冲"]="Ｇ【天赋：灵奇洒脱】ＨＷ自带能力限界突破，战斗中移动力提升三格ＰＧ【称号：九剑传人】ＨＷ进入战斗立即行动"
    TFNLJS["东方不败"]="Ｇ【称号：唯我不败】ＨＷ二连击机率百分之百；三连击机率百分之六十"
    TFNLJS["任盈盈"]="Ｇ【天赋：琴铮盈盈】ＨＷ使用扶瑶琴攻击时机率发动七弦无琴剑气：敌全体减生命一百点ＰＧ【称号：日月圣姑】ＨＷ与令狐冲在战场时使用扶瑶琴攻击机率发动笑傲江湖：两人体力受伤全回复"
    TFNLJS["蓝凤凰"]="Ｇ【称号：五毒教主】ＨＷ攻击威力提升百分之十；用毒上限四百点"
    TFNLJS["林平之"]="Ｇ【称号：辟邪剑客】ＨＷ不受自宫的惩罚影响；学习葵花神功后领悟葵花移行；葵花神功可攻击"
    TFNLJS["岳灵姗"]="Ｇ【称号：慧中灵剑】ＨＷ每修习一种剑法并且等级达到极之后，自身攻击伤害效果提升百分之五"
    TFNLJS["田伯光"]="Ｇ【称号：万里独行】ＨＷ集气速度提升，战场上已方人员越少提升越多"
    TFNLJS["平一指"]="Ｇ【称号：杀人名医】ＨＷ医疗上限五百点　战斗中集气速度随杀敌数上升"
    TFNLJS["陈家洛"]="Ｇ【称号：天池红花】ＨＷ升级时兵器值高成长"
    TFNLJS["霍青桐"]="Ｇ【天赋：巾帼之才】ＨＷ我方全体防御效果上升百分之十ＰＧ【称号：翠羽黄衫】ＨＷ使用三分剑术攻击杀敌体力十五点"
    TFNLJS["张召重"]="Ｇ【天赋：勇猛精进】ＨＷ我方全体攻击效果上升百分之十ＰＧ【称号：火手判官】ＨＷ攻击时使对手受伤程度翻倍"
    TFNLJS["杨过"]="Ｇ【天赋：逆流勇进】ＨＷ生命百分之五十以下暴击率两倍；百分之二十五以下暴击率三倍ＰＧ【称号：西狂】ＨＷ攻击时追加西狂之怒啸，敌全员集气减一百"
    TFNLJS["小龙女"]="Ｇ【天赋：冷剑冰霜】ＨＷ左右发动机率上升ＰＧ【称号：联心素女】ＨＷ以玉女素心剑攻击必定连击"
    TFNLJS["程英"]="Ｇ【天赋：外和内刚】ＨＷ生命百分之五十以下伤害上升百分之二十ＰＧ【称号：青萧落瑛】ＨＷ使用玉萧剑法攻击杀敌内力三百点"
    TFNLJS["金轮法王"]="Ｇ【称号：元蒙帝师】ＨＷ任何攻击大幅追加杀集气能力"
    TFNLJS["霍都"]="Ｇ【称号：吾乃蛮夷】ＨＷ任何攻击追加杀集气能力"
    TFNLJS["石破天"]="Ｇ【天赋：质朴刚健】ＨＷ个人特效发动率增加十点ＰＧ【称号：白首太玄】ＨＷ太玄神功提升特效发动机率效果为两倍"
    TFNLJS["贝海石"]="Ｇ【称号：老谋深算】ＨＷ每次受到攻击自动回血五十点，医疗上限四百点"
    TFNLJS["张无忌"]="Ｇ【天赋：谁与争峰】ＨＷ内功加力及护体发动机率百分之百ＰＧ【称号：九阳明尊】ＨＷ发动乾坤大挪移时反弹伤害百分之八十；或受到攻击以九阳神功反震攻击者百分之二十伤害"
    TFNLJS["宋青书"]="Ｇ【天赋：我为伊狂】ＨＷ战场上我方女性角色越多其攻击效果越高Ｐ"
    TFNLJS["小昭"]="Ｇ【称号：波斯圣女】ＨＷ敌全体移动减三格"
    TFNLJS["朱九真"]="Ｇ【称号：灵獒毒娇】ＨＷ在战场上低机率发现食材"
    TFNLJS["王难姑"]="Ｇ【称号：毒手姑婆】ＨＷ用毒上限四百点"
    TFNLJS["胡青牛"]="Ｇ【称号：蝶谷医仙】ＨＷ医疗上限五百点　药品效果上升　可向队友用药"
    TFNLJS["袁承志"]="Ｇ【天赋：志垂日月】ＨＷ自动恢复内伤ＰＧ【称号：气侠风雷】ＨＷ暴击率提升百分之三十"
    TFNLJS["温青青"]="Ｇ【称号：青青子衿】ＨＷ使用雷震剑法攻击随机一至三倍威力"
    TFNLJS["何铁手"]="Ｇ【称号：铁袖拂风】ＨＷ攻击威力提升百分之十；用毒上限四百点"
    TFNLJS["萧中慧"]="Ｇ【称号：鸳鸯刀客】ＨＷ使用夫妻刀法攻击必暴击"
    TFNLJS["祖千秋"]="Ｇ【称号：酒神】ＨＷ被攻击时机率发动酒神秘踪步，闪躲攻击"
    TFNLJS["人厨子"]="Ｇ【称号：食神】ＨＷ攻击不减体力"
    return TFNLJS
end

return Role_info
