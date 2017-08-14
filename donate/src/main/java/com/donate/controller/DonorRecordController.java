package com.donate.controller;

import com.donate.po.Appeal;
import com.donate.po.DonorRecord;
import com.donate.po.Pager;
import com.donate.po.User;
import com.donate.service.AppealService;
import com.donate.service.DonorRecordService;
import com.donate.util.PaymentUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * ⑥捐款管理（在线捐款（使用支付宝接口）、捐款记录查询、捐款统计）--------肖亦鸣
 * @author xiaoyiming
 *
 */
@Controller
@RequestMapping("/record")
public class DonorRecordController {
	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Resource
	DonorRecordService donorRecordService;
	@Resource
	AppealService appealService;
	//查询所有
	@RequestMapping("/getAll")
	public String getAll(Pager<DonorRecord> pageBean,Map<Object, Object> map,
			HttpServletRequest request){
		pageBean.setUrl("getAll");
		pageBean = donorRecordService.getAll(pageBean);
		map.put("pageBean", pageBean);
		return "front_page/donate_record";
	}
	//根据id查询所有
	@RequestMapping("/getAllById")
	public String getAllById(Pager<DonorRecord> pageBean,HttpServletRequest request){
		pageBean.setUrl("getAllById");
		User user = (User) request.getSession().getAttribute("userSession");
		if(user == null){
//			user = new User();
//			user.setId(1);
			request.setAttribute("erro", "您还没有登陆,请先登陆!");
			return "login";
		}
		pageBean = donorRecordService.getAllById(user.getId(),pageBean);
		request.setAttribute("pageBean", pageBean);
		return "front_page/donate_record";
	}
	//模糊查询
	@RequestMapping("/search")
	public String search(Integer selected,Pager<DonorRecord> pageBean,
			HttpServletRequest request) throws Exception{
		String context = request.getParameter("context");
//		if(context!=null&&!"null".equals(context)){
//			context = new String((context).getBytes("iso-8859-1"),"UTF-8");
//		}
		pageBean.setUrl("search");
		pageBean = donorRecordService.search(selected, context, pageBean);
		request.setAttribute("pageBean", pageBean);
		request.setAttribute("selected", selected);
		request.setAttribute("context", context);
		return "front_page/donate_record";
	}
	//查询所有
	@RequestMapping("/getBackAll")
	public String getBackAll(Pager<DonorRecord> pageBean,Map<Object, Object> map,
			HttpServletRequest request){
		pageBean.setUrl("getBackAll");
		pageBean = donorRecordService.getAll(pageBean);
		map.put("pageBean", pageBean);
		double d = donorRecordService.getTotalDonorMoney();
		DecimalFormat dcmFmt = new DecimalFormat("#,###.00");
		map.put("getTotal", dcmFmt.format(d));
		return "back_page/donate-list";
	}
	@RequestMapping("/donate-list")
	public String donateList(Integer selected,Pager<DonorRecord> pageBean,
			String beforDate,String afterDate,
			HttpServletRequest request) throws Exception{
		String context = request.getParameter("context");
//		if(context!=null&&!"null".equals(context)){
//			context = new String((context).getBytes("iso-8859-1"),"UTF-8");
//		}
		if(beforDate==null||"".equals(beforDate)){
			beforDate = "2016-08-01";
		}
		if(afterDate==null||"".equals(afterDate)){
			afterDate = new SimpleDateFormat("yyyy-MM-dd").format(new Date()).toString();
		}
		if(selected==null){
			selected = 1;
		}
		pageBean.setUrl("donate-list");
		pageBean = donorRecordService.getBackdonateList(selected,context, beforDate, afterDate, pageBean);
		request.setAttribute("pageBean", pageBean);
		request.setAttribute("selected", selected);
		request.setAttribute("beforDate", beforDate);
		request.setAttribute("afterDate", afterDate);
		request.setAttribute("context", context);
		double d = donorRecordService.getTotalDonorMoney();
		DecimalFormat dcmFmt = new DecimalFormat("#,###.00");
		request.setAttribute("getTotal", dcmFmt.format(d));
		return "back_page/donate-list";
	}
	
	@RequestMapping("/getTotelDonorMoney")
	public String getTotelDonorMoney(Map<Object, Object> map){
		double d = donorRecordService.getTotalDonorMoney();
		map.put("totelDonorMoney", d);
		return null;
	}
	
