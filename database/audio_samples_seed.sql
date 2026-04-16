USE hainan_dialect_platform;

CREATE TABLE IF NOT EXISTS audio_samples (
  id BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  sample_key VARCHAR(100) NOT NULL,
  file_name VARCHAR(255) NOT NULL,
  file_path VARCHAR(255) NOT NULL,
  transcript_text VARCHAR(255) NOT NULL,
  translated_text VARCHAR(255) NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY uk_audio_samples_sample_key (sample_key),
  UNIQUE KEY uk_audio_samples_file_name (file_name),
  INDEX idx_audio_samples_created_at (created_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '1_pingguo', '1_pingguo.wav', 'dataset_cleaned/wav/1_pingguo.wav', '苹果', '苹果'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '1_pingguo'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '2_xiangjiao', '2_xiangjiao.wav', 'dataset_cleaned/wav/2_xiangjiao.wav', '香蕉', '香蕉'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '2_xiangjiao'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '3_gua', '3_gua.wav', 'dataset_cleaned/wav/3_gua.wav', '瓜', '瓜'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '3_gua'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '4_ju', '4_ju.wav', 'dataset_cleaned/wav/4_ju.wav', '桔', '桔'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '4_ju'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '5_li', '5_li.wav', 'dataset_cleaned/wav/5_li.wav', '梨', '梨'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '5_li'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '6_boluo', '6_boluo.wav', 'dataset_cleaned/wav/6_boluo.wav', '菠萝', '菠萝'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '6_boluo'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '7_putao', '7_putao.wav', 'dataset_cleaned/wav/7_putao.wav', '葡萄', '葡萄'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '7_putao'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '8_ningmeng', '8_ningmeng.wav', 'dataset_cleaned/wav/8_ningmeng.wav', '柠檬', '柠檬'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '8_ningmeng'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '9_baicai', '9_baicai.wav', 'dataset_cleaned/wav/9_baicai.wav', '白菜', '白菜'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '9_baicai'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '10_mi', '10_mi.wav', 'dataset_cleaned/wav/10_mi.wav', '米', '米'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '10_mi'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '11_mianbao', '11_mianbao.wav', 'dataset_cleaned/wav/11_mianbao.wav', '面包', '面包'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '11_mianbao'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '12_niunai', '12_niunai.wav', 'dataset_cleaned/wav/12_niunai.wav', '牛奶', '牛奶'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '12_niunai'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '13_suannai', '13_suannai.wav', 'dataset_cleaned/wav/13_suannai.wav', '酸奶', '酸奶'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '13_suannai'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '14_kafei', '14_kafei.wav', 'dataset_cleaned/wav/14_kafei.wav', '咖啡', '咖啡'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '14_kafei'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '15_cha', '15_cha.wav', 'dataset_cleaned/wav/15_cha.wav', '茶', '茶'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '15_cha'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '16_bao', '16_bao.wav', 'dataset_cleaned/wav/16_bao.wav', '包', '包'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '16_bao'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '17_fan', '17_fan.wav', 'dataset_cleaned/wav/17_fan.wav', '饭', '饭'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '17_fan'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '18_chaofan', '18_chaofan.wav', 'dataset_cleaned/wav/18_chaofan.wav', '炒饭', '炒饭'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '18_chaofan'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '19_miantiao', '19_miantiao.wav', 'dataset_cleaned/wav/19_miantiao.wav', '面条', '面条'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '19_miantiao'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '20_tang', '20_tang.wav', 'dataset_cleaned/wav/20_tang.wav', '汤', '汤'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '20_tang'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '21_yu', '21_yu.wav', 'dataset_cleaned/wav/21_yu.wav', '鱼', '鱼'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '21_yu'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '22_gou', '22_gou.wav', 'dataset_cleaned/wav/22_gou.wav', '狗', '狗'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '22_gou'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '23_mao', '23_mao.wav', 'dataset_cleaned/wav/23_mao.wav', '猫', '猫'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '23_mao'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '24_niao', '24_niao.wav', 'dataset_cleaned/wav/24_niao.wav', '鸟', '鸟'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '24_niao'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '25_laoshu', '25_laoshu.wav', 'dataset_cleaned/wav/25_laoshu.wav', '老鼠', '老鼠'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '25_laoshu'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '26_niu', '26_niu.wav', 'dataset_cleaned/wav/26_niu.wav', '牛', '牛'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '26_niu'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '27_ma', '27_ma.wav', 'dataset_cleaned/wav/27_ma.wav', '马', '马'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '27_ma'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '28_yang', '28_yang.wav', 'dataset_cleaned/wav/28_yang.wav', '羊', '羊'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '28_yang'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '29_zhu', '29_zhu.wav', 'dataset_cleaned/wav/29_zhu.wav', '猪', '猪'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '29_zhu'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '30_she', '30_she.wav', 'dataset_cleaned/wav/30_she.wav', '蛇', '蛇'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '30_she'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '31_qingwa', '31_qingwa.wav', 'dataset_cleaned/wav/31_qingwa.wav', '蛙', '蛙'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '31_qingwa'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '32_taiyang', '32_taiyang.wav', 'dataset_cleaned/wav/32_taiyang.wav', '太阳', '太阳'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '32_taiyang'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '33_yun', '33_yun.wav', 'dataset_cleaned/wav/33_yun.wav', '云', '云'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '33_yun'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '34_feng', '34_feng.wav', 'dataset_cleaned/wav/34_feng.wav', '风', '风'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '34_feng'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '35_yu', '35_yu.wav', 'dataset_cleaned/wav/35_yu.wav', '雨', '雨'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '35_yu'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '36_xue', '36_xue.wav', 'dataset_cleaned/wav/36_xue.wav', '雪', '雪'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '36_xue'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '37_lei', '37_lei.wav', 'dataset_cleaned/wav/37_lei.wav', '雷', '雷'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '37_lei'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '38_dian', '38_dian.wav', 'dataset_cleaned/wav/38_dian.wav', '电', '电'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '38_dian'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '39_shenshui', '39_shenshui.wav', 'dataset_cleaned/wav/39_shenshui.wav', '深水', '深水'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '39_shenshui'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '40_qianshui', '40_qianshui.wav', 'dataset_cleaned/wav/40_qianshui.wav', '浅水', '浅水'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '40_qianshui'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '41_caodi', '41_caodi.wav', 'dataset_cleaned/wav/41_caodi.wav', '草地', '草地'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '41_caodi'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '42_diqiu', '42_diqiu.wav', 'dataset_cleaned/wav/42_diqiu.wav', '地球', '地球'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '42_diqiu'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '43_feiji', '43_feiji.wav', 'dataset_cleaned/wav/43_feiji.wav', '飞机', '飞机'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '43_feiji'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '44_huoche', '44_huoche.wav', 'dataset_cleaned/wav/44_huoche.wav', '火车', '火车'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '44_huoche'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '45_qiche', '45_qiche.wav', 'dataset_cleaned/wav/45_qiche.wav', '汽车', '汽车'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '45_qiche'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '46_danche', '46_danche.wav', 'dataset_cleaned/wav/46_danche.wav', '单车', '单车'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '46_danche'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '47_gongjiaoche', '47_gongjiaoche.wav', 'dataset_cleaned/wav/47_gongjiaoche.wav', '公交车', '公交车'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '47_gongjiaoche'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '48_chuan', '48_chuan.wav', 'dataset_cleaned/wav/48_chuan.wav', '船', '船'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '48_chuan'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '49_gaotie', '49_gaotie.wav', 'dataset_cleaned/wav/49_gaotie.wav', '高铁', '高铁'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '49_gaotie'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '50_jiaqi', '50_jiaqi.wav', 'dataset_cleaned/wav/50_jiaqi.wav', '假期', '假期'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '50_jiaqi'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '51_shangban', '51_shangban.wav', 'dataset_cleaned/wav/51_shangban.wav', '上班', '上班'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '51_shangban'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '52_jianshen', '52_jianshen.wav', 'dataset_cleaned/wav/52_jianshen.wav', '健身', '健身'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '52_jianshen'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '53_yundong', '53_yundong.wav', 'dataset_cleaned/wav/53_yundong.wav', '运动', '运动'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '53_yundong'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '54_zuqiu', '54_zuqiu.wav', 'dataset_cleaned/wav/54_zuqiu.wav', '足球', '足球'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '54_zuqiu'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '55_lanqiu', '55_lanqiu.wav', 'dataset_cleaned/wav/55_lanqiu.wav', '篮球', '篮球'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '55_lanqiu'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '56_wangqiu', '56_wangqiu.wav', 'dataset_cleaned/wav/56_wangqiu.wav', '网球', '网球'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '56_wangqiu'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '57_paiqiu', '57_paiqiu.wav', 'dataset_cleaned/wav/57_paiqiu.wav', '排球', '排球'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '57_paiqiu'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '58_youshui', '58_youshui.wav', 'dataset_cleaned/wav/58_youshui.wav', '游水', '游水'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '58_youshui'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '59_pingpangqiu', '59_pingpangqiu.wav', 'dataset_cleaned/wav/59_pingpangqiu.wav', '乒乓球', '乒乓球'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '59_pingpangqiu'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '60_paobu', '60_paobu.wav', 'dataset_cleaned/wav/60_paobu.wav', '跑步', '跑步'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '60_paobu'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '61_xiezi', '61_xiezi.wav', 'dataset_cleaned/wav/61_xiezi.wav', '写字', '写字'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '61_xiezi'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '62_huahua', '62_huahua.wav', 'dataset_cleaned/wav/62_huahua.wav', '画画', '画画'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '62_huahua'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '63_changge', '63_changge.wav', 'dataset_cleaned/wav/63_changge.wav', '唱歌', '唱歌'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '63_changge'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '64_tiaowu', '64_tiaowu.wav', 'dataset_cleaned/wav/64_tiaowu.wav', '跳舞', '跳舞'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '64_tiaowu'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '65_yanxi', '65_yanxi.wav', 'dataset_cleaned/wav/65_yanxi.wav', '演戏', '演戏'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '65_yanxi'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '66_kandianying', '66_kandianying.wav', 'dataset_cleaned/wav/66_kandianying.wav', '看电影', '看电影'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '66_kandianying'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '67_tingge', '67_tingge.wav', 'dataset_cleaned/wav/67_tingge.wav', '听歌', '听歌'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '67_tingge'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '68_dushu', '68_dushu.wav', 'dataset_cleaned/wav/68_dushu.wav', '读书', '读书'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '68_dushu'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '69_dadianhua', '69_dadianhua.wav', 'dataset_cleaned/wav/69_dadianhua.wav', '打电话', '打电话'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '69_dadianhua'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '70_faduanxin', '70_faduanxin.wav', 'dataset_cleaned/wav/70_faduanxin.wav', '发短信', '发短信'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '70_faduanxin'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '71_chi', '71_chi.wav', 'dataset_cleaned/wav/71_chi.wav', '吃', '吃'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '71_chi'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '72_he', '72_he.wav', 'dataset_cleaned/wav/72_he.wav', '喝', '喝'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '72_he'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '73_zou', '73_zou.wav', 'dataset_cleaned/wav/73_zou.wav', '走', '走'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '73_zou'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '74_pao', '74_pao.wav', 'dataset_cleaned/wav/74_pao.wav', '跑', '跑'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '74_pao'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '75_zuo', '75_zuo.wav', 'dataset_cleaned/wav/75_zuo.wav', '坐', '坐'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '75_zuo'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '76_zhan', '76_zhan.wav', 'dataset_cleaned/wav/76_zhan.wav', '站', '站'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '76_zhan'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '77_shui', '77_shui.wav', 'dataset_cleaned/wav/77_shui.wav', '睡', '睡'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '77_shui'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '78_shuixing', '78_shuixing.wav', 'dataset_cleaned/wav/78_shuixing.wav', '睡醒', '睡醒'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '78_shuixing'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '79_shangke', '79_shangke.wav', 'dataset_cleaned/wav/79_shangke.wav', '上课', '上课'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '79_shangke'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '80_shangban', '80_shangban.wav', 'dataset_cleaned/wav/80_shangban.wav', '上班', '上班'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '80_shangban'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '81_gongzuo', '81_gongzuo.wav', 'dataset_cleaned/wav/81_gongzuo.wav', '工作', '工作'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '81_gongzuo'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '82_wan', '82_wan.wav', 'dataset_cleaned/wav/82_wan.wav', '玩', '玩'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '82_wan'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '83_kan', '83_kan.wav', 'dataset_cleaned/wav/83_kan.wav', '看', '看'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '83_kan'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '84_ting', '84_ting.wav', 'dataset_cleaned/wav/84_ting.wav', '听', '听'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '84_ting'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '85_shuo', '85_shuo.wav', 'dataset_cleaned/wav/85_shuo.wav', '说', '说'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '85_shuo'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '86_tiao', '86_tiao.wav', 'dataset_cleaned/wav/86_tiao.wav', '跳', '跳'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '86_tiao'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '87_pa', '87_pa.wav', 'dataset_cleaned/wav/87_pa.wav', '爬', '爬'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '87_pa'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '88_jiang', '88_jiang.wav', 'dataset_cleaned/wav/88_jiang.wav', '讲', '讲'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '88_jiang'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '89_xiao', '89_xiao.wav', 'dataset_cleaned/wav/89_xiao.wav', '笑', '笑'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '89_xiao'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '90_ku', '90_ku.wav', 'dataset_cleaned/wav/90_ku.wav', '哭', '哭'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '90_ku'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '91_da', '91_da.wav', 'dataset_cleaned/wav/91_da.wav', '打', '打'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '91_da'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '92_saodi', '92_saodi.wav', 'dataset_cleaned/wav/92_saodi.wav', '扫地', '扫地'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '92_saodi'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '93_xiya', '93_xiya.wav', 'dataset_cleaned/wav/93_xiya.wav', '洗牙', '洗牙'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '93_xiya'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '94_xizao', '94_xizao.wav', 'dataset_cleaned/wav/94_xizao.wav', '洗澡', '洗澡'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '94_xizao'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '95_xiyifu', '95_xiyifu.wav', 'dataset_cleaned/wav/95_xiyifu.wav', '穿衣服', '穿衣服'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '95_xiyifu'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '96_paizhao', '96_paizhao.wav', 'dataset_cleaned/wav/96_paizhao.wav', '拍照', '拍照'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '96_paizhao'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '97_dazi', '97_dazi.wav', 'dataset_cleaned/wav/97_dazi.wav', '打字', '打字'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '97_dazi'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '98_xiezi', '98_xiezi.wav', 'dataset_cleaned/wav/98_xiezi.wav', '写字', '写字'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '98_xiezi'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '99_qiecai', '99_qiecai.wav', 'dataset_cleaned/wav/99_qiecai.wav', '切菜', '切菜'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '99_qiecai'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '100_shuawan', '100_shuawan.wav', 'dataset_cleaned/wav/100_shuawan.wav', '刷碗', '刷碗'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '100_shuawan'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '101_qingli', '101_qingli.wav', 'dataset_cleaned/wav/101_qingli.wav', '清理', '清理'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '101_qingli'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '102_guangjie', '102_guangjie.wav', 'dataset_cleaned/wav/102_guangjie.wav', '逛街', '逛街'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '102_guangjie'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '103_mai', '103_mai.wav', 'dataset_cleaned/wav/103_mai.wav', '买', '买'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '103_mai'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '104_mai_', '104_mai_.wav', 'dataset_cleaned/wav/104_mai_.wav', '卖', '卖'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '104_mai_'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '105_gei', '105_gei.wav', 'dataset_cleaned/wav/105_gei.wav', '给', '给'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '105_gei'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '106_n', '106_n.wav', 'dataset_cleaned/wav/106_n.wav', '拿', '拿'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '106_n'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '107_song', '107_song.wav', 'dataset_cleaned/wav/107_song.wav', '送', '送'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '107_song'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '108_bang', '108_bang.wav', 'dataset_cleaned/wav/108_bang.wav', '帮', '帮'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '108_bang'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '109_jiao', '109_jiao.wav', 'dataset_cleaned/wav/109_jiao.wav', '教', '教'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '109_jiao'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '110_xue', '110_xue.wav', 'dataset_cleaned/wav/110_xue.wav', '学', '学'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '110_xue'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '111_kanshu', '111_kanshu.wav', 'dataset_cleaned/wav/111_kanshu.wav', '看书', '看书'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '111_kanshu'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '112_shuohu', '112_shuohu.wav', 'dataset_cleaned/wav/112_shuohu.wav', '说话', '说话'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '112_shuohu'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '113_wan', '113_wan.wav', 'dataset_cleaned/wav/113_wan.wav', '玩', '玩'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '113_wan'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '114_wangji', '114_wangji.wav', 'dataset_cleaned/wav/114_wangji.wav', '忘记', '忘记'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '114_wangji'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '115_jide', '115_jide.wav', 'dataset_cleaned/wav/115_jide.wav', '记得', '记得'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '115_jide'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '116_hao', '116_hao.wav', 'dataset_cleaned/wav/116_hao.wav', '好', '好'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '116_hao'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '117_huai', '117_huai.wav', 'dataset_cleaned/wav/117_huai.wav', '坏', '坏'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '117_huai'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '118_haokan', '118_haokan.wav', 'dataset_cleaned/wav/118_haokan.wav', '好看', '好看'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '118_haokan'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '119_nankan', '119_nankan.wav', 'dataset_cleaned/wav/119_nankan.wav', '难看', '难看'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '119_nankan'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '120_kuai', '120_kuai.wav', 'dataset_cleaned/wav/120_kuai.wav', '快', '快'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '120_kuai'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '121_man', '121_man.wav', 'dataset_cleaned/wav/121_man.wav', '慢', '慢'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '121_man'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '122_gao', '122_gao.wav', 'dataset_cleaned/wav/122_gao.wav', '高', '高'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '122_gao'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '123_di', '123_di.wav', 'dataset_cleaned/wav/123_di.wav', '低', '低'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '123_di'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '124_d', '124_d.wav', 'dataset_cleaned/wav/124_d.wav', '大', '大'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '124_d'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '125_xiao', '125_xiao.wav', 'dataset_cleaned/wav/125_xiao.wav', '小', '小'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '125_xiao'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '126_duo', '126_duo.wav', 'dataset_cleaned/wav/126_duo.wav', '多', '多'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '126_duo'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '127_shao', '127_shao.wav', 'dataset_cleaned/wav/127_shao.wav', '少', '少'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '127_shao'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '128_re', '128_re.wav', 'dataset_cleaned/wav/128_re.wav', '热', '热'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '128_re'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '129_leng', '129_leng.wav', 'dataset_cleaned/wav/129_leng.wav', '冷', '冷'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '129_leng'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '130_nuan', '130_nuan.wav', 'dataset_cleaned/wav/130_nuan.wav', '暖', '暖'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '130_nuan'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '131_liang', '131_liang.wav', 'dataset_cleaned/wav/131_liang.wav', '凉', '凉'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '131_liang'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '132_liang', '132_liang.wav', 'dataset_cleaned/wav/132_liang.wav', '亮', '亮'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '132_liang'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '133_hei', '133_hei.wav', 'dataset_cleaned/wav/133_hei.wav', '黑', '黑'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '133_hei'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '134_qing', '134_qing.wav', 'dataset_cleaned/wav/134_qing.wav', '清', '清'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '134_qing'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '135_mohu', '135_mohu.wav', 'dataset_cleaned/wav/135_mohu.wav', '模糊', '模糊'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '135_mohu'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '136_qing', '136_qing.wav', 'dataset_cleaned/wav/136_qing.wav', '轻', '轻'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '136_qing'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '137_zhong', '137_zhong.wav', 'dataset_cleaned/wav/137_zhong.wav', '重', '重'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '137_zhong'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '138_duan', '138_duan.wav', 'dataset_cleaned/wav/138_duan.wav', '短', '短'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '138_duan'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '139_chang', '139_chang.wav', 'dataset_cleaned/wav/139_chang.wav', '长', '长'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '139_chang'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '140_qiang', '140_qiang.wav', 'dataset_cleaned/wav/140_qiang.wav', '强', '强'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '140_qiang'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '141_rui', '141_rui.wav', 'dataset_cleaned/wav/141_rui.wav', '弱', '弱'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '141_rui'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '142_ganjing', '142_ganjing.wav', 'dataset_cleaned/wav/142_ganjing.wav', '干净', '干净'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '142_ganjing'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '143_angzang', '143_angzang.wav', 'dataset_cleaned/wav/143_angzang.wav', '肮脏', '肮脏'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '143_angzang'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '144_nan', '144_nan.wav', 'dataset_cleaned/wav/144_nan.wav', '难', '难'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '144_nan'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '145_rongyi', '145_rongyi.wav', 'dataset_cleaned/wav/145_rongyi.wav', '容易', '容易'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '145_rongyi'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '146_gaoxing', '146_gaoxing.wav', 'dataset_cleaned/wav/146_gaoxing.wav', '高兴', '高兴'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '146_gaoxing'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '147_nanshou', '147_nanshou.wav', 'dataset_cleaned/wav/147_nanshou.wav', '难受', '难受'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '147_nanshou'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '148_lei', '148_lei.wav', 'dataset_cleaned/wav/148_lei.wav', '累', '累'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '148_lei'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '149_youjingshentou', '149_youjingshentou.wav', 'dataset_cleaned/wav/149_youjingshentou.wav', '有精神头', '有精神头'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '149_youjingshentou'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '150_congming', '150_congming.wav', 'dataset_cleaned/wav/150_congming.wav', '聪明', '聪明'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '150_congming'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '151_ben', '151_ben.wav', 'dataset_cleaned/wav/151_ben.wav', '笨', '笨'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '151_ben'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '152_youqian', '152_youqian.wav', 'dataset_cleaned/wav/152_youqian.wav', '有钱', '有钱'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '152_youqian'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '153_qiong', '153_qiong.wav', 'dataset_cleaned/wav/153_qiong.wav', '穷', '穷'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '153_qiong'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '154_kuaile', '154_kuaile.wav', 'dataset_cleaned/wav/154_kuaile.wav', '快乐', '快乐'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '154_kuaile'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '155_shengqi', '155_shengqi.wav', 'dataset_cleaned/wav/155_shengqi.wav', '生气', '生气'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '155_shengqi'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '156_wenrou', '156_wenrou.wav', 'dataset_cleaned/wav/156_wenrou.wav', '温柔', '温柔'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '156_wenrou'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '157_lihai', '157_lihai.wav', 'dataset_cleaned/wav/157_lihai.wav', '厉害', '厉害'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '157_lihai'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '158_danxiao', '158_danxiao.wav', 'dataset_cleaned/wav/158_danxiao.wav', '胆小', '胆小'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '158_danxiao'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '159_xiaodiansheng', '159_xiaodiansheng.wav', 'dataset_cleaned/wav/159_xiaodiansheng.wav', '小点声', '小点声'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '159_xiaodiansheng'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '160_chaonao', '160_chaonao.wav', 'dataset_cleaned/wav/160_chaonao.wav', '吵闹', '吵闹'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '160_chaonao'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '161_manyi', '161_manyi.wav', 'dataset_cleaned/wav/161_manyi.wav', '满意', '满意'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '161_manyi'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '162_buman', '162_buman.wav', 'dataset_cleaned/wav/162_buman.wav', '不满', '不满'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '162_buman'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '163_kuai', '163_kuai.wav', 'dataset_cleaned/wav/163_kuai.wav', '快', '快'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '163_kuai'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '164_man', '164_man.wav', 'dataset_cleaned/wav/164_man.wav', '慢', '慢'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '164_man'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '165_hen', '165_hen.wav', 'dataset_cleaned/wav/165_hen.wav', '很', '很'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '165_hen'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '166_bu', '166_bu.wav', 'dataset_cleaned/wav/166_bu.wav', '不', '不'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '166_bu'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '167_yizhi', '167_yizhi.wav', 'dataset_cleaned/wav/167_yizhi.wav', '一直', '一直'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '167_yizhi'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '168_jiujiulaiyici', '168_jiujiulaiyici.wav', 'dataset_cleaned/wav/168_jiujiulaiyici.wav', '久久来一次', '久久来一次'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '168_jiujiulaiyici'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '169_jingchang', '169_jingchang.wav', 'dataset_cleaned/wav/169_jingchang.wav', '经常', '经常'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '169_jingchang'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '170_zongshi', '170_zongshi.wav', 'dataset_cleaned/wav/170_zongshi.wav', '总是', '总是'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '170_zongshi'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '171_youshi', '171_youshi.wav', 'dataset_cleaned/wav/171_youshi.wav', '有时', '有时'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '171_youshi'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '172_congbu', '172_congbu.wav', 'dataset_cleaned/wav/172_congbu.wav', '从不', '从不'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '172_congbu'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '173_xianzai', '173_xianzai.wav', 'dataset_cleaned/wav/173_xianzai.wav', '现在', '现在'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '173_xianzai'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '174_houmian', '174_houmian.wav', 'dataset_cleaned/wav/174_houmian.wav', '后面', '后面'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '174_houmian'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '175_yijing', '175_yijing.wav', 'dataset_cleaned/wav/175_yijing.wav', '已经', '已经'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '175_yijing'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '176_hai', '176_hai.wav', 'dataset_cleaned/wav/176_hai.wav', '还', '还'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '176_hai'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '177_xian', '177_xian.wav', 'dataset_cleaned/wav/177_xian.wav', '先', '先'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '177_xian'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '178_hou', '178_hou.wav', 'dataset_cleaned/wav/178_hou.wav', '后', '后'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '178_hou'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '179_geng', '179_geng.wav', 'dataset_cleaned/wav/179_geng.wav', '更', '更'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '179_geng'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '180_zui', '180_zui.wav', 'dataset_cleaned/wav/180_zui.wav', '最', '最'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '180_zui'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '181_jianglai', '181_jianglai.wav', 'dataset_cleaned/wav/181_jianglai.wav', '将来', '将来'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '181_jianglai'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '182_zaoshang', '182_zaoshang.wav', 'dataset_cleaned/wav/182_zaoshang.wav', '早上', '早上'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '182_zaoshang'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '183_wanshang', '183_wanshang.wav', 'dataset_cleaned/wav/183_wanshang.wav', '晚上', '晚上'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '183_wanshang'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '184_dagai', '184_dagai.wav', 'dataset_cleaned/wav/184_dagai.wav', '大概', '大概'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '184_dagai'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '185_zhende', '185_zhende.wav', 'dataset_cleaned/wav/185_zhende.wav', '真的', '真的'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '185_zhende'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '186_zhengoujia', '186_zhengoujia.wav', 'dataset_cleaned/wav/186_zhengoujia.wav', '真够假', '真够假'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '186_zhengoujia'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '187_keneng', '187_keneng.wav', 'dataset_cleaned/wav/187_keneng.wav', '可能', '可能'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '187_keneng'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '188_kending', '188_kending.wav', 'dataset_cleaned/wav/188_kending.wav', '肯定', '肯定'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '188_kending'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '189_qingsong', '189_qingsong.wav', 'dataset_cleaned/wav/189_qingsong.wav', '轻松', '轻松'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '189_qingsong'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '190_turan', '190_turan.wav', 'dataset_cleaned/wav/190_turan.wav', '突然', '突然'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '190_turan'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '191_zhengchang', '191_zhengchang.wav', 'dataset_cleaned/wav/191_zhengchang.wav', '正常', '正常'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '191_zhengchang'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '192_kuaidian', '192_kuaidian.wav', 'dataset_cleaned/wav/192_kuaidian.wav', '快点', '快点'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '192_kuaidian'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '193_youdian', '193_youdian.wav', 'dataset_cleaned/wav/193_youdian.wav', '有点', '有点'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '193_youdian'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '194_yiding', '194_yiding.wav', 'dataset_cleaned/wav/194_yiding.wav', '一定', '一定'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '194_yiding'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '195_meici', '195_meici.wav', 'dataset_cleaned/wav/195_meici.wav', '每次', '每次'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '195_meici'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '196_zongshi', '196_zongshi.wav', 'dataset_cleaned/wav/196_zongshi.wav', '总是', '总是'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '196_zongshi'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '197_buguo', '197_buguo.wav', 'dataset_cleaned/wav/197_buguo.wav', '不过', '不过'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '197_buguo'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '198_buzhi', '198_buzhi.wav', 'dataset_cleaned/wav/198_buzhi.wav', '不止', '不止'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '198_buzhi'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '199_henduo', '199_henduo.wav', 'dataset_cleaned/wav/199_henduo.wav', '很多', '很多'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '199_henduo'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '200_henshao', '200_henshao.wav', 'dataset_cleaned/wav/200_henshao.wav', '很少', '很少'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '200_henshao'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '201_duoduo', '201_duoduo.wav', 'dataset_cleaned/wav/201_duoduo.wav', '多多', '多多'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '201_duoduo'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '202_yixia', '202_yixia.wav', 'dataset_cleaned/wav/202_yixia.wav', '一下', '一下'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '202_yixia'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '203_zhenzhi', '203_zhenzhi.wav', 'dataset_cleaned/wav/203_zhenzhi.wav', '甚至', '甚至'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '203_zhenzhi'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '204_shishishang', '204_shishishang.wav', 'dataset_cleaned/wav/204_shishishang.wav', '事实上', '事实上'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '204_shishishang'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '205_qita', '205_qita.wav', 'dataset_cleaned/wav/205_qita.wav', '其他', '其他'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '205_qita'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '206_zaimouzhongchengdushang', '206_zaimouzhongchengdushang.wav', 'dataset_cleaned/wav/206_zaimouzhongchengdushang.wav', '在某种程度上', '在某种程度上'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '206_zaimouzhongchengdushang'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '207_ji', '207_ji.wav', 'dataset_cleaned/wav/207_ji.wav', '极', '极'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '207_ji'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '208_gengjia', '208_gengjia.wav', 'dataset_cleaned/wav/208_gengjia.wav', '更加', '更加'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '208_gengjia'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '209_feichang', '209_feichang.wav', 'dataset_cleaned/wav/209_feichang.wav', '非常', '非常'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '209_feichang'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '210_wo', '210_wo.wav', 'dataset_cleaned/wav/210_wo.wav', '我', '我'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '210_wo'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '211_ni', '211_ni.wav', 'dataset_cleaned/wav/211_ni.wav', '你', '你'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '211_ni'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '212_shui', '212_shui.wav', 'dataset_cleaned/wav/212_shui.wav', '谁', '谁'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '212_shui'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '213_shenme', '213_shenme.wav', 'dataset_cleaned/wav/213_shenme.wav', '什么', '什么'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '213_shenme'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '214_nage', '214_nage.wav', 'dataset_cleaned/wav/214_nage.wav', '哪个', '哪个'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '214_nage'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '215_meige', '215_meige.wav', 'dataset_cleaned/wav/215_meige.wav', '每个', '每个'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '215_meige'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '216_yidian', '216_yidian.wav', 'dataset_cleaned/wav/216_yidian.wav', '一点', '一点'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '216_yidian'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '217_suoyou', '217_suoyou.wav', 'dataset_cleaned/wav/217_suoyou.wav', '所有', '所有'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '217_suoyou'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '218_shuidoushi', '218_shuidoushi.wav', 'dataset_cleaned/wav/218_shuidoushi.wav', '谁都是', '谁都是'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '218_shuidoushi'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '219_ziji', '219_ziji.wav', 'dataset_cleaned/wav/219_ziji.wav', '自己', '自己'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '219_ziji'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '220_zhe', '220_zhe.wav', 'dataset_cleaned/wav/220_zhe.wav', '这', '这'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '220_zhe'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '221_na', '221_na.wav', 'dataset_cleaned/wav/221_na.wav', '那', '那'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '221_na'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '222_zheli', '222_zheli.wav', 'dataset_cleaned/wav/222_zheli.wav', '这里', '这里'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '222_zheli'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '223_nali', '223_nali.wav', 'dataset_cleaned/wav/223_nali.wav', '那里', '那里'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '223_nali'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '224_limian', '224_limian.wav', 'dataset_cleaned/wav/224_limian.wav', '里面', '里面'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '224_limian'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '225_waimian', '225_waimian.wav', 'dataset_cleaned/wav/225_waimian.wav', '外面', '外面'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '225_waimian'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '226_shangmian', '226_shangmian.wav', 'dataset_cleaned/wav/226_shangmian.wav', '上面', '上面'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '226_shangmian'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '227_xiamian', '227_xiamian.wav', 'dataset_cleaned/wav/227_xiamian.wav', '下面', '下面'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '227_xiamian'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '229_qianmian', '229_qianmian.wav', 'dataset_cleaned/wav/229_qianmian.wav', '前面', '前面'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '229_qianmian'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '230_houmian', '230_houmian.wav', 'dataset_cleaned/wav/230_houmian.wav', '后面', '后面'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '230_houmian'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '231_henduo', '231_henduo.wav', 'dataset_cleaned/wav/231_henduo.wav', '很多', '很多'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '231_henduo'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '232_buguan', '232_buguan.wav', 'dataset_cleaned/wav/232_buguan.wav', '不管', '不管'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '232_buguan'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '233_heshi', '233_heshi.wav', 'dataset_cleaned/wav/233_heshi.wav', '何时', '何时'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '233_heshi'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '234_shenmeshihou', '234_shenmeshihou.wav', 'dataset_cleaned/wav/234_shenmeshihou.wav', '什么时候', '什么时候'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '234_shenmeshihou'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '235_renhedifang', '235_renhedifang.wav', 'dataset_cleaned/wav/235_renhedifang.wav', '任何地方', '任何地方'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '235_renhedifang'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '236_qita', '236_qita.wav', 'dataset_cleaned/wav/236_qita.wav', '其他', '其他'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '236_qita'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '237_qitaren', '237_qitaren.wav', 'dataset_cleaned/wav/237_qitaren.wav', '其他人', '其他人'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '237_qitaren'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '238_meiyou', '238_meiyou.wav', 'dataset_cleaned/wav/238_meiyou.wav', '没有', '没有'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '238_meiyou'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '239_quanbu', '239_quanbu.wav', 'dataset_cleaned/wav/239_quanbu.wav', '全部', '全部'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '239_quanbu'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '240_buguannage', '240_buguannage.wav', 'dataset_cleaned/wav/240_buguannage.wav', '不管哪个', '不管哪个'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '240_buguannage'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '241_quanbudoushi', '241_quanbudoushi.wav', 'dataset_cleaned/wav/241_quanbudoushi.wav', '全部都是', '全部都是'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '241_quanbudoushi'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '242_youdian', '242_youdian.wav', 'dataset_cleaned/wav/242_youdian.wav', '有点', '有点'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '242_youdian'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '243_shengxia', '243_shengxia.wav', 'dataset_cleaned/wav/243_shengxia.wav', '剩下', '剩下'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '243_shengxia'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '244_niziji', '244_niziji.wav', 'dataset_cleaned/wav/244_niziji.wav', '你自己', '你自己'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '244_niziji'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '245_woziji', '245_woziji.wav', 'dataset_cleaned/wav/245_woziji.wav', '我自己', '我自己'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '245_woziji'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '246_butong', '246_butong.wav', 'dataset_cleaned/wav/246_butong.wav', '不同', '不同'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '246_butong'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '247_tongyang', '247_tongyang.wav', 'dataset_cleaned/wav/247_tongyang.wav', '同样', '同样'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '247_tongyang'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '248_yiyang', '248_yiyang.wav', 'dataset_cleaned/wav/248_yiyang.wav', '一样', '一样'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '248_yiyang'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '249_nihaoma', '249_nihaoma.wav', 'dataset_cleaned/wav/249_nihaoma.wav', '你好吗', '你好吗'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '249_nihaoma'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '250_zenmeyang', '250_zenmeyang.wav', 'dataset_cleaned/wav/250_zenmeyang.wav', '怎么样', '怎么样'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '250_zenmeyang'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '251_shenmeshi', '251_shenmeshi.wav', 'dataset_cleaned/wav/251_shenmeshi.wav', '什么事', '什么事'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '251_shenmeshi'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '252_zainali', '252_zainali.wav', 'dataset_cleaned/wav/252_zainali.wav', '在哪里', '在哪里'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '252_zainali'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '253_shenmeshihou', '253_shenmeshihou.wav', 'dataset_cleaned/wav/253_shenmeshihou.wav', '什么时候', '什么时候'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '253_shenmeshihou'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '254_weishenme', '254_weishenme.wav', 'dataset_cleaned/wav/254_weishenme.wav', '为什么', '为什么'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '254_weishenme'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '255_zenmeban', '255_zenmeban.wav', 'dataset_cleaned/wav/255_zenmeban.wav', '怎么办', '怎么办'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '255_zenmeban'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '256_duoshao', '256_duoshao.wav', 'dataset_cleaned/wav/256_duoshao.wav', '多少', '多少'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '256_duoshao'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '257_keyima', '257_keyima.wav', 'dataset_cleaned/wav/257_keyima.wav', '可以吗', '可以吗'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '257_keyima'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '258_dangran', '258_dangran.wav', 'dataset_cleaned/wav/258_dangran.wav', '当然', '当然'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '258_dangran'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '259_qingwen', '259_qingwen.wav', 'dataset_cleaned/wav/259_qingwen.wav', '请问', '请问'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '259_qingwen'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '260_nihao', '260_nihao.wav', 'dataset_cleaned/wav/260_nihao.wav', '你好', '你好'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '260_nihao'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '261_ganxie', '261_ganxie.wav', 'dataset_cleaned/wav/261_ganxie.wav', '感谢', '感谢'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '261_ganxie'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '262_duibuqi', '262_duibuqi.wav', 'dataset_cleaned/wav/262_duibuqi.wav', '对不起', '对不起'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '262_duibuqi'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '263_meishenmeshi', '263_meishenmeshi.wav', 'dataset_cleaned/wav/263_meishenmeshi.wav', '没什么事', '没什么事'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '263_meishenmeshi'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '264_shide', '264_shide.wav', 'dataset_cleaned/wav/264_shide.wav', '是的', '是的'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '264_shide'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '265_bushi', '265_bushi.wav', 'dataset_cleaned/wav/265_bushi.wav', '不是', '不是'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '265_bushi'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '266_meiwenti', '266_meiwenti.wav', 'dataset_cleaned/wav/266_meiwenti.wav', '没问题', '没问题'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '266_meiwenti'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '267_weishenmebu', '267_weishenmebu.wav', 'dataset_cleaned/wav/267_weishenmebu.wav', '为什么不', '为什么不'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '267_weishenmebu'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '268_haode', '268_haode.wav', 'dataset_cleaned/wav/268_haode.wav', '好的', '好的'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '268_haode'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '269_meishi', '269_meishi.wav', 'dataset_cleaned/wav/269_meishi.wav', '没事', '没事'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '269_meishi'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '270_buyonga', '270_buyonga.wav', 'dataset_cleaned/wav/270_buyonga.wav', '不用啊', '不用啊'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '270_buyonga'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '271_meivuanxi', '271_meivuanxi.wav', 'dataset_cleaned/wav/271_meivuanxi.wav', '没关系', '没关系'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '271_meivuanxi'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '272_qing', '272_qing.wav', 'dataset_cleaned/wav/272_qing.wav', '请', '请'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '272_qing'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '273_bangwona', '273_bangwona.wav', 'dataset_cleaned/wav/273_bangwona.wav', '帮我拿', '帮我拿'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '273_bangwona'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '274_mafanni', '274_mafanni.wav', 'dataset_cleaned/wav/274_mafanni.wav', '麻烦你', '麻烦你'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '274_mafanni'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '275_woxiang', '275_woxiang.wav', 'dataset_cleaned/wav/275_woxiang.wav', '我想', '我想'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '275_woxiang'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '276_woyao', '276_woyao.wav', 'dataset_cleaned/wav/276_woyao.wav', '我要', '我要'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '276_woyao'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '277_nizhidaoma', '277_nizhidaoma.wav', 'dataset_cleaned/wav/277_nizhidaoma.wav', '你知道吗', '你知道吗'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '277_nizhidaoma'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '278_nikeyizuoma', '278_nikeyizuoma.wav', 'dataset_cleaned/wav/278_nikeyizuoma.wav', '你可以做吗', '你可以做吗'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '278_nikeyizuoma'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '279_rangwolai', '279_rangwolai.wav', 'dataset_cleaned/wav/279_rangwolai.wav', '让我来', '让我来'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '279_rangwolai'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '280_yiding', '280_yiding.wav', 'dataset_cleaned/wav/280_yiding.wav', '一定', '一定'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '280_yiding'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '281_wobumingbai', '281_wobumingbai.wav', 'dataset_cleaned/wav/281_wobumingbai.wav', '我不明白', '我不明白'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '281_wobumingbai'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '282_mingbaile', '282_mingbaile.wav', 'dataset_cleaned/wav/282_mingbaile.wav', '明白了', '明白了'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '282_mingbaile'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '283_shiwozhidao', '283_shiwozhidao.wav', 'dataset_cleaned/wav/283_shiwozhidao.wav', '是我知道', '是我知道'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '283_shiwozhidao'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '284_buzhidao', '284_buzhidao.wav', 'dataset_cleaned/wav/284_buzhidao.wav', '不知道', '不知道'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '284_buzhidao'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '285_bieshuole', '285_bieshuole.wav', 'dataset_cleaned/wav/285_bieshuole.wav', '别说了', '别说了'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '285_bieshuole'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '286_tingwoshuo', '286_tingwoshuo.wav', 'dataset_cleaned/wav/286_tingwoshuo.wav', '听我说', '听我说'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '286_tingwoshuo'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '287_zhidaole', '287_zhidaole.wav', 'dataset_cleaned/wav/287_zhidaole.wav', '知道了', '知道了'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '287_zhidaole'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '288_shuohua', '288_shuohua.wav', 'dataset_cleaned/wav/288_shuohua.wav', '说话', '说话'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '288_shuohua'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '289_fashengleshenme', '289_fashengleshenme.wav', 'dataset_cleaned/wav/289_fashengleshenme.wav', '发生了什么', '发生了什么'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '289_fashengleshenme'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '290_wozhidaole', '290_wozhidaole.wav', 'dataset_cleaned/wav/290_wozhidaole.wav', '我知道了', '我知道了'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '290_wozhidaole'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '291_meishenmeshi', '291_meishenmeshi.wav', 'dataset_cleaned/wav/291_meishenmeshi.wav', '没什么事', '没什么事'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '291_meishenmeshi'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '292_meibanfa', '292_meibanfa.wav', 'dataset_cleaned/wav/292_meibanfa.wav', '没办法', '没办法'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '292_meibanfa'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '293_buxing', '293_buxing.wav', 'dataset_cleaned/wav/293_buxing.wav', '不行', '不行'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '293_buxing'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '294_bushiba', '294_bushiba.wav', 'dataset_cleaned/wav/294_bushiba.wav', '不是吧', '不是吧'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '294_bushiba'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '295_haimei', '295_haimei.wav', 'dataset_cleaned/wav/295_haimei.wav', '还没', '还没'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '295_haimei'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '296_kuaidian', '296_kuaidian.wav', 'dataset_cleaned/wav/296_kuaidian.wav', '快点', '快点'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '296_kuaidian'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '297_mandian', '297_mandian.wav', 'dataset_cleaned/wav/297_mandian.wav', '慢点', '慢点'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '297_mandian'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '301_anjing', '301_anjing.wav', 'dataset_cleaned/wav/301_anjing.wav', '安静', '安静'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '301_anjing'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '302_baoguo', '302_baoguo.wav', 'dataset_cleaned/wav/302_baoguo.wav', '包裹', '包裹'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '302_baoguo'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '303_baobei', '303_baobei.wav', 'dataset_cleaned/wav/303_baobei.wav', '宝贝', '宝贝'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '303_baobei'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '304_bianhua', '304_bianhua.wav', 'dataset_cleaned/wav/304_bianhua.wav', '变化', '变化'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '304_bianhua'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '305_fangbian', '305_fangbian.wav', 'dataset_cleaned/wav/305_fangbian.wav', '方便', '方便'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '305_fangbian'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '306_fenkai', '306_fenkai.wav', 'dataset_cleaned/wav/306_fenkai.wav', '分开', '分开'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '306_fenkai'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '307_gaoxing', '307_gaoxing.wav', 'dataset_cleaned/wav/307_gaoxing.wav', '高兴', '高兴'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '307_gaoxing'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '308_hezuo', '308_hezuo.wav', 'dataset_cleaned/wav/308_hezuo.wav', '合作', '合作'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '308_hezuo'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '309_jiaozuo', '309_jiaozuo.wav', 'dataset_cleaned/wav/309_jiaozuo.wav', '叫做', '叫做'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '309_jiaozuo'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '310_jiancha', '310_jiancha.wav', 'dataset_cleaned/wav/310_jiancha.wav', '检查', '检查'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '310_jiancha'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '311_kongqi', '311_kongqi.wav', 'dataset_cleaned/wav/311_kongqi.wav', '空气', '空气'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '311_kongqi'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '312_liaojie', '312_liaojie.wav', 'dataset_cleaned/wav/312_liaojie.wav', '了解', '了解'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '312_liaojie'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '313_lvcheng', '313_lvcheng.wav', 'dataset_cleaned/wav/313_lvcheng.wav', '旅程', '旅程'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '313_lvcheng'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '314_mengxiang', '314_mengxiang.wav', 'dataset_cleaned/wav/314_mengxiang.wav', '梦想', '梦想'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '314_mengxiang'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '315_liaojie', '315_liaojie.wav', 'dataset_cleaned/wav/315_liaojie.wav', '了解', '了解'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '315_liaojie'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '316_pifu', '316_pifu.wav', 'dataset_cleaned/wav/316_pifu.wav', '皮肤', '皮肤'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '316_pifu'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '317_qianglie', '317_qianglie.wav', 'dataset_cleaned/wav/317_qianglie.wav', '强烈', '强烈'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '317_qianglie'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '318_wanqu', '318_wanqu.wav', 'dataset_cleaned/wav/318_wanqu.wav', '弯曲', '弯曲'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '318_wanqu'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '319_turan', '319_turan.wav', 'dataset_cleaned/wav/319_turan.wav', '突然', '突然'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '319_turan'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '320_wuliao', '320_wuliao.wav', 'dataset_cleaned/wav/320_wuliao.wav', '无聊', '无聊'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '320_wuliao'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '321_waixie', '321_waixie.wav', 'dataset_cleaned/wav/321_waixie.wav', '歪斜', '歪斜'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '321_waixie'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '322_mingliang', '322_mingliang.wav', 'dataset_cleaned/wav/322_mingliang.wav', '明亮', '明亮'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '322_mingliang'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '323_zhengchang', '323_zhengchang.wav', 'dataset_cleaned/wav/323_zhengchang.wav', '正常', '正常'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '323_zhengchang'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '324_yushui', '324_yushui.wav', 'dataset_cleaned/wav/324_yushui.wav', '雨水', '雨水'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '324_yushui'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '325_xingqi', '325_xingqi.wav', 'dataset_cleaned/wav/325_xingqi.wav', '星期', '星期'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '325_xingqi'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '326_kafei', '326_kafei.wav', 'dataset_cleaned/wav/326_kafei.wav', '咖啡', '咖啡'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '326_kafei'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '327_nongtian', '327_nongtian.wav', 'dataset_cleaned/wav/327_nongtian.wav', '农田', '农田'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '327_nongtian'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '328_dianying', '328_dianying.wav', 'dataset_cleaned/wav/328_dianying.wav', '电影', '电影'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '328_dianying'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '329_qiche', '329_qiche.wav', 'dataset_cleaned/wav/329_qiche.wav', '汽车', '汽车'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '329_qiche'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '330_ditie', '330_ditie.wav', 'dataset_cleaned/wav/330_ditie.wav', '地铁', '地铁'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '330_ditie'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '331_heliu', '331_heliu.wav', 'dataset_cleaned/wav/331_heliu.wav', '河流', '河流'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '331_heliu'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '332_xiagu', '332_xiagu.wav', 'dataset_cleaned/wav/332_xiagu.wav', '峡谷', '峡谷'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '332_xiagu'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '333_diannao', '333_diannao.wav', 'dataset_cleaned/wav/333_diannao.wav', '电脑', '电脑'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '333_diannao'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '334_dianhua', '334_dianhua.wav', 'dataset_cleaned/wav/334_dianhua.wav', '电话', '电话'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '334_dianhua'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '335_chashui', '335_chashui.wav', 'dataset_cleaned/wav/335_chashui.wav', '茶水', '茶水'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '335_chashui'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '336_dianshi', '336_dianshi.wav', 'dataset_cleaned/wav/336_dianshi.wav', '电视', '电视'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '336_dianshi'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '337_gongchang', '337_gongchang.wav', 'dataset_cleaned/wav/337_gongchang.wav', '工厂', '工厂'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '337_gongchang'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '338_jihua', '338_jihua.wav', 'dataset_cleaned/wav/338_jihua.wav', '计划', '计划'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '338_jihua'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '339_shouji', '339_shouji.wav', 'dataset_cleaned/wav/339_shouji.wav', '手机', '手机'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '339_shouji'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '340_qianbao', '340_qianbao.wav', 'dataset_cleaned/wav/340_qianbao.wav', '钱包', '钱包'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '340_qianbao'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '341_xingxing', '341_xingxing.wav', 'dataset_cleaned/wav/341_xingxing.wav', '星星', '星星'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '341_xingxing'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '342_shijie', '342_shijie.wav', 'dataset_cleaned/wav/342_shijie.wav', '世界', '世界'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '342_shijie'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '343_taiyang', '343_taiyang.wav', 'dataset_cleaned/wav/343_taiyang.wav', '太阳', '太阳'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '343_taiyang'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '344_jiezou', '344_jiezou.wav', 'dataset_cleaned/wav/344_jiezou.wav', '节奏', '节奏'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '344_jiezou'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '345_tianqi', '345_tianqi.wav', 'dataset_cleaned/wav/345_tianqi.wav', '天气', '天气'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '345_tianqi'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '346_shouzhi', '346_shouzhi.wav', 'dataset_cleaned/wav/346_shouzhi.wav', '手指', '手指'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '346_shouzhi'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '347_fangbian', '347_fangbian.wav', 'dataset_cleaned/wav/347_fangbian.wav', '方便', '方便'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '347_fangbian'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '348_senlin', '348_senlin.wav', 'dataset_cleaned/wav/348_senlin.wav', '森林', '森林'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '348_senlin'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '349_yingxiang', '349_yingxiang.wav', 'dataset_cleaned/wav/349_yingxiang.wav', '影像', '影像'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '349_yingxiang'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '350_taiyang', '350_taiyang.wav', 'dataset_cleaned/wav/350_taiyang.wav', '太阳', '太阳'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '350_taiyang'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '351_lanse', '351_lanse.wav', 'dataset_cleaned/wav/351_lanse.wav', '蓝色', '蓝色'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '351_lanse'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '352_qingwa', '352_qingwa.wav', 'dataset_cleaned/wav/352_qingwa.wav', '青蛙', '青蛙'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '352_qingwa'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '353_shoubiao', '353_shoubiao.wav', 'dataset_cleaned/wav/353_shoubiao.wav', '手表', '手表'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '353_shoubiao'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '354_like', '354_like.wav', 'dataset_cleaned/wav/354_like.wav', '立刻', '立刻'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '354_like'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '355_bangong', '355_bangong.wav', 'dataset_cleaned/wav/355_bangong.wav', '办公', '办公'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '355_bangong'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '356_lvcao', '356_lvcao.wav', 'dataset_cleaned/wav/356_lvcao.wav', '绿草', '绿草'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '356_lvcao'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '357_jiudian', '357_jiudian.wav', 'dataset_cleaned/wav/357_jiudian.wav', '酒店', '酒店'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '357_jiudian'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '358_jiemu', '358_jiemu.wav', 'dataset_cleaned/wav/358_jiemu.wav', '节目', '节目'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '358_jiemu'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '359_benzi', '359_benzi.wav', 'dataset_cleaned/wav/359_benzi.wav', '本子', '本子'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '359_benzi'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '360_lieche', '360_lieche.wav', 'dataset_cleaned/wav/360_lieche.wav', '列车', '列车'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '360_lieche'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '361_mubiao', '361_mubiao.wav', 'dataset_cleaned/wav/361_mubiao.wav', '目标', '目标'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '361_mubiao'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '362_anquan', '362_anquan.wav', 'dataset_cleaned/wav/362_anquan.wav', '安全', '安全'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '362_anquan'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '363_manyi', '363_manyi.wav', 'dataset_cleaned/wav/363_manyi.wav', '满意', '满意'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '363_manyi'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '364_gongzuo', '364_gongzuo.wav', 'dataset_cleaned/wav/364_gongzuo.wav', '工作', '工作'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '364_gongzuo'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '365_shuijiao', '365_shuijiao.wav', 'dataset_cleaned/wav/365_shuijiao.wav', '睡觉', '睡觉'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '365_shuijiao'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '366_zhanli', '366_zhanli.wav', 'dataset_cleaned/wav/366_zhanli.wav', '站立', '站立'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '366_zhanli'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '367_caozuo', '367_caozuo.wav', 'dataset_cleaned/wav/367_caozuo.wav', '操作', '操作'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '367_caozuo'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '368_youxi', '368_youxi.wav', 'dataset_cleaned/wav/368_youxi.wav', '游戏', '游戏'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '368_youxi'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '369_yundong', '369_yundong.wav', 'dataset_cleaned/wav/369_yundong.wav', '运动', '运动'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '369_yundong'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '370_fengjing', '370_fengjing.wav', 'dataset_cleaned/wav/370_fengjing.wav', '风景', '风景'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '370_fengjing'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '371_aiqing', '371_aiqing.wav', 'dataset_cleaned/wav/371_aiqing.wav', '爱情', '爱情'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '371_aiqing'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '372_xuanze', '372_xuanze.wav', 'dataset_cleaned/wav/372_xuanze.wav', '选择', '选择'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '372_xuanze'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '373_sudu', '373_sudu.wav', 'dataset_cleaned/wav/373_sudu.wav', '速度', '速度'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '373_sudu'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '374_feixing', '374_feixing.wav', 'dataset_cleaned/wav/374_feixing.wav', '飞行', '飞行'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '374_feixing'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '375_huoche', '375_huoche.wav', 'dataset_cleaned/wav/375_huoche.wav', '火车', '火车'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '375_huoche'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '376_sudu', '376_sudu.wav', 'dataset_cleaned/wav/376_sudu.wav', '速度', '速度'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '376_sudu'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '377_shiwu', '377_shiwu.wav', 'dataset_cleaned/wav/377_shiwu.wav', '食物', '食物'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '377_shiwu'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '378_gongju', '378_gongju.wav', 'dataset_cleaned/wav/378_gongju.wav', '工具', '工具'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '378_gongju'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '379_kouwei', '379_kouwei.wav', 'dataset_cleaned/wav/379_kouwei.wav', '口味', '口味'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '379_kouwei'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '380_shuzi', '380_shuzi.wav', 'dataset_cleaned/wav/380_shuzi.wav', '数字', '数字'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '380_shuzi'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '381_baise', '381_baise.wav', 'dataset_cleaned/wav/381_baise.wav', '白色', '白色'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '381_baise'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '382_hongse', '382_hongse.wav', 'dataset_cleaned/wav/382_hongse.wav', '红色', '红色'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '382_hongse'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '383_lanse', '383_lanse.wav', 'dataset_cleaned/wav/383_lanse.wav', '蓝色', '蓝色'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '383_lanse'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '384_huangse', '384_huangse.wav', 'dataset_cleaned/wav/384_huangse.wav', '黄色', '黄色'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '384_huangse'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '385_heise', '385_heise.wav', 'dataset_cleaned/wav/385_heise.wav', '黑色', '黑色'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '385_heise'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '386_zhaoji', '386_zhaoji.wav', 'dataset_cleaned/wav/386_zhaoji.wav', '着急', '着急'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '386_zhaoji'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '387_jidong', '387_jidong.wav', 'dataset_cleaned/wav/387_jidong.wav', '激动', '激动'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '387_jidong'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '388_chuangxin', '388_chuangxin.wav', 'dataset_cleaned/wav/388_chuangxin.wav', '创新', '创新'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '388_chuangxin'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '389_yingxiang', '389_yingxiang.wav', 'dataset_cleaned/wav/389_yingxiang.wav', '影响', '影响'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '389_yingxiang'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '390_zhongshi', '390_zhongshi.wav', 'dataset_cleaned/wav/390_zhongshi.wav', '重视', '重视'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '390_zhongshi'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '391_jiandan', '391_jiandan.wav', 'dataset_cleaned/wav/391_jiandan.wav', '简单', '简单'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '391_jiandan'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '392_ganxie', '392_ganxie.wav', 'dataset_cleaned/wav/392_ganxie.wav', '感谢', '感谢'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '392_ganxie'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '393_xiaorong', '393_xiaorong.wav', 'dataset_cleaned/wav/393_xiaorong.wav', '笑容', '笑容'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '393_xiaorong'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '394_kaoxiang', '394_kaoxiang.wav', 'dataset_cleaned/wav/394_kaoxiang.wav', '烤箱', '烤箱'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '394_kaoxiang'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '395_liwu', '395_liwu.wav', 'dataset_cleaned/wav/395_liwu.wav', '礼物', '礼物'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '395_liwu'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '396_anzhuang', '396_anzhuang.wav', 'dataset_cleaned/wav/396_anzhuang.wav', '安装', '安装'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '396_anzhuang'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '397_siji', '397_siji.wav', 'dataset_cleaned/wav/397_siji.wav', '司机', '司机'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '397_siji'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '398_gaofeng', '398_gaofeng.wav', 'dataset_cleaned/wav/398_gaofeng.wav', '高峰', '高峰'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '398_gaofeng'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '399_fangjian', '399_fangjian.wav', 'dataset_cleaned/wav/399_fangjian.wav', '房间', '房间'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '399_fangjian'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '400_yijian', '400_yijian.wav', 'dataset_cleaned/wav/400_yijian.wav', '意见', '意见'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '400_yijian'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '501_xiangmu', '501_xiangmu.wav', 'dataset_cleaned/wav/501_xiangmu.wav', '项目', '项目'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '501_xiangmu'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '502_tiaozheng', '502_tiaozheng.wav', 'dataset_cleaned/wav/502_tiaozheng.wav', '调整', '调整'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '502_tiaozheng'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '503_kaifang', '503_kaifang.wav', 'dataset_cleaned/wav/503_kaifang.wav', '开放', '开放'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '503_kaifang'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '504_youhua', '504_youhua.wav', 'dataset_cleaned/wav/504_youhua.wav', '优化', '优化'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '504_youhua'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '505_waibiao', '505_waibiao.wav', 'dataset_cleaned/wav/505_waibiao.wav', '外表', '外表'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '505_waibiao'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '506_zixin', '506_zixin.wav', 'dataset_cleaned/wav/506_zixin.wav', '自信', '自信'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '506_zixin'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '507_gongneng', '507_gongneng.wav', 'dataset_cleaned/wav/507_gongneng.wav', '功能', '功能'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '507_gongneng'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '508_tedian', '508_tedian.wav', 'dataset_cleaned/wav/508_tedian.wav', '特点', '特点'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '508_tedian'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '509_mubiao', '509_mubiao.wav', 'dataset_cleaned/wav/509_mubiao.wav', '目标', '目标'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '509_mubiao'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '510_guli', '510_guli.wav', 'dataset_cleaned/wav/510_guli.wav', '鼓励', '鼓励'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '510_guli'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '511_caozuo', '511_caozuo.wav', 'dataset_cleaned/wav/511_caozuo.wav', '操作', '操作'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '511_caozuo'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '512_tigong', '512_tigong.wav', 'dataset_cleaned/wav/512_tigong.wav', '提供', '提供'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '512_tigong'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '513_qinggan', '513_qinggan.wav', 'dataset_cleaned/wav/513_qinggan.wav', '情感', '情感'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '513_qinggan'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '514_shichang', '514_shichang.wav', 'dataset_cleaned/wav/514_shichang.wav', '市场', '市场'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '514_shichang'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '515_shencha', '515_shencha.wav', 'dataset_cleaned/wav/515_shencha.wav', '审查', '审查'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '515_shencha'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '516_jihua', '516_jihua.wav', 'dataset_cleaned/wav/516_jihua.wav', '计划', '计划'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '516_jihua'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '517_caokong', '517_caokong.wav', 'dataset_cleaned/wav/517_caokong.wav', '操控', '操控'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '517_caokong'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '518_chengguo', '518_chengguo.wav', 'dataset_cleaned/wav/518_chengguo.wav', '成果', '成果'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '518_chengguo'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '519_texing', '519_texing.wav', 'dataset_cleaned/wav/519_texing.wav', '特性', '特性'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '519_texing'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '520_renyuan', '520_renyuan.wav', 'dataset_cleaned/wav/520_renyuan.wav', '人员', '人员'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '520_renyuan'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '521_kehua', '521_kehua.wav', 'dataset_cleaned/wav/521_kehua.wav', '刻画', '刻画'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '521_kehua'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '522_guandian', '522_guandian.wav', 'dataset_cleaned/wav/522_guandian.wav', '观点', '观点'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '522_guandian'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '523_chanpin', '523_chanpin.wav', 'dataset_cleaned/wav/523_chanpin.wav', '产品', '产品'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '523_chanpin'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '524_cailiao', '524_cailiao.wav', 'dataset_cleaned/wav/524_cailiao.wav', '材料', '材料'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '524_cailiao'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '525_queren', '525_queren.wav', 'dataset_cleaned/wav/525_queren.wav', '确认', '确认'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '525_queren'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '526_shunli', '526_shunli.wav', 'dataset_cleaned/wav/526_shunli.wav', '顺利', '顺利'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '526_shunli'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '527_rensheng', '527_rensheng.wav', 'dataset_cleaned/wav/527_rensheng.wav', '人生', '人生'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '527_rensheng'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '528_renwu', '528_renwu.wav', 'dataset_cleaned/wav/528_renwu.wav', '任务', '任务'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '528_renwu'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '530_shiying', '530_shiying.wav', 'dataset_cleaned/wav/530_shiying.wav', '适应', '适应'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '530_shiying'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '531_fengxian', '531_fengxian.wav', 'dataset_cleaned/wav/531_fengxian.wav', '风险', '风险'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '531_fengxian'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '532_quanli', '532_quanli.wav', 'dataset_cleaned/wav/532_quanli.wav', '权利', '权利'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '532_quanli'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '533_yijian', '533_yijian.wav', 'dataset_cleaned/wav/533_yijian.wav', '意见', '意见'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '533_yijian'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '534_tiqian', '534_tiqian.wav', 'dataset_cleaned/wav/534_tiqian.wav', '提前', '提前'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '534_tiqian'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '535_jingyan', '535_jingyan.wav', 'dataset_cleaned/wav/535_jingyan.wav', '经验', '经验'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '535_jingyan'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '536_guocheng', '536_guocheng.wav', 'dataset_cleaned/wav/536_guocheng.wav', '过程', '过程'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '536_guocheng'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '537_kehu', '537_kehu.wav', 'dataset_cleaned/wav/537_kehu.wav', '客户', '客户'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '537_kehu'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '538_dianzi', '538_dianzi.wav', 'dataset_cleaned/wav/538_dianzi.wav', '电子', '电子'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '538_dianzi'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '539_shipei', '539_shipei.wav', 'dataset_cleaned/wav/539_shipei.wav', '适配', '适配'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '539_shipei'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '540_anpai', '540_anpai.wav', 'dataset_cleaned/wav/540_anpai.wav', '安排', '安排'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '540_anpai'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '541_xuanbu', '541_xuanbu.wav', 'dataset_cleaned/wav/541_xuanbu.wav', '宣布', '宣布'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '541_xuanbu'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '542_fujin', '542_fujin.wav', 'dataset_cleaned/wav/542_fujin.wav', '附近', '附近'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '542_fujin'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '543_lijie', '543_lijie.wav', 'dataset_cleaned/wav/543_lijie.wav', '理解', '理解'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '543_lijie'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '544_reqing', '544_reqing.wav', 'dataset_cleaned/wav/544_reqing.wav', '热情', '热情'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '544_reqing'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '545_renwu', '545_renwu.wav', 'dataset_cleaned/wav/545_renwu.wav', '人物', '人物'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '545_renwu'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '546_kuandu', '546_kuandu.wav', 'dataset_cleaned/wav/546_kuandu.wav', '宽度', '宽度'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '546_kuandu'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '547_fangxing', '547_fangxing.wav', 'dataset_cleaned/wav/547_fangxing.wav', '方形', '方形'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '547_fangxing'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '548_polie', '548_polie.wav', 'dataset_cleaned/wav/548_polie.wav', '破裂', '破裂'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '548_polie'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '549_meiwei', '549_meiwei.wav', 'dataset_cleaned/wav/549_meiwei.wav', '美味', '美味'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '549_meiwei'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '550_fenxi', '550_fenxi.wav', 'dataset_cleaned/wav/550_fenxi.wav', '分析', '分析'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '550_fenxi'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '601_jiaju', '601_jiaju.wav', 'dataset_cleaned/wav/601_jiaju.wav', '家具', '家具'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '601_jiaju'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '602_chuangyi', '602_chuangyi.wav', 'dataset_cleaned/wav/602_chuangyi.wav', '创意', '创意'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '602_chuangyi'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '603_tupian', '603_tupian.wav', 'dataset_cleaned/wav/603_tupian.wav', '图片', '图片'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '603_tupian'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '604_chuangkou', '604_chuangkou.wav', 'dataset_cleaned/wav/604_chuangkou.wav', '窗口', '窗口'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '604_chuangkou'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '605_yanjiu', '605_yanjiu.wav', 'dataset_cleaned/wav/605_yanjiu.wav', '研究', '研究'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '605_yanjiu'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '606_dengpao', '606_dengpao.wav', 'dataset_cleaned/wav/606_dengpao.wav', '灯泡', '灯泡'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '606_dengpao'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '607_huihua', '607_huihua.wav', 'dataset_cleaned/wav/607_huihua.wav', '绘画', '绘画'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '607_huihua'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '608_yinhang', '608_yinhang.wav', 'dataset_cleaned/wav/608_yinhang.wav', '银行', '银行'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '608_yinhang'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '609_youjian', '609_youjian.wav', 'dataset_cleaned/wav/609_youjian.wav', '邮件', '邮件'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '609_youjian'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '610_yinyue', '610_yinyue.wav', 'dataset_cleaned/wav/610_yinyue.wav', '音乐', '音乐'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '610_yinyue'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '611_renwu', '611_renwu.wav', 'dataset_cleaned/wav/611_renwu.wav', '任务', '任务'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '611_renwu'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '612_lvxing', '612_lvxing.wav', 'dataset_cleaned/wav/612_lvxing.wav', '旅行', '旅行'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '612_lvxing'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '613_caoping', '613_caoping.wav', 'dataset_cleaned/wav/613_caoping.wav', '草坪', '草坪'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '613_caoping'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '614_huayuan', '614_huayuan.wav', 'dataset_cleaned/wav/614_huayuan.wav', '花园', '花园'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '614_huayuan'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '615_haitan', '615_haitan.wav', 'dataset_cleaned/wav/615_haitan.wav', '海滩', '海滩'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '615_haitan'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '616_chuangpu', '616_chuangpu.wav', 'dataset_cleaned/wav/616_chuangpu.wav', '床铺', '床铺'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '616_chuangpu'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '617_chuxing', '617_chuxing.wav', 'dataset_cleaned/wav/617_chuxing.wav', '出行', '出行'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '617_chuxing'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '618_huiyi', '618_huiyi.wav', 'dataset_cleaned/wav/618_huiyi.wav', '会议', '会议'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '618_huiyi'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '619_chengyuan', '619_chengyuan.wav', 'dataset_cleaned/wav/619_chengyuan.wav', '成员', '成员'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '619_chengyuan'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '620_fenzu', '620_fenzu.wav', 'dataset_cleaned/wav/620_fenzu.wav', '分组', '分组'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '620_fenzu'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '621_xinxi', '621_xinxi.wav', 'dataset_cleaned/wav/621_xinxi.wav', '信息', '信息'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '621_xinxi'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '622_jiankang', '622_jiankang.wav', 'dataset_cleaned/wav/622_jiankang.wav', '健康', '健康'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '622_jiankang'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '623_guanxin', '623_guanxin.wav', 'dataset_cleaned/wav/623_guanxin.wav', '关心', '关心'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '623_guanxin'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '624_fangsong', '624_fangsong.wav', 'dataset_cleaned/wav/624_fangsong.wav', '放松', '放松'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '624_fangsong'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '625_yundong', '625_yundong.wav', 'dataset_cleaned/wav/625_yundong.wav', '运动', '运动'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '625_yundong'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '626_yiyuan', '626_yiyuan.wav', 'dataset_cleaned/wav/626_yiyuan.wav', '医院', '医院'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '626_yiyuan'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '627_yundong', '627_yundong.wav', 'dataset_cleaned/wav/627_yundong.wav', '运动', '运动'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '627_yundong'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '628_shixian', '628_shixian.wav', 'dataset_cleaned/wav/628_shixian.wav', '实现', '实现'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '628_shixian'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '629_kuaile', '629_kuaile.wav', 'dataset_cleaned/wav/629_kuaile.wav', '快乐', '快乐'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '629_kuaile'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '630_jiaoliu', '630_jiaoliu.wav', 'dataset_cleaned/wav/630_jiaoliu.wav', '交流', '交流'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '630_jiaoliu'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '631_fenxiang', '631_fenxiang.wav', 'dataset_cleaned/wav/631_fenxiang.wav', '分享', '分享'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '631_fenxiang'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '632_juese', '632_juese.wav', 'dataset_cleaned/wav/632_juese.wav', '角色', '角色'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '632_juese'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '633_huanjing', '633_huanjing.wav', 'dataset_cleaned/wav/633_huanjing.wav', '环境', '环境'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '633_huanjing'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '634_qidian', '634_qidian.wav', 'dataset_cleaned/wav/634_qidian.wav', '起点', '起点'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '634_qidian'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '635_yinxiang', '635_yinxiang.wav', 'dataset_cleaned/wav/635_yinxiang.wav', '音响', '音响'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '635_yinxiang'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '636_yuyin', '636_yuyin.wav', 'dataset_cleaned/wav/636_yuyin.wav', '语音', '语音'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '636_yuyin'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '637_jihua', '637_jihua.wav', 'dataset_cleaned/wav/637_jihua.wav', '计划', '计划'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '637_jihua'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '638_chengji', '638_chengji.wav', 'dataset_cleaned/wav/638_chengji.wav', '成绩', '成绩'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '638_chengji'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '639_mubiao', '639_mubiao.wav', 'dataset_cleaned/wav/639_mubiao.wav', '目标', '目标'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '639_mubiao'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '640_liangdian', '640_liangdian.wav', 'dataset_cleaned/wav/640_liangdian.wav', '亮点', '亮点'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '640_liangdian'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '641_yanshi', '641_yanshi.wav', 'dataset_cleaned/wav/641_yanshi.wav', '演示', '演示'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '641_yanshi'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '642_zuzhi', '642_zuzhi.wav', 'dataset_cleaned/wav/642_zuzhi.wav', '组织', '组织'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '642_zuzhi'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '643_zhuanzhu', '643_zhuanzhu.wav', 'dataset_cleaned/wav/643_zhuanzhu.wav', '专注', '专注'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '643_zhuanzhu'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '644_fangsong', '644_fangsong.wav', 'dataset_cleaned/wav/644_fangsong.wav', '放松', '放松'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '644_fangsong'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '645_tixing', '645_tixing.wav', 'dataset_cleaned/wav/645_tixing.wav', '提醒', '提醒'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '645_tixing'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '646_gongju', '646_gongju.wav', 'dataset_cleaned/wav/646_gongju.wav', '工具', '工具'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '646_gongju'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '647_weisheng', '647_weisheng.wav', 'dataset_cleaned/wav/647_weisheng.wav', '卫生', '卫生'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '647_weisheng'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '648_zijin', '648_zijin.wav', 'dataset_cleaned/wav/648_zijin.wav', '资金', '资金'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '648_zijin'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '649_zhuangkuang', '649_zhuangkuang.wav', 'dataset_cleaned/wav/649_zhuangkuang.wav', '状况', '状况'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '649_zhuangkuang'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '650_shuxue', '650_shuxue.wav', 'dataset_cleaned/wav/650_shuxue.wav', '数学', '数学'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '650_shuxue'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '651_fuhao', '651_fuhao.wav', 'dataset_cleaned/wav/651_fuhao.wav', '符号', '符号'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '651_fuhao'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '652_tese', '652_tese.wav', 'dataset_cleaned/wav/652_tese.wav', '特色', '特色'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '652_tese'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '653_tiyu', '653_tiyu.wav', 'dataset_cleaned/wav/653_tiyu.wav', '体育', '体育'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '653_tiyu'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '654_jiankang', '654_jiankang.wav', 'dataset_cleaned/wav/654_jiankang.wav', '健康', '健康'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '654_jiankang'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '655_yisheng', '655_yisheng.wav', 'dataset_cleaned/wav/655_yisheng.wav', '医生', '医生'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '655_yisheng'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '656_xunlian', '656_xunlian.wav', 'dataset_cleaned/wav/656_xunlian.wav', '训练', '训练'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '656_xunlian'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '657_wuli', '657_wuli.wav', 'dataset_cleaned/wav/657_wuli.wav', '物理', '物理'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '657_wuli'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '658_zhishi', '658_zhishi.wav', 'dataset_cleaned/wav/658_zhishi.wav', '知识', '知识'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '658_zhishi'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '659_kaoshi', '659_kaoshi.wav', 'dataset_cleaned/wav/659_kaoshi.wav', '考试', '考试'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '659_kaoshi'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '660_yanjiu', '660_yanjiu.wav', 'dataset_cleaned/wav/660_yanjiu.wav', '研究', '研究'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '660_yanjiu'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '661_fenshu', '661_fenshu.wav', 'dataset_cleaned/wav/661_fenshu.wav', '分数', '分数'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '661_fenshu'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '662_ziliao', '662_ziliao.wav', 'dataset_cleaned/wav/662_ziliao.wav', '资料', '资料'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '662_ziliao'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '663_jiating', '663_jiating.wav', 'dataset_cleaned/wav/663_jiating.wav', '家庭', '家庭'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '663_jiating'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '664_shuji', '664_shuji.wav', 'dataset_cleaned/wav/664_shuji.wav', '书籍', '书籍'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '664_shuji'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '665_renwu', '665_renwu.wav', 'dataset_cleaned/wav/665_renwu.wav', '任务', '任务'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '665_renwu'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '666_fudao', '666_fudao.wav', 'dataset_cleaned/wav/666_fudao.wav', '辅导', '辅导'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '666_fudao'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '667_kecheng', '667_kecheng.wav', 'dataset_cleaned/wav/667_kecheng.wav', '课程', '课程'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '667_kecheng'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '668_juhui', '668_juhui.wav', 'dataset_cleaned/wav/668_juhui.wav', '聚会', '聚会'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '668_juhui'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '669_yundong', '669_yundong.wav', 'dataset_cleaned/wav/669_yundong.wav', '运动', '运动'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '669_yundong'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '670_guandian', '670_guandian.wav', 'dataset_cleaned/wav/670_guandian.wav', '观点', '观点'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '670_guandian'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '671_jiaqi', '671_jiaqi.wav', 'dataset_cleaned/wav/671_jiaqi.wav', '假期', '假期'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '671_jiaqi'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '672_huiyi', '672_huiyi.wav', 'dataset_cleaned/wav/672_huiyi.wav', '会议', '会议'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '672_huiyi'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '673_celiang', '673_celiang.wav', 'dataset_cleaned/wav/673_celiang.wav', '测量', '测量'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '673_celiang'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '674_jieshi', '674_jieshi.wav', 'dataset_cleaned/wav/674_jieshi.wav', '解释', '解释'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '674_jieshi'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '675_xiangxin', '675_xiangxin.wav', 'dataset_cleaned/wav/675_xiangxin.wav', '相信', '相信'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '675_xiangxin'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '676_leguan', '676_leguan.wav', 'dataset_cleaned/wav/676_leguan.wav', '乐观', '乐观'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '676_leguan'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '677_huodong', '677_huodong.wav', 'dataset_cleaned/wav/677_huodong.wav', '活动', '活动'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '677_huodong'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '678_xiaozu', '678_xiaozu.wav', 'dataset_cleaned/wav/678_xiaozu.wav', '小组', '小组'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '678_xiaozu'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '679_chengyuan', '679_chengyuan.wav', 'dataset_cleaned/wav/679_chengyuan.wav', '成员', '成员'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '679_chengyuan'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '680_jiti', '680_jiti.wav', 'dataset_cleaned/wav/680_jiti.wav', '集体', '集体'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '680_jiti'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '681_wancheng', '681_wancheng.wav', 'dataset_cleaned/wav/681_wancheng.wav', '完成', '完成'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '681_wancheng'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '682_taolun', '682_taolun.wav', 'dataset_cleaned/wav/682_taolun.wav', '讨论', '讨论'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '682_taolun'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '683_gongzuo', '683_gongzuo.wav', 'dataset_cleaned/wav/683_gongzuo.wav', '工作', '工作'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '683_gongzuo'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '684_tigong', '684_tigong.wav', 'dataset_cleaned/wav/684_tigong.wav', '提供', '提供'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '684_tigong'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '685_yitu', '685_yitu.wav', 'dataset_cleaned/wav/685_yitu.wav', '意图', '意图'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '685_yitu'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '686_quebao', '686_quebao.wav', 'dataset_cleaned/wav/686_quebao.wav', '确保', '确保'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '686_quebao'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '687_sheji', '687_sheji.wav', 'dataset_cleaned/wav/687_sheji.wav', '设计', '设计'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '687_sheji'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '688_jihua', '688_jihua.wav', 'dataset_cleaned/wav/688_jihua.wav', '计划', '计划'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '688_jihua'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '689_renwu', '689_renwu.wav', 'dataset_cleaned/wav/689_renwu.wav', '任务', '任务'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '689_renwu'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '690_xiaoguo', '690_xiaoguo.wav', 'dataset_cleaned/wav/690_xiaoguo.wav', '效果', '效果'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '690_xiaoguo'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '691_xiaoxijie', '691_xiaoxijie.wav', 'dataset_cleaned/wav/691_xiaoxijie.wav', '小细节', '小细节'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '691_xiaoxijie'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '692_jiaoyu', '692_jiaoyu.wav', 'dataset_cleaned/wav/692_jiaoyu.wav', '教育', '教育'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '692_jiaoyu'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '693_jiaolian', '693_jiaolian.wav', 'dataset_cleaned/wav/693_jiaolian.wav', '教练', '教练'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '693_jiaolian'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '694_shijian', '694_shijian.wav', 'dataset_cleaned/wav/694_shijian.wav', '实践', '实践'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '694_shijian'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '695_zhunbei', '695_zhunbei.wav', 'dataset_cleaned/wav/695_zhunbei.wav', '准备', '准备'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '695_zhunbei'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '696_xiangmu', '696_xiangmu.wav', 'dataset_cleaned/wav/696_xiangmu.wav', '项目', '项目'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '696_xiangmu'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '697_xixin', '697_xixin.wav', 'dataset_cleaned/wav/697_xixin.wav', '细心', '细心'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '697_xixin'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '698_fankui', '698_fankui.wav', 'dataset_cleaned/wav/698_fankui.wav', '反馈', '反馈'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '698_fankui'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '699_jihua', '699_jihua.wav', 'dataset_cleaned/wav/699_jihua.wav', '计划', '计划'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '699_jihua'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '700_renli', '700_renli.wav', 'dataset_cleaned/wav/700_renli.wav', '人力', '人力'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '700_renli'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '701_ziyuan', '701_ziyuan.wav', 'dataset_cleaned/wav/701_ziyuan.wav', '资源', '资源'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '701_ziyuan'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '702_tiaozhan', '702_tiaozhan.wav', 'dataset_cleaned/wav/702_tiaozhan.wav', '挑战', '挑战'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '702_tiaozhan'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '703_xiangmu', '703_xiangmu.wav', 'dataset_cleaned/wav/703_xiangmu.wav', '项目', '项目'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '703_xiangmu'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '704_zuzhi', '704_zuzhi.wav', 'dataset_cleaned/wav/704_zuzhi.wav', '组织', '组织'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '704_zuzhi'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '705_ziyou', '705_ziyou.wav', 'dataset_cleaned/wav/705_ziyou.wav', '自由', '自由'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '705_ziyou'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '706_fangsong', '706_fangsong.wav', 'dataset_cleaned/wav/706_fangsong.wav', '放松', '放松'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '706_fangsong'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '707_shunchang', '707_shunchang.wav', 'dataset_cleaned/wav/707_shunchang.wav', '顺畅', '顺畅'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '707_shunchang'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '708_chengjiu', '708_chengjiu.wav', 'dataset_cleaned/wav/708_chengjiu.wav', '成就', '成就'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '708_chengjiu'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '709_kehu', '709_kehu.wav', 'dataset_cleaned/wav/709_kehu.wav', '客户', '客户'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '709_kehu'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '710_gongying', '710_gongying.wav', 'dataset_cleaned/wav/710_gongying.wav', '供应', '供应'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '710_gongying'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '711_jieduan', '711_jieduan.wav', 'dataset_cleaned/wav/711_jieduan.wav', '阶段', '阶段'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '711_jieduan'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '712_huanjing', '712_huanjing.wav', 'dataset_cleaned/wav/712_huanjing.wav', '环境', '环境'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '712_huanjing'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '713_shichang', '713_shichang.wav', 'dataset_cleaned/wav/713_shichang.wav', '市场', '市场'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '713_shichang'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '714_qidong', '714_qidong.wav', 'dataset_cleaned/wav/714_qidong.wav', '启动', '启动'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '714_qidong'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '715_jieshou', '715_jieshou.wav', 'dataset_cleaned/wav/715_jieshou.wav', '接收', '接收'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '715_jieshou'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '716_tisheng', '716_tisheng.wav', 'dataset_cleaned/wav/716_tisheng.wav', '提升', '提升'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '716_tisheng'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '717_ziyuan', '717_ziyuan.wav', 'dataset_cleaned/wav/717_ziyuan.wav', '资源', '资源'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '717_ziyuan'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '718_renwu', '718_renwu.wav', 'dataset_cleaned/wav/718_renwu.wav', '任务', '任务'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '718_renwu'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '719_guocheng', '719_guocheng.wav', 'dataset_cleaned/wav/719_guocheng.wav', '过程', '过程'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '719_guocheng'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '720_fangan', '720_fangan.wav', 'dataset_cleaned/wav/720_fangan.wav', '方案', '方案'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '720_fangan'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '721_guanli', '721_guanli.wav', 'dataset_cleaned/wav/721_guanli.wav', '管理', '管理'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '721_guanli'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '722_fazhan', '722_fazhan.wav', 'dataset_cleaned/wav/722_fazhan.wav', '发展', '发展'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '722_fazhan'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '723_shiyan', '723_shiyan.wav', 'dataset_cleaned/wav/723_shiyan.wav', '实验', '实验'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '723_shiyan'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '724_fengge', '724_fengge.wav', 'dataset_cleaned/wav/724_fengge.wav', '风格', '风格'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '724_fengge'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '725_liucheng', '725_liucheng.wav', 'dataset_cleaned/wav/725_liucheng.wav', '流程', '流程'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '725_liucheng'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '726_chuangyi', '726_chuangyi.wav', 'dataset_cleaned/wav/726_chuangyi.wav', '创意', '创意'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '726_chuangyi'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '727_chuli', '727_chuli.wav', 'dataset_cleaned/wav/727_chuli.wav', '处理', '处理'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '727_chuli'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '728_touzi', '728_touzi.wav', 'dataset_cleaned/wav/728_touzi.wav', '投资', '投资'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '728_touzi'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '729_chengguo', '729_chengguo.wav', 'dataset_cleaned/wav/729_chengguo.wav', '成果', '成果'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '729_chengguo'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '730_dongli', '730_dongli.wav', 'dataset_cleaned/wav/730_dongli.wav', '动力', '动力'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '730_dongli'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '731_panduan', '731_panduan.wav', 'dataset_cleaned/wav/731_panduan.wav', '判断', '判断'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '731_panduan'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '732_shijue', '732_shijue.wav', 'dataset_cleaned/wav/732_shijue.wav', '视觉', '视觉'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '732_shijue'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '733_lijie', '733_lijie.wav', 'dataset_cleaned/wav/733_lijie.wav', '理解', '理解'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '733_lijie'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '734_chuangxin', '734_chuangxin.wav', 'dataset_cleaned/wav/734_chuangxin.wav', '创新', '创新'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '734_chuangxin'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '735_lingdao', '735_lingdao.wav', 'dataset_cleaned/wav/735_lingdao.wav', '领导', '领导'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '735_lingdao'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '736_xinren', '736_xinren.wav', 'dataset_cleaned/wav/736_xinren.wav', '信任', '信任'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '736_xinren'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '737_tishi', '737_tishi.wav', 'dataset_cleaned/wav/737_tishi.wav', '提示', '提示'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '737_tishi'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '738_gongzheng', '738_gongzheng.wav', 'dataset_cleaned/wav/738_gongzheng.wav', '公正', '公正'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '738_gongzheng'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '739_mubiao', '739_mubiao.wav', 'dataset_cleaned/wav/739_mubiao.wav', '目标', '目标'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '739_mubiao'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '740_youshi', '740_youshi.wav', 'dataset_cleaned/wav/740_youshi.wav', '优势', '优势'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '740_youshi'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '741_chixu', '741_chixu.wav', 'dataset_cleaned/wav/741_chixu.wav', '持续', '持续'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '741_chixu'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '742_huanbao', '742_huanbao.wav', 'dataset_cleaned/wav/742_huanbao.wav', '环保', '环保'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '742_huanbao'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '743_shiyan', '743_shiyan.wav', 'dataset_cleaned/wav/743_shiyan.wav', '实验', '实验'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '743_shiyan'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '744_jihua', '744_jihua.wav', 'dataset_cleaned/wav/744_jihua.wav', '计划', '计划'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '744_jihua'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '745_jiashe', '745_jiashe.wav', 'dataset_cleaned/wav/745_jiashe.wav', '假设', '假设'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '745_jiashe'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '746_wenhua', '746_wenhua.wav', 'dataset_cleaned/wav/746_wenhua.wav', '文化', '文化'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '746_wenhua'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '747_yule', '747_yule.wav', 'dataset_cleaned/wav/747_yule.wav', '娱乐', '娱乐'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '747_yule'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '748_guandian', '748_guandian.wav', 'dataset_cleaned/wav/748_guandian.wav', '观点', '观点'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '748_guandian'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '749_xitong', '749_xitong.wav', 'dataset_cleaned/wav/749_xitong.wav', '系统', '系统'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '749_xitong'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '750_caozuo', '750_caozuo.wav', 'dataset_cleaned/wav/750_caozuo.wav', '操作', '操作'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '750_caozuo'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '800_renwu', '800_renwu.wav', 'dataset_cleaned/wav/800_renwu.wav', '任务', '任务'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '800_renwu'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '801_canting', '801_canting.wav', 'dataset_cleaned/wav/801_canting.wav', '餐厅', '餐厅'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '801_canting'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '802_wangshanggouwu', '802_wangshanggouwu.wav', 'dataset_cleaned/wav/802_wangshanggouwu.wav', '网上购物', '网上购物'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '802_wangshanggouwu'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '803_shuijiao', '803_shuijiao.wav', 'dataset_cleaned/wav/803_shuijiao.wav', '睡觉', '睡觉'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '803_shuijiao'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '804_chumen', '804_chumen.wav', 'dataset_cleaned/wav/804_chumen.wav', '出门', '出门'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '804_chumen'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '805_paizhao', '805_paizhao.wav', 'dataset_cleaned/wav/805_paizhao.wav', '拍照', '拍照'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '805_paizhao'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '806_dasaoweisheng', '806_dasaoweisheng.wav', 'dataset_cleaned/wav/806_dasaoweisheng.wav', '打扫卫生', '打扫卫生'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '806_dasaoweisheng'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '807_chifan', '807_chifan.wav', 'dataset_cleaned/wav/807_chifan.wav', '吃饭', '吃饭'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '807_chifan'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '808_quhaibian', '808_quhaibian.wav', 'dataset_cleaned/wav/808_quhaibian.wav', '去海边', '去海边'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '808_quhaibian'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '809_tiaowu', '809_tiaowu.wav', 'dataset_cleaned/wav/809_tiaowu.wav', '跳舞', '跳舞'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '809_tiaowu'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '810_zuozuoye', '810_zuozuoye.wav', 'dataset_cleaned/wav/810_zuozuoye.wav', '做作业', '做作业'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '810_zuozuoye'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '811_fangxue', '811_fangxue.wav', 'dataset_cleaned/wav/811_fangxue.wav', '放学', '放学'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '811_fangxue'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '812_paidui', '812_paidui.wav', 'dataset_cleaned/wav/812_paidui.wav', '排队', '排队'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '812_paidui'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '813_guomalu', '813_guomalu.wav', 'dataset_cleaned/wav/813_guomalu.wav', '过马路', '过马路'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '813_guomalu'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '814_lvxing', '814_lvxing.wav', 'dataset_cleaned/wav/814_lvxing.wav', '旅行', '旅行'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '814_lvxing'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '815_diancan', '815_diancan.wav', 'dataset_cleaned/wav/815_diancan.wav', '点餐', '点餐'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '815_diancan'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '816_kandianshi', '816_kandianshi.wav', 'dataset_cleaned/wav/816_kandianshi.wav', '看电视', '看电视'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '816_kandianshi'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '817_zhufan', '817_zhufan.wav', 'dataset_cleaned/wav/817_zhufan.wav', '煮饭', '煮饭'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '817_zhufan'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '818_xiaban', '818_xiaban.wav', 'dataset_cleaned/wav/818_xiaban.wav', '下班', '下班'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '818_xiaban'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '819_tingyinyue', '819_tingyinyue.wav', 'dataset_cleaned/wav/819_tingyinyue.wav', '听音乐', '听音乐'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '819_tingyinyue'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '820_dadianhua', '820_dadianhua.wav', 'dataset_cleaned/wav/820_dadianhua.wav', '打电话', '打电话'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '820_dadianhua'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '821_maidongxi', '821_maidongxi.wav', 'dataset_cleaned/wav/821_maidongxi.wav', '买东西', '买东西'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '821_maidongxi'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '822_yundonghui', '822_yundonghui.wav', 'dataset_cleaned/wav/822_yundonghui.wav', '运动会', '运动会'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '822_yundonghui'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '823_xiexin', '823_xiexin.wav', 'dataset_cleaned/wav/823_xiexin.wav', '写信', '写信'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '823_xiexin'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '824_youyongchi', '824_youyongchi.wav', 'dataset_cleaned/wav/824_youyongchi.wav', '游泳池', '游泳池'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '824_youyongchi'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '825_tiyuguan', '825_tiyuguan.wav', 'dataset_cleaned/wav/825_tiyuguan.wav', '体育馆', '体育馆'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '825_tiyuguan'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '826_shangwang', '826_shangwang.wav', 'dataset_cleaned/wav/826_shangwang.wav', '上网', '上网'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '826_shangwang'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '827_xuexi', '827_xuexi.wav', 'dataset_cleaned/wav/827_xuexi.wav', '学习', '学习'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '827_xuexi'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '828_dingpiao', '828_dingpiao.wav', 'dataset_cleaned/wav/828_dingpiao.wav', '订票', '订票'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '828_dingpiao'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '829_dayouxi', '829_dayouxi.wav', 'dataset_cleaned/wav/829_dayouxi.wav', '打游戏', '打游戏'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '829_dayouxi'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '830_dache', '830_dache.wav', 'dataset_cleaned/wav/830_dache.wav', '打车', '打车'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '830_dache'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '831_paobu', '831_paobu.wav', 'dataset_cleaned/wav/831_paobu.wav', '跑步', '跑步'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '831_paobu'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '832_shuaka', '832_shuaka.wav', 'dataset_cleaned/wav/832_shuaka.wav', '刷卡', '刷卡'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '832_shuaka'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '833_kaiche', '833_kaiche.wav', 'dataset_cleaned/wav/833_kaiche.wav', '开车', '开车'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '833_kaiche'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '834_kaorou', '834_kaorou.wav', 'dataset_cleaned/wav/834_kaorou.wav', '烤肉', '烤肉'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '834_kaorou'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '835_zuofan', '835_zuofan.wav', 'dataset_cleaned/wav/835_zuofan.wav', '做饭', '做饭'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '835_zuofan'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '836_pengyoujuhui', '836_pengyoujuhui.wav', 'dataset_cleaned/wav/836_pengyoujuhui.wav', '朋友聚会', '朋友聚会'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '836_pengyoujuhui'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '837_maicai', '837_maicai.wav', 'dataset_cleaned/wav/837_maicai.wav', '买菜', '买菜'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '837_maicai'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '838_xiyifu', '838_xiyifu.wav', 'dataset_cleaned/wav/838_xiyifu.wav', '洗衣服', '洗衣服'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '838_xiyifu'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '839_zuojiawu', '839_zuojiawu.wav', 'dataset_cleaned/wav/839_zuojiawu.wav', '做家务', '做家务'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '839_zuojiawu'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '840_chizaocan', '840_chizaocan.wav', 'dataset_cleaned/wav/840_chizaocan.wav', '吃早餐', '吃早餐'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '840_chizaocan'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '841_songhuo', '841_songhuo.wav', 'dataset_cleaned/wav/841_songhuo.wav', '送货', '送货'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '841_songhuo'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '842_lvyoujingdian', '842_lvyoujingdian.wav', 'dataset_cleaned/wav/842_lvyoujingdian.wav', '旅游景点', '旅游景点'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '842_lvyoujingdian'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '843_youlechang', '843_youlechang.wav', 'dataset_cleaned/wav/843_youlechang.wav', '游乐场', '游乐场'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '843_youlechang'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '844_paobuji', '844_paobuji.wav', 'dataset_cleaned/wav/844_paobuji.wav', '跑步机', '跑步机'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '844_paobuji'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '845_zuoyundong', '845_zuoyundong.wav', 'dataset_cleaned/wav/845_zuoyundong.wav', '做运动', '做运动'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '845_zuoyundong'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '846_gouwuche', '846_gouwuche.wav', 'dataset_cleaned/wav/846_gouwuche.wav', '购物车', '购物车'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '846_gouwuche'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '847_huanyifu', '847_huanyifu.wav', 'dataset_cleaned/wav/847_huanyifu.wav', '换衣服', '换衣服'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '847_huanyifu'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '848_kaipaidui', '848_kaipaidui.wav', 'dataset_cleaned/wav/848_kaipaidui.wav', '开派对', '开派对'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '848_kaipaidui'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '849_guoshengri', '849_guoshengri.wav', 'dataset_cleaned/wav/849_guoshengri.wav', '过生日', '过生日'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '849_guoshengri'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '850_dabao', '850_dabao.wav', 'dataset_cleaned/wav/850_dabao.wav', '打包', '打包'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '850_dabao'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '851_fuxi', '851_fuxi.wav', 'dataset_cleaned/wav/851_fuxi.wav', '复习', '复习'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '851_fuxi'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '852_diancai', '852_diancai.wav', 'dataset_cleaned/wav/852_diancai.wav', '点菜', '点菜'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '852_diancai'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '853_nakuaidi', '853_nakuaidi.wav', 'dataset_cleaned/wav/853_nakuaidi.wav', '拿快递', '拿快递'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '853_nakuaidi'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '854_paidianying', '854_paidianying.wav', 'dataset_cleaned/wav/854_paidianying.wav', '拍电影', '拍电影'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '854_paidianying'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '855_xinnian', '855_xinnian.wav', 'dataset_cleaned/wav/855_xinnian.wav', '新年', '新年'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '855_xinnian'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '856_shengdanjie', '856_shengdanjie.wav', 'dataset_cleaned/wav/856_shengdanjie.wav', '圣诞节', '圣诞节'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '856_shengdanjie'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '857_hongbei', '857_hongbei.wav', 'dataset_cleaned/wav/857_hongbei.wav', '烘焙', '烘焙'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '857_hongbei'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '858_zhonghua', '858_zhonghua.wav', 'dataset_cleaned/wav/858_zhonghua.wav', '种花', '种花'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '858_zhonghua'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '859_xiaochijie', '859_xiaochijie.wav', 'dataset_cleaned/wav/859_xiaochijie.wav', '小吃街', '小吃街'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '859_xiaochijie'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '860_xiaotanfan', '860_xiaotanfan.wav', 'dataset_cleaned/wav/860_xiaotanfan.wav', '小摊贩', '小摊贩'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '860_xiaotanfan'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '861_tuangou', '861_tuangou.wav', 'dataset_cleaned/wav/861_tuangou.wav', '团购', '团购'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '861_tuangou'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '862_guojie', '862_guojie.wav', 'dataset_cleaned/wav/862_guojie.wav', '过节', '过节'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '862_guojie'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '863_chizizhucan', '863_chizizhucan.wav', 'dataset_cleaned/wav/863_chizizhucan.wav', '吃自助餐', '吃自助餐'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '863_chizizhucan'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '864_chihuoguo', '864_chihuoguo.wav', 'dataset_cleaned/wav/864_chihuoguo.wav', '吃火锅', '吃火锅'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '864_chihuoguo'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '865_qudianyingyuan', '865_qudianyingyuan.wav', 'dataset_cleaned/wav/865_qudianyingyuan.wav', '去电影院', '去电影院'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '865_qudianyingyuan'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '866_qushangchangguangjie', '866_qushangchangguangjie.wav', 'dataset_cleaned/wav/866_qushangchangguangjie.wav', '去商场逛街', '去商场逛街'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '866_qushangchangguangjie'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '867_canguanbowuguan', '867_canguanbowuguan.wav', 'dataset_cleaned/wav/867_canguanbowuguan.wav', '参观博物馆', '参观博物馆'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '867_canguanbowuguan'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '868_shuaya', '868_shuaya.wav', 'dataset_cleaned/wav/868_shuaya.wav', '刷牙', '刷牙'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '868_shuaya'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '869_kanshu', '869_kanshu.wav', 'dataset_cleaned/wav/869_kanshu.wav', '看书', '看书'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '869_kanshu'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '870_zuomeirong', '870_zuomeirong.wav', 'dataset_cleaned/wav/870_zuomeirong.wav', '做美容', '做美容'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '870_zuomeirong'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '871_kanbing', '871_kanbing.wav', 'dataset_cleaned/wav/871_kanbing.wav', '看病', '看病'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '871_kanbing'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '872_dapenti', '872_dapenti.wav', 'dataset_cleaned/wav/872_dapenti.wav', '打喷嚏', '打喷嚏'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '872_dapenti'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '873_zuoshoushu', '873_zuoshoushu.wav', 'dataset_cleaned/wav/873_zuoshoushu.wav', '做手术', '做手术'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '873_zuoshoushu'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '874_zuoanmo', '874_zuoanmo.wav', 'dataset_cleaned/wav/874_zuoanmo.wav', '做按摩', '做按摩'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '874_zuoanmo'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '875_chuchai', '875_chuchai.wav', 'dataset_cleaned/wav/875_chuchai.wav', '出差', '出差'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '875_chuchai'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '876_youlan', '876_youlan.wav', 'dataset_cleaned/wav/876_youlan.wav', '游览', '游览'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '876_youlan'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '877_gongyuan', '877_gongyuan.wav', 'dataset_cleaned/wav/877_gongyuan.wav', '公园', '公园'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '877_gongyuan'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '878_chuchen', '878_chuchen.wav', 'dataset_cleaned/wav/878_chuchen.wav', '除尘', '除尘'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '878_chuchen'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '880_jiatingjuhui', '880_jiatingjuhui.wav', 'dataset_cleaned/wav/880_jiatingjuhui.wav', '家庭聚会', '家庭聚会'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '880_jiatingjuhui'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '881_zuogongjiao', '881_zuogongjiao.wav', 'dataset_cleaned/wav/881_zuogongjiao.wav', '坐公交', '坐公交'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '881_zuogongjiao'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '882_guangshangchang', '882_guangshangchang.wav', 'dataset_cleaned/wav/882_guangshangchang.wav', '逛商场', '逛商场'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '882_guangshangchang'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '883_kanyanchu', '883_kanyanchu.wav', 'dataset_cleaned/wav/883_kanyanchu.wav', '看演出', '看演出'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '883_kanyanchu'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '884_duanlianshenti', '884_duanlianshenti.wav', 'dataset_cleaned/wav/884_duanlianshenti.wav', '锻炼身体', '锻炼身体'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '884_duanlianshenti'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '885_yujia', '885_yujia.wav', 'dataset_cleaned/wav/885_yujia.wav', '瑜伽', '瑜伽'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '885_yujia'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '886_taiji', '886_taiji.wav', 'dataset_cleaned/wav/886_taiji.wav', '太极', '太极'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '886_taiji'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '887_shangjianshenfang', '887_shangjianshenfang.wav', 'dataset_cleaned/wav/887_shangjianshenfang.wav', '上健身房', '上健身房'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '887_shangjianshenfang'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '888_tiaosheng', '888_tiaosheng.wav', 'dataset_cleaned/wav/888_tiaosheng.wav', '跳绳', '跳绳'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '888_tiaosheng'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '889_dapingpangqiu', '889_dapingpangqiu.wav', 'dataset_cleaned/wav/889_dapingpangqiu.wav', '打乒乓球', '打乒乓球'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '889_dapingpangqiu'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '890_qutushuguan', '890_qutushuguan.wav', 'dataset_cleaned/wav/890_qutushuguan.wav', '去图书馆', '去图书馆'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '890_qutushuguan'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '891_zuocai', '891_zuocai.wav', 'dataset_cleaned/wav/891_zuocai.wav', '做菜', '做菜'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '891_zuocai'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '892_zuofan', '892_zuofan.wav', 'dataset_cleaned/wav/892_zuofan.wav', '做饭', '做饭'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '892_zuofan'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '893_dasaofangjian', '893_dasaofangjian.wav', 'dataset_cleaned/wav/893_dasaofangjian.wav', '打扫房间', '打扫房间'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '893_dasaofangjian'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '894_kantianqiyubao', '894_kantianqiyubao.wav', 'dataset_cleaned/wav/894_kantianqiyubao.wav', '看天气预报', '看天气预报'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '894_kantianqiyubao'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '895_kanwanhui', '895_kanwanhui.wav', 'dataset_cleaned/wav/895_kanwanhui.wav', '看晚会', '看晚会'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '895_kanwanhui'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '896_zuoditie', '896_zuoditie.wav', 'dataset_cleaned/wav/896_zuoditie.wav', '坐地铁', '坐地铁'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '896_zuoditie'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '897_guomalu', '897_guomalu.wav', 'dataset_cleaned/wav/897_guomalu.wav', '过马路', '过马路'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '897_guomalu'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '898_chidao', '898_chidao.wav', 'dataset_cleaned/wav/898_chidao.wav', '迟到', '迟到'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '898_chidao'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '899_guahao', '899_guahao.wav', 'dataset_cleaned/wav/899_guahao.wav', '挂号', '挂号'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '899_guahao'
);

INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)
SELECT '900_kanyisheng', '900_kanyisheng.wav', 'dataset_cleaned/wav/900_kanyisheng.wav', '看医生', '看医生'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM audio_samples
  WHERE sample_key = '900_kanyisheng'
);
