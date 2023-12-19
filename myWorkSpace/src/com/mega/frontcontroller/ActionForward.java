package com.mega.frontcontroller;

public class ActionForward {

	// Redirect 방식으로 할건지 유무 확인 변수
	// 페이지 이동이 forward 인가? Redirect 인가?
	private boolean isRedirect;
	// 페이지 이동 경로
	private String path;

	public ActionForward() {
	}

	public ActionForward(boolean isRedirect, String path) {
		super();
		this.isRedirect = isRedirect;
		this.path = path;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public boolean isRedirect() {
		return isRedirect;
	}

	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	};
}
