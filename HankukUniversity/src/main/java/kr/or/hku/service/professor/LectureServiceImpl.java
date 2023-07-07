package kr.or.hku.service.professor;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.hku.mapper.professor.LectureMapper;
import kr.or.hku.vo.CollegeVO;
import kr.or.hku.vo.DepartmentVO;
import kr.or.hku.vo.FacilitiesVO;
import kr.or.hku.vo.FacilityVO;
import kr.or.hku.vo.SubjectVO;

@Service
public class LectureServiceImpl implements ILectureService {

	@Autowired
	private LectureMapper lectureMapper;
	
	@Override
	public List<SubjectVO> getSubjectList() {
		return lectureMapper.getSubjectList();
	}
	@Override
	public List<CollegeVO> getCollegeList() {
		return lectureMapper.getCollegeList();
	}
	
	@Override
	public List<DepartmentVO> getDeptList(String college) {
		return lectureMapper.getDeptList(college);
	}
	@Override
	public List<SubjectVO> selSubject(String deptNm) {
		return lectureMapper.selSubject(deptNm);
	}
	@Override
	public List<SubjectVO> getcolSubject(String college) {
		// TODO Auto-generated method stub
		return  lectureMapper.getcolSubject(college);
	}
	@Override
	public Map<String, List<?>> getListMap(String college) {
		Map<String, List<?>> myMap = new HashMap<String, List<?>>();
		myMap.put("colSubject", lectureMapper.getcolSubject(college));
		myMap.put("dept",  lectureMapper.getDeptList(college));
		return myMap;
	}
	
	@Override
	public List<FacilityVO> getFlctList() {
		return lectureMapper.getFlctList();
	}
	
//	@Override
//	public List<FacilitiesVO> getFlctsList() {
//	}
	@Override
	public Map<String, List<?>> getTimeTable(String flct) {
		Map<String, List<?>> myMap = new HashMap<String, List<?>>();
		myMap.put("flcts",  lectureMapper.getFlctsList(flct));
		return myMap;
	}
}