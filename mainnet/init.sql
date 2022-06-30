-- CREATE DATABASE cmp_chain;

USE  cmp_chain;

CREATE TABLE `block_bloom` (
  `id` bigint(20) NOT NULL,
  `block_number` bigint(20) DEFAULT NULL COMMENT '区块号',
  `block_hash` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '区块hash',
  `bloom` longtext COLLATE utf8mb4_bin COMMENT '区块bloom',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `block_number_index` (`block_number`) USING BTREE,
  KEY `block_hash_index` (`block_hash`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='bloom表';

CREATE TABLE `logs` (
  `id` bigint(20) NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'address',
  `topics` varchar(500) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'topics',
  `data` longtext COLLATE utf8mb4_bin COMMENT '数据',
  `block_number` bigint(20) DEFAULT NULL COMMENT '区块号',
  `tx_hash` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '交易hash',
  `tx_index` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'tx_index',
  `block_hash` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '区块hash',
  `log_index` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'index',
  `removed` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '删除状态 true false',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `address_index` (`address`) USING BTREE,
  KEY `block_number_index` (`block_number`) USING BTREE,
  KEY `block_hash_index` (`block_hash`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='日志表';