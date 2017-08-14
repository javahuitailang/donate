package com.donate.controller.util;

import java.io.IOException;
import java.io.InputStream;
import java.text.MessageFormat;
import java.util.Properties;
import javax.mail.Session;

public class EmailUtils {
	private String name;//收件人姓名
	private String to;//收件人账号
	private String code;//验证码(对外收入的参数)
	private Properties props ;//读取配置文件
	
	private String smtp; //服务器主机
	private String username; //用户名
	private String password;//密码
	private String from;//发件人
	private String subject; //主题
	private String content;//内容
	public EmailUtils(String name,String to,String code){
		this.name = name;
		this.to = to;
		this.code = code;
		InputStream is = EmailUtils.class.getResourceAsStream("/email.properties");
		props = new Properties();
		try {
			props.load(is);
			smtp = props.getProperty("smtp");//获取服务器主机
			username = props.getProperty("username");//获取用户名
			password = props.getProperty("password");//获取密码
			from = props.getProperty("from");//获取发件人
			subject = props.getProperty("subject");//获取主题
//			content = props.getProperty("contentCode");//获取邮件内容
//			content = MessageFormat.format(content,name,code);//替换{0,1}//通配符
		} catch (IOException e) {
			e.printStackTrace();
		}
	}		
	public void setContent(int type){
		if(type==0){//发送激活链接
			content = props.getProperty("contentLink");//获取邮件内容
			content = MessageFormat.format(content,name,name,code);//替换{0,1,2}
		}else if(type==1){//发送验证码
			content = props.getProperty("contentCode");//获取邮件内容
			content = MessageFormat.format(content,name,code);//替换{0,1}//通配符
		}else{
			System.out.println("\u90AE\u4EF6\u65B9\u5F0F\u9519\u8BEF,\u5DF2\u7ECF\u4F7F\u7528\u7CFB\u7EDF\u9ED8\u8BA4\u53D1\u9001\u65B9\u5F0F");
			content=null;
		}
	}
	public boolean send(){
		if(content==null){
			System.out.println("\u90AE\u4EF6\u5185\u5BB9\u4E0D\u80FD\u4E3A\u7A7A");
		//	return false;
		}
		try {
			Session session = Email.createSession(smtp, username, password);//得到session
			MailVo mail = new MailVo(from, to,subject,content);//创建邮件对象
			Email.send(session, mail);
			System.out.println(content+"\n发送成功");
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(content+"\n发送失败");
			return false;
		}
	}
	public static void main(String[] args){
		EmailUtils email = new EmailUtils("shab adfasf","850109093@qq.com","123456789");
		email.setContent(0);
		email.send();//发送激活链接
	}

}
//java处理url中的特殊字符
//1.+ 表示空格（在 URL 中不能使用空格）          %20 
//2./ 分隔目录和子目录                                              %2F 
//3.? 分隔实际的 URL 和参数                                   %3F 
//4.% 指定特殊字符                                                    %25 
//5.# 表示书签                                                             %23 
//6.& URL 中指定的参数间的分隔符             	%26 