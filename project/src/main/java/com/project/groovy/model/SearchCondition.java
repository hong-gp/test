package com.project.groovy.model;

import org.springframework.web.util.UriComponentsBuilder;

public class SearchCondition {

	private Integer page = 1;
	private Integer pageSize = 10;
	private String keyword = "";
	private String optionSearch;
	private String optionCategory;
	
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	public Integer getOffset() {
		return (page - 1) * pageSize;
	}
	public SearchCondition() {
		super();
	}
	public SearchCondition(Integer page, Integer pageSize, String keyword, String optionSearch, String optionCategory) {
		super();
		this.page = page;
		this.pageSize = pageSize;
		this.keyword = keyword;
		this.optionSearch = optionSearch;
		this.optionCategory = optionCategory;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getOptionSearch() {
		return optionSearch;
	}
	public void setOptionSearch(String optionSearch) {
		this.optionSearch = optionSearch;
	}
	public String getOptionCategory() {
		return optionCategory;
	}
	public void setOptionCategory(String optionCategory) {
		this.optionCategory = optionCategory;
	}
	
	public String getQueryString(Integer page) {
		if ("".equals(keyword) || keyword == null) {
			return UriComponentsBuilder.newInstance()
					.queryParam("page", page)
					.queryParam("pageSize", pageSize).build().toString();
		}
		return UriComponentsBuilder.newInstance()
				.queryParam("page", page)
				.queryParam("pageSize", pageSize)
				.queryParam("optionSearch", optionSearch)
				.queryParam("optionCategory", optionCategory)
				.queryParam("keyword", keyword)
				.build().toString();
	}
	public String getQueryString() {
		return getQueryString(page);
	}
	@Override
	public String toString() {
		return "SearchCondition [page=" + page + ", pageSize=" + pageSize + ", keyword=" + keyword + ", optionSearch="
				+ optionSearch + ", optionCategory=" + optionCategory + "]";
	}
	
}
