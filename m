Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794809452;
	b=YAvE0s/4f9FcghElwlLYe51uSDO9iGTsKeakFncKUdR8lbKbTJTTrSC7osKtPOhY9SP8
	 lKqmNvyviO6/4zLmKTARBnnW0hd9Kf1RBTzO8B4B5sI4liPGrLWkwZgtQ9nsmiaJxBqO1
	 TrLi2fXYfOqbTx4FxcZZE5UazscOnZhpj74d1JtTEkBMR1IPvDQq1McM+xYAjsw0VT5Gq
	 bS/gMgGP8y39S+7WKOJhPqFqHWeJ0WyKFmm39O+nLbYqFcokOAQQPJg2d3xePY01FOjRr
	 5+HUQBYViQakfOwonaZdOLfYOgWVBf6qLHST+JZTbgy2MkUORuwkD5+n9VD6Q9ozWVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794809452;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5Jxiry9vwgyxS5ZS37aNjiYx6GYa6EgvSiPtoxpaBk4=;
	b=vUtsJyxqM7J6h1vFXLzmphwDZZXbrhPiiMhY8w8J6/snBcW0vzvnWUzImmKSnsE810c7
	 LKPXIepN9Ow0u0WWej0kmQihkU0iCg+nwbxr0PKnkxSwH/IwRmb4Un6ydcAMpljvUiuuJ
	 8miPCr+M4AvCUJ/AtNk3yQFLA9O/gS1FgBgczJHnTtnfG3Zz/BKjZSWsNuZHVpKrO87gt
	 J8+zjnjG9DhkYqYfVTO+yvfUgbhzek+8PHYwzWHbyzrU6EM2xCqRxB0vP2ev4iUaa3mIP
	 1wU/P3jNUmNdnCDoVER3ufPmd+wyZr+P6U/r8O1JpFOywGz7DKF19NVb0epk3d0FHmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OaQ5e15P;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Nt3wSwsc;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1342B606A31C
	for <sashiko-reviews@lists.linux.dev>; Mon, 16 Nov 2026 06:10:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1342B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OaQ5e15P;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Nt3wSwsc
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG5LaAW214141
	for <sashiko-reviews@lists.linux.dev>; Mon, 16 Nov 2026 06:10:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5Jxiry9vwgyxS5ZS37aNjiYx6GYa6EgvSiPtoxpaBk4=; b=OaQ5e15PJX8yGqJ5
	bsHWfMCv4B1VKFn1Z7HYMNi2p63/ZRu/tfaDIBawEwUx6vE0WEpxsqbsFjMY1Prg
	hAUMdyW9qSoVA0q0XYePoQZ3A8igSVgPfqOz4zle51bjeoyR7gvwiM2XJoWBrvUT
	wHS8XRtE+FwnweUcXGU6FSwxPL+Y2/tzs+n0Di32qMbBH8BcKdQdkwJHtM88CVxx
	6oIW88BIuINX7f9L7STw1BjO6eGJ4KpC9yhvNV9ay5r97i+zROQIPu0a1gOMhH9O
	TMa291/2Xp2gD7UUHQx/TPIBQfPCyYe40tc7HnY/GceFLzfgUCYzFZA9hkWitIe4
	SUCgIQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhjqn63n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Mon, 16 Nov 2026 06:10:50 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2eb2437d752so13726315ad.0
        for <sashiko-reviews@lists.linux.dev>; Sun, 15 Nov 2026 22:10:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794809450; x=1795414250; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Jxiry9vwgyxS5ZS37aNjiYx6GYa6EgvSiPtoxpaBk4=;
        b=Nt3wSwscCfVi5S2cTzYI3P76bGjyTmslztCoLBtBTMZO3R4GPtv6NKjuLm60l1bvCy
         XsWUjXl3jJ7UlC1m0+TgEy1MsAfp791ibAee35uEeF/JxyqSJui1MnnlMZfHxAxz9Usn
         z4J75KciNNIUBkV4EYReFSfZ6fYsbOZ+8OBOCzd5NFD3pwk7loSU4xfW6e2xoGDBID6s
         Fh/Oex6a8jhujzj8J+2HABV2T9aVxfGd/uLqdtZS41W6Jlg1q36CGTyPHF7k/mSwsXtz
         qW2eUcDEZihFQLcJaCQJamI9VRGJ2jkY7wgNk3ZGgLR1XcjGCWA2cyFTwD0J6K8w0Y8L
         0BwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794809450; x=1795414250;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5Jxiry9vwgyxS5ZS37aNjiYx6GYa6EgvSiPtoxpaBk4=;
        b=sDcF90t3s6OfPh/wmupj/kLbUU/Kw5s1yScgpfc2yTRxCIWQzsR/6j8SVRhubxwlto
         DleUZiyIQeXR3jz0bGCaVUPMOmkLrbd4L5E89EGSyEZVTxsCpH1mg9LgBMd8vSvnDbvP
         Y/pi4oa1jbCzzdRoojfIomxL4aVtmvu8CLoxDEiXi2HfvL+t6DNdUvln9Szqg69cNu5z
         PhUXLqefkf8fyaTYh9VHjlsGgnDcOUFZtAZF6oAjVLyGC952BQs5gtaEXkT7jqD6ONS2
         hBqn/U6zJABeAVXOjGkAwRYwY3HRalG7AojQXhq3iqX8gXBFhc4zwRLLEa1z/xB/elHn
         x2Xw==
