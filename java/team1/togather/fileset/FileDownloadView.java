package team1.togather.fileset;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

public class FileDownloadView extends AbstractView {
	public FileDownloadView() {
		setContentType("application/download; charset=utf-8");
	}
	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception { //String의 경우에는 String s = StreamUtils.copyToString(InputStream , StandardCharsets.UTF_8 );
			File file =(File)model.get("downloadFile");
			
			response.setContentType(getContentType());
			response.setContentLength((int)file.length());
			String value = "attachment; filename="+java.net.URLEncoder.encode(file.getName(), "utf-8") + ";";
			response.setHeader("content-Disposition", value);
			response.setHeader("Centent-Transfer-Encoding", "binary");
			
			OutputStream os = response.getOutputStream();
			FileInputStream fis = null;
			try {
				fis = new FileInputStream(file);
				FileCopyUtils.copy(fis, os);
				os.flush();
			}catch(IOException ie) {
				ie.printStackTrace();
			}finally {
				try {
					if(fis != null) fis.close();
					if(os!=null)os.close();
				}catch(IOException ie) {
					ie.printStackTrace();
				}
			}
	}

}
