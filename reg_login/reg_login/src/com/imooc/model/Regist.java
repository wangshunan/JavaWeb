package com.imooc.model;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.fileupload.FileItem;

import com.imooc.domain.User;
import com.imooc.utils.UploadUtils;

public class Regist {
	public static String UserRegist(List<FileItem> newData, List<User> userList, String path) throws IOException {
		// 定义一个Map集合用于保存接收到的数据:
		Map<String,String> map = new HashMap<String,String>();
		// 遍历集合，获得每个FileItem，判断是表单项还是文件上传项
		String url = null;
		for (FileItem fileItem : newData) {
			// 判断是表单项还是文件上传项
			if(fileItem.isFormField()){
				// 普通表单项:
				// 接收表单项参数的值:
				String name = fileItem.getFieldName(); // 获得表单项的name属性的值
				String value = fileItem.getString("UTF-8");// 获得表单项的值
				System.out.println(name+"    "+value);
				// 将数据存入到map集合中:
				map.put(name, value);
			}else{
				// 文件上传项:
				// 文件上传功能：
				// 获得文件上传的名称：
				String fileName = fileItem.getName();
				if(fileName !=null && !"".equals(fileName)){
					// 通过工具类获得唯一文件名:
					String uuidFileName = UploadUtils.getUUIDFileName(fileName);
					// 获得文件上传的数据：
					InputStream is = fileItem.getInputStream();

					// 将输入流对接到输出流就可以了:
					url = path+"\\"+uuidFileName;
					OutputStream os = new FileOutputStream(url);
					int len = 0;
					byte[] b = new byte[1024];
					while((len = is.read(b))!=-1){
						os.write(b, 0, len);
					}
					is.close();
					os.close();
				}
			}
		}

		// 校验用户名:
		for(User u : userList){
			if(u.getUsername().equals(map.get("username"))){
				return "existed";
			}
		}

		// 封装数据到User当中:
		User user = new User();
		user.setUsername(map.get("username"));
		user.setPassword(map.get("password"));
		user.setSex(map.get("sex"));
		user.setNickname(map.get("nickname"));
		user.setPath(url);
		// 将注册用户的信息存入到List集合中:

		userList.add(user);
//		for (User u : userList) {
//			System.out.println(u);
//		}

		return "finished";
	}
}
