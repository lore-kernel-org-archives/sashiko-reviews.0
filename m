Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C5C7372075
	for <sashiko-reviews@lists.linux.dev>; Sun, 12 Jul 2026 07:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783841904; cv=none; b=Ew+T8fzoAR2iPmMOrwnjxDBYHmmjiROFiCb/OImESD89rFYRG1yiMC7vqrhFaQme+AsFFXOi4u41D3reBoNd95yMSVrg5psWWMOswxaWLOcwFkacB/CZlqT65aMhe+OEO/FUeXglFdPT5y6cial5eA0Qb17TFE/SR59dV/duS8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783841904; c=relaxed/simple;
	bh=BV8ut0rEeRosEgV3ugjLJI/Faym51YUwOfk3wpRSB5k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dcMQPqdQIOypca+F3SdaSZB9tXxv0Z8F8znlFVm4QZe+Haep8M4TD3jQZPlLC27w3Be+UhCGIMdbfp3G9hi6wFbvgYi1pUNAbq2rTrTUFnbksOqnaF+vbMnPhJShT7k2x83SxqVHYCUFJ7tcCZI03TTWCphBKjR9lK+SI58s2ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AHakTebX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z/3mjRam; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AHakTebX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z/3mjRam"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66C7Sa5W2000366
	for <sashiko-reviews@lists.linux.dev>; Sun, 12 Jul 2026 07:38:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c/P/iZ/D5DHAxKN2T0dtA4DCwWYFUcs5vQTDdDjQhus=; b=AHakTebXl5pMJmYr
	y1sSoySiY/oQ/aCfn9vIuOCO479L4ST7zwQYbW1ZrWtkQPdB57IXb4F6cSATQD7o
	iosKZmuKWNnDKb19my9WiBHalKn5yFLwk2LFfkgUTnqVeG/THvLB+GYGK6TflI2R
	bn9akRGU5cv/Bx/rIvI5b1G05ALkoQBxnf03DAhMBnUGl/ipxCN3RRkR6aHI98ml
	f6kmudYVK+7aqx/9u9KOzF3i4WgtBzzE1643qjeIhvaLEJ5S6ETDI06hFhqldlgc
	5SE4ym1hTV7ntyvLmdMKYqzhPjLArAEAXzlJ1hwJ7ZCYyBil0Q5dhutp//fyvimN
	t7U6HA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbe8vabjv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Sun, 12 Jul 2026 07:38:22 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c85798977dcso456558a12.0
        for <sashiko-reviews@lists.linux.dev>; Sun, 12 Jul 2026 00:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783841902; x=1784446702; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c/P/iZ/D5DHAxKN2T0dtA4DCwWYFUcs5vQTDdDjQhus=;
        b=Z/3mjRamj4ixUi2uZ7fSjxASjm+1dlne2LoHzHA5edX7iWekE+Tk8iwaAfMuFO7ZIv
         inhNu8oS+vcwPm1m0v1QYy2MQg5wo1vmFGrs/zNoGi9crIe/SmdmUNptRjrSQ8lcq/C5
         /ACN1xDCExYrYnNU4iER9F2cTaVoQZ6cqKS3EJTMiJrvL+I0+LcFQhBw0d+1wOt2GCxg
         8MaW2OexYqVOTrfZI8l/Bze4/gR7XNoIuTjn/EP/89r0iL1cYShRioWIBb+tl0z/qbl0
         kwM+lUDQAu1n81bD+yC+unRDV2wbanl/Cg1QSU8VRn0tPiD0yqWsO35j630x3nDLuhGS
         nZSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783841902; x=1784446702;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c/P/iZ/D5DHAxKN2T0dtA4DCwWYFUcs5vQTDdDjQhus=;
        b=FlZl7+chcj9ZfdzDEr3WJxdQoqj3PE5bCYHGDUP8TpiFMk3D6m2DvRqdmCBvBsonBb
         hq78GFpXAHur7X9judCHFxBirmbB2xNq6j2tmSFZKqmBAIcfJMpYg8C3WQhFB9Fjs4gK
         S5H7LvBvmlTMuW5bPnkOCP2lFJyAYEmC1oaMr2Rae+YJvXCV3ylNDe4h1CObtXyDmJYK
         IQiOO2syqYfhAWwc7A9xCdC/6hrfDU4qnlRe8D/OeLXSytDAOrnTz1GqSTZ/iCMP0Gq2
         L3ztyY5rr+P3KFc123WxOFaZhqJ1yL4EfC+v060/8YjO/DmkL5O0yBI81AKk0jkqdGMk
         1JwA==
