Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F54403B02
	for <sashiko-reviews@lists.linux.dev>; Mon, 19 Oct 2026 05:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792386048; cv=none; b=T/y5jNiCBcdI9N2oFxYmtUc4L1xZb9tfFi3FMvY2Tsd67oA8YhRD2SR+05H2Wu0ozxxaq7C5JmsahNwEEFNf+WcoGpAZHPjS3+6DcGGzZ2UHVyv4zGJUXmNrqlMBr/D+K2/UMzrHDhjHkt4yqlLuKus6LUFcSwA0CNuuVuY4cBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792386048; c=relaxed/simple;
	bh=K+4QUmI2FHemQsCM6LPm+IF7KDqWjOzPmXdCgDeqkBI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=L4mrvKLjYn3vvLOBRDzZysGyxEauro/p0//gDomtr5IBM6ql8rASZO9AYMHVLuTTkpWaR3zXgPsJdj7u+63yZxHsx5wDN2/C4B4HnC4TjN8UY/PL994L/7ul6J7FxNgMOhlB6rEEhmWZCMr7Zo37i66oDK0LmOb3UGOMlzM1D3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Knfxpf3F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HR7RUQpx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Knfxpf3F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HR7RUQpx"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J4j0Pa2818934
	for <sashiko-reviews@lists.linux.dev>; Mon, 19 Oct 2026 05:00:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Hx0fhj8bMrjech0/jwiRrwoQsgXvjpvMtyi96ZF6zus=; b=Knfxpf3FhlkJsxF3
	OODYRgnnR8u2ryagWKXc7CSl76CDKpXaDCrkVP+tc+ZlqQB1St3F0LLTrKYjnWl2
	g/SMxidwxcTYUjpHP501UN+OgXLa4AIANvREd11o6cbyZ+m3Ra16ExIdFnSgmsPW
	RAHboGxPOu+1jEv/Iqpi/1yunewm6aJGJOeDVJ2jMN7zeJNhymaPrd1IdxqJPMll
	f1K/vPa1PceF0DfhN+j8rJmiKyGzB2hweDgy4FRJicqtMbx8odMGo8Gp9Q+wfPxe
	gUVVrFiNIzVvQp0SsjY8OGt21xhvFLumfGu8DWr9TdgwS0WnS3Ha6Lx4idJMnUNq
	ePZ4sA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbxqfw5h2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Mon, 19 Oct 2026 05:00:43 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e97dda7346so13758355ad.1
        for <sashiko-reviews@lists.linux.dev>; Sun, 18 Oct 2026 22:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792386043; x=1792990843; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hx0fhj8bMrjech0/jwiRrwoQsgXvjpvMtyi96ZF6zus=;
        b=HR7RUQpxee1afpJABDroorWqrCWz+i+fI3C7FKv50J4znvZZeBBLNsYuUbO5iHqtrv
         PDZSkZSpjsooUDXMK6mfoc9C43Xn45iA79G44izULZkC/ZuY9i9KJcUEijJ0xkPBgZjt
         XvXO2kjou4dkYc9Bxsa2MsjrC0nuETwzWIv1COhWM3WZByhftbFITJFO4Go07XZRptZv
         ms3lBYcUedynEvUbBeLcOamWGH3nV/tlsOvoTvpbW8cigffAAX1qbwERRiunWmnaGJc6
         afj1ipW+TQcN5vqDmlVT7QW1QOKpVBRnWn2NM0cK6wUlIzpApADLAEDWNV0hoZxFFDPk
         cuuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792386043; x=1792990843;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hx0fhj8bMrjech0/jwiRrwoQsgXvjpvMtyi96ZF6zus=;
        b=vNbGJonfT68hnlmfpH3G060nH80PH4LhOqnNCvYT97LKNLEjrFyPUUNV2eU9NoLCK3
         uQhQXu+pFv5FpXt0+7ddI1cBxhhJwE8dJAtjN8x00FvQXhfuVvqFSbxo2UP49zbUk3Bd
         jSh9GRYXZtsa6jUjFXA3SVUOaHFEyLModI21zNEVoYAEtqSQg5s2DBCKUvouWgE+ezaA
         rQnztt6MrbByujLi5+1dHBPhE5+98rSHTmfGUmiUDO/WZbxQgFW1E8NFcvOT5zI7PIrv
         7SmkYP12ArPxBzlF+Agv9v+xDRhC9moEmBq2QQDZ5D9kFZzy7k+nmM2g2BkccwEC7q3j
         zACw==
X-Gm-Message-State: AFq9FYIbd0QPhhnY8cKeN8dWw6zFlA0KAyxycwUC3KZ/qSOiggowpF5Z
	uML2ST0vXaTtVd5Re58EKoiJrryArjHLGGC2PDwiWdrRX9FZzwHrkq+8jIZSy/0Ljum++0tsvL+
	OgsVQ05LNg5/eBbZEH9B/lwd9T5tBIdvTokomUlEXsAYofCo0slBt2jf5fVNRNclfZ7kTgZdP30
	pnFjE=
X-Gm-Gg: AYBFou2yWgUw4TzLBanPEV4hWp+CirkhmOD/c01KhpRbF+opDV1b6w2mzvF874Lixjv
	vpKL1EbGv97fC345lKGxc+xIPeMszRZuZwfWQjFaCjqhyscuCOfAW5VSGSE6LlewLgjHI2PCbYJ
	FudX8NMa6TDs0Tadchcsn30y2S9hXPD9TpcbiST6cnkeUh19bfkGJTLIiku+lvRjSX1tXrE3okB
	rqkMt6z936xiJv8tuIZFZCS6ll6y6PpaEFioN/CBxe6wQ38VsCpy6TwBZ23QzdQ9pVNo6sG2Naw
	VjM/TBYy/TDnJwBsOkEunLwjAKpLNVm8LHTZyDsLKnWFNLXUVeSgtoa0F1KziyfziF7WlC6Q35S
	dRD2/WPXr8TK1R1PDtziLFY0XTTPA
