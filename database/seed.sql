USE hainan_dialect_platform;

INSERT INTO learning_modules (title, description, level, sort_order, status)
SELECT '基础问候', '适合零基础用户入门的常用问候表达。', 'beginner', 1, 'published'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM learning_modules WHERE title = '基础问候'
);

INSERT INTO learning_modules (title, description, level, sort_order, status)
SELECT '日常交流', '覆盖生活中最常见的海南方言交流场景。', 'beginner', 2, 'published'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM learning_modules WHERE title = '日常交流'
);

INSERT INTO learning_modules (title, description, level, sort_order, status)
SELECT '餐饮点单', '学习吃饭、点餐、结账相关表达。', 'beginner', 3, 'published'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM learning_modules WHERE title = '餐饮点单'
);

INSERT INTO learning_modules (title, description, level, sort_order, status)
SELECT '交通出行', '学习问路、坐车、打车等高频句子。', 'beginner', 4, 'published'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM learning_modules WHERE title = '交通出行'
);

INSERT INTO learning_modules (title, description, level, sort_order, status)
SELECT '常见称呼', '学习家人、朋友和礼貌称呼。', 'beginner', 5, 'published'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM learning_modules WHERE title = '常见称呼'
);

INSERT INTO learning_lessons (module_id, title, summary, difficulty, estimated_minutes, sort_order, status)
SELECT id, '你好与再见', '学习最基础的问候与告别表达。', 'beginner', 10, 1, 'published'
FROM learning_modules
WHERE title = '基础问候'
  AND NOT EXISTS (
    SELECT 1 FROM learning_lessons WHERE title = '你好与再见'
  );

INSERT INTO learning_lessons (module_id, title, summary, difficulty, estimated_minutes, sort_order, status)
SELECT id, '礼貌表达', '学习谢谢、请、对不起等礼貌用语。', 'beginner', 10, 2, 'published'
FROM learning_modules
WHERE title = '基础问候'
  AND NOT EXISTS (
    SELECT 1 FROM learning_lessons WHERE title = '礼貌表达'
  );

INSERT INTO learning_lessons (module_id, title, summary, difficulty, estimated_minutes, sort_order, status)
SELECT id, '简单自我介绍', '学习姓名、来自哪里、是否听得懂等表达。', 'beginner', 12, 1, 'published'
FROM learning_modules
WHERE title = '日常交流'
  AND NOT EXISTS (
    SELECT 1 FROM learning_lessons WHERE title = '简单自我介绍'
  );

INSERT INTO learning_lessons (module_id, title, summary, difficulty, estimated_minutes, sort_order, status)
SELECT id, '饭店点餐', '学习点菜、询价和口味表达。', 'beginner', 12, 1, 'published'
FROM learning_modules
WHERE title = '餐饮点单'
  AND NOT EXISTS (
    SELECT 1 FROM learning_lessons WHERE title = '饭店点餐'
  );

INSERT INTO learning_lessons (module_id, title, summary, difficulty, estimated_minutes, sort_order, status)
SELECT id, '问路和坐车', '学习目的地、路线和价格相关表达。', 'beginner', 12, 1, 'published'
FROM learning_modules
WHERE title = '交通出行'
  AND NOT EXISTS (
    SELECT 1 FROM learning_lessons WHERE title = '问路和坐车'
  );

INSERT INTO learning_lessons (module_id, title, summary, difficulty, estimated_minutes, sort_order, status)
SELECT id, '家庭与朋友称呼', '学习常见亲属和朋友称呼。', 'beginner', 10, 1, 'published'
FROM learning_modules
WHERE title = '常见称呼'
  AND NOT EXISTS (
    SELECT 1 FROM learning_lessons WHERE title = '家庭与朋友称呼'
  );

INSERT INTO lesson_terms (lesson_id, mandarin_text, hainan_text, pinyin_note, meaning_note, sort_order)
SELECT ll.id, '你好', '侬好', 'long ho', '用于见面打招呼。', 1
FROM learning_lessons ll
WHERE ll.title = '你好与再见'
  AND NOT EXISTS (
    SELECT 1 FROM lesson_terms WHERE lesson_id = ll.id AND sort_order = 1
  );