	@RequestMapping("/getTotal")
	public String getTotal(Map<Object, Object> map){
		double d = donorRecordService.getTotal();
		map.put("donorMoneyById", d);
		return null;
	}
	@RequestMapping("/getDonorMoneyById")
	public String getDonorMoneyById(Integer id,Map<Object, Object> map){
		double d = donorRecordService.getDonorMoneyById(id);
		map.put("donorMoneyById", d);
		return null;
	}
	@RequestMapping("/appeal")
	public String appeal(Integer appealId,Pager<DonorRecord> pageBean,
			HttpServletRequest request)throws Exception{
		pageBean.setUrl("appeal");
		pageBean = donorRecordService.getAppealById(appealId, pageBean);
		//根据id获取详细求助信息显示出来
		Appeal appeal = appealService.getAppealById(appealId);
		request.setAttribute("appeal", appeal);
		
		List<Appeal> appealHeaderBySortNum = appealService.getAppealHeaderBySortNum();
		request.setAttribute("appealHeader", appealHeaderBySortNum);
		
		request.setAttribute("appealId", appealId);
		request.setAttribute("pageBean", pageBean);
		return "front_page/appeal";
	}
	@RequestMapping("/pay")
	public String pay(String price_t,String appealId,
			HttpServletRequest request)throws Exception{
		User user =  (User) request.getSession().getAttribute("userSession");
		//防止插入为空异常
		if(user==null){
//			user = new User();
//			user.setId(1);
			request.setAttribute("erro", "您还没有登陆,请先登陆!");
			return "login";
		}
		if(appealId==null||price_t==null||"".equals(appealId)||"".equals(price_t)){
			request.setAttribute("error", "请输入金额");
			return "forward:appeal";
		}
		boolean boo = appealService.checkSupport(appealId);
		if(!boo){
			request.setAttribute("error", "该求助项目已经下线,不能再捐款");
			return "forward:appeal";
		}
		DonorRecord donorRecord = new DonorRecord();
		Appeal appeal = new Appeal();
		appeal.setId(Integer.valueOf(appealId));
		donorRecord.setAppeal(appeal);
		String order = UUID.randomUUID().toString().replaceAll("-", "");
		donorRecord.setOrderNumber(order);
		
		donorRecord.setDonor(user);
		donorRecord.setComments("未付款");
		donorRecord.setDonorState(0);
		donorRecord.setDonorDate(new Date());
		donorRecord.setDonorMoney(Double.valueOf(price_t));
		//调用Service 加入到数据库中
		donorRecordService.insertDonorRecord(donorRecord);
		request.setAttribute("appealId", order);
		request.setAttribute("price_t", price_t);
		return "front_page/pay";
	}
	/**
	 * 支付方法
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping(value="/payment",method=RequestMethod.POST)
	public String payment(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		Properties props = new Properties();
		props.load(this.getClass().getClassLoader().getResourceAsStream("payment.properties"));
		/*
		 * 1. 准备13个参数
		 */
		String p0_Cmd = "Buy";//业务类型，固定值Buy
		String p1_MerId = props.getProperty("p1_MerId");//商号编码，在易宝的唯一标识
		String p2_Order = req.getParameter("appealId");//订单编码
		String p3_Amt = "0.01";//"0.01";req.getParameter("price_t")//支付金额
		String p4_Cur = "CNY";//交易币种，固定值CNY
		String p5_Pid = ""+UUID.randomUUID().toString();//商品名称
		String p6_Pcat = ""+UUID.randomUUID().toString();//商品种类
		String p7_Pdesc = ""+UUID.randomUUID().toString();//商品描述
		String p8_Url = props.getProperty("p8_Url");//在支付成功后，易宝会访问这个地址。
		String p9_SAF = "";//送货地址
		String pa_MP = "";//扩展信息
		String pd_FrpId = req.getParameter("yh");//支付通道
		String pr_NeedResponse = "1";//应答机制，固定值1
		
		/*
		 * 2. 计算hmac
		 * 需要13个参数
		 * 需要keyValue
		 * 需要加密算法
		 */
		String keyValue = props.getProperty("keyValue");
		String hmac = PaymentUtil.buildHmac(p0_Cmd, p1_MerId, p2_Order, p3_Amt,
				p4_Cur, p5_Pid, p6_Pcat, p7_Pdesc, p8_Url, p9_SAF, pa_MP,
				pd_FrpId, pr_NeedResponse, keyValue);
		
