package team1.togather.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import team1.togather.fileset.GBPath;
import team1.togather.domain.GBoardCriteria;
import team1.togather.domain.GBoard;
import team1.togather.mapper.GBoardMapper;

@Log4j
@Service
@AllArgsConstructor
public class GBoardServiceImpl implements GBoardService {
	private GBoardMapper gboardMapper;
	
	
	@Override
	public List<GBoard> gblistCri(GBoardCriteria cri) {
		return gboardMapper.gblistPageCri(cri);
	}
	@Override
	public int gbpageCount(long gseq) {
		return gboardMapper.gbpageCount(gseq);
	}
	
	@Override
	public GBoard getGBoard(long gbnum) {
		GBoard gboard = gboardMapper.selectgbnum(gbnum);
		return gboard;
	}
	
	@Override
	public void gbwrite(GBoard gboard, MultipartFile gbfiles) {
		String gbofname = gbfiles.getOriginalFilename();
		if(gbofname.length() != 0) {
			int idx = gbofname.lastIndexOf(".");
			String ofheader = gbofname.substring(0, idx);
			String ext = gbofname.substring(idx);
			long ms = System.currentTimeMillis();
			
			StringBuilder sb = new StringBuilder();
			sb.append(ofheader);
			sb.append("_");
			sb.append(ms);
			sb.append(ext);
			String gbsaveFileName = sb.toString();
			
			long gbfsize = gbfiles.getSize();
			log.info("gbofname: " + gbofname + ", gbsaveFileName" +gbsaveFileName+ ", gbfsize: " + gbfsize);
			
			boolean flag = gbwriteFile(gbfiles, gbofname);
			if(flag) {
				log.info("#그룹보드파일 업로드 성공");
			}else {
				log.info("#그룹보드파일 업로드 실패");
			}
			gboard.setGbfname(gbsaveFileName);
			gboard.setGbofname(gbofname);
			gboard.setGbfsize(gbfsize);
		}
		
		gboardMapper.gbinsert(gboard);
	}
	@Override
	public void gbedit(GBoard gboard) {
		gboardMapper.gbupdate(gboard);
	}
	@Override
	public void gbremove(long gbnum) {
		gboardMapper.gbdelete(gbnum);
	}
	
	private boolean gbwriteFile(MultipartFile gbfile, String gbsaveFileName) {
		File gbdir = new File(GBPath.GBFILE_STORE);
		if(!gbdir.exists()) gbdir.mkdirs();
		
		FileOutputStream fos = null;
		try {
			byte data[] = gbfile.getBytes();
			fos = new FileOutputStream(GBPath.GBFILE_STORE + gbsaveFileName);
			fos.write(data);
			fos.flush();
			
			return true;
		}catch(IOException ie) {
			return false;
		}finally {
			try {
				if(fos != null) fos.close();
			}catch(IOException ie) {}
		}
	}
	
	@Override
	public List<GBoard> getGBoardBySearch(Map map){
		return gboardMapper.getGBoardBySearch(map);
	}
	
	@Override
	public GBoard getGseq(long gseq) {
		GBoard gboard = gboardMapper.selectgseq(gseq);
		return gboard;
	}
	
	@Override
	public void updateGBView(Long gbnum) {
		gboardMapper.updateGBView(gbnum);
	}

}
