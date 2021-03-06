package com.hisun.saas.zzb.app.console.aset.entity;

import com.hisun.saas.sys.tenant.tenant.entity.TenantEntity;
import com.hisun.saas.zzb.app.console.zscx.entity.AppZscxZsA01;
import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

/**
 * Created by zhouying on 2017/11/28.
 */
@Entity
@Table(name = "app_aset_a01_query")
public class AppAsetA01Query extends TenantEntity implements Serializable {
    public final static int DISPLAY =1;
    public final static int HIDDEN =0;
    @Id
    @GenericGenerator(name = "generator", strategy = "uuid.hex")
    @GeneratedValue(generator = "generator")
    @Column(name = "id", nullable = false, unique = true, length = 32)
    private String id;
    @Column(name = "query_name")
    private String queryName;
    @Lob
    @Basic(fetch = FetchType.LAZY)
    @Column(name = "query_condition",columnDefinition = "TEXT",nullable = true)
    private String queryCondition;
    @Lob
    @Basic(fetch = FetchType.LAZY)
    @Column(name = "query_json",columnDefinition = "TEXT",nullable = true)
    private String queryJson;
    @Column(name = "query_sort")
    private int querySort;
    @Column(name = "is_display")
    private int isDisplay=HIDDEN;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getQueryName() {
        return queryName;
    }

    public void setQueryName(String queryName) {
        this.queryName = queryName;
    }

    public String getQueryCondition() {
        return queryCondition;
    }

    public void setQueryCondition(String queryCondition) {
        this.queryCondition = queryCondition;
    }

    public String getQueryJson() {
        return queryJson;
    }

    public void setQueryJson(String queryJson) {
        this.queryJson = queryJson;
    }

    public int getQuerySort() {
        return querySort;
    }

    public void setQuerySort(int querySort) {
        this.querySort = querySort;
    }

    public int getIsDisplay() {
        return isDisplay;
    }

    public void setIsDisplay(int isDisplay) {
        this.isDisplay = isDisplay;
    }
}
