Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9791270575
	for <sashiko-reviews@lists.linux.dev>; Fri, 24 Jul 2026 07:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784879061; cv=none; b=JVYhXEtE/45qVB06T4L1Z8zcDBmj56c7JHOpwuXpvArbvEU0LLtT5EFAeZV+JsHWoh1+sAT9tz45xxcOhREQIdk1AIraEgZjUHfPZze7DMZoIy11IcRFRimpHQ8v+TEoGzwK8oWQxTr2Rr8xSjug7PTEYuKymczJmOlR/q4ZJ/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784879061; c=relaxed/simple;
	bh=sHlybZgLkTs2r2AfscP+XwN6yYIR9I1L19bdkTZIvTw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zy9BbDfvlEQMrY+er5hmPx//DNMTgJsTbaTD79fsnOhDUV6KUm1xSHYj2SnbyuZDBelPyZJt94Z5YR87e4asu7vZqGYEEu0ERKeLkz+IRMXG72O7Ar1TYP7lCcyN9Xq9xTJtx/vb3YvosiEqOk4jq1Le17MKrsmHqlnz3wsCTT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=on+6E/J8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NaEdB0V7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="on+6E/J8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NaEdB0V7"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O4lLX11869116
	for <sashiko-reviews@lists.linux.dev>; Fri, 24 Jul 2026 07:44:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Eoy4QlmrMHX1Usc11OodSW3HOovzq95yfLLLy/3S0hY=; b=on+6E/J8ZnMEbWlP
	N6QDv6D5XFdzk5Cxmwu5f2RReUEaffQhVOxakDLXa4Yvsi1flOmnkH8/64ZwCTic
	0zXDU30lUUOg+ARJq9PgXbZgLam/R7X76BhUb2brd0nedeUUTxsfzcTlfmKg4tDw
	h3aUAnasMbnB7UW6ngXCQDdmNIgWVJq7EorB977XMCj0CqQO1Mbb7cAKDnguXkkE
	bIJkirDJem9ldpNPsX9IQzW18VXA6SwTjEKKN4T5SnBgj/YXOawdxhNVELYutHaq
	P1l50RYT36T2H62E4zrJTDjG5XEHXjAffNrc95eG2yfxjAwHKodfkiMUXDl9f/W6
	MH9e4w==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm0pw8qkn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Fri, 24 Jul 2026 07:44:18 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84885a4fcabso207076b3a.3
        for <sashiko-reviews@lists.linux.dev>; Fri, 24 Jul 2026 00:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784879057; x=1785483857; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Eoy4QlmrMHX1Usc11OodSW3HOovzq95yfLLLy/3S0hY=;
        b=NaEdB0V7aVfim2Lyfj5WRS808s/Tafj1qSyrKxWPV5+ICGaNJgvdbYrU6xP3oYz1cn
         VxIKjsJ44VqQu3HQT1DhhVKzKfKhkHDLEG1NITjuhvFvspueyD/mnus6/SOaB/gLzUZ5
         2DdPmJSfUyL9loY/Z0T/xpQTOFzPn1LmBjcHZX3BnnbZHOYOPzFREC2S/88JiwdLThN8
         NcwD96ixh5Ii3bl8B8UJD6Ah1qKk1KFHy5T32k7qVrk1bL+MQEmWQdRhI9woIZD0oXow
         RZGaTnoQ4UhK98Ivf+8Q5yzEu2sMz9s7ydSvhCuJTG2ZALuG3f2oowygk1pqwCmiU8n1
         MJMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784879057; x=1785483857;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Eoy4QlmrMHX1Usc11OodSW3HOovzq95yfLLLy/3S0hY=;
        b=J7jUn2/kJmNOPADh3O8AekrGnqgWALqvadkkWtwZ05bDPvDalnHOwNAa9nTPNjfhAI
         g9JUQ2Q1yZ3z5zLWuWdcShgycypaFzNrJhAJrI3+eEyqjk+U5B6EjYLmQqEO7M+aYYz8
         b3+5hyLLfGPHGrvbTvdLXG1vAV6GEqx6rE4kTSHsvQ96Y5SHb1nflR0KUQ3wq7mgvxOk
         utqlL0h8CMaYH4lFFKF/AZcd80DqpEW7zXudfCE7dG4VXOFex+6qF96ytvyEbwOcY26b
         m3DXeRcdIJLQayyunxe2kpSgAlgvD0tmN14XcHPZpA4OC+lYD2C4anLQJMJyF5kiIZQN
         FFqQ==
