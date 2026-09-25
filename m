Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA2A4D0CF1
	for <sashiko-reviews@lists.linux.dev>; Fri, 25 Sep 2026 15:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790351299; cv=none; b=rLoyWaFuoLuEt+mn4XkPgqZbcCLWY6ROpU3Fhv/F+LAkDSOCUhGRfhOGvExkosEK64rroIu2a+jYWLDyHg+gLATxjq2mm8e14TON/w71STVxXBAKnDJ+tz5xSIZu4eq8XWe9f6PUX2tIe77OXGRz6NAJIFDWeeD5EeDGdfZTE4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790351299; c=relaxed/simple;
	bh=E6UApKjAeeqjjgPV6hxBeLGZLMyNRKBoW0DejnovXWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bBmCgIegPWsyqax7AUY6/NSWKC/6qg4ebYsmnwn7FdoDO20DHg/ddCwN/6DMA2WGfIOpfco76vexRzZG34i5Ifj3M9H91EpIhNrb2dnH5Syw64ZnvFBqewLEvVcl+WQaH7xKLlutkuJ82yW3b/suihLw7xqc7P+mQdei9ERBWq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UBYdca9t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XAr2Yqc4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UBYdca9t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XAr2Yqc4"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PBV8G3425741
	for <sashiko-reviews@lists.linux.dev>; Fri, 25 Sep 2026 15:48:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HAa88aSpF4m0kFUi9b/TWtPC
	p4mBS3ICVL49YXGHL6o=; b=UBYdca9tEP4C3BYqzKZOolTWCDauaoaFNu7I4yVA
	2yldZ8WfVua0cCmqqNa8YO2GhjSf7ydaFXRd4/dS9C4MH/HSZ765xAF6efVrQD90
	OkGGK+ve0mD9aUNWfapsqPwU6aVRU6diSHe1isR27aVeHvrzp4t8miG3typaB0p3
	eNuCSHyCyR2Sd91HnqxjWHMNhQWpM049/932E9Y/NVpnxWEhFby8yhMJsqgAJHrX
	7+L/PhcGgkvs8QtTrtOt649p0e9x1I53g47l1mujRyeTGDoEjPYfwlUov5i8dnP9
	eXEbYkq70NWVJ10Y8+DKCJoksrdg35QcUuDbaNgdDdYYTA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwr5e8wrq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Fri, 25 Sep 2026 15:48:16 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-939f3426a7cso250705385a.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 25 Sep 2026 08:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790351296; x=1790956096; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HAa88aSpF4m0kFUi9b/TWtPCp4mBS3ICVL49YXGHL6o=;
        b=XAr2Yqc4xfUj9+4JAgNODjtps2luFiiZeqB86BkZ6QgSYlCbkhQkFhYQNsxdD/Bzfi
         onhgkolD6KDS9aBbjR9KUI78mBqAbux7aSwoRTldhNMEcAeTqCXlcYt92mAej++65el8
         58TWnEcq+AypMsnaA1KeF9qJ+8VNafFw3tCPWGdyn75QTlXIx2YvAjWIEYe3KdQxMTv5
         Ur9c7TFwKnDGaEh41ETISZHJLnlqwqXnmKdtnEEQsdAxdFtUyJ/CAFeEKJ1+pBnqx3eP
         TSgHoVo/XV41KDq4YRGUjak6DzNu53Soh+vh6JOmF60UL5FAKh6hrb7rzG0ssmuakQZ3
         PC/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790351296; x=1790956096;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HAa88aSpF4m0kFUi9b/TWtPCp4mBS3ICVL49YXGHL6o=;
        b=t6kdExi7gxeONYFHqZq8ovW0aisydfXhzE+viiJ8sXlJATxGcz7M+8NfubV2lXSUFb
         71l58NclXj3mG3OZ2RrtYmgnuGDovniYO2QwBVY4fbjlBFXmROUYuZJQx/yNl0pSCdli
         p8kRtT9YimrpZ+LHa6tR8UU+w2ZJoO6DYQlTNXbL54f/9Gbh078Cs409kYzkXnyErleu
         XOc/R9mzwwT2qBFgi1mTJYkWM9jMAkI7+7OijjWg+pqsC23cg6NBFkZ8p9cA2UlwPE8t
         zUSDJCmgyoiX9DZvjDV5Pr+HzGaT2MwG9FwB52l6YcBIyJEA9/TuTs9sQAL7MhB0j987
         t7bg==
