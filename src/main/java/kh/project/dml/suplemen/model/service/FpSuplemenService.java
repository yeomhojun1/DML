package kh.project.dml.suplemen.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.project.dml.suplemen.model.dao.FpSuplemenDao;
import kh.project.dml.suplemen.model.vo.FpSuplemenVo;



public interface FpSuplemenService {

	
	
	
	public List<FpSuplemenVo> selectList();
	
	public FpSuplemenVo selectOne(int suplemenno);
	
	public int insert(FpSuplemenVo vo);
	
	public int update(FpSuplemenVo vo);
	
	public int delete(int suplemenno);
}
