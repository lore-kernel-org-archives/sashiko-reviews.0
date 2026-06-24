Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE6434676F
	for <sashiko-reviews@lists.linux.dev>; Wed, 24 Jun 2026 13:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782307958; cv=none; b=gn/OM7B0k2QlNcF+bSOHMxLtVhAW8i7l0Fn2XZeRMgYPm0NqtD3tB+e2nus1zUtvtHMP4PrkfA6zpPlyhXY4BdHEtM+wC5C647JJH3flR5I6+07pHOysv8AgWAhJOHYKIubSILBT5CXjLX53caOtOU9CXPG6+R1BeOu1TOc9w4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782307958; c=relaxed/simple;
	bh=omwyuqulGFGHWQeeHx5ij2yog4yrYPZqWTkWqeld3S8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MaEePYEKdZw0cB1ub4AHvMNJBmXI+50idcb34uglozC4cjIev+noLwYSAU2ajBDaKtkrWFUjCg1U6eU3NI7UUAbu/2QsFj3Cbc8a8BzDSlw1cbjlBbsowyQR5pCOcqJm1D3ntr/himLA10DKmnA0o2X1/ovO4h+wqEqI610lznc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WZ4t5G6u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AaHXc3Eg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WZ4t5G6u";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AaHXc3Eg"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OANUKs2582973
	for <sashiko-reviews@lists.linux.dev>; Wed, 24 Jun 2026 13:32:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dgs9noh+aVMYmMVI+RiZ548pHFrtQba3o3tk53GSo6k=; b=WZ4t5G6ukBEor6jW
	Ti7uDiJOoY0Fx4/D9vcg4oUOoEh+31mpxDiCC4gG3Ifq0IklBiSif6yGccNOHXsE
	LIzKYk152+ObLrTxvt79LqZUEXjzCauSJI9PjVlmpIeQCK7kYFDKDu8wsSV6595S
	pDBqcAZVY3Tp1SYroMKkBZzkwj067vLl8Huy3WgIZRU2XBC8ybEAeg2ZM6mCn3YZ
	/SLWedBJzbRch6WvT2i+4gzNTuJ6z6TYieyiGNYRhzJI+P2KsMCdkwHM6RrgWJwg
	dYe4mc1yqNSFkSpiykPmD1zVYHEmK56Uy6zEeFHgaC4WFJfx2T052aAbsVambpyH
	mT5akQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f00evbacc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 24 Jun 2026 13:32:36 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-37de6edd915so722901a91.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 24 Jun 2026 06:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782307956; x=1782912756; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Dgs9noh+aVMYmMVI+RiZ548pHFrtQba3o3tk53GSo6k=;
        b=AaHXc3EgPGhbHOZZ5yVJIpqKQzFibVwHoBAcL2dmD9yxTEQ8+9jhic3K4jyPvBsbxo
         fXxhrNpKRD+FtYeThAYNf7RVYmgnlT2CQFFYw2bfepvxIASmacZ/6F0r6E501SGJcXzb
         CrjrwwfPeCZjyok80cGsaTXLbGxj1jnMIFgflKYVe3gspCqrv+vdcx0kFpewCP9iX3F7
         mHp/E+B8YQn7tOSnGjdq4q2gKT70qZnYUdCYZegqgneWZ8L2A+z4Ya9oY1uSg+7HpMiV
         VET1LC02wPw7Uhlx/MokOrEZyvDtzQ+38nHen6rXFnC468tYrE26w6NM8GAPFkiyeiqe
         h+yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782307956; x=1782912756;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dgs9noh+aVMYmMVI+RiZ548pHFrtQba3o3tk53GSo6k=;
        b=pOd0dL7BzWpoVTXWfqlAbLPqr5S0wnoo+NENEublKfr9pBroVFJEaEmyTkr7IQgMLv
         wwqERLObVTTPi/YV2+p1JdUBr5tg83IyYWVh8SdN5gPFC0hx5hdczkLTE8/qyQ3Kugbt
         u56g9hrOO+n8SGXJsOiIEWag5RiJxDWRAhm7SjZDPVGvu7raLoFA1NVAcPXJ6kzyda8M
         yj/gX8yyeNp2est8x4gXa1WV8tUAWPO8kp3pO5caaLfCB4Bh5D/CGcTSma9RbT8v3xar
         H9FNhYcnXVyU56uoJZHqLscoOr0rOp4enH7QAOTLUlOZFUyFQIKjyUsQq+EH2EjisC8u
         kYhA==
X-Gm-Message-State: AOJu0Yz9/wB7FUQrq5JE8S6p2Q3m1Rc8S3KBsGcrG0QDJBJtpBatZGSZ
	AvmLkgVb2iWeKhGXaJ6rSTIYRp47JT+toZBBJ9Gb4U7ffugGyMvQJWtDjMx04UK7iDHhhqwaDoG
	iuJ6C3Ng6CGF9FJHqf6dRY+nS3xIwkNZWFJtGwuWE75i7gpUP5oWzbXeTdWY+cuF7eKcmalSyZ8
	sOEbw=
X-Gm-Gg: AfdE7cmGVt49TYNRFe2UUx3nUUu7cYMI8pF6bGqLNVHZ0rTFyVqM7We2nczXTwqJE8R
	0wsjJNOjbmDm2U5L9QBh7sXNPFLOEegQQnbM2U7n6UZlJVWs/4wQJUeatZYpHFhKpWw8Q6tLnax
	IbCuil/fJ3ahKbCFcoU9ebu5SHZM/do1btui1UU4Nq/iMfqQraiDRyy5+sEJ29I8gWKZAik1KqP
	1ZoYGId6rTG73gJfXIL1/xcr26ejfkKw9LKt8yotEugVkW4T2+BxecjURCYORRCrED9vuaod7SW
	Gs3zuQQUj+NfnfhOmEoUTJ4VU48ScqvyMT1OwN8KMSDEWrDpxN+352rKFjrDzkrasD+HudbGzb4
	0qPCda3obH9F3pTPsgilAI4ydjFittsQBa1zPqJJ2ZME=
