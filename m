Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F7F35836A
	for <sashiko-reviews@lists.linux.dev>; Mon,  8 Jun 2026 05:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780897140; cv=none; b=jNLK2g9omO9WBQEymaLETwfMhG8xKe8wGz5KnJnWbok1kI3rs4A9blff05LSGdkWpDVLgrQYOLDIdGUn5Lj99S9swPcCkNnRP+Xm+RZHvxJhK0esyGuiRICyQZJOv5I/64GPZctYZhY3LGR5cTcjlhGmtE662BdtKE+qqx/0br4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780897140; c=relaxed/simple;
	bh=AAydjUIWlTTNwmK5Mm0q6RFad2xRnZcIP+BIQ7JFdwo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=EbPsoUS2+UzHHn4HJc2xZdjsyniaspBzswAjxf/2qk7VVXmwmxpY5vtEXGcS7aAB398Ph8fl+EM1eFRJ3Rb0oZbCPHjr1h+Z3tPDQo03AB1M4WMQ7qIJzwbv65aYFytZRrFaD4xU4ZU8KN2ibnvwzhFx4MZA6uuA+sxQz3KqxRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nj8MXlzn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b+XiYFYf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nj8MXlzn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b+XiYFYf"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6580GHNh2027023
	for <sashiko-reviews@lists.linux.dev>; Mon, 8 Jun 2026 05:38:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VBn6EGEU9bZPva+oRSW1+IX1E71RxLh+Lv7xp4tZnkY=; b=nj8MXlznGLk0jPY0
	88jv19EM9sYbkbNbi3q137LdJ0CXPJDp4nugN9KneZo6Lkjb7OJk1NVP+CtokcOz
	pAyOj9I1WaPC/Ih3CbPWP40MKenDTcZVN15k7wMt/V0FWBRQilBfrqN69A+BLRka
	s/MHPOVfbl3NI9FX1Vk3/2bxyAJ7bNgx6nQs6uoB5L2JjjOCiKeUtnmwHcmfUVWc
	qKG08FCuyLAE2hFfX3WIpgdTy5RqYX67TkzNSwSZsvw6CzRtknURkS7iaXtz9pVj
	q7j8u8XsSBjSN41UNS2ju3jJGA45hFiAMJ1HuPfG0ZKigq7YyiordVLkYnDfYZuJ
	7usm4Q==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emaj4xa0g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Mon, 08 Jun 2026 05:38:58 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c860544c077so4095274a12.3
        for <sashiko-reviews@lists.linux.dev>; Sun, 07 Jun 2026 22:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780897137; x=1781501937; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VBn6EGEU9bZPva+oRSW1+IX1E71RxLh+Lv7xp4tZnkY=;
        b=b+XiYFYfuIve61EWr7L023XwLu8TdVPr82POrKCQ73jXQHwi+VhyKIoV3QSXaJAtDM
         UJuOufh/BOCwJ0DNse003cCkW9ixVFyaRA8TSPOUv2sjm/ZeqeKHLq/p68Rq4muzAaP8
         XDx57IlEY2rNK3o4RjKrLEsCyyEHiLeYZukO4/Zz9KfsrwmfF4BHccMWSuH0we/JHgfe
         Ve5mK8dutafN8VRRLTYmvOfppD7bKqFmZLjAvtamYmIrNsGoNExpi679/q+Il54mpGyq
         t+GEB71o0GDpNzZpkxBxc+8N7DbIlNjJrBqj0j5x0MGM7c+gYSYdNCp0EbQRauvUrS7U
         TP8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780897137; x=1781501937;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VBn6EGEU9bZPva+oRSW1+IX1E71RxLh+Lv7xp4tZnkY=;
        b=m0sNj5t1TuGXetCC75WObPN3zLS1o9nrxgdPhvBSDF6JbVOA9EKbTbPlaOGCLEXMHl
         Xq7Qnu7B8Kl/bPyAN/VpizaixnNQzuwhpXnFZLUUQL6ph0E3Ymrht1zLov1zqAvty/9f
         iDpOtUvzCRAWRzMbjZDimdkonzuy0yFOR9qWE1sj4VAyseqSE2Gwkk+XbKCcEo30eHqs
         839J27zCYJS/iG0BnJE5s5w0HicREUtueXk4xXzDMrYRBqpGjV0CEP2koiGdIeY/eh1C
         oVG1nD0Iu1mRf5TuT2ojHi0gXPf+bkiTPDxxAnElhNe33zMbbZd8AqdMdFYxU5xsIB0m
         TiBg==
