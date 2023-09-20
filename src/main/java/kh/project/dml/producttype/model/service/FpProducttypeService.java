package kh.project.dml.producttype.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.project.dml.producttype.model.dao.FpProducttypeDao;
import kh.project.dml.producttype.model.vo.FpProducttypeVo;


public interface FpProducttypeService {

	
	
	
	public List<FpProducttypeVo> selectList();
	
	public FpProducttypeVo selectOne(String type);
	
	public int insert(FpProducttypeVo vo);
	
	public int update(FpProducttypeVo vo);
	
	public int delete(String type);
}
