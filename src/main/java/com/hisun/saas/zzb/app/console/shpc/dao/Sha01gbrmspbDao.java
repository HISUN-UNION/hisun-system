package com.hisun.saas.zzb.app.console.shpc.dao;

import com.hisun.base.dao.BaseDao;
import com.hisun.saas.zzb.app.console.shpc.entity.Sha01gbrmspb;

import java.util.Map;

/**
 * Created by zhouying on 2017/9/12.
 */
public interface Sha01gbrmspbDao extends BaseDao<Sha01gbrmspb,String> {

    public String saveFromWord(Sha01gbrmspb gbrmspb , Map<String, String> wordDataMap) throws Exception;

}