X-Gm-Message-State: AOJu0YyeG/41S0hTJYq5mTvPaZK6g5aU49PKr4JCcNkyFOMXyHWNbK1v
	kDep6cSP1pxipI4R4c2wvQLF3z8Ec98t37H3IyAdM5HYWxt7d0SuQ+mjknv1d6077okkZIse4rQ
	UWayjNwCR9oVdJMenBu48cXGzjPy/a5tjBtV1yWzEYByfkTf4+qOpxfEGmniS3asAouTXQq3SEJ
	y07+U=
X-Gm-Gg: AfdE7ck6eq0NDCdcQFp0B+N7h+qtd4KalwSrW/lArQ23q3ogbgPNDXR+xOO26wdWKis
	QHs/8C2Y4h136X80VhtALlCKP5SZ+id8ZCdDx4cdIjL7JV8owpL1Dsv2v5AliMyiDF6mrhojeZg
	BhMNG+wCSAF9gzE3aVFDf6MmffQxVuda60VdPLY/f8bjFFibdZE7lxCDUbpmppMZUmCoJQ9asYy
	Y0v1Gs43XshPTYrybnwZvfMsyxbk805tS3K5LPCV26APN3Ps4Qvg+V2F2xmedWSb0uYS1mL85go
	Q1X3dC+5TJr7xe2MaRhRT25ybLpLPiRm49YCVsE1SQCroQ/djMS+0L4zf8gPrE+2rkgFPdn6YoY
	JUTy8N0DHyNxYO98uDcpUeju7XUQII3h2DI5dmV3QEi9BgQ==
X-Received: by 2002:a05:6a20:a124:b0:3c0:b62a:2b8c with SMTP id adf61e73a8af0-3c110a4f0b0mr5099882637.70.1783841901575;
        Sun, 12 Jul 2026 00:38:21 -0700 (PDT)
X-Received: by 2002:a05:6a20:a124:b0:3c0:b62a:2b8c with SMTP id adf61e73a8af0-3c110a4f0b0mr5099867637.70.1783841901133;
        Sun, 12 Jul 2026 00:38:21 -0700 (PDT)
Received: from [192.168.0.106] ([49.204.17.188])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313b0240570sm25040628eec.28.2026.07.12.00.38.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Jul 2026 00:38:20 -0700 (PDT)
Message-ID: <6ce122cf-c985-484e-94df-776e12085948@oss.qualcomm.com>
Date: Sun, 12 Jul 2026 13:08:17 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/4] pinctrl: qcom: hawi-lpass-lpi: add Hawi LPASS LPI
 TLMM
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20260708114924.1069239-1-prasad.kumpatla@oss.qualcomm.com>
 <20260708114924.1069239-5-prasad.kumpatla@oss.qualcomm.com>
 <20260708115754.E16EC1F000E9@smtp.kernel.org>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <20260708115754.E16EC1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Qud3LthubYbuHESOEoJLo639KmuWK1S1
