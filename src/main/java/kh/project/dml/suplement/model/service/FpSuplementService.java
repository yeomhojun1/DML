package kh.project.dml.suplement.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.project.dml.suplement.model.dao.FpSuplementDao;
import kh.project.dml.suplement.model.vo.FpSuplementVo;



public interface FpSuplementService {

	
	
	
	public List<FpSuplementVo> selectList();
	
	public FpSuplementVo selectOne(int suplemenno);
	
	public int insert(FpSuplementVo vo);
	
	public int update(FpSuplementVo vo);
	
	public int delete(int suplemenno);
}
