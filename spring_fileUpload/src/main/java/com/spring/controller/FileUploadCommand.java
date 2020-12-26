package com.spring.controller;

import org.springframework.web.multipart.MultipartFile;

public class FileUploadCommand {
	
	private String title;
	private MultipartFile file;
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	@Override
	public String toString() {
		return "FileUploadCommand [title=" + title + ", file=" + file + "]";
	}
	
}