X-Received: by 2002:a17:903:1d1:b0:2dd:c053:ec75 with SMTP id d9443c01a7336-2e9a6e4378bmr56414815ad.40.1792386042473;
        Sun, 18 Oct 2026 22:00:42 -0700 (PDT)
X-Received: by 2002:a17:903:1d1:b0:2dd:c053:ec75 with SMTP id d9443c01a7336-2e9a6e4378bmr56414435ad.40.1792386041905;
        Sun, 18 Oct 2026 22:00:41 -0700 (PDT)
Received: from [10.218.7.34] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e878910sm33730395ad.61.2026.10.18.22.00.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Oct 2026 22:00:41 -0700 (PDT)
Message-ID: <88085b6e-9de1-4056-9ae0-489cbd866601@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 10:30:36 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/7] regulator: qcom-pm8008: Add PM8010 mode support
To: sashiko-reviews@lists.linux.dev
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, robh@kernel.org,
        conor+dt@kernel.org, lee@kernel.org
References: <20261014-pm8010_i2c_support-v2-0-b395d2b3f668@oss.qualcomm.com>
 <20261014-pm8010_i2c_support-v2-3-b395d2b3f668@oss.qualcomm.com>
 <sashiko-outbox-171156@kernel.org>
Content-Language: en-US
In-Reply-To: <sashiko-outbox-171156@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAxOSBTYWx0ZWRfX+3MngnIpl/ci
 UK1T69kl2sOZ7GEg4PC2mLJUyDiuliKmEbz2ZF6jFTbaKUYAVq3m2AbgvAIXWtaHvs01OSu3aFr
 3LIweoKfSPfnuCWR4k6nhrHwdqofbSA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAxOSBTYWx0ZWRfXw9a+BIcQS/mQ
 gwFGs5DM/73ap80VQcNTK3MuJjFcjLrxAbTgCjMy3efzZJEXtYizCdX4BX2IyfsEYilSuMKTEAp
 DSnEvX52j+Z1OcQpy8g/PWxiAHdNgj7bUi1Z69wdftOOUVLxpAM16PYr2GF3Dd3KC56Q7N2+mFN
 r5QjI6fcRUMpKBjgFoxSsz9W/nCR5XPstmduvFPmvt0jYNzAxWqDycT/bjfrg5VzLOqJ+Ry9WgU
 2ilDDdhDdTfuzy9BCcbAZLPnJP88nHDe6p0i9CXVOylVRKfvUdbZCGw4G3dpvTzsFKJ+MOor73i
 +n5u/SHc0FEPyPMhPn2HRN1nPUvL+CnLRVk3IHnC5d8mGV0aUr7aVZBNNpc3xR5Cdjs9EiS+t4N
 LWqF8j5Bcogqh+HeMAl+IycySK/7D6RIoVO1n8Mb6csdjYAn/4YMEHtxREcDlucfvMlo68KLchz
 jMCZQ0120bhjK1CgKIQ==
X-Proofpoint-ORIG-GUID: FFwS9_Q20uliA5uHlfadnEqF73nsdvW6
X-Proofpoint-GUID: FFwS9_Q20uliA5uHlfadnEqF73nsdvW6
X-Authority-Analysis: v=2.4 cv=RYMFmFtv c=1 sm=1 tr=0 ts=6ad5a3fb cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=cRC-_68V1cTd_MlQ6vEA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190019

On 10/14/2026 4:15 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] regulator: qcom-pm8008: get_mode() reads status instead of control reg
> --
> 

...

>> +static unsigned int pm8010_regulator_get_mode(struct regulator_dev *rdev)
>> +{
>> +	struct pm8008_regulator *preg = rdev_get_drvdata(rdev);
>> +	unsigned int val;
>> +	int ret;
>> +
>> +	ret = regmap_read(preg->regmap, preg->base + LDO_STATUS1_REG, &val);
>> +	if (ret < 0)
>> +		return REGULATOR_MODE_INVALID;
>> +
>> +	return (val & MODE_STATE_MASK) == MODE_STATE_NPM ?
>> +		REGULATOR_MODE_NORMAL : REGULATOR_MODE_IDLE;
>> +}
> 
> [Severity: Medium]
> Does reading LDO_STATUS1_REG instead of the control register
> (LDO_MODE_CTL1_REG) here break the regulator core's set_mode optimization
> when the LDO is disabled?
> 
> When the LDO is disabled, the physical status register indicates an OFF state
> (evaluating to 0), which incorrectly falls through to return
> REGULATOR_MODE_IDLE.
> 
> If a consumer calls regulator_set_mode() with REGULATOR_MODE_IDLE while the
> regulator is disabled, the core compares the requested mode with the returned
> get_mode() value. Seeing a match, it skips writing the new mode to the control
> register. Later, when the regulator is enabled, it powers up using the stale
> mode in LDO_MODE_CTL1_REG (e.g., REGULATOR_MODE_NORMAL), completely ignoring
> the consumer's earlier REGULATOR_MODE_IDLE request.
> 
> Should pm8010_regulator_get_mode() read LDO_MODE_CTL1_REG instead to
> accurately reflect the configured state rather than the dynamic physical
> status?

Yes, this seems correct, will make this change in the next patch version.

Thanks.
Jishnu

> 

