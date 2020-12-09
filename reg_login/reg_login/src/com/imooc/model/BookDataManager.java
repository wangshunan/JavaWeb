package com.imooc.model;

import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;

import com.imooc.domain.Book;

public class BookDataManager {
	public static Book Create(Map<String, String> book) throws IOException {
		// 定义一个Map集合用于保存接收到的数据:
		Map<String,String> map = new HashMap<String,String>();
		// 创建遍历用的迭代器
		Iterator<Entry<String, String>> iter = book.entrySet().iterator();

		while (iter.hasNext()) {
			Entry<String, String> entry = iter.next();
			String name = entry.getKey(); // 获得表单项的name属性的值
			String value = entry.getValue();// 获得表单项的值
//			System.out.println(name+"    "+value);
			// 将数据存入到map集合中:
			map.put(name, value);
		}

		Book newData = new Book();
		newData.setName(map.get("name"));
		newData.setAuthor(map.get("author"));
		newData.setPublisher(map.get("publisher"));
		newData.setPrice(Integer.parseInt(map.get("price")));
		newData.setDate(map.get("date"));

		return newData;
	}

}