		/*
		 * 3. 重定向到易宝的支付网关
		 */
		StringBuilder sb = new StringBuilder("https://www.yeepay.com/app-merchant-proxy/node");
		sb.append("?").append("p0_Cmd=").append(p0_Cmd);
		sb.append("&").append("p1_MerId=").append(p1_MerId);
		sb.append("&").append("p2_Order=").append(p2_Order);
		sb.append("&").append("p3_Amt=").append(p3_Amt);
		sb.append("&").append("p4_Cur=").append(p4_Cur);
		sb.append("&").append("p5_Pid=").append(p5_Pid);
		sb.append("&").append("p6_Pcat=").append(p6_Pcat);
		sb.append("&").append("p7_Pdesc=").append(p7_Pdesc);
		sb.append("&").append("p8_Url=").append(p8_Url);
		sb.append("&").append("p9_SAF=").append(p9_SAF);
		sb.append("&").append("pa_MP=").append(pa_MP);
		sb.append("&").append("pd_FrpId=").append(pd_FrpId);
		sb.append("&").append("pr_NeedResponse=").append(pr_NeedResponse);
		sb.append("&").append("hmac=").append(hmac);
		resp.sendRedirect(sb.toString());
		return null;
	}
	
	/**
	 * 回馈方法
	 * 当支付成功时，易宝会访问这里
	 * 用两种方法访问：
	 * 1. 引导用户的浏览器重定向(如果用户关闭了浏览器，就不能访问这里了)
	 * 2. 易宝的服务器会使用点对点通讯的方法访问这个方法。（必须回馈success，不然易宝服务器会一直调用这个方法）
	 * req.setAttribute("code", "success");
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping("/back")
	public String back(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		/*
		 * 1. 获取12个参数
		 */
		String p1_MerId = req.getParameter("p1_MerId");
		String r0_Cmd = req.getParameter("r0_Cmd");
		String r1_Code = req.getParameter("r1_Code");
		String r2_TrxId = req.getParameter("r2_TrxId");
		String r3_Amt = req.getParameter("r3_Amt");
		String r4_Cur = req.getParameter("r4_Cur");
		String r5_Pid = req.getParameter("r5_Pid");
		String r6_Order = req.getParameter("r6_Order");
		String r7_Uid = req.getParameter("r7_Uid");
		String r8_MP = req.getParameter("r8_MP");
		String r9_BType = req.getParameter("r9_BType");
		String hmac = req.getParameter("hmac");
		/*
		 * 2. 获取keyValue
		 */
		Properties props = new Properties();
		props.load(this.getClass().getClassLoader().getResourceAsStream("payment.properties"));
		String keyValue = props.getProperty("keyValue");
		/*
		 * 3. 调用PaymentUtil的校验方法来校验调用者的身份
		 *   >如果校验失败：保存错误信息，转发到msg.jsp
		 *   >如果校验通过：
		 *     * 判断访问的方法是重定向还是点对点，如果要是重定向
		 *     修改订单状态，保存成功信息，转发到msg.jsp
		 *     * 如果是点对点：修改订单状态，返回success
		 */
		boolean bool = PaymentUtil.verifyCallback(hmac, p1_MerId, r0_Cmd, r1_Code, r2_TrxId,
				r3_Amt, r4_Cur, r5_Pid, r6_Order, r7_Uid, r8_MP, r9_BType,
				keyValue);
		if(!bool) {
			req.setAttribute("code", "error");
			req.setAttribute("msg", "无效的签名，支付失败！");
			return "message";
		}
		if(r1_Code.equals("1")) {
			DonorRecord donorRecord = new DonorRecord();
			donorRecord.setOrderNumber(r6_Order);
			donorRecord.setComments("success");
			donorRecord.setDonorState(1);
			donorRecord.setDonorDate(new Date());
			//调用Service 加入到数据库中
			donorRecordService.updateDonorRecord(donorRecord);
			if(r9_BType.equals("1")) {
				req.setAttribute("code", "success");
				req.setAttribute("msg", "恭喜，支付成功！");
				return "message";				
			} else if(r9_BType.equals("2")) {
				resp.getWriter().print("success");
			}
		}
		return null;
	}
}