X-Forwarded-Encrypted: i=1; AFNElJ/FdC7J1xmI5VMSmY3NBNy5PE/VbsOacEv1zkij4txvQBjYTvSa44yk+YaRSzc1tkGJp7h4neS1kdbYgWR8b9Q=@lists.linux.dev
X-Gm-Message-State: AOJu0YzJavf+cWgRGCe/wOGiDSKFL/0GVfIB0g90FGD5x8tzhyXW4S3m
	XNUNzlQTGSd57B+P+U5U3xBa4z8e4GzWgOFOPhxVN6Xa3SeWsxZkVEMZTiD3PSx3PKBM1V/1h9g
	j2m1xMKPMLMJ80TMWw5FljfBCEztebzxdqGIhngpjkbYvApVp4CsGd7Wt/Vhoee9Z/xNvOGM=
X-Gm-Gg: Acq92OECflZBBteTGWTLlZWWVx6LOf1CLspYGgc4MxqsXXMpfvtBSJyi979QI4GNYKY
	a3NHbIz/gzgFwnh+9XNMeZiPXgMCpTSIZLVaC48krTVBZf/Jt35fYGkjTu51JRhOem93eHdalMd
	1V40H2HgEsk5vmtG2y1FtoO8UntW+sU1IyO1uwv3iyCf3G6MAUip5hFYxrJnA1HNKls/P8KntnB
	M1BtIAPVOO0oQd1EFt0WXU5f7eeHf2VvUP4AQBGg2DmP1YerKNOkW6fvZ2fFSt43P/NSM7S1cKi
	A18OcTWhCI56UBBd6f4+wx0mUr/wP9WpSNaVjsGiIre47xNpftBsHSow+SUTyzwGbt2pfSAKNkW
	XNmMyaFLeyM+bXOPa7MNKDJAcwGK0UytMeBoPOhC0c896RTmWoLdCQSgSO/mgiqVf
X-Received: by 2002:a05:6a00:1d8e:b0:842:6099:c55c with SMTP id d2e1a72fcca58-842b0d82a44mr13654959b3a.3.1780897137455;
        Sun, 07 Jun 2026 22:38:57 -0700 (PDT)
X-Received: by 2002:a05:6a00:1d8e:b0:842:6099:c55c with SMTP id d2e1a72fcca58-842b0d82a44mr13654936b3a.3.1780897136914;
        Sun, 07 Jun 2026 22:38:56 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828e02f9sm16718331b3a.48.2026.06.07.22.38.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Jun 2026 22:38:56 -0700 (PDT)
Message-ID: <e51033f1-8923-ab8f-d911-ffea73d15b29@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 11:08:52 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v7 06/12] media: iris: Replace enum-indexed clock and
 power domain tables with per-block structures
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, robh@kernel.org
References: <20260603-glymur-v7-6-afaa55d11fe0@oss.qualcomm.com>
 <20260603143718.A65981F00893@smtp.kernel.org>
 <h64x7lp43zd6ktit7t4slxlr4fprqtlaijzslpeqtxpyd6gar4@kadh2diinpmg>
Content-Language: en-US
In-Reply-To: <h64x7lp43zd6ktit7t4slxlr4fprqtlaijzslpeqtxpyd6gar4@kadh2diinpmg>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: IjlhM1urlKf2w3mfiDILVIPQ4IkYvFWB
X-Proofpoint-GUID: IjlhM1urlKf2w3mfiDILVIPQ4IkYvFWB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA0OSBTYWx0ZWRfX/h3zwEJh+zOS
 D5PKa75yvJD+VSny46paqo5J52eI541Nf2ptbXCaypK6nFXfjzqzbG/4v7odg9mraJ+6T4ZnBpD
 gmvQ4+pYZcQeabMQzLktazLE6NQCuOgSNDEqGf97VnnQ5j30m8MdZ2p+2aBLWbShnkQjs0k1x5a
 RIN2ACdIgfD/wMn3IKeuVe5s1WsTerMv/ojIbvBR8hXSb/lkYpjJ6wW6XpzjZIbr9E0zP1M64+V
 KvSzA4RRZb61cojWq7TzMrfFUtpuZLBzzV6wKhEFDAEYqJyn/NygMV+246t60mZvbRarqDufe3b
 34w54cR2V/DfGoW99Uyz0ISP2wn9tIaF5M4ktFgcygM2iAAqC6C7QiqkOP7Cw7/NZthwQCjoEt2
 wpHWritvAjtUXgegIRtvH6z+ZYffwA+TgV2KY6gEKYI0M4+W9ZegAhx09LOLzGS5ceVlp6PGyQ5
 oL3Ys6YO9BrDBwCRCtQ==