X-Gm-Message-State: APuU4Z8Xajdidair9t5vcrYsfS9+GzHM8NIauWudsVs6VBpN2fRuwUxz
	50Qpa2sM2AMONYw2kbUUgJoKvzqKLfp09P3VC6PPF3BBQTGO9uU6+DXBLXYe5P5WsHCKeT0H9bD
	WdCimeXOc35mpbtkzMOpQlhKy7kXRV/+kkTMFczNpnowkwLsROErXlR3Z4Eoc21Oaq9eTr8ea21
	TYjYc=
X-Gm-Gg: AZFdTZc/txK9vfy5N3WRegfNGZbcnJin7Tl+5+Dgdm96Lb+J3cJNeByG6vMn5Xgi7zA
	siK8cG9g/6W2QrK3BBeqQcmjxuWbsavXwUqoFc06p9MKNNT1Sn6Z1SEcg/deDhuPC8idrB1YPfd
	KqZ5uVomySOzZxa67huEoeq+hIh9xyZL99tjHlZAkL8sfBujGBYPwIhOK+k8KT16ePjuQSwekQG
	bHhixvYvd9w5UVTSjpAdPyE+jjz1W7wAmdxc1YNF2QQPuLjVONsm5TNG1sLOwOWcAqWYgw2Gr68
	b4T8oBKJBlD0WzKBATHurGuiggKmZExSrFn6VuA+XprBcgUIiCed4xpvPtm/K6Cf/yHDk0eadQx
	sIXFlqKTHuUjP6CwoUiH1x/Yxg/7aNN67DTrvIA4zlztpL2mGel2g3niKkNZRtfNXXOv6L/HMXJ
	+Ikw==
X-Received: by 2002:a17:90a:c2cf:b0:3ac:74b3:a8f3 with SMTP id 98e67ed59e1d1-3b1b0ccec81mr8961208a91.44.1794809449696;
        Sun, 15 Nov 2026 22:10:49 -0800 (PST)
X-Received: by 2002:a17:90a:c2cf:b0:3ac:74b3:a8f3 with SMTP id 98e67ed59e1d1-3b1b0ccec81mr8961191a91.44.1794809449195;
        Sun, 15 Nov 2026 22:10:49 -0800 (PST)
Received: from [10.218.7.34] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d27cf1sm21087463a91.12.2026.11.15.22.10.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 22:10:48 -0800 (PST)
Message-ID: <bbf095b6-83c5-4d77-8837-873e29d093d0@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 11:40:45 +0530
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/7] regulator: pm8008: Add mode voting support for
 PM8010
To: sashiko-reviews@lists.linux.dev
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, robh@kernel.org,
        conor+dt@kernel.org, lee@kernel.org
