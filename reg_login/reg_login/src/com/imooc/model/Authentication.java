package com.imooc.model;

import java.util.List;

import com.imooc.domain.User;

public class Authentication {
	static public User Verify(String username, String password, List<User> userList) {
		for(User user : userList){
			// 判断用户名是否正确:
			if(username.equals(user.getUsername())){
				// 用户名是正确的
				if(password.equals(user.getPassword())){
					// 密码也正确：
					// 登录成功:
					return user;
				}
			}
		}

		return null;
	}
}
