package com.hisun.saas.zzb.app.console.gbmc.entity;

import com.hisun.saas.sys.tenant.tenant.entity.TenantEntity;
import com.hisun.util.StringUtils;
import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

/**
 * Created by zhouying on 2017/9/8.
 */
@Entity
@Table(name = "APP_MC_B01")
public class GbMcB01 extends TenantEntity implements Serializable {

    public static int DISPLAY=0;
    public static int HIDDEN=1;


    @Id
    @GenericGenerator(name = "generator", strategy = "uuid.hex")
    @GeneratedValue(generator = "generator")
    @Column(name = "ID", nullable = false, unique = true, length = 32)
    private String id;
    @ManyToOne(optional = true, fetch = FetchType.LAZY)
    @JoinColumn(name = "mc_id")
    private GbMc gbMc;
    @Column(name = "b0101", length = 255)
    private String b0101;
    @Column(name = "px")
    private int px;
    @Column(name = "is_display")
    private int isDisplay=DISPLAY;

    @OneToMany(mappedBy = "gbMcB01", fetch = FetchType.LAZY)
    @Cascade({org.hibernate.annotations.CascadeType.ALL})
    private List<GbMcA01> gbMcA01s;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }


    public String getB0101() {
        return b0101;
    }

    public void setB0101(String b0101) {
        this.b0101 = b0101;
    }

    public int getPx() {
        return px;
    }

    public void setPx(int px) {
        this.px = px;
    }

    public GbMc getGbMc() {
        return gbMc;
    }

    public void setGbMc(GbMc gbMc) {
        this.gbMc = gbMc;
    }

    public List<GbMcA01> getGbMcA01s() {
        return gbMcA01s;
    }

    public void setGbMcA01s(List<GbMcA01> gbMcA01s) {
        this.gbMcA01s = gbMcA01s;
    }

    public int getIsDisplay() {
        return isDisplay;
    }

    public void setIsDisplay(int isDisplay) {
        this.isDisplay = isDisplay;
    }

    public String toInsertSql(){
        StringBuffer sb = new StringBuffer("");
        sb.append(" INSERT INTO ");
        sb.append(" app_mc_b01 ");
        sb.append("(");
        sb.append("id");
        sb.append(",b0101");
        sb.append(",mc_id");
        sb.append(",px");
        sb.append(")");
        sb.append(" VALUES");
        sb.append("(");
        sb.append("'"+ StringUtils.transNull(id)+"'");
        sb.append(",'"+ StringUtils.transNull(b0101)+"'");
        sb.append(",'"+ StringUtils.transNull(gbMc.getId())+"'");
        sb.append(","+px);
        sb.append(")");
        return sb.toString();
    }
}