X-Authority-Analysis: v=2.4 cv=TLh1jVla c=1 sm=1 tr=0 ts=6a265572 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=o_a0ztKt6M1vlsVVC2EA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_01,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 phishscore=0 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080049


On 6/8/2026 3:14 AM, Dmitry Baryshkov wrote:
> On Wed, Jun 03, 2026 at 02:37:18PM +0000, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 7 potential issue(s) to consider:
>>
>> New issues:
>> - [High] Uninitialized stack pointer dereference when a hardware block has 0 power domains.
>> - [High] Secondary hardware cores are left unpowered due to missing iteration over `num_cores`.
>> - [High] NULL pointer dereference when optional hardware blocks are enabled in hardware but missing from platform data.
>> - [High] Premature OPP voltage drop causes DVFS sequence violation.
>> - [High] Uninitialized fields in `struct dev_pm_domain_attach_data` result in arbitrary behavior.
>> - [Medium] API mismatch silently discards additional power domains if `pd_cnt > 1`.
>>
>> Pre-existing issues:
>> - [High] Resource leak of Runtime PM usage counter and OPP rate on error path.
>> --
>>
>> commit 569dbace99d0eb806398e44f1f3dd0f46e77e155
>> Author: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>>
>> media: iris: Replace enum-indexed clock and power domain tables with per-block structures
>>
>> This patch replaces flat, enum-indexed tables for clocks and power domains with 
>> per-hardware block structures in the iris driver. It groups devices, power 
>> domains, and clocks together logically in the iris_power_domain struct, and 
>> removes index lookups at runtime.
>>
>>> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
>>> index c2dcb50a27824..681db1da9559a 100644
>>> --- a/drivers/media/platform/qcom/iris/iris_probe.c
>>> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
>>> @@ -39,15 +39,32 @@ static int iris_init_icc(struct iris_core *core)
>>>  	return devm_of_icc_bulk_get(core->dev, core->icc_count, core->icc_tbl);
>>>  }
>>>  
>>> -static int iris_init_power_domains(struct iris_core *core)
>>> +static int iris_init_power_domains_per_block(struct iris_core *core,
>>> +					     struct iris_power_domain *pd,
>>> +					     const struct iris_power_domain_data *pd_data)
>>>  {
>>> +	struct dev_pm_domain_attach_data iris_pd_data;
>> [Severity: High]
>> Does this leave fields in iris_pd_data uninitialized? Since it's allocated on the
>> stack without zero-initialization, any fields added to struct
>> dev_pm_domain_attach_data (like link_flags) could contain stack garbage when
>> passed to devm_pm_domain_attach_list().
> A simple '= {};' would have saved you.

Thanks, will use this.

>>> +	struct dev_pm_domain_list *pmdomain_tbl;
>>>  	int ret;
>>>  
>>> +	iris_pd_data.pd_names = pd_data->pd_names;
>>> +	iris_pd_data.num_pd_names = pd_data->pd_cnt;
>>> +	iris_pd_data.pd_flags = PD_FLAG_NO_DEV_LINK;
>>> +
>>> +	ret = devm_pm_domain_attach_list(core->dev, &iris_pd_data, &pmdomain_tbl);
>>> +	if (ret < 0)
>>> +		return ret;
>>> +
>>> +	pd->dev = pmdomain_tbl->pd_devs[0];
>> [Severity: High]
>> If pd_data->pd_cnt is 0, devm_pm_domain_attach_list() returns 0 but does not
>> modify pmdomain_tbl. Does this result in an uninitialized pointer dereference
>> when accessing pmdomain_tbl->pd_devs[0]?
>>
>> [Severity: Medium]
>> Also, if the platform data specifies multiple power domains (pd_cnt > 1), does
>> this logic silently discard all but the first power domain? Since
>> PD_FLAG_NO_DEV_LINK is used, the driver has to power them on manually, which
>> means secondary domains might never be powered on.
> Indeed, both seem to be correct.

For pd_cnt = 0: Will add a guard to return early before accessing pmdomain_tbl.

For pd_cnt > 1: All current platforms will 1 pd_cnt only. Support for multiple
managed domains will be added when needed.

>>> +
>>> +	return 0;
>>> +}
>> [ ... ]
>>> diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/media/platform/qcom/iris/iris_resources.c
>>> index 773f6548370a2..fdc6eb68e5c78 100644
>>> --- a/drivers/media/platform/qcom/iris/iris_resources.c
>>> +++ b/drivers/media/platform/qcom/iris/iris_resources.c
>> [ ... ]
>>> @@ -70,7 +69,7 @@ int iris_opp_set_rate(struct device *dev, unsigned long freq)
>>>  	return dev_pm_opp_set_opp(dev, opp);
>>>  }
>>>  
>>> -int iris_enable_power_domains(struct iris_core *core, struct device *pd_dev)
>>> +int iris_enable_power_domain_and_clocks(struct iris_core *core, struct iris_power_domain *pd)
>>>  {
>>>  	int ret;
>>>  
>>> @@ -78,66 +77,20 @@ int iris_enable_power_domains(struct iris_core *core, struct device *pd_dev)
>>>  	if (ret)
>>>  		return ret;
>>>  
>>> -	ret = pm_runtime_get_sync(pd_dev);
>>> +	ret = pm_runtime_get_sync(pd->dev);
>>>  	if (ret < 0)
>>>  		return ret;
>>>  
>> [Severity: High]
>> This is a pre-existing issue, but does this error path permanently leak the
>> runtime PM usage counter and leave the global core device forced to its highest
>> performance state? If pm_runtime_get_sync() fails, there is no
>> pm_runtime_put_noidle() or iris_opp_set_rate(core->dev, 0) called before
>> returning.
> I think I saw patches fixing this.

Yes, You are correct.

>>> -	return ret;
>>> -}
>>> -
>>> -int iris_disable_power_domains(struct iris_core *core, struct device *pd_dev)
>>> -{
>>> -	int ret;
>>> -
>>> -	ret = iris_opp_set_rate(core->dev, 0);
>>> +	ret = clk_bulk_prepare_enable(pd->clk_cnt, pd->clocks);
>>>  	if (ret)
>>> -		return ret;
>>> -
>>> -	pm_runtime_put_sync(pd_dev);
>>> -
>>> -	return 0;
>>> -}
>>> +		pm_runtime_put_sync(pd->dev);
>>>  
>>> -static struct clk *iris_get_clk_by_type(struct iris_core *core, enum platform_clk_type clk_type)
>>> -{
>> [ ... ]
>>> +	return ret;
>>>  }
>>>  
>>> -int iris_disable_unprepare_clock(struct iris_core *core, enum platform_clk_type clk_type)
>>> +void iris_disable_power_domain_and_clocks(struct iris_core *core, struct iris_power_domain *pd)
>>>  {
>>> -	struct clk *clock;
>>> -
>>> -	clock = iris_get_clk_by_type(core, clk_type);
>>> -	if (!clock)
>>> -		return -EINVAL;
>>> -
>>> -	clk_disable_unprepare(clock);
>>> -
>>> -	return 0;
>>> +	clk_bulk_disable_unprepare(pd->clk_cnt, pd->clocks);
>>> +	iris_opp_set_rate(core->dev, 0);
>>> +	pm_runtime_put_sync(pd->dev);
>>>  }
>> [Severity: High]
>> Could dropping the OPP rate to 0 inside a block-specific helper cause issues?
>> If multiple blocks are being torn down (for example, in
>> iris_vpu4x_power_off_hardware() which shuts down VPP1, VPP0, then VCODEC), this
>> would instantly drop the global controller OPP to 0 when the first block is
>> disabled, while other blocks' clocks are still running. Does this violate DVFS
>> constraints?
> Yes. iris_opp_set_rate() should not be called from a per-domain
> functions.
>

iris_opp_set_rate(0) sets all associated clocks to their lowest rate and drops
the RPMHPD level to low simultaneously. By the time the first block's helper
calls it, no clocks remain at a higher rate.

