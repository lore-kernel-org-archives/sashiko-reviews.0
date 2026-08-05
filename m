Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 795213EAC84
	for <sashiko-reviews@lists.linux.dev>; Wed,  5 Aug 2026 09:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785921705; cv=none; b=PtNHymXjrNweJI9h2mz7c0izpQRczklguN23qOjlX6ExfCGKz6t6uE7nKSHMCJ05dPeeMGAMOfzFrE2c2YMyGqKdwNqUrod+25BnAKYTDIJnlK8MfTubwLEWxIihBE1G+ZpatgLc7N6B8+8jKHHAyB/2j5DaAHlBid53q3oOMzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785921705; c=relaxed/simple;
	bh=06GM06RMXNj1CMZ/fuLjt/+XEZVnfkbqtv78k0uCzag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TuP876GGibak0Fqy1JRF0Xo7SaCZzz6iruyIxDID6GFwAgsS3UQ78v9SxdvNqVSbjCpQpB9VVlQ4v9et94CnbNrJ2rlHwCJ4v2ezC+nhyNjUZOYvBi1qncjHDcsNw/z12TAMgHOzRPuPSeTxA4wteNlgErau+g+iyPWxI/sFf1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N65bEnVL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W+WyQuh0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N65bEnVL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W+WyQuh0"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6758dZMM1713196
	for <sashiko-reviews@lists.linux.dev>; Wed, 5 Aug 2026 09:21:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	17gNOg/IJCDj1TVREVlKHTlpRu+kYYeF1zlXTMH9cdM=; b=N65bEnVLCN0IgCtr
	do/8ey41FYb0KPQrPb/cl/uXZPlPSNcXXmeXM4JjtAGv0D3g8qSXCre+zZQ60kUY
	+ivAbGgcMCAdrh1sp29sbh/Z5ulWH8VRfRskvBOsnHA2XN2SSLVdWlmEj4Ut5f2M
	e4qWfK7TXNrgbMayD5N+aiaXrhUJdV/JQg8EKJh5ZLkB/7fjq/pg/ulWopJNOdcU
	2K+ufSwkVBk1xmbGWpIbDCI2Klpknne+HCY/mpCT6t5t7Ibv0gzGU7+yKd909cdi
	P95Fgczv8THNnDvpQIqsz51ujYQdi+mgbIKrjNOeiMRfpYJNr32vG+Dt7b2lUmSD
	EduKPw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fuwbqsc6h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 05 Aug 2026 09:21:43 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84859a64079so1452086b3a.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 05 Aug 2026 02:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785921703; x=1786526503; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=17gNOg/IJCDj1TVREVlKHTlpRu+kYYeF1zlXTMH9cdM=;
        b=W+WyQuh0dxDda4Ld63Rl4xgEfbBDOOH9O1i4rPWgVIZdTSb4nat/Bfldr37g0DjJx9
         LwPwcDI5lTg55He5QHke9X4K5xtSR43N4V22pGGTya4eHjHygla0ps52wc9fIQAW4gkg
         3eHAXLLrtpJ7GHBuqIpY5X6bV0zHa56FcwakllvvZ/giuWAjk2YslL3YHt8dRAP0AxuL
         PtzhycLQ6wHyFw+g1QfDdOBAl+BIrlnVmkMLUkDLPuZN6J1YiwKTtcsK544OUj6sMebX
         5AFzZvWpzBIKJWR6D8xi6dVcafB7Xsmch3Nc0vURFCpoH/0djd3foAheAihFV/Fjn+45
         +s/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785921703; x=1786526503;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=17gNOg/IJCDj1TVREVlKHTlpRu+kYYeF1zlXTMH9cdM=;
        b=GCiiaR+TxaM1evS1ByhpVnOtGjZ2avM0DKRuexfg1wR6NScONx2ERJBYXxWNohwjAH
         Js5i+hfYFEdd31wgysjvJLRzi4vcI4XZUkpjts5HF+Vv0UrmOAnLH2VsP9Zj0DRb57av
         77K5qyYorTGYR0VlHihqctfmFdHIO80lg2yN2Nv9JsVVDeWFBaCXwCi/Rcv8k61wuOIq
         ZEnjo1uh/Y3CrREG0pshvHeLmuln8QgyBJqXH+s9SzVG666FCKa2KtFg6+zSRgCZ+ZzH
         Wk32z+zfKXd9ftdmrbTLO1hfWeXXdOymKWJGbTjpsTgvRAzlbscO0to/laiHSnyZ6Csz
         XBvw==
X-Gm-Message-State: AOJu0YygCLWEbji0yPVTn0bNa2J51blZ9/bM0A5OaYv75OmjhIN272rL
	DpjmuKbj2ve7U8aTvGh+3l9PXxQHLFLUEoqukRleCgXLEz/1I3dMPHGF0u7GFJD6yzyW9bSOS9i
	sfq3n43choG7kdI0S/jBXXI3Rv4oODfP9gMYuvuaXIGrsxwQ8lRHJIjK4qtrHXJCvSioHxVrMni
	JZbYM=
