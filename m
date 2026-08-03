Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D85BF40DB5B
	for <sashiko-reviews@lists.linux.dev>; Mon,  3 Aug 2026 13:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785762441; cv=none; b=rTSTH7CbhC7IxzXqYX9fynpiK2mlvsSouSSmaEl4RUuPLID2DZFz6386MPgZS+Ayl26hpuFkX7ydFIOQvuYQzJqYzHNa4PshgOd+26yzp3xFNZyVNWfMK/eymo5QlW+OPPIzFZLpzIx/vxOqUVbRSVW7c/jPg+uOAEZDJnqwmsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785762441; c=relaxed/simple;
	bh=H9594XUyw3POtqMhfAsK0sI0aCBEtIDmlenuukjge1Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MuFrQ4zgMJ3599m4uiqLE2V/d0iZ4NqYQrtGci/Zu9JN9YgWTQUEH9PgCosUjDqDokY2bWHtaQXKGza9UHGocdaRvGDO2D4Knxvg/KqOsI+Ma8PZa4eqM/ZjcoKaeI5P5V4/N/PqWTomVMakW2D8dzxF//k74E7I5UTiWkTZ/FU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gfmEw9UP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MNuTXSur; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gfmEw9UP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MNuTXSur"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673C4loH856080
	for <sashiko-reviews@lists.linux.dev>; Mon, 3 Aug 2026 13:07:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DV+TIe+B8KPVpKTDj8vG+10Yx2ThG4j+TkRNvCbR0tQ=; b=gfmEw9UPmfGBTj5/
	RYAtRA/FeKPGUyUxNRJUOhvZm7V6RYrsTQn6DTcfwQjUzLYKV5VeMf+LiPM8l+90
	0FTVd53M2x0T9spGK8ACKb5LjxYTOH4Q9T7HfVGzt9Xah63o19Iiv8tDXHeggv/i
	6LMVORNnT9RHwfxAN6y+wXLvxXIn6MI91JNdyBrX5m1xHjQoy1tDURp/Z34R/sGQ
	jHG69NXTLbURbLj9nEx4xJHt1o4x3h4Akz0u+mlJQyjfIFYXi+g7uM9dGeRLj+B2
	aOCqZXHkslyziE/r8PpOS/HtQ8z5R4icGNPEggzxXUFqmKDd0Pt2k8cbiByu1NDh
	pvAa3w==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnrb9n2p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Mon, 03 Aug 2026 13:07:18 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7e9f565a6e7so4356973a34.2
        for <sashiko-reviews@lists.linux.dev>; Mon, 03 Aug 2026 06:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785762438; x=1786367238; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DV+TIe+B8KPVpKTDj8vG+10Yx2ThG4j+TkRNvCbR0tQ=;
        b=MNuTXSurUTM+Lt05o1PK+sy6dhXox7WUoh9naKgWXXnV4Y+F1Ibo+3Gvirn8kppFNC
         CBfMaudv8rv0ernJWYlie9uDamzBytjNSb5FPFofn4fANkfADEUyLMF7TyDgLMrGVp4T
         yW4t8/h+kzWJC0VYLSUvaC+7RFmEUCtFOVaXmpJxB74CPO7qlx5BEQAKyoEoSog/WbG8
         R1avM0/djuYBWjf9atgS7mb60bqU2cPxFcwgom0TDdO3iYfZG8ARgW6t5AU/jTuWahnB
         d7OtvhnbXGO7NNQMda6dR6fz1e6gT8dE+sXWWf00OXx6IYW2Eb+d6mb6fVN+ZO6auC4S
         Gt/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785762438; x=1786367238;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DV+TIe+B8KPVpKTDj8vG+10Yx2ThG4j+TkRNvCbR0tQ=;
        b=S2oUCqnuJt4JVlZ/TPWNXYQK3qVi3wH8deBQVcbzdePf69y4qmsxSuFQf00jFN9JbX
         y8BNSXB6/rZ0eApFBDQHR9/on18eI+ePBCLmMTb0ez/C3a+i0EVMVScumQzwzJeThaOd
         Zhy9k1/qSl9Hncf3gMvm5QiWLMOadN9LZGe1OAXOFxJjDnVwn+EB+suJPManUsivN4vV
         /CPx/MoVJVNH6ZX1YpNO+/Zk6pb3Fdos/clArX5RqpvxcZBL4dZ0epaeZVJfJKHjfuQK
         e6e8McsgMJopnYUr6gZfBLwyEzgEl4YG3/8azdhp5PGEUwdXTY0ZfzKSNCD0FjNH3WEW
         xqrA==
X-Gm-Message-State: AOJu0YyvKU5gwYHpGhZmBmrOuhUiPVfOFtCxXEWKFMJKRi2md15R3QQX
	X2uknmqU89J6u0CM2/spS7RGVZ/MxnFkIq0FTe4C8xAIVU2A7T9Jg+hjX9MrLIghKUTu2jALc0Z
	gs7DzoqkdLt5l6i5YsP9KrB5ofXmVGM3DyPlPH3oBYWj+OCyoHBtUNNRjGB9fderl2cU+mgWfEe
	+l0WQ=
X-Gm-Gg: AR+sD10Z/SaH1D9l5oDF8K30gWv0AmtZFKroJEx0goZq8xAPk9wNYEB/fkq7tWBrZRK
	A71BYt7vLEyUNwKnFyQYWh7WB3pRDotHhBuvBMARMil/Yiq5aEY0DCY6Vo855kQXFm+IVlOPpTy
	6Ag7Fegqej7Dsh8xqpWxyAn5XZ9QTSG6uc6FUxccVLSxKkoewpMD+AHkZEtx9ExScOn+aAn0yCg
	+i1I9rpwph2KJDKg4BVf9yrQnWOpGcXq2NdkXjlbxH1aGthK+NlQ51xpnHjxHVdATtARd8AXbFV
	7TwEI6iUKUhlJIqUnINMktNyfmCZD4vAAMCRLh/wDoTLI5hjeXHOsJTDEj4LXfBIsXpSq5SxNaY
	jG1+PfLxNGFMSfUWq6+zvtUVRPE+WTn+VRA==
