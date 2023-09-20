package kh.project.dml.suplemenid.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.project.dml.suplemenid.model.dao.FpSuplemenIdDao;
import kh.project.dml.suplemenid.model.vo.FpSuplemenIdVo;



public interface FpSuplemenIdService {

	
	
	
	public List<FpSuplemenIdVo> selectList();
	
	public FpSuplemenIdVo selectOne(int suplemenno);
	
	public int insert(FpSuplemenIdVo vo);
	
	public int update(FpSuplemenIdVo vo);
	
	public int delete(int suplemenno);
}