X-Gm-Gg: AR+sD11AH0eLRuLwdNAExAe2e/sbgiQ7wSM02lkX3oq8c9urWXa9zi7jR5BH7x3x8td
	9EGjPm3X6n+DtDBn+a24VtZTQoi64faxKGwnNdSxZO83K2tjE1NlQTGXHWXHUeSHeYNKzYu9FnZ
	4bykzornqq1EjlCe7duLDDY0kptIcFmylaIRd9a7A+ZpA57XsyVGCR6MzXLgMUTXqh3zrD3hhbH
	Ex13OcD6d5Ca0O/M3hgnpqHr1iDrKGJdiHe4EImAPNtlBPfNBPrpucheVtED9lq8k/WC3Klm4Bq
	nkdMw9M1B49MqGlLSsXJiHY269oKuh3wO4dIcc1HdKYYQ1kKRy+dvmhh8/5nvuR1ojN14M1YajT
	i+o8nIlB8jwtPSZ0ifTg5BUG6opgn6lRbH+vPkECa+CdjDkY=
X-Received: by 2002:a05:6a20:a10a:b0:3c4:3ada:384d with SMTP id adf61e73a8af0-3cb85f42d97mr5462053637.30.1785921702791;
        Wed, 05 Aug 2026 02:21:42 -0700 (PDT)
X-Received: by 2002:a05:6a20:a10a:b0:3c4:3ada:384d with SMTP id adf61e73a8af0-3cb85f42d97mr5461999637.30.1785921702278;
        Wed, 05 Aug 2026 02:21:42 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe70928ba2sm1169429a12.29.2026.08.05.02.21.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 02:21:41 -0700 (PDT)
Date: Wed, 5 Aug 2026 02:21:39 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org,
        conor+dt@kernel.org, olteanv@gmail.com
Subject: Re: [PATCH v8 2/6] phy: qcom: qmp-pcie: Add QMP PCIe Multi-PHY driver
Message-ID: <anMAo+DNmtbAvKyf@hu-qianyu-lv.qualcomm.com>
References: <20260730-glymur_linkmode_0731-v8-0-a455265ad8bf@oss.qualcomm.com>
 <20260730-glymur_linkmode_0731-v8-2-a455265ad8bf@oss.qualcomm.com>
 <20260731052639.81FF61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260731052639.81FF61F000E9@smtp.kernel.org>
X-Proofpoint-ORIG-GUID: eqSQbdJRvs-i5V8HI495KTdYol_Zh829
X-Authority-Analysis: v=2.4 cv=B+uJFutM c=1 sm=1 tr=0 ts=6a7300a7 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=seLki_t14JjGgSYVy8sA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-GUID: eqSQbdJRvs-i5V8HI495KTdYol_Zh829
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDA3MyBTYWx0ZWRfX/JR8oop4xtOO
 DMmfwvgIXW/wvOPpIuQZr8se4qxQf7tQh012fUEVhLuX7G349foMv8xdbu5NAk+xlmfJpO0DVrj
 uyypE1CxXzRpUDBGzHeZ3RuDkGeSDa8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDA3MyBTYWx0ZWRfX+P5N5ZJElNHO
 51WZhwzK/1A+8TC1jIiNLwfvqzFnkFq2EFvztIdvSc/pVjFEwBYzOWjBT2AznkVQZdryHzF8zsk
 a4ID4X4CiMkWNVlk55NY6bRciniKnaHQJBEYCAghT59oM1FqshXefmxZjWKSFsa/XQJ2st6z0Vc
 lvwpResVANdYShvC0mACgMNUEn8hbXIZah5h5+Bz+5KT/IFw3YauCVgVD6QJJSK+vYVmtSqdn7e
 fLxagTjpbZj0u70JL5frzysRJnlBe14friMQKcXqBy3k1LGXrm1q4vYde96SauZJsMeoQ3OYY9v
 r04LRqJc4npeZmy9pFxzAGvEkZ1E70Jx5Vf7b4GoWvpTyLFe719CdDoBHQoWTyamgIlJYxD0eNO
 N+eluDCroHvRwpPxzjMCgjPfC3F/aBJR4RyRvLdBgG7Vy4iYy8GYj5n1ZIQd2GXLPtHwmXxrCMS
 Wffplhoqr35dcBVZJug==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_03,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050073

