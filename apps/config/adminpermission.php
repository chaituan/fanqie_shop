<?php
/**
 * 后台管理权限配置数组
 * @author chaituan@126.com
 */
$config ['adminpermission'] = array (
		'adminuser' => array (
				'name' => '管理员管理',
				'methods' => array (
						'index' => '浏览',
						'add' => '添加',
						'edit' => '修改',
						'del' => '删除',
						'dels' => '批量删除',
						'lock' => '锁定',
						'edit_pwd' => '修改密码',
						'export' => '导出' 
				) 
		),
		'adminrole' => array (
				'name' => '管理员角色',
				'methods' => array (
						'index' => '浏览',
						'add' => '添加',
						'edit' => '修改',
						'del' => '删除',
						'permission' => '权限配置' 
				) 
		),
		'config' => array (
				'name' => '变量配置',
				'methods' => array (
						'index' => '浏览',
						'add' => '添加',
						'edit' => '修改',
						'del' => '删除' 
				) 
		),
		'menu' => array (
				'name' => '后台菜单',
				'methods' => array (
						'index' => '浏览',
						'add' => '添加',
						'edit' => '修改',
						'del' => '删除',
						'quicksave' => '快速保存' 
				) 
		),
		'menugroup' => array (
				'name' => '菜单分组',
				'methods' => array (
						'index' => '浏览',
						'add' => '添加',
						'edit' => '修改',
						'del' => '删除',
						'dels' => '批量删除',
						'quicksave' => '快速保存' 
				) 
		),
		'news' => array (
				'name' => '文章管理',
				'methods' => array (
						'index' => '浏览',
						'add' => '添加',
						'edit' => '修改',
						'del' => '删除',
						'dels' => '批量删除',
						'lock' => '锁定' 
				) 
		),
		'newsgroup' => array (
				'name' => '文章分组',
				'methods' => array (
						'index' => '浏览',
						'add' => '添加',
						'edit' => '修改',
						'del' => '删除' 
				) 
		),
		'Products' => array (
				'name' => '会员管理',
				'methods' => array (
						'index' => '浏览',
						'del' => '删除',
						'dels' => '批量删除',
						'lock' => '锁定',
						'config' => '会员配置',
						'export' => '导出' 
				) 
		),
		'ProductGroup' => array (
				'name' => '会员分组',
				'methods' => array (
						'index' => '浏览',
						'add' => '添加',
						'del' => '删除' 
				) 
		) 
);