package com.hisun.saas.zzb.app.console.shpc.entity;

import com.google.common.collect.Lists;
import com.hisun.saas.sys.tenant.tenant.entity.TenantEntity;
import com.hisun.saas.zzb.app.console.shtp.entity.Shtp;
import com.hisun.util.StringUtils;
import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by zhouying on 2017/9/8.
 */
@Entity
@Table(name="APP_SH_PC")
public class Shpc extends TenantEntity implements Serializable{

    public static String SHLX_BWH="1";
    public static String SHLX_CWH="2";

    @Id
    @GenericGenerator(name="generator",strategy="uuid.hex")
    @GeneratedValue(generator="generator")
    @Column(name="ID",nullable=false,unique=true,length=32)
    private String id;
    @Column(name = "PC_MC",length = 255)
    private String pcmc;
    @Column(name = "SHLX",length = 1)
    private String shlx=SHLX_BWH;
    @Column(name = "PC_SJ")
    @Temporal(TemporalType.TIMESTAMP)
    private Date pcsj;
    @Column(name = "file_path")
    private String filePath;
    @Column(name = "sh_zt")//0-未上会，1-已上会
    private int shZt;

    @OneToMany(mappedBy="shpc",fetch= FetchType.LAZY)
    @Cascade({org.hibernate.annotations.CascadeType.ALL})
    private List<Sha01> sha01s;

    @OneToMany(mappedBy="shpc",fetch= FetchType.LAZY)
    @Cascade({org.hibernate.annotations.CascadeType.ALL})
    private List<Shtp> shtps;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPcmc() {
        return pcmc;
    }

    public void setPcmc(String pcmc) {
        this.pcmc = pcmc;
    }

    public String getShlx() {
        return shlx;
    }

    public void setShlx(String shlx) {
        this.shlx = shlx;
    }

    public Date getPcsj() {
        return pcsj;
    }

    public void setPcsj(Date pcsj) {
        this.pcsj = pcsj;
    }

    public List<Sha01> getSha01s() {
        return sha01s;
    }

    public void setSha01s(List<Sha01> sha01s) {
        this.sha01s = sha01s;
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }

    public List<Shtp> getShtps() {
        return shtps;
    }

    public void setShtps(List<Shtp> shtps) {
        this.shtps = shtps;
    }

    public int getShZt() {
        return shZt;
    }

    public void setShZt(int shZt) {
        this.shZt = shZt;
    }

    public String toInsertSql(){
        StringBuffer sb = new StringBuffer("");
        sb.append(" INSERT INTO ");
        sb.append(" APP_SH_PC ");
        sb.append("(");
        sb.append("ID");
        sb.append(",PC_MC");
        sb.append(",SHLX");
        sb.append(",PC_SJ");
        sb.append(",sh_zt");
        sb.append(")");
        sb.append(" VALUES");
        sb.append("(");
        sb.append("'"+ StringUtils.transNull(id)+"'");
        sb.append(",'"+ StringUtils.transNull(pcmc)+"'");
        sb.append(",'"+ StringUtils.transNull(shlx)+"'");
        if(pcsj!=null){
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            sb.append(",'"+ df.format(pcsj)+"'");
        }else{
            sb.append(",''");
        }
        sb.append(",'"+ shZt+"'");
        sb.append(")");
        return sb.toString();
    }
}