X-Gm-Message-State: AFuF++kGvVMw5j9d3phaTSJvUWe2f2ARMufw/i1OiiZKfGQXY19314aE
	ZajKW971hAUXnchuCKQTksOV0VsFLKGJd1p8TXuoJ9YK2Shx4OxrpWoBfqcd7+sYul2n6o+/tQR
	tqJ+N8/EOBF0ArnUbDw9YfqEWGo8oAXvxVBrs7Z0AUoqvbKulcrZ2tc5ygF1TOiJDSii1Gq9ena
	MzAN8=
X-Gm-Gg: AYBFou3gCIzgvOgbCn2HKzA4Haqlq1JxKlkfoV0RHQdaYWBNHHGj+ursq0epTFGw02j
	Snwr5p2/mTGfPQh1Tm7vQL5Gt64qtp//CipK/0w7BRelfYzHy5V6klmZTgwyUWcDLcBEGN9DxSl
	A13AQyyq2wFCD3QkcptW1y2JgYCPQmBIwM1Bpoel5duQDAfwLhyR4m9W+1UZTIXbOIt0M4qWf15
	GMFxm7odznOJF1deSglzyjI+H6NBjRjG8AusmTb/U+x8qHB4jEINi2bt2es7w1X6XdYaFmbNDyl
	k7NB/b6knnxmYhldIC1HfEpXaYn2GjAu/uzU0zOfuHNtoOi/lh9jTsgE+9HjwTXIY3z7HtaTEc7
	VLcirNYL653EiLms=
X-Received: by 2002:a05:620a:40cc:b0:93b:c025:8508 with SMTP id af79cd13be357-93c43b83ca4mr500335385a.8.1790351295749;
        Fri, 25 Sep 2026 08:48:15 -0700 (PDT)
X-Received: by 2002:a05:620a:40cc:b0:93b:c025:8508 with SMTP id af79cd13be357-93c43b83ca4mr500328085a.8.1790351294927;
        Fri, 25 Sep 2026 08:48:14 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a3627a8sm8907573f8f.23.2026.09.25.08.48.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 08:48:14 -0700 (PDT)
Date: Fri, 25 Sep 2026 18:48:13 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, linux-clk@vger.kernel.org, robh@kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v5 27/42] clk: qcom: gcc-x1e80100: Tie the CX power
 domain to controller
Message-ID: <yttdmfzfkzu36vg6gkoapd7q7e2anhqb7wlg3jalj2u5xiwcho@4nje2faa7uly>
References: <20260924-qcom-tie-cx-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com>
 <20260924-qcom-tie-cx-to-gcc-v5-27-38732033e5b5@oss.qualcomm.com>
 <20260924110809.244D41F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924110809.244D41F000FF@smtp.kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2MiBTYWx0ZWRfX1KKOfw7luQoV
 0p3uuCMKIrQjC2d6ATSGBiFYjhMjMMBZFVmrxcE6xJyWbFlDsSp7f5JgUDIFjNGZlcRW01Kc8DR
 lDhNoAVfbcDiVZkM+0NABzHe2YHb2VE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2MiBTYWx0ZWRfXxT0uNXwzOgoM
 TCktze06mmrErza00k5bwI57yom1pKXFp1FX9dtg74PqP7IJF7f0tEaaYFyqc9R1BjILf0TKKCH
 5byp4zZ/22c1H6sUpaOXomhTnbekbja69eEnIQgMnK/tpUPPXFgk/VzC6GcpXmOEaZsYWDs5Zhk
 HuKaakj0qnlYIvng7EsHCql8AYb/nj/K+nyebz+/vMQ5G8ndzLCOQLBG9Bpatx9TRwCLNP8e9Wz
 lA+AVO5MV54WlyKDvnYk0uzJRfk20d5bfX0ZVUuA4ioZregqmUSVn07I5IASF4w2HMSnmXAv6hz
 s0/SFYVdQ8ayCFf/+rW5s6X5ub7U35QmyoWbbha+M+FDRP9qqnVxW552I085pJ3LmPG0+mV6hVT
 4f1FPAZ1FbfuEd6n9CSVL9WWqbajYmrGUql6N3PKoPSLDdmBvwokfC4Y1cNEHf/XaAnnOHz52Me
 OuIbeC0A/GlEfYvYsEw==
