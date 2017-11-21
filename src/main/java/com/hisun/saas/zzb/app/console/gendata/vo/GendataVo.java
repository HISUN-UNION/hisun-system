package com.hisun.saas.zzb.app.console.gendata.vo;

import com.aspose.slides.Collections.Generic.List;
import com.hisun.saas.zzb.app.console.gbtj.vo.GbtjVo;
import com.hisun.saas.zzb.app.console.shpc.vo.ShpcVo;

/**
 * Created by zhouying on 2017/9/16.
 */
public class GendataVo {

    public static String SHPC_DATA="SHPC";
    public static String GBTJ_DATA="GBTJ";
    public static String GBMC_DATA="GBMC";

    private String id;
    private String path;
    private List<ShpcVo> shpcVoList;
    private List<GbtjVo> gbtjVoList;
    private int isCurrentPacket;
    private String isCurrentPacketValue;
    private String createTimeValue;

    public int getIsCurrentPacket() {
        return isCurrentPacket;
    }

    public void setIsCurrentPacket(int isCurrentPacket) {
        this.isCurrentPacket = isCurrentPacket;
    }

    public String getIsCurrentPacketValue() {
        if(this.isCurrentPacket==0){
            return "非当前数据包";
        }else if(this.isCurrentPacket==1){
            return "当前数据包";
        }
        return "";
    }

    public void setIsCurrentPacketValue(String isCurrentPacketValue) {
        this.isCurrentPacketValue = isCurrentPacketValue;
    }

    public static String getShpcData() {
        return SHPC_DATA;
    }

    public static void setShpcData(String shpcData) {
        SHPC_DATA = shpcData;
    }

    public static String getGbtjData() {
        return GBTJ_DATA;
    }

    public static void setGbtjData(String gbtjData) {
        GBTJ_DATA = gbtjData;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public List<ShpcVo> getShpcVoList() {
        return shpcVoList;
    }

    public void setShpcVoList(List<ShpcVo> shpcVoList) {
        this.shpcVoList = shpcVoList;
    }

    public List<GbtjVo> getGbtjVoList() {
        return gbtjVoList;
    }

    public void setGbtjVoList(List<GbtjVo> gbtjVoList) {
        this.gbtjVoList = gbtjVoList;
    }

    public String getCreateTimeValue() {
        return createTimeValue;
    }

    public void setCreateTimeValue(String createTimeValue) {
        this.createTimeValue = createTimeValue;
    }
}
