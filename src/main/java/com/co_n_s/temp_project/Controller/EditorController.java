package com.co_n_s.temp_project.Controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

public class EditorController {
	@RequestMapping(value = "/resources/ckeimgUpload", method = RequestMethod.GET)
	public void resourcesckeimgUploadimgUpload(HttpServletRequest request, HttpServletResponse response, @RequestParam MultipartFile upload) {
		
		OutputStream out = null;
		PrintWriter printWriter = null;
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
			
		try {
			
			String fileName = upload.getOriginalFilename();
			byte[] bytes = upload.getBytes();
			//저장경로 에 파일이름 들어갈 코드로 썻는데 해봐야암
			String uploadPath = request.getSession().getServletContext().getRealPath("/")+"/resources/ckeimgUpload";    
			out = new FileOutputStream(new File(uploadPath + fileName));
			out.write(bytes);
			String callback = request.getParameter("CKEditorFuncNum");
			
			
			printWriter = response.getWriter();
			String fileUrl=request.getContextPath()+"/resources/ckeimgUpload/"+fileName;
			System.out.println(fileUrl);
			//이미지를 writer 폼안에 넣는거
			printWriter.println("<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction("
					+ callback
					+ ",'"
					+ fileUrl
					+ "',' 이미지를 업로드하였습니다.'"
					+ ")</script>");
			printWriter.flush();
			//에러잡는터취
		}catch(IOException e) {
			e.printStackTrace();
		}finally {
			try {
				if(out != null) {
					out.close();
				}
				if(printWriter != null) {
					printWriter.close();
				}
			}catch(IOException e) {
				e.printStackTrace();
			}
	}
		return;
	}
}
