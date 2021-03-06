package com.hisun.saas.zzb.app.console.gbmc.entity;

import com.hisun.saas.sys.tenant.tenant.entity.TenantEntity;
import com.hisun.util.StringUtils;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Created by zhouying on 2017/9/8.
 */
@Entity
@Table(name = "app_mc_a01_gzjl")
public class GbMcA01gzjl extends TenantEntity implements Serializable {

    @Id
    @GenericGenerator(name="generator",strategy="uuid.hex")
    @GeneratedValue(generator="generator")
    @Column(name="ID",nullable=false,unique=true,length=32)
    private String id;
    @ManyToOne(optional=true,fetch = FetchType.LAZY)
    @JoinColumn(name="APP_MC_A01_ID")
    private GbMcA01 gbMcA01;
    @Column(name = "C_SJ",length = 24)
    private String csj;
    @Column(name = "Z_SJ",length = 24)
    private String zsj;
    @Column(name = "JLSM",length = 255)//经历说明
    private String jlsm;
    @Column(name = "GZJL_PX")
    private int px;

    public GbMcA01gzjl(){

    }

    public GbMcA01gzjl(String gzjl,int px){
        this.jlsm= gzjl;
        this.px=px;
    }


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }



    public String getCsj() {
        return csj;
    }

    public void setCsj(String csj) {
        this.csj = csj;
    }

    public String getZsj() {
        return zsj;
    }

    public void setZsj(String zsj) {
        this.zsj = zsj;
    }

    public String getJlsm() {
        return jlsm;
    }

    public void setJlsm(String jlsm) {
        this.jlsm = jlsm;
    }

    public int getPx() {
        return px;
    }

    public void setPx(int px) {
        this.px = px;
    }

    public GbMcA01 getGbMcA01() {
        return gbMcA01;
    }

    public void setGbMcA01(GbMcA01 gbMcA01) {
        this.gbMcA01 = gbMcA01;
    }


}
