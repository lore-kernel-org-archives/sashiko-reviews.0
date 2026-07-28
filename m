Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 379133A873D
	for <sashiko-reviews@lists.linux.dev>; Tue, 28 Jul 2026 06:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785219903; cv=none; b=PEav9Eg6j2Ed6RsSmVbzvjPo2VdbFrlz7XSWsgLXmitLw6JzluDDoZvetkBaTdmpn/y3un2S17EOLWyR1Fcw5Edj9sM3MxxKOUVTJEPQ+J4hm+/gp4KoHScNC8YwXJ0AFJU2NMFAmj4jQjVSQTLYbyhJ/7sZpKt7RN6Nw8L5ey4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785219903; c=relaxed/simple;
	bh=3/ZO6zGkn9ru2PcIl0J3RTnmHzcjul+BnKZKqTk4mbM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oPa2/Q8xcJTk4nFGFc4skEuBTrGj865scmjWJr+V9ek8i3eynNHsqb4BUa24srkV2S1WmNfeJxVUaOWRHjkEWOFUEsGHnC3p4B94aCjcLR4WN1oRBdJmKGJLPsYVq6m+Aj5xgiq4NEqDY8s9nYxOtdhuRZk5N8QXQL/YsGhsQa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IYy8g4FW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G7g/m3jx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IYy8g4FW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G7g/m3jx"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S3apZA1673508
	for <sashiko-reviews@lists.linux.dev>; Tue, 28 Jul 2026 06:25:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6VCxAzwtFaouNE9V1I6LWmfhLkv+iNrffp5f3eT2ZMY=; b=IYy8g4FWMnJo6eqK
	NJyaKwcnSDVJBE28vMe5rK1xSuJXW5Y0IrPNUR2cDI4DfXBREHUhxvOyCC0lLxu+
	cznxhXBkq29iHmutSjw4v/cGOR/sJImTJ9uqeJd47LIblzmheKDIAKD0B2ESjy9r
	nb+b3SF08Yjrnb972TtOyM8YIDV1p5gSHF4jecY68quZwCD5Ey9IkKL2JWy7daRS
	/o3rVtP4BhO/Y4ZXeqKEzTczmjOVjKr0uu22h9ah9RN8i0lZMhxNpLvLSRu8HxTn
	AYjHjaRbTdIHUMrrQEFeeV2kJ/tSCKd6+KdyUs5ojvDD1WCPQV4a36cwE2TJBfBD
	rPcYvA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpbrstqcw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Tue, 28 Jul 2026 06:24:59 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cfe48ca1efso35379445ad.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 27 Jul 2026 23:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785219899; x=1785824699; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6VCxAzwtFaouNE9V1I6LWmfhLkv+iNrffp5f3eT2ZMY=;
        b=G7g/m3jxWn0P+VehcaiJEdrBGAxXWoZ5TSsfa/Lk9VPphmlzpTsAS81Sr98PaWt9/e
         6f3XRJ6PrgUEAehIyNgLFfCABsjfBQgpNCwRq/RMSMO38EdFzGPloY2uTISNb4Rzdwe3
         6gKT8O9PfIh+jfUU2Nw8BftYeXvNGENNEq64T9r2Ll6wBoeqlmLZ0EGTRVrRGwFxZKam
         jyYJxIaa0BXoR7trlqdfzAeC1TrkGe5Rv+iQAymcDVajDTDguluzXEkzf0NGcBZ6wtaR
         /sQgABulEy2KiMRv5ebR1zopafW3ysn2F5haPMz3+dzhPh5i3dcIpsag0MmilbRu7Y++
         e4SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785219899; x=1785824699;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6VCxAzwtFaouNE9V1I6LWmfhLkv+iNrffp5f3eT2ZMY=;
        b=fyJbm3bdKRHtfIB2K+01uSOpIfGqYGxm2EZie1bWctVka57GnE1gnDlupvCOI69MIB
         cIg3CHmQizGhjFPyDcu3oHqXEWYe/bV3XhxxUbJdOzVSAgal+UsUAOO6rsR5XqhrQ2gD
         Tllk8d+LPyE5l2ehDYkO4xLSRRyuQN9p7PfLhioiQFNubCqyBFbV6JXMmPZoJyEUfhOM
         F3LugJbD1s6GQVe5dI/x3skzfsqIkQ2ZE8mSG53DhW4rJFcmolYD9pQL7oVzf/1uxTXo
         FlB+3smzZsb4pjNocnV0AMPWKcIivNoX+PLqXIxgKESMCJ9QAwUhopw1lNqj2FbOwe8f
         j/EA==