On Fri, Jul 31, 2026 at 05:26:39AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] Asynchronous pm_runtime_put() during PHY power off leaves hardware powered on if device is removed.
> - [Medium] Unchecked return value of of_property_count_strings() leads to massive allocation attempt and incorrect error masking.
> --
> 
> --- Patch [2]: [PATCH v8 2/6] phy: qcom: qmp-pcie: Add QMP PCIe Multi-PHY driver ---
> commit 512c48acf91e02b02ae430362c2348d1ce2fb525
> Author: Qiang Yu <qiang.yu@oss.qualcomm.com>
> 
> phy: qcom: qmp-pcie: Add QMP PCIe Multi-PHY driver
> 
> This patch introduces a dedicated QMP PCIe PHY driver for hardware blocks
> that support multiple link topologies. It reads the current link mode from
> the hardware and instantiates the necessary sub-PHYs, inheriting firmware
> configurations.
> 
> > diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie-multiphy.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie-multiphy.c
> > new file mode 100644
> > index 0000000000000..739c7c96aeed6
> > --- /dev/null
> > +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie-multiphy.c
> [ ... ]
> > +static int qmp_pcie_pd_power_on(struct qmp_pcie *qmp)
> > +{
> > +	const struct qmp_phy_cfg *cfg = qmp->cfg;
> > +	int i, ret;
> > +
> > +	for (i = 0; i < cfg->num_pds; i++) {
> > +		ret = pm_runtime_resume_and_get(qmp->pd_devs[i]);
> > +		if (ret < 0) {
> > +			dev_err(qmp->dev, "failed to power on %s domain: %d\n",
> > +				cfg->pd_names[i], ret);
> > +			goto err_power_off;
> > +		}
> > +	}
> > +
> > +	return 0;
> > +
> > +err_power_off:
> > +	while (--i >= 0)
> > +		pm_runtime_put(qmp->pd_devs[i]);
> 
> [Severity: Medium]
> Will using an asynchronous pm_runtime_put() here (and in 
> qmp_pcie_pd_power_off) race with device unbind?
> 
> If the PHY provider unbinds, device links will cause the consumer to unbind
> first, which calls phy_power_off() and phy_exit(), queuing an asynchronous
> suspend. The PHY provider's devres cleanup then calls dev_pm_domain_detach(),
> which executes pm_runtime_disable() and cancels the pending suspend.
> 
> Does this leave the hardware powered on? Should pm_runtime_put_sync() be used
> instead to ensure the hardware powers down before the domain detaches?

This driver has no .remove callback so there's no unbind path for
qmp_pcie_pd_power_off()'s async put to race with. And even if
dev_pm_domain_detach is somehow called. qmp_pcie_pd_detach()'s
dev_pm_domain_detach(dev, true) handles any still-pending async request
internally (pm_runtime_disable() → __pm_runtime_barrier()).

> 
> > +
> > +	return ret;
> > +}
> > +
> > +static void qmp_pcie_pd_power_off(struct qmp_pcie *qmp)
> > +{
> > +	const struct qmp_phy_cfg *cfg = qmp->cfg;
> > +	int i;
> > +
> > +	for (i = cfg->num_pds - 1; i >= 0; i--)
> > +		pm_runtime_put(qmp->pd_devs[i]);
> 
> [Severity: Medium]
> As mentioned above, can this asynchronous put race with the devres teardown
> during removal?
> 
> > +}
> [ ... ]
> > +static int qmp_pcie_multiphy_register_clocks(struct device *dev,
> > +					      struct device_node *np,
> > +					      struct qmp_pcie_multiphy *qmp_data)
> > +{
> > +	int num_pipe_outputs;
> > +	int i, ret;
> > +
> > +	num_pipe_outputs = of_property_count_strings(np, "clock-output-names");
> > +
> > +	qmp_data->num_pipe_outputs = num_pipe_outputs;
> > +	qmp_data->pipe_out_clks = devm_kcalloc(dev, num_pipe_outputs,
> > +					       sizeof(*qmp_data->pipe_out_clks),
> > +					       GFP_KERNEL);
> 
> [Severity: Medium]
> Does this code properly handle missing or malformed device tree properties?
> 
> If "clock-output-names" is missing, of_property_count_strings() will return
> a negative error code (e.g., -EINVAL). This negative value is passed as the
> count parameter to devm_kcalloc(), underflowing into a massive size_t. 
> 
> While the internal size_mul checks in the allocator safely return NULL, this
> causes the driver to fail probe with -ENOMEM rather than the actual device
> tree parsing error. Should num_pipe_outputs be checked for a negative value
> before attempting the allocation?

As Konrad commented, clock-output-names is required via bindings, so the
check is not required.

- Qiang Yu

> 
> > +	if (!qmp_data->pipe_out_clks)
> > +		return -ENOMEM;
> > +
> > +	for (i = 0; i < num_pipe_outputs; i++) {
> > +		ret = __phy_pipe_clk_register(dev, np, i,
> > +					      &qmp_data->pipe_out_clks[i]);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	return devm_of_clk_add_hw_provider(dev, qmp_pcie_multiphy_clk_hw_get, qmp_data);
> > +}
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260730-glymur_linkmode_0731-v8-0-a455265ad8bf@oss.qualcomm.com?part=2