INSERT INTO lesson_terms (lesson_id, mandarin_text, hainan_text, pinyin_note, meaning_note, sort_order)
SELECT ll.id, '再见', '再会', 'zai hui', '用于告别场景。', 2
FROM learning_lessons ll
WHERE ll.title = '你好与再见'
  AND NOT EXISTS (
    SELECT 1 FROM lesson_terms WHERE lesson_id = ll.id AND sort_order = 2
  );

INSERT INTO lesson_terms (lesson_id, mandarin_text, hainan_text, pinyin_note, meaning_note, sort_order)
SELECT ll.id, '谢谢', '多谢', 'do xia', '表达感谢。', 1
FROM learning_lessons ll
WHERE ll.title = '礼貌表达'
  AND NOT EXISTS (
    SELECT 1 FROM lesson_terms WHERE lesson_id = ll.id AND sort_order = 1
  );

INSERT INTO lesson_terms (lesson_id, mandarin_text, hainan_text, pinyin_note, meaning_note, sort_order)
SELECT ll.id, '对不起', '失礼', 'sit li', '表达歉意。', 2
FROM learning_lessons ll
WHERE ll.title = '礼貌表达'
  AND NOT EXISTS (
    SELECT 1 FROM lesson_terms WHERE lesson_id = ll.id AND sort_order = 2
  );

INSERT INTO lesson_terms (lesson_id, mandarin_text, hainan_text, pinyin_note, meaning_note, sort_order)
SELECT ll.id, '我叫', '我叫', 'gua gio', '用于自我介绍。', 1
FROM learning_lessons ll
WHERE ll.title = '简单自我介绍'
  AND NOT EXISTS (
    SELECT 1 FROM lesson_terms WHERE lesson_id = ll.id AND sort_order = 1
  );

INSERT INTO lesson_terms (lesson_id, mandarin_text, hainan_text, pinyin_note, meaning_note, sort_order)
SELECT ll.id, '多少钱', '几多钱', 'gui do qian', '用于询价。', 1
FROM learning_lessons ll
WHERE ll.title = '饭店点餐'
  AND NOT EXISTS (
    SELECT 1 FROM lesson_terms WHERE lesson_id = ll.id AND sort_order = 1
  );

INSERT INTO lesson_terms (lesson_id, mandarin_text, hainan_text, pinyin_note, meaning_note, sort_order)
SELECT ll.id, '去哪里', '去叨位', 'ki dau ui', '用于问目的地。', 1
FROM learning_lessons ll
WHERE ll.title = '问路和坐车'
  AND NOT EXISTS (
    SELECT 1 FROM lesson_terms WHERE lesson_id = ll.id AND sort_order = 1
  );

INSERT INTO lesson_terms (lesson_id, mandarin_text, hainan_text, pinyin_note, meaning_note, sort_order)
SELECT ll.id, '妈妈', '阿母', 'a bo', '家庭常用称呼。', 1
FROM learning_lessons ll
WHERE ll.title = '家庭与朋友称呼'
  AND NOT EXISTS (
    SELECT 1 FROM lesson_terms WHERE lesson_id = ll.id AND sort_order = 1
  );

INSERT INTO lesson_sentences (lesson_id, mandarin_text, hainan_text, meaning_note, sort_order)
SELECT ll.id, '你好，很高兴认识你。', '侬好，见着你真欢喜。', '基础问候示例句。', 1
FROM learning_lessons ll
WHERE ll.title = '你好与再见'
  AND NOT EXISTS (
    SELECT 1 FROM lesson_sentences WHERE lesson_id = ll.id AND sort_order = 1
  );

INSERT INTO lesson_sentences (lesson_id, mandarin_text, hainan_text, meaning_note, sort_order)
SELECT ll.id, '谢谢你的帮助。', '多谢你来帮忙。', '礼貌表达示例句。', 1
FROM learning_lessons ll
WHERE ll.title = '礼貌表达'
  AND NOT EXISTS (
    SELECT 1 FROM lesson_sentences WHERE lesson_id = ll.id AND sort_order = 1
  );