X-Proofpoint-GUID: JQrtD3yHrAT_eWXekJZOpRNqZhBNMaY_
X-Proofpoint-ORIG-GUID: JQrtD3yHrAT_eWXekJZOpRNqZhBNMaY_
X-Authority-Analysis: v=2.4 cv=Hf2B3SE8 c=1 sm=1 tr=0 ts=6ab697c1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=lRdF5oBOcDA5qlmLtVEA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250062

On 26-09-24 11:08:08, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] clk: qcom: gcc-x1e80100: missing register restore after CX power down
> --
> 
> commit 4516f7fcbae3fe60975d4e2ac718022779543d8c
> Author: Abel Vesa <abel.vesa@oss.qualcomm.com>
> 
>     clk: qcom: gcc-x1e80100: Tie the CX power domain to controller
> 
> This commit enables runtime PM for the GCC controller by setting use_rpm to
> true. This allows the CX power domain to be powered down when all GCC clocks
> and GDSCs are released by their consumers.
> 
> > diff --git a/drivers/clk/qcom/gcc-x1e80100.c b/drivers/clk/qcom/gcc-x1e80100.c
> > index 9402fd7fddb8f..b979b74153774 100644
> > --- a/drivers/clk/qcom/gcc-x1e80100.c
> > +++ b/drivers/clk/qcom/gcc-x1e80100.c
> > @@ -7449,6 +7449,7 @@ static const struct qcom_cc_desc gcc_x1e80100_desc = {
> >  	.num_resets = ARRAY_SIZE(gcc_x1e80100_resets),
> >  	.gdscs = gcc_x1e80100_gdscs,
> >  	.num_gdscs = ARRAY_SIZE(gcc_x1e80100_gdscs),
> > +	.use_rpm = true,
> 
> [Severity: High]
> Will the manual register configurations performed during gcc_x1e80100_probe()
> be lost here when the CX domain collapses?
> 
> During probe, several manual register writes are made that are not tied to
> any specific clock structure:
> 
> gcc_x1e80100_probe() {
>     ...
>     qcom_branch_set_clk_en(regmap, 0x71004); /* GCC_GPU_CFG_AHB_CLK */
>     qcom_branch_set_clk_en(regmap, 0x7d01c); /* GCC_HLOS1_VOTE_AGGRE_NOC... */
>     
>     /* Clear GDSC_SLEEP_ENA_VOTE to stop votes being auto-removed in sleep. */
>     regmap_write(regmap, 0x52224, 0x0);
>     
>     /* FORCE_MEM_CORE_ON for ufs phy ice core and gcc ufs phy axi clocks  */
>     qcom_branch_set_force_mem_core(regmap, gcc_ufs_phy_ice_core_clk, true);
>     qcom_branch_set_force_mem_core(regmap, gcc_ufs_phy_axi_clk, true);
>     ...
> }
> 
> When runtime PM is enabled, the CX power domain can power down during deep
> sleep when consumers release their clocks. Since the driver has no pm
> operations to manually restore these writes upon resuming, and
> gcc_x1e80100_regmap_config does not configure a regmap cache (such as
> REGCACHE_MAPLE) to auto-restore them, won't these registers revert to their
> hardware default states on wake?
> 
> Could this cause dependent subsystems like the GPU and UFS to malfunction or
> crash after resuming from sleep?

Nope. Dropping the vote on CX does not lead to configurations done on
probe being lost on resume.