X-Gm-Message-State: AOJu0YzDuyJPJN6UcmDtl5eF/zcJESE8LA8l+8AEgl6AH3pFNFH8nocT
	sjwFHQy2IU0JqXSc10VJbunO5urHbmIsXR+W9cawIHm82F2t/ppr20A6JRquqm1Vdr5PTDVS/2J
	i+sI6ruGjGC94OkoKZOr9V4xLBtZ/0uKO6nrxgJ6QWiAcT9tIFHSO+OWtthb6DjrjZhbpRORifk
	Np8Wo=
X-Gm-Gg: AR+sD12ukdbpCY8GYLpQUmgPgi7D7mhGkDD9OURbyyzNRaiI9hW6xSXAAAoQerJxWLG
	NrDIOr6CQ/ibsZL7eQ48I48F8ddYMz8EUpUFEi4Te7y+Oi2kGEkdnN7Njnf7wDtfyKYtMtOFQvp
	esDNvWFH+3XBMhqywh3WMiY/vEROhS2TUsdWaDHp7CPb+FTjLGcn7WrkLkoYbPrZT+PeMNDMrIu
	J9BVvFmvZ5gVIID2bsM9LTy+OjOX9mBdKooGG+bDCqxlLvbD7sRbOlj6Jm9RMjSCi58nd7WOBLX
	BB11vInHNwy8niicAWRiuWZ7VwGejOmRiEc3tP1bI/iv9vmpyJwnnDwD2cFGyhAzeV23y+GTcLP
	AMwSdmkzzjVJJjeD+LGcUN62IVhA=
X-Received: by 2002:a05:6a00:278d:b0:848:2e3c:9955 with SMTP id d2e1a72fcca58-84e2b82f7c2mr6728959b3a.4.1784879057519;
        Fri, 24 Jul 2026 00:44:17 -0700 (PDT)
X-Received: by 2002:a05:6a00:278d:b0:848:2e3c:9955 with SMTP id d2e1a72fcca58-84e2b82f7c2mr6728943b3a.4.1784879057049;
        Fri, 24 Jul 2026 00:44:17 -0700 (PDT)
Received: from [10.218.5.114] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e17578345sm4194987b3a.39.2026.07.24.00.44.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 00:44:16 -0700 (PDT)
Message-ID: <39718bb3-8f13-4cfa-946a-908eeff0653e@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 13:12:33 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] clk: qcom: common: Register reset controller only
 when resets are present
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
References: <20260723-shikra-audiocorecc-v3-0-90b878ae0d4e@oss.qualcomm.com>
 <20260723-shikra-audiocorecc-v3-1-90b878ae0d4e@oss.qualcomm.com>
 <20260723155515.68A0E1F00A3A@smtp.kernel.org>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <20260723155515.68A0E1F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA2OSBTYWx0ZWRfXw1pssWgV4rH+
 OcLm6PHe2G5/PatIn75RXetac2IsOa1UlAyUKfsgP727LbDBqyF2x2OKGJ1kaH0NLaSIez7U0TL
 9hB3+/kxhtt+EN3BgltexHlYoBerY3QyZa5G+CtQ3RJnfCBVmuJvK+E2ATt/IogtEeLwY3xsosS
 NTRpMWzZlqpI2vixJraG56nupcYulpuFEjU5vTWpoguJ/Di4vxK1AFaPmo6OehH+87YlGNMOu1V
 /xrA3PzJtlPHVwRA31zQ6mP/So8S5umc2IINs+cWn0TB17T728feD6TbTXJMk+3yW3E/+/egFjl
 852qi9qUti/tB7HVtE3wEq8ueU90HoSzWRZsSgn2QADJGqn9KMs23r9wX6/5ar5aKwaLtwwKKBL
 MSmYlEQnonCeEbGzou3aR0xJtGL+tDreAUbex1IlhnYRcTHEeMdtUEskOfZcIJQM8buUXbsc8Ne
 mxAGmZp4Vn+YAmTktXw==
