-- 待扩展补充

-- 用户表
CREATE TABLE user (
                      id VARCHAR(64) PRIMARY KEY,
                      username VARCHAR(50) UNIQUE NOT NULL COMMENT '用户名',
                      password VARCHAR(255) NOT NULL COMMENT '密码',
                      phone_number VARCHAR(255) UNIQUE NOT NULL CHECK ( REGEXP_LIKE(phone_number,'^1[3-9]\\d{9}$') ) COMMENT '手机号',
                      introduce VARCHAR(255) DEFAULT '空空如也~' COMMENT '一句话介绍自己',
                      gender CHAR(1) NOT NULL DEFAULT '男' COMMENT '性别',
                      age int DEFAULT 0 COMMENT '年龄',
                      create_time DATETIME DEFAULT NOW() COMMENT '用户创建时间'
)ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

-- 关注表
create table follow(
    id VARCHAR(64) PRIMARY KEY,
    followed_user_id varchar(64) not null COMMENT '被关注的用户ID', # 应该设个followed_user_id和user_id不能存在相同的记录的约束,不然插入了两条相同的记录
    user_id varchar(64) not null COMMENT '关注者',
    create_time DATETIME DEFAULT NOW() COMMENT '关注时间'
)ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

-- blog表
-- 点赞表
-- 拉黑表