INSERT INTO lesson_sentences (lesson_id, mandarin_text, hainan_text, meaning_note, sort_order)
SELECT ll.id, '我叫小林，来自海口。', '我叫小林，来自海口。', '自我介绍示例句。', 1
FROM learning_lessons ll
WHERE ll.title = '简单自我介绍'
  AND NOT EXISTS (
    SELECT 1 FROM lesson_sentences WHERE lesson_id = ll.id AND sort_order = 1
  );

INSERT INTO lesson_sentences (lesson_id, mandarin_text, hainan_text, meaning_note, sort_order)
SELECT ll.id, '这个菜多少钱？', '这个菜几多钱？', '点餐询价示例句。', 1
FROM learning_lessons ll
WHERE ll.title = '饭店点餐'
  AND NOT EXISTS (
    SELECT 1 FROM lesson_sentences WHERE lesson_id = ll.id AND sort_order = 1
  );

INSERT INTO lesson_sentences (lesson_id, mandarin_text, hainan_text, meaning_note, sort_order)
SELECT ll.id, '去火车站怎么走？', '去火车站按怎行？', '交通问路示例句。', 1
FROM learning_lessons ll
WHERE ll.title = '问路和坐车'
  AND NOT EXISTS (
    SELECT 1 FROM lesson_sentences WHERE lesson_id = ll.id AND sort_order = 1
  );

INSERT INTO lesson_sentences (lesson_id, mandarin_text, hainan_text, meaning_note, sort_order)
SELECT ll.id, '这是我的妈妈。', '这是我个阿母。', '称呼场景示例句。', 1
FROM learning_lessons ll
WHERE ll.title = '家庭与朋友称呼'
  AND NOT EXISTS (
    SELECT 1 FROM lesson_sentences WHERE lesson_id = ll.id AND sort_order = 1
  );

INSERT INTO translation_dictionary (source_lang, target_lang, source_text, target_text, note)
SELECT 'mandarin', 'hainan', '你好', '侬好', '高频问候语'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM translation_dictionary
  WHERE source_lang = 'mandarin' AND target_lang = 'hainan' AND source_text = '你好'
);

INSERT INTO translation_dictionary (source_lang, target_lang, source_text, target_text, note)
SELECT 'hainan', 'mandarin', '侬好', '你好', '高频问候语'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM translation_dictionary
  WHERE source_lang = 'hainan' AND target_lang = 'mandarin' AND source_text = '侬好'
);

INSERT INTO translation_dictionary (source_lang, target_lang, source_text, target_text, note)
SELECT 'mandarin', 'hainan', '谢谢', '多谢', '基础礼貌表达'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM translation_dictionary
  WHERE source_lang = 'mandarin' AND target_lang = 'hainan' AND source_text = '谢谢'
);

INSERT INTO translation_dictionary (source_lang, target_lang, source_text, target_text, note)
SELECT 'hainan', 'mandarin', '多谢', '谢谢', '基础礼貌表达'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM translation_dictionary
  WHERE source_lang = 'hainan' AND target_lang = 'mandarin' AND source_text = '多谢'
);

INSERT INTO translation_dictionary (source_lang, target_lang, source_text, target_text, note)
SELECT 'mandarin', 'hainan', '多少钱', '几多钱', '餐饮与购物高频表达'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM translation_dictionary
  WHERE source_lang = 'mandarin' AND target_lang = 'hainan' AND source_text = '多少钱'
);

INSERT INTO translation_dictionary (source_lang, target_lang, source_text, target_text, note)
SELECT 'hainan', 'mandarin', '几多钱', '多少钱', '餐饮与购物高频表达'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM translation_dictionary
  WHERE source_lang = 'hainan' AND target_lang = 'mandarin' AND source_text = '几多钱'
);

INSERT INTO translation_dictionary (source_lang, target_lang, source_text, target_text, note)
SELECT 'mandarin', 'hainan', '去哪里', '去叨位', '交通出行高频表达'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM translation_dictionary
  WHERE source_lang = 'mandarin' AND target_lang = 'hainan' AND source_text = '去哪里'
);

INSERT INTO translation_dictionary (source_lang, target_lang, source_text, target_text, note)
SELECT 'hainan', 'mandarin', '去叨位', '去哪里', '交通出行高频表达'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM translation_dictionary
  WHERE source_lang = 'hainan' AND target_lang = 'mandarin' AND source_text = '去叨位'
);
