package com.spring.utils;

import java.awt.image.BufferedImage;
import java.io.File;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.FileCopyUtils;

public class UploadFileUtils {

	private static final Logger logger = LoggerFactory.getLogger(UploadFileUtils.class);

	// uploadFile저장
	public static String uploadFile(String uploadPath, String originalName, byte[] fileData) throws Exception {

		// 중복파일명 해결
		UUID uid = UUID.randomUUID();
		String saveName = uid.toString().replace("-", "") + "_" + originalName;

		// 저장경로
		String savePath = calcPath(uploadPath); // uploadPath\년\월\일

		// 저장
		File target = new File(uploadPath + savePath, saveName);
		FileCopyUtils.copy(fileData, target);

		logger.info("saved path : " + target.getAbsolutePath());

		// 썸네일 이미지/파일
		String thumbFileName = null;
		String formatName = originalName.substring(originalName.lastIndexOf(".") + 1);

		if (MediaUtils.getMediaType(formatName) != null) {// image file
			// 썸네일 형태로 보여주기
			thumbFileName = makeThumbnail(uploadPath, savePath, saveName);
		} else { // not image file
			// 텍스트 형태로 보여주기
			thumbFileName = makeIcon(uploadPath, savePath, saveName);
		}

		return thumbFileName;
	}

	public static String calcPath(String uploadPath) throws Exception {
		Calendar cal = Calendar.getInstance();

		String yearPath = File.separator+cal.get(Calendar.YEAR);
		String monthPath = yearPath+File.separator+
				new DecimalFormat("00").format(cal.get(Calendar.MONTH)+1);
		String dataPath = monthPath+File.separator+
				new DecimalFormat("00").format(cal.get(Calendar.DATE));

		//String dataPath = new SimpleDateFormat(File.separator+"yyyy"+File.separator+"MM"+File.separator+"dd").format(new Date());

		File file = new File(uploadPath + dataPath);
		if (!file.exists()) {
			file.mkdirs();
		}
		logger.info(dataPath);

		return dataPath;
	}
	
	// 썸네일 형태
	public static String makeThumbnail(String uploadPath, String path, String fileName) throws Exception {

		BufferedImage sourceImg = ImageIO.read(new File(uploadPath + path, fileName));

		BufferedImage destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, 100);

		String thumbName = uploadPath + path + File.separator + "s_" + fileName;
		File newFile = new File(thumbName);
		String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);

		ImageIO.write(destImg, formatName.toUpperCase(), newFile);

		return thumbName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}
	
	// 아이콘 형태
	public static String makeIcon(String uploadPath, String path, String fileName) throws Exception {
		String iconName = uploadPath + path + File.separator + fileName;

		return iconName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}
}

