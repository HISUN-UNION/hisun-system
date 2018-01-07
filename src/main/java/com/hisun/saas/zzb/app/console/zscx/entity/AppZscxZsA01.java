package com.hisun.saas.zzb.app.console.zscx.entity;

import com.hisun.saas.sys.tenant.tenant.entity.TenantEntity;
import com.hisun.saas.zzb.app.console.aset.entity.AppAsetA01;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Created by zhouying on 2017/11/28.
 */
@Entity
@Table(name = "app_zscx_zs_a01")
public class AppZscxZsA01 extends TenantEntity implements Serializable {
    @Id
    @GenericGenerator(name="generator",strategy="uuid.hex")
    @GeneratedValue(generator="generator")
    @Column(name="id",nullable=false,unique=true,length=32)
    private String id;
    @ManyToOne
    @JoinColumn(name="a01_id")
    private AppAsetA01 appAsetA01;

    @ManyToOne(optional = true,fetch = FetchType.LAZY)
    @JoinColumn(name = "zs_id")
    private AppZscxZs appZscxZs;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public AppAsetA01 getAppAsetA01() {
        return appAsetA01;
    }

    public void setAppAsetA01(AppAsetA01 appAsetA01) {
        this.appAsetA01 = appAsetA01;
    }

    public AppZscxZs getAppZscxZs() {
        return appZscxZs;
    }

    public void setAppZscxZs(AppZscxZs appZscxZs) {
        this.appZscxZs = appZscxZs;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        AppZscxZsA01 that = (AppZscxZsA01) o;

        if (id != null ? !id.equals(that.id) : that.id != null) return false;
        if (appAsetA01 != null ? !appAsetA01.equals(that.appAsetA01) : that.appAsetA01 != null) return false;
        return appZscxZs != null ? appZscxZs.equals(that.appZscxZs) : that.appZscxZs == null;

    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (appAsetA01 != null ? appAsetA01.hashCode() : 0);
        result = 31 * result + (appZscxZs != null ? appZscxZs.hashCode() : 0);
        return result;
    }
}