X-Authority-Analysis: v=2.4 cv=RJeD2Yi+ c=1 sm=1 tr=0 ts=6a6317d2 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Z0OJ9TEZ1dYWzG6c7Z0A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: qVG02N14coSzzkOAtGN0ZtI9ciYyWD_e
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA2OSBTYWx0ZWRfXzUWsmvLfnXzo
 /FBmmXQ7IJZi4j47pjNSdfhgjrYTfVrRhtOC7wkUXDxfWm8nQzLU4QffssJMfaD7snrVP9PNhLL
 +Qb8QvUMPDnn1t0YAUQDxUhBUJPt9ms=
X-Proofpoint-GUID: qVG02N14coSzzkOAtGN0ZtI9ciYyWD_e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 bulkscore=0
 impostorscore=0 clxscore=1011 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240069



On 23-07-2026 09:25 pm, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] The local pointer `reset` is used uninitialized when registering GDSCs if the clock controller defines GDSCs but no resets.
> --
> 
> --- Patch [1]: [PATCH v3 1/4] clk: qcom: common: Register reset controller only when resets are present ---
> commit 4dacf2df1c1e317705833daaa92c7514eab60f24
> Author: Imran Shaik <imran.shaik@oss.qualcomm.com>
> 
> clk: qcom: common: Register reset controller only when resets are present
> 
> This commit avoids registering a reset controller if the clock controller
> descriptor does not define any resets. It does this by checking if
> desc->num_resets is non-zero before initializing and registering the
> controller.
> 
>> diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
>> --- a/drivers/clk/qcom/common.c
>> +++ b/drivers/clk/qcom/common.c
> [ ... ]
>> @@ -359,17 +359,19 @@ int qcom_cc_really_probe(struct device *dev,
>>   		qcom_cc_clk_regs_configure(dev, desc->driver_data, regmap);
>>   	}
>>   
>> -	reset = &cc->reset;
>> -	reset->rcdev.of_node = dev->of_node;
>> -	reset->rcdev.ops = &qcom_reset_ops;
>> -	reset->rcdev.owner = dev->driver->owner;
>> -	reset->rcdev.nr_resets = desc->num_resets;
>> -	reset->regmap = regmap;
>> -	reset->reset_map = desc->resets;
>> -
>> -	ret = devm_reset_controller_register(dev, &reset->rcdev);
>> -	if (ret)
>> -		goto put_rpm;
>> +	if (desc->num_resets) {
>> +		reset = &cc->reset;
>> +		reset->rcdev.of_node = dev->of_node;
>> +		reset->rcdev.ops = &qcom_reset_ops;
>> +		reset->rcdev.owner = dev->driver->owner;
>> +		reset->rcdev.nr_resets = desc->num_resets;
>> +		reset->regmap = regmap;
>> +		reset->reset_map = desc->resets;
>> +
>> +		ret = devm_reset_controller_register(dev, &reset->rcdev);
>> +		if (ret)
>> +			goto put_rpm;
>> +	}
>>   
>>   	if (desc->gdscs && desc->num_gdscs) {
>>   		scd = devm_kzalloc(dev, sizeof(*scd), GFP_KERNEL);
>>   		if (!scd) {
>>   			ret = -ENOMEM;
>>   			goto put_rpm;
>>   		}
>>   		scd->dev = dev;
>>   		scd->scs = desc->gdscs;
>>   		scd->num = desc->num_gdscs;
>>   		scd->pd_list = cc->pd_list;
>>   		ret = gdsc_register(scd, &reset->rcdev, regmap);
> 
> [Severity: High]
> If a clock controller defines GDSCs but no resets, does this leave the reset
> pointer uninitialized when evaluated here?
> 
> During qcom_cc_really_probe(), the new if (desc->num_resets) block skips the
> initialization of the reset pointer when the clock controller has no resets
> defined.
> 
> However, the pointer arithmetic &reset->rcdev is still evaluated when
> calling gdsc_register(). Passing this uninitialized garbage address could invoke
> undefined behavior and cause a panic during boot when compiler hardening tools
> are enabled.
> 

This appears to be a valid issue. I will check further and submit the
updated changes in a separate patch. For now, I'll drop this change from
this series, as it is no longer required after separating AudioCoreCC
clocks and resets into different devices.

Thanks,
Imran

