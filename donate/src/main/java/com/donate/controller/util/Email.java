package com.donate.controller.util;

import java.io.IOException;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

/**
 * 
 * @author 本类只有这么一个方法，用来发邮件！
 */
public class Email {
	public static Session createSession(String host, final String username, final String password) {
		Properties prop = new Properties();
		prop.setProperty("mail.host", host);// 指定主机
		prop.setProperty("mail.smtp.auth", "true");// 指定验证为true

		// 创建验证器
		Authenticator auth = new Authenticator() {
			public PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		};
		
		// 获取session对象
		return Session.getInstance(prop, auth);
	}
	
	/**
	 * 发送指定的邮件
	 * 
	 * @param mail
	 */
	public static void send(Session session, final MailVo mail) throws MessagingException,
			IOException {

		MimeMessage msg = new MimeMessage(session);// 创建邮件对象
		msg.setFrom(new InternetAddress(mail.getFrom()));// 设置发件人
		msg.addRecipients(RecipientType.TO, mail.getToAddress());// 设置收件人

		// 设置抄送
		String cc = mail.getCcAddress();
		if (!cc.isEmpty()) {
			msg.addRecipients(RecipientType.CC, cc);
		}

		// 设置暗送
		String bcc = mail.getBccAddress();
		if (!bcc.isEmpty()) {
			msg.addRecipients(RecipientType.BCC, bcc);
		}

		msg.setSubject(mail.getSubject());// 设置主题

		MimeMultipart parts = new MimeMultipart();// 创建部件集对象

		MimeBodyPart part = new MimeBodyPart();// 创建一个部件
		part.setContent(mail.getContent(), "text/html;charset=utf-8");// 设置邮件文本内容
		parts.addBodyPart(part);// 把部件添加到部件集中
		
		///////////////////////////////////////////

//		// 添加附件
//		List<AttachBean> attachBeanList = mail.getAttachs();// 获取所有附件
//		if (attachBeanList != null) {
//			for (AttachBean attach : attachBeanList) {
//				MimeBodyPart attachPart = new MimeBodyPart();// 创建一个部件
//				attachPart.attachFile(attach.getFile());// 设置附件文件
//				attachPart.setFileName(MimeUtility.encodeText(attach
//						.getFileName()));// 设置附件文件名
//				String cid = attach.getCid();
//				if(cid != null) {
//					attachPart.setContentID(cid);
//				}
//				parts.addBodyPart(attachPart);
//			}
//		}

		msg.setContent(parts);// 给邮件设置内容
		Transport.send(msg);// 发邮件
	}
}

/**
 * 表示邮件类，你需要设置：账户名和密码、收件人、抄送(可选)、暗送(可选)、主题、内容，以及附件(可选)
 * 
 * 在创建了Mail对象之后
 * 可以调用它的setSubject()、setContent()，设置主题和正文
 * 也可以调用setFrom()和　addToAddress()，设置发件人，和添加收件人。
 * 也可以调用addAttch()添加附件
 * 创建AttachBean：new AttachBean(new File("..."), "fileName");
 */
class MailVo {
	private String from;//发件人
	private StringBuilder toAddress = new StringBuilder();//收件人
	private StringBuilder ccAddress = new StringBuilder();//抄送
	private StringBuilder bccAddress = new StringBuilder();//暗送
	
	private String subject;//主题
	private String content;//正文
	
	// 附件列表
//	private List<AttachBean> attachList = new ArrayList<AttachBean>();
	
	public MailVo() {}
	
	public MailVo(String from, String to) {
		this(from, to, null, null);
	}
	
	public MailVo(String from, String to, String subject, String content) {
		this.from = from;
		this.toAddress.append(to);
		this.subject = subject;
		this.content = content;
	}
	
	/**
	 * 返回发件人
	 * @return
	 */
	public void setFrom(String from) {
		this.from = from;
	}
	
	/**
	 * 返回发件人
	 * @return
	 */
	public String getFrom() {
		return from;
	}
	
	/**
	 * 返回主题
	 */
	public String getSubject() {
		return subject;
	}

	/**
	 * 设置主题
	 */
	public void setSubject(String subject) {
		this.subject = subject;
	}

	/**
	 * 获取主题内容
	 */
	public String getContent() {
		return content;
	}

	/**
	 * 设置主题内容
	 * @param content
	 */
	public void setContent(String content) {
		this.content = content;
	}

	/**
	 * 获取收件人
	 * @return
	 */
	public String getToAddress() {
		return toAddress.toString();
	}

	/**
	 * 获取抄送
	 * @return
	 */
	public String getCcAddress() {
		return ccAddress.toString();
	}

	/**
	 * 获取暗送
	 * @return
	 */
	public String getBccAddress() {
		return bccAddress.toString();
	}

	/**
	 * 添加收件人,可以是多个收件人
	 * @param to
	 */
	public void addToAddress(String to) {
		if(this.toAddress.length() > 0) {
			this.toAddress.append(",");
		}
		this.toAddress.append(to);
	}

	/**
	 * 添加抄送人，可以是多个抄送人
	 * @param cc
	 */
	public void addCcAddress(String cc) {
		if(this.ccAddress.length() > 0) {
			this.ccAddress.append(",");
		}
		this.ccAddress.append(cc);
	}

	/**
	 * 添加暗送人，可以是多个暗送人
	 * @param bcc
	 */
	public void addBccAddress(String bcc) {
		if(this.bccAddress.length() > 0) {
			this.bccAddress.append(",");
		}
		this.bccAddress.append(bcc);
	}
	
	/**
	 * 添加附件，可以添加多个附件
	 * @param attachBean
	 */
//	public void addAttach(AttachBean attachBean) {
//		this.attachList.add(attachBean);
//	}
//	
//	/**
//	 * 获取所有附件
//	 * @return
//	 */
//	public List<AttachBean> getAttachs() {
//		return this.attachList;
//	}
}