X-Gm-Message-State: AOJu0YwWo94Xy9bGf3J1XCQtaRWdxUQ7LlbstPg+rVF0s0zjgh+L++Ju
	KKkbAvHu2Mgf40g5cRtnTAs7ec+QmH+5jafRjB9Cdd8EO4GAJsyl+HKa7l8OkXRGKQ4jdn5wcs+
	OwQ2KB0Pe7IClM2qTIhpMZcJwtUlKO9IzF3jYxSKbALk44QjJrztlm3ugu2I1abV6G5NTpvt4bW
	BOvEs=
X-Gm-Gg: AR+sD13ZBAzLtMAmyWSVmMlh4MySGyIbiebf9KZi2h+VXMdDUPY8kb1Mnm//zXRNhVh
	36jrnyxqH3B7j4Dqqkwr6D71qecNMlPUmoiIPvw2nWjjS9hCXcv0hmaPYkAHUGD3FcL9tvPYEIX
	LbS8XVNCAAiCMFKh65Qg+jXbhQhi/TzWEzOO3UfqEnY9B+UUyRag+cOq7zl7O1Gw9URFmqqFA8C
	Y3nJxGzXCscBAZELDapYBsT95J16/MWnZ4MrqFtOHG9IM/sOrgRyZlV1zTr5qIKoeXbXxV0bm0l
	aOiFvyeo1VHbhC7YEKtHmcqhuaDCE3qPk4FAAtupTQP1udnbfTNKIB8LW1Z/DAFjYqR6kIZhstB
	HLue2QR3AIUmyBDHesOOI8Jpx7PyH3Lv65Q==
X-Received: by 2002:a17:903:388d:b0:2c9:e69f:8b0f with SMTP id d9443c01a7336-2d015d01806mr12359025ad.17.1785219898802;
        Mon, 27 Jul 2026 23:24:58 -0700 (PDT)
X-Received: by 2002:a17:903:388d:b0:2c9:e69f:8b0f with SMTP id d9443c01a7336-2d015d01806mr12358775ad.17.1785219898337;
        Mon, 27 Jul 2026 23:24:58 -0700 (PDT)
Received: from [10.219.49.187] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde5fde87sm45693045ad.37.2026.07.27.23.24.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 23:24:57 -0700 (PDT)
Message-ID: <ad930b71-5c3e-4447-9888-7b5eae57eea4@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 11:54:54 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/5] pinctrl: qcom: hawi-lpass-lpi: add Hawi LPASS LPI
 TLMM
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20260724141708.2212057-1-prasad.kumpatla@oss.qualcomm.com>
 <20260724141708.2212057-6-prasad.kumpatla@oss.qualcomm.com>
 <20260724144528.9EB851F00A3A@smtp.kernel.org>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <20260724144528.9EB851F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA1NyBTYWx0ZWRfX46qdd8rWfmVO
 VEBJPjtwOilHtmqqLZ13QliMzQtsp+Hp0/nm96MwWiTebu484FPmA3Ne2rW8jnEAOqdMruDCMaH
 XXYSmRQpesXF2Cd3C8DnhNlT3ky9WWN4A9PAIThfPRV07L1qkArrHlPRGZOQYDKbxSUGFuFfEYl
 cJfTvkicGKo0wVAe6DVBKBJeDqB5bW/YuEQcj+AMJy18lbM7ebF418YUdVuTs+r39UjLXhtkO6l
 qDckTxB9i/BezNuJLPilhEERZPaqRgZJbPsuD/jZeXLJ46wXlvS4mOgcMCQ5vDOU6dDYhkNVuPF
 RqLWbF+uCKKmESF7q483G6FyRjGnrFoRft7xfwACHShjhuvDill6Pw9aXj1YtW+asonm9vM8v1v
 7QZKytYyodfosuORjkxn33wr6k8+9CxJIqBlSTh0ViHB1ePDAjCyzXTcdFbhWY0ZVR2364L0KDO
 LMf5dsKd2aVjiXE/ZwQ==
