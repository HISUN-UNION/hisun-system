package com.hisun.saas.zzb.app.console.gendata.service;

import com.hisun.base.service.BaseService;
import com.hisun.saas.zzb.app.console.gendata.entity.Gendata;

import java.io.File;
import java.util.Map;

/**
 * Created by zhouying on 2017/9/16.
 */
public interface GendataService extends BaseService<Gendata,String>{

   public static String DATA_PATH = File.separator+"appdata"+File.separator;
   public static String IMG_PATH=File.separator+"img"+File.separator;
   public static String APP_IMG_PATH="img/";
   public static String ATTS_PATH=File.separator+"atts"+File.separator;
   public static String APP_ATTS_PATH="atts/";
   public static String DB_PATH=File.separator+"db"+File.separator;
   public static String APP_DB_PATH="db/";
   public static String SQLITE_DB_NAME="zzb-app.db";
   public static String DATA_PACKET_NAME="zzb-app-android";


   String saveAppData(Gendata gendata,Map<String,String> selectedMap) throws Exception;

   String saveAppInitData(Gendata gendata) throws Exception;

   String saveAppDataFromAnotherAppData(Gendata newPacket,Map<String,String> selectedMap,
                                          Gendata oldPacket,Map<String,String> selectedMapFromOldPacket)throws Exception;


}