X-Proofpoint-GUID: Qud3LthubYbuHESOEoJLo639KmuWK1S1
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEyMDA3NyBTYWx0ZWRfXy+fkLbFxpvXf
 dWsjTdQ9RrmgrdCY5AsBju3otHgaFZHZ9M2s+m+EGSHC2GRJAUeu0Tm0epunCXOHVTJheNoYb8m
 yfQUIFJMsVBFrDazn1QE6ccENBhvpx4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEyMDA3NyBTYWx0ZWRfX4WplyyXDgFBD
 LjCL19rsYr4ZOqJxF8GwKryw/ntVX4DXoAXQEHN2ebFdLdRRNi7o5OY0xd+/twXyG+qCtq4eNSX
 QQ0+GYjjQlVKelclxvZmSHpSblT3Vob0ELhrqoecDF66sWz+W3HmdzB9se3bwy03hj8DLzGoB8d
 0jduAWRO56OX15J/VPo8CY81dK8QRv0zu1Vzw3MFyimgm1F71n7/iP/JrqSgcghR52gTDFkKjCN
 0/gvLxD1A/AaCRD6LK3luZnwa9osfZkKfBwHGorBQMPv3ewc03utIvoTiqpktGHOEkGYNtCzE3F
 +1Cw6kCBs6uPYEXEcxKGKRJHNenqVJRWX+RWLQGLM1RkMfPNd6HuKK1rzGG+KJ0NDylSUiasVvY
 OJbvelYanAkvF7sCOAmpL9Ww+hbIptFzTFKnNblERVj2A6xCpM846BkwLjrvN0gNl0QfJgOmpBn
 p5yd4uge87nVncRTlUw==
X-Authority-Analysis: v=2.4 cv=WONPmHsR c=1 sm=1 tr=0 ts=6a53446e cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=/JTPBhwEQko7YaD0RKblyA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=sFkXs5fRGYWMjOD9uhEA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-12_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 phishscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607120077


On 7/8/2026 5:27 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>
> Pre-existing issues:
> - [High] Premature destruction of `pctrl->lock` mutex before pinctrl device unregistration creates a use-after-free window.
> --
>
> --- Patch [4]: [PATCH v1 4/4] pinctrl: qcom: hawi-lpass-lpi: add Hawi LPASS LPI TLMM ---
> commit 38f7bb1223fcfb1f3a3b0698eedf3998e066c226
> Author: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
>
> pinctrl: qcom: hawi-lpass-lpi: add Hawi LPASS LPI TLMM
>
> This commit adds a new pin controller driver for the Low Power Audio
> SubSystem (LPASS) Low Power Island (LPI) of the Qualcomm Hawi SoC. It
> supports 23 GPIOs with various alternate functions and includes a custom
> pingroup macro to handle test_bus mux slot offsets.
>
>> diff --git a/drivers/pinctrl/qcom/pinctrl-hawi-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-hawi-lpass-lpi.c
>> new file mode 100644
>> index 0000000000000..7036bf4c66920
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
> This isn't a bug introduced by this patch, but does the core driver destroy
> the mutex while the pinctrl device is still registered?
>
> Looking at the core driver drivers/pinctrl/qcom/pinctrl-lpass-lpi.c:
>
> drivers/pinctrl/qcom/pinctrl-lpass-lpi.c:lpi_pinctrl_remove() {
> 	struct lpi_pinctrl *pctrl = platform_get_drvdata(pdev);
> 	int i;
>
> 	mutex_destroy(&pctrl->lock);
>
> 	for (i = 0; i < pctrl->data->npins; i++)
> 		pinctrl_generic_remove_group(pctrl->ctrl, i);
> }
>
> The core driver uses devm_pinctrl_register() to register the pinctrl device,
> which ties its unregistration to the devres teardown phase that occurs after
> lpi_pinctrl_remove() returns.
>
> Could this create a window where the pinctrl device is still fully registered
> and visible to the system, but its lock is destroyed? If an unprivileged
> local user reads pinctrl debugfs while the device unbinds, could this
> trigger a kernel panic or oops by operating on a destroyed mutex?
>
> The same pattern also appears in the err_pinctrl path of lpi_pinctrl_probe():
>
> drivers/pinctrl/qcom/pinctrl-lpass-lpi.c:lpi_pinctrl_probe() {
>      ...
> err_pinctrl:
> 	mutex_destroy(&pctrl->lock);
>
> 	return ret;
> }
>
> Here, the mutex is destroyed in the error path while the devm-registered
> pinctrl device is still live globally until devres unregisters it.

Thanks for the review.

Yes this looks to be core LPI driver issue, Not related to Hawi pin ctrl.

Need to address this issue as a separate patch.

Thanks,
Prasad

>
>> +};
>> +
>> +module_platform_driver(lpi_pinctrl_driver);
