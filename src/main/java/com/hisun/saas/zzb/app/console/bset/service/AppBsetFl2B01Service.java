package com.hisun.saas.zzb.app.console.bset.service;

import com.hisun.base.service.BaseService;
import com.hisun.saas.zzb.app.console.bset.entity.AppBsetFl2B01;

import javax.sql.DataSource;

/**
 * Created by zhouying on 2017/9/16.
 */
public interface AppBsetFl2B01Service extends BaseService<AppBsetFl2B01,String> {

     int saveBsetFl2B01FromYw(DataSource dataSource)throws Exception;

}