X-Received: by 2002:a17:90b:1807:b0:35b:9894:f6f9 with SMTP id 98e67ed59e1d1-37dd0dd1110mr9044615a91.18.1782307956211;
        Wed, 24 Jun 2026 06:32:36 -0700 (PDT)
X-Received: by 2002:a17:90b:1807:b0:35b:9894:f6f9 with SMTP id 98e67ed59e1d1-37dd0dd1110mr9044566a91.18.1782307955632;
        Wed, 24 Jun 2026 06:32:35 -0700 (PDT)
Received: from [10.218.35.45] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37de3cfc92fsm1201836a91.0.2026.06.24.06.32.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 06:32:35 -0700 (PDT)
Message-ID: <475fe567-9e0d-4710-902d-a63470813273@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 19:02:31 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] PCI: qcom: Keep PERST# GPIO state as-is during
 probe
To: sashiko-reviews@lists.linux.dev
Cc: linux-phy@lists.infradead.org, vkoul@kernel.org, neil.armstrong@linaro.org,
        linux-pci@vger.kernel.org, olteanv@gmail.com
References: <20260521-link_retain-v2-2-08ed448b081c@oss.qualcomm.com>
 <20260521134316.8B9821F000E9@smtp.kernel.org>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20260521134316.8B9821F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDExMiBTYWx0ZWRfXyyO8d61fxwHO
 oYBbYAbHGpXjmTQ8uiyuBK21FJDiYRDY/2oKxcIt/pnkqWJ7qpeD2zln7QQffTq/j5+0Bg6hLAC
 G94AUt7dIO+23HgNoXx0jgQTYoRNFXnli4mKtRyR/OU/PBZDfNNsdswZoEWsgREYtni6dY4A4Ex
 zM0GyMExxXIIMsX/q1HqHv68TplcRD9imr7MbiN4ld77eAOjjtiJ/0InmQUwM60qjX2SjIk435u
 1kJHxh2qK50ctVhRGhH44+FU6BBV+IxU3NcZluYKion2BZdIezauJdk3n6fsuRrzUE9AwEmFXZS
 dL/HGcJAt+dKcYMNA/SK9sToFIJuveOgTUeZl3rttLpJ1owFxlFrUbqjZ1D9XTJWRS2yg+4+Hov
 IXdnn/DPEr3iJNmUu05UZ1a3nMa96Wh/UAKms/M8hIwwsN/XIxg+TrYlCoCswDGhoK4G+fIKDBN
 fEpE3Cd/ZKtKojEKdbw==
X-Proofpoint-ORIG-GUID: Re78hu-M3vBI3waRm6BgRLrPFYImCHci
X-Proofpoint-GUID: Re78hu-M3vBI3waRm6BgRLrPFYImCHci
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDExMiBTYWx0ZWRfX24qUgQPjyYRU
 LA2oXy7ffS5Wu0jpVdYgujETq/mrax01Efpc6LFuyq16lOt9z8OhivTZ8L2LpGP3u0d2XSaOxp4
 VVVY7DjsniTgzNuD8xxH6ueJD+Xrr/U=
X-Authority-Analysis: v=2.4 cv=JbaMa0KV c=1 sm=1 tr=0 ts=6a3bdc74 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=N6vRwfa21d4p-6sfUasA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 suspectscore=0 adultscore=0 impostorscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606240112



On 5/21/2026 7:13 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Silent hardware control failure due to incorrect GPIO direction when using `GPIOD_ASIS`.
> --
>
> commit b4b7937282f9b2dc2dff52265ec3936b1024af9d
> Author: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>
> PCI: qcom: Keep PERST# GPIO state as-is during probe
>
> This commit changes the PERST# GPIO request to use GPIOD_ASIS instead of
> GPIOD_OUT_HIGH. This preserves the existing GPIO state configured by the
> bootloader or firmware to avoid unintentionally asserting reset during
> probe.
>
>> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
>> index af6bf5cce65be..bfe873cbf44f6 100644
>> --- a/drivers/pci/controller/dwc/pcie-qcom.c
>> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
>> @@ -1707,7 +1707,7 @@ static int qcom_pcie_parse_perst(struct qcom_pcie *pcie,
>>  		goto parse_child_node;
>>  
>>  	reset = devm_fwnode_gpiod_get(dev, of_fwnode_handle(np), "reset",
>> -				      GPIOD_OUT_HIGH, "PERST#");
>> +				      GPIOD_ASIS, "PERST#");
> [Severity: High]
> If the bootloader leaves the PERST# pin floating or as an input, will
> this cause gpiod_set_value_cansleep() to silently fail later?
>
> When using GPIOD_ASIS, if the pin was not previously configured as an
> output, GPIOD_FLAG_IS_OUT will not be set in the GPIO descriptor.
>
> Later in qcom_pcie_host_init(), the driver attempts to toggle the reset
> pin by calling gpiod_set_value_cansleep() via __qcom_pcie_perst_assert().
>
> Because gpiod_set_value_cansleep() enforces directionality, it will
> return -EPERM if the pin is not configured as an output. Since
> __qcom_pcie_perst_assert() ignores the return value of
> gpiod_set_value_cansleep(), the reset line might never actually be driven.
>
> Could this break PCIe link initialization on platforms where the
> bootloader hasn't set the GPIO direction to output?
There is pincntrl in the devicetree to make the direction OUT if bootloader
doesn't set
this pin out.

- Krishna Chaitanya.
>

