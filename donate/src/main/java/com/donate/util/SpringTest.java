package com.donate.util;

import org.apache.commons.dbcp.BasicDataSource;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * Created by Administrator on 2017/2/7.
 */
public class SpringTest {
     private static ClassPathXmlApplicationContext cxt;
     public static void main(String []args) throws Exception{
         cxt = new ClassPathXmlApplicationContext("spring-mybatis.xml");
         BasicDataSource dataSource = cxt.getBean(BasicDataSource.class);
         System.out.println(dataSource.getUsername());

     }
}
