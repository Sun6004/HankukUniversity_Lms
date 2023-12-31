package kr.or.hku.portal.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.hku.portal.mapper.PortalMapper;
import kr.or.hku.portal.service.PortalService;
import kr.or.hku.portal.vo.DetailNoticeVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class PortalServiceImpl implements PortalService {

	@Autowired
	private PortalMapper portalMapper;

	@Override
	public List<Map<String, String>> getAcadmicNoticeList() {
		return portalMapper.getAcadmicNoticeList();
	}

	@Override
	public List<Map<String, String>> getDeptNoticeList(String deptCd) {
		return portalMapper.getDeptNoticeList(deptCd);
	}

	@Override
	public List<Map<String, String>> getEmploymentNoticeList() {
		return portalMapper.getEmploymentNoticeList();
	}
	
	@Override
	public DetailNoticeVO getNoticeDetail(Map<String, String> paramMap) {
		portalMapper.incrementReadCnt(paramMap);
		return portalMapper.getNoticeDetail(paramMap);
	}
}