X-Received: by 2002:a05:6830:67f6:b0:7e6:e022:4b44 with SMTP id 46e09a7af769-7f196f1c52bmr16096000a34.15.1785762437591;
        Mon, 03 Aug 2026 06:07:17 -0700 (PDT)
X-Received: by 2002:a05:6830:67f6:b0:7e6:e022:4b44 with SMTP id 46e09a7af769-7f196f1c52bmr16095923a34.15.1785762437054;
        Mon, 03 Aug 2026 06:07:17 -0700 (PDT)
Received: from [10.218.44.82] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f18ed3c81fsm7306578a34.5.2026.08.03.06.07.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 06:07:16 -0700 (PDT)
Message-ID: <f18569ad-3e39-4d48-9ed0-968af4e31c40@oss.qualcomm.com>
Date: Mon, 3 Aug 2026 18:37:11 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v24 06/12] power: reset: Add psci-reboot-mode driver
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org,
        lee@kernel.org, mfd@lists.linux.dev
References: <20260803-arm-psci-system_reset2-vendor-reboots-v24-0-889281373870@oss.qualcomm.com>
 <20260803-arm-psci-system_reset2-vendor-reboots-v24-6-889281373870@oss.qualcomm.com>
 <20260803101117.C91CF1F0155B@smtp.kernel.org>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <20260803101117.C91CF1F0155B@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDExOCBTYWx0ZWRfXzoAF4aB2m0Tv
 xAOn0TMLlyowlu9OGblLu875mGHkWxzL873kFE7Mm/lmKvOn9RDuiBj/1D9Cj8pjd+efEwOmr+s
 7M5bzuhnbkHdhaidVFd1S5FchRAAkuo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDExOCBTYWx0ZWRfX5Ml7Slbof7uW
 56cn/w6s8ATxGFTaHOXpqzVcOd6MD1I/FfZb/CnR1Fn2PP23GciMPj9qYwAQYfYmzSvx/ltGKpI
 tbt0AOSsS5dTp75C1cGJwUOGayD00yHjk1LM4t2gNo+X+oh6UxlmNQxGdYhILGHwCgrY55BdiTH
 Jq83jjwmtg9BD/Q//RacDzuMDT8/jnFPWqAhUfFV8SQkyVtI7q2EEKxfTjzL4ub8Zjmen5b+vCj
 NivWBABKLIzASASl9xkj97fQJZCid+zhTZDEJBhsSiCp5BE/Z8+rQaW+mpZgwaUWj7axtl2BA7S
 FtQXYQwrBUrbPTaxxkTrQc8oz1sloXKJ4dmmb1ElQIEw3ODfElcpS8+BMCS9W9xGk2SsUZfsk9L
 Aqh6Pz/T2+PV7jsFyP8hKUitGRq0+GBmKKdxc4bkoDm7VCEnYx1YExKPiBKmAbfZB3LK/PPAqoC
 22WPQMWHn7W39l43+wA==
X-Authority-Analysis: v=2.4 cv=RNSD2Yi+ c=1 sm=1 tr=0 ts=6a709286 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=-TrfgTw52sERH2XDXHIA:9 a=QEXdDO2ut3YA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-GUID: 3XKe6DavMCMICkNp6jzHSZvkgkybaO8e
X-Proofpoint-ORIG-GUID: 3XKe6DavMCMICkNp6jzHSZvkgkybaO8e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-03_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030118



On 8/3/2026 3:41 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] The `psci-reboot-mode` driver is completely unreachable and non-functional because it is never instantiated.
> - [High] Standard 'normal' reboot mode commands are entirely ignored by PSCI due to an incorrect `data` check in the restart handler.
> --

[snip..]

>> +static int psci_reboot_mode_write(struct reboot_mode_driver *reboot,
>> +				  const u32 *magic, u32 count)
>> +{
>> +	(void)reboot;
>> +
>> +	if (count < 1 || count > 3)
>> +		return -EINVAL;
>> +
>> +	return psci_set_reset_cmd(magic[0], psci_reboot_mode_get_cookie(magic, count));
> 
> [Severity: High]
> Does this work for standard "normal" reboots?
> 
> When a standard reboot is triggered without a specific command string, the
> reboot_mode framework translates the NULL command to "normal" mode and calls
> this write function to configure the reset command.

No, write can be called only if a mode entry is found that matches name 
"normal". And there is no mode name defined here as "normal".
> 
> However, in drivers/firmware/psci/psci.c, psci_sys_reset() skips applying
> the command because it checks for a non-NULL data argument:

> drivers/firmware/psci/psci.c:psci_sys_reset() {
> 	...
> 	cmd = smp_load_acquire(&reset_cmd);
> 	if (data && cmd && !panic_in_progress())
> 		psci_handle_reset_cmd(cmd);
> 
> 	psci_handle_reboot_mode();
> 	...
> }
> 
> Will this cause standard reboots mapped to vendor-specific commands to be
> silently ignored?

does not affects.

> 
>> +}
> [ ... ]
>> +static struct platform_driver psci_reboot_mode_driver = {
>> +	.probe  = psci_reboot_mode_probe,
>> +	.driver = {
>> +		.name	= "psci-reboot-mode",
>> +	},
>> +};
> 
> [Severity: High]
> Is this driver ever instantiated?
> 

this is probed as psci-mfd child.

thanks,
Shivendra
