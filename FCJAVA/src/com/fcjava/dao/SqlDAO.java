package com.fcjava.dao;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlDAO {
	private static SqlSessionFactory sqlSession; //객체를 한번만 만들면된다.
	public static SqlSessionFactory getSqlSession(){
		return sqlSession;
	}

	static{
		try {
			String resource = "com/fcjava/xml/XmlSqlDBcon.xml";
			Reader reader = Resources.getResourceAsReader(resource);
			SqlSessionFactoryBuilder factory = new SqlSessionFactoryBuilder();
			sqlSession = factory.build(reader);
		} catch (Exception e) {
			System.out.println(e);
		}
	}
}
