package com.fcjava.util;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MyBatisUtil {
	
	private static SqlSessionFactory sqlSessionFactory; //객체를 한번만 만들면된다.
	
	static{
		try {
			String resource = "com/fcjava/xml/mybatis-config.xml";
			Reader reader = Resources.getResourceAsReader(resource);
			SqlSessionFactoryBuilder factory = new SqlSessionFactoryBuilder();
			sqlSessionFactory = factory.build(reader);
		} catch (Exception e) {
			System.out.println(e);
		}
	}
	
	private MyBatisUtil() {}
	
	public static SqlSessionFactory getSqlSessionFactory(){
		return sqlSessionFactory;
	}
}
