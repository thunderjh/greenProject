package com.spring.client.mission.common.vo;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.springframework.web.multipart.MultipartFile;


public class FileUploadUtil {

	// 업로드 할 폴더 생성
	public static void makeDir(String docRoot) {
		File fileDir = new File(docRoot);
		if (fileDir.exists())
			return;

		fileDir.mkdirs();
	}

	// 파일 업로드
	public static String fileUpload(MultipartFile file, String fileName) throws IOException {
		String real_name = null;
		String org_name = file.getOriginalFilename(); // 클라이언트가 업로드한 파일

		// 파일명 변경
		if (org_name != null && (!org_name.equals(""))) {
			real_name = fileName + "_" + System.currentTimeMillis() + "_" + org_name;

			String docRoot = "C://uploadStorage//" + fileName;
			makeDir(docRoot); // 폴더생성

			File fileAdd = new File(docRoot + "/" + real_name);

			file.transferTo(fileAdd); // 파일 업로드 처리
		}

		return real_name; // DB로 저장할 파일 명
	}

	// 썸네일 생성
	public static String makeThumbnail(String fileName) throws Exception {
		String dirName = fileName.substring(0, fileName.indexOf("_"));

		String imgPath = "C://uploadStorage//" + dirName;

		File fileAdd = new File(imgPath, fileName);

		BufferedImage sourceImg = ImageIO.read(fileAdd); //  데이터로 저장
		BufferedImage destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, 133); 
		//크기 조정 후 저장
																												
		String thumbnailName = "thumbnail_" + fileName;
		String docRoot = imgPath + "/thumbnail";
		makeDir(docRoot);

		File newFile = new File(docRoot, thumbnailName);
		String formatName = fileName.substring(fileName.lastIndexOf(".") + 1); // jpg

		ImageIO.write(destImg, formatName, newFile); // 파일에 저장(크기, 확장자타입, 파일경로)

		return thumbnailName; // 썸네일 파일명 반환

	}

	// 파일 삭제
	public static void fileDelete(String fileName) throws IOException {
		boolean result = false;
		String startDirName = "", docRoot = "";
		String dirName = fileName.substring(0, fileName.indexOf("_"));

		if (dirName.equals("thumbnail")) {
			startDirName = fileName.substring(dirName.length() + 1, fileName.indexOf("_", dirName.length() + 1));
			docRoot = "C://uploadStorage//" + startDirName + "//" + dirName;
		} else {
			docRoot = "C://uploadStorage//" + dirName;
		}

		File fileDelete = new File(docRoot + "/" + fileName);

		if (fileDelete.exists() && fileDelete.isFile()) {
			result = fileDelete.delete();
		}

	}

}
