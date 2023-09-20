package kh.project.dml.nutrient.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.project.dml.nutrient.model.dao.FpNntruentDao;
import kh.project.dml.nutrient.model.vo.FpNntruentVo;



public interface FpNntruentService {

	
	
	
	public List<FpNntruentVo> selectList();
	
	public FpNntruentVo selectOne(int nutrientId);
	
	public int insert(FpNntruentVo vo);
	
	public int update(FpNntruentVo vo);
	
	public int delete(int nutrientId);
}
