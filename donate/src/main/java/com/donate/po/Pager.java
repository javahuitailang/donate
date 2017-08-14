package com.donate.po;

import java.util.List;

/**
 * 分页
 * @author xiaoyiming
 *
 * @param <T>
 */
public class Pager<T> {
	private int pageSize = 5;// 每页显示的条数
	private int recordCount;// 总共的条数
	private int pageCurrent;// 当前页面
	private int totalPage;// 总页数
	private List<T> datas;//存放的数据
	
	private String url;//存放请求路径

	/**
	 * 设置总页数
	 */
	private void setTotalPage() {
		this.totalPage = recordCount % pageSize == 0 ? recordCount / pageSize
				: recordCount / pageSize + 1;
	}
	/**
	 * @return 总共的页
	 */
	public int getTotalPage() {
		setTotalPage();
		return totalPage;
	}
	/**
	 * @return 每页显示的条数
	 */
	public int getPageSize() {
		return pageSize;
	}
	/**
	 * 每页显示的条数,默认 5;
	 */
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	/**
	 * @return 总共的条数
	 */
	public int getRecordCount() {
		return recordCount;
	}
	/**
	 * 总共的条数
	 */
	public void setRecordCount(int recordCount) {
		this.recordCount = recordCount;
	}
	/**
	 * @return 当前页面
	 */
	public int getPageCurrent() {
		return pageCurrent;
	}
	/**
	 * 当前页面 
	 */
	public void setPageCurrent(int pageCurrent) {
		this.pageCurrent = pageCurrent;
	}
	/**
	 * @return 存放的数据
	 */
	public List<T> getDatas() {
		return datas;
	}
	/**
	 * 设置参数
	 * @param dates
	 */
	public void setDatas(List<T> datas) {
		this.datas = datas;
	}
	/**
	 * 获得请求方法
	 * @return
	 */
	public String getUrl() {
		return url;
	}
	/**
	 * 获得请求方法
	 */
	public void setUrl(String url) {
		this.url = url;
	}
	@Override
	public String toString() {
		return "PageBean [pageSize=" + pageSize + ", recordCount="
				+ recordCount + ", pageCurrent=" + pageCurrent + ", totalPage="
				+ totalPage + ", datas=" + datas + ", url=" + url+"]";
	}



}