X-Proofpoint-ORIG-GUID: dwEEsrwUq7rgEddWoohEcLSQx8r7TMtP
X-Proofpoint-GUID: dwEEsrwUq7rgEddWoohEcLSQx8r7TMtP
X-Authority-Analysis: v=2.4 cv=ALkdLnG8 c=1 sm=1 tr=0 ts=6a684b3b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=sFkXs5fRGYWMjOD9uhEA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA1NyBTYWx0ZWRfX8bwDGCNAVWjD
 f6FZhfYRCUEVaBzI14itaIfAnk2LBmnJhtpZBieIP1s8kbRPefA+iuU5U+U/fkIgAlS7trEbbzD
 SQJmRblTdAOCpEnO0KEMAsHBtDwYSR4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_01,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607280057


On 7/24/2026 8:15 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>
> Pre-existing issues:
> - [High] Premature mutex destruction in the driver removal path creates a potential use-after-destroy race condition.
> --
>
> --- Patch [5]: [PATCH v6 5/5] pinctrl: qcom: hawi-lpass-lpi: add Hawi LPASS LPI TLMM ---
> commit c233c0ac41f2bc46bdca1d1c9ea5842fe1fcc867
> Author: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
>
> pinctrl: qcom: hawi-lpass-lpi: add Hawi LPASS LPI TLMM
>
> This commit adds the pin controller driver for the Low Power Audio
> SubSystem (LPASS) Low Power Island (LPI) of the Qualcomm Hawi SoC.
> The controller supports 23 GPIOs and utilizes the LPI_PINGROUP6 macro
> for certain pins due to a test_bus entry.
>
>> diff --git a/drivers/pinctrl/qcom/pinctrl-hawi-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-hawi-lpass-lpi.c
>> new file mode 100644
>> --- /dev/null
>> +++ b/drivers/pinctrl/qcom/pinctrl-hawi-lpass-lpi.c
> [ ... ]
>> +static struct platform_driver lpi_pinctrl_driver = {
>> +	.driver = {
>> +		.name = "qcom-hawi-lpass-lpi-pinctrl",
>> +		.of_match_table = lpi_pinctrl_of_match,
>> +		.pm = pm_ptr(&lpi_pinctrl_pm_ops),
>> +	},
>> +	.probe = lpi_pinctrl_probe,
>> +	.remove = lpi_pinctrl_remove,
> [Severity: High]
> This is a pre-existing issue, but I noticed a potential race condition in the
> shared removal path being used here.
>
> Can this lead to a use-after-destroy race condition when the device is
> unbound?
>
> Looking at the shared lpi_pinctrl_remove() in pinctrl-lpass-lpi.c:
>
> void lpi_pinctrl_remove(struct platform_device *pdev)
> {
> 	struct lpi_pinctrl *pctrl = platform_get_drvdata(pdev);
> 	int i;
>
> 	mutex_destroy(&pctrl->lock);
> 	...
>
> Since devres is used to manage the GPIO chip and pinctrl interfaces
> (devm_gpiochip_add_data and devm_pinctrl_register), these interfaces remain
> active until the devres release phase, which occurs after lpi_pinctrl_remove()
> returns.
>
> If a concurrent request (such as a userspace process accessing the exported
> GPIO via sysfs while unbinding) attempts to operate on the GPIOs, won't it
> try to lock this destroyed mutex before the devres cleanup has unregistered
> the interfaces?

Thanks for the review.

Yes this looks to be core LPI driver issue, Not related to Hawi pin ctrl.

Need to address this issue as a separate patch.

Thanks,
Prasad

>
>> +};
>> +
>> +module_platform_driver(lpi_pinctrl_driver);
