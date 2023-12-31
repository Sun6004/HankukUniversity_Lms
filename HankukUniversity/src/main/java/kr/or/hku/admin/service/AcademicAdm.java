package kr.or.hku.admin.service;

import java.util.List;

import kr.or.hku.admin.vo.AcademicChangeVO;
import kr.or.hku.admin.vo.CollegeVO;
import kr.or.hku.admin.vo.DepartmentVO;
import kr.or.hku.admin.vo.FacilityVO;
import kr.or.hku.admin.vo.NextCodeVO;
import kr.or.hku.common.vo.SearchInfoVO;
import kr.or.hku.lectureInfo.vo.SubjectVO;

public interface AcademicAdm {

	/**
	 * 전체 학과 리스트를 가져오는 메서드
	 * @고길동
	 */
	public List<DepartmentVO> selectDeptList(SearchInfoVO searchInfoVO);
	
	public int insertDept(DepartmentVO deptVO);

	public int deleteDept(String deptCd);

	public DepartmentVO selectDept(String deptCd);

	public int updateDept(DepartmentVO deptVO);

	public List<CollegeVO> colList();

	public List<FacilityVO> flctList();

	public NextCodeVO deptCdSet();

	public List<SubjectVO> selectSubjectList(SearchInfoVO searchInfoVO);

	public int insertSubject(SubjectVO subjectVO);

	public int deleteSubject(String subNo);

	public NextCodeVO subNoSet();

	public SubjectVO selectSubject(String subNo);

	public int updateSubject(SubjectVO subjectVO);

	public List<AcademicChangeVO> getAcademicAplyList();

	public int academicProccess(AcademicChangeVO academicChangeVO);

}