References: <20261111-pm8010_i2c_support-v4-0-4549cab1c8e4@oss.qualcomm.com>
 <20261111-pm8010_i2c_support-v4-3-4549cab1c8e4@oss.qualcomm.com>
 <sashiko-outbox-209409@kernel.org>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <sashiko-outbox-209409@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KelHIgYD c=1 sm=1 tr=0 ts=6afa9e6a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=m2CrskostU30fZ5MlgQA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAyNCBTYWx0ZWRfX1OwFZAsmSCXk
 V35UY0bCDv4IZJI76xbN+zy20VvflorRoUYLVXCjJ+8FjjmcSsDFr9g8BrSkfGb/5G83EDLIo8U
 G0rpfFh3Twy0PgadrMcGYVALnnZxZ7o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAyNCBTYWx0ZWRfXxffGj8j3OVDZ
 Ui9vahRe1DJyFospIq1uVvHxtW4906I0WKqMbN6KtzHGuBShK97mtkCjQY1Lc9QBZal+gHlAzUY
 UFOKPhYvvU+YElhxn7FYVKsgRhNdsCUExetPgTvVr3DC1uRAvxs4oE+j+TqrwA6bLdRMRnTrIyN
 bv46PzaeT8L6OkrJtUPVtlS1a5GlDZFvnEgypaQ5VuiTC2fiXc9l9hVCode8IvHotfgXGNr85zN
 NZmBdjyBga4xC59Vjk/ztqKTaqeyoQlHc/ABeuWEzn2LHQK2FTLKwV+YK+9IN0ntY+xeIRj1UVe
 TzYEgyWAkdv4MrCiSBkpBzV9mDS0SeDUC9GHSsRmYwwobSM17Il939MVRTeQH4/i5Wy7iK8te7U
 5ojEtmWA6S9TOMx5ZZ6VWC513joIJaJgeCUnYKFiv57K9t8kVANQ8Ns2WeqKFB8iyNcu97+MMoc
 eB1l+dhc/+A2+iJw9lw==
X-Proofpoint-GUID: cwq6xF59dPagO5MhzDKp4utRFO3L54k9
X-Proofpoint-ORIG-GUID: cwq6xF59dPagO5MhzDKp4utRFO3L54k9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1011 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160024

On 11/11/2026 10:57 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] regulator: pm8008: wrong hpm_min_load_uA for PM8010 L1/L2 in
>   pm8010_reg_data
> --
> 
> commit e894320c5a690e879a2556e289265d1ae5f7176f
> Author: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
> 
> regulator: pm8008: Add mode voting support for PM8010
> 
> This commit adds set_mode, get_mode, and get_optimum_mode support for
> PM8010 LDO1 and LDO2 in the pm8008 regulator driver.
> 
>> diff --git a/drivers/regulator/qcom-pm8008-regulator.c b/drivers/regulator/qcom-pm8008-regulator.c
>> index 0ea4ac016dc22..395d5582f6af0 100644
>> --- a/drivers/regulator/qcom-pm8008-regulator.c
>> +++ b/drivers/regulator/qcom-pm8008-regulator.c
> 
> [ ... ]
> 
>> @@ -84,9 +97,10 @@ static const struct pm8008_regulator_data pm8008_reg_data[] = {
>>  	PM8008_REGULATOR("ldo7", "vdd-l7",    0x4600, 200000, pm8008_pldo_ranges),
>>  };
>>  
>> +/* LPM setting is supported for only N-type LDOs of PM8010 (L1 and L2) */
>>  static const struct pm8008_regulator_data pm8010_reg_data[] = {
>> -	PM8008_REGULATOR("ldo1", "vdd-l1-l2", 0x4000, 172000, pm8010_nldo_ranges),
>> -	PM8008_REGULATOR("ldo2", "vdd-l1-l2", 0x4100, 172000, pm8010_nldo_ranges),
>> +	PM8010_REGULATOR("ldo1", "vdd-l1-l2", 0x4000, 172000, pm8010_nldo_ranges, 100000),
>> +	PM8010_REGULATOR("ldo2", "vdd-l1-l2", 0x4100, 172000, pm8010_nldo_ranges, 100000),
> 
> [Severity: Medium]
> Should hpm_min_load_uA for ldo1 and ldo2 in pm8010_reg_data be 30000
> instead of 100000?
> 
> In drivers/regulator/qcom-rpmh-regulator.c, pm8010_vreg_data defines the
> same PM8010 LDO1 and LDO2 regulators using pmic5_nldo502, which sets
> hpm_min_load_uA to 30000 (30 mA):

It's possible there was an issue with the HW document I checked
in this case. I'll update this value to 30000 as it's known
to be working.

Thanks,
Jishnu

> 
> drivers/regulator/qcom-rpmh-regulator.c:pmic5_nldo502 {
>     ...
> 	.hpm_min_load_uA = 30000,
> 	.pmic_mode_map = pmic_mode_map_pmic5_ldo,
>     ...
> }
> 
> With hpm_min_load_uA set to 100000, pm8010_regulator_get_optimum_mode()
> keeps LDO1 and LDO2 in REGULATOR_MODE_IDLE (LDO_MODE_LPM) when consumers
> request loads between 30000 uA and 99999 uA via regulator_set_load(),
> which can cause output droop or brownout under moderate loads.
> 

