Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 593F43E717A
	for <sashiko-reviews@lists.linux.dev>; Fri, 16 Oct 2026 10:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792145962; cv=none; b=aTXX1lTkkB2VEe3LHIIWZPI0S//wx+HxIe0lAIFdnaTgqGa5w2A+n/mUH2y2h6KWTy5eArvY5x+zPQ28b5wcS3t8HmuSyfN5zilmVs0t2hzNWoHXH4sms+5h7gGkHwwje/rF3mlRj4vOUhgfMPUmDbg64x26sJzWYL3uIFZyaFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792145962; c=relaxed/simple;
	bh=U9CRgRoLAmtk8E/dKxBycedliKECA2YqR+zLevH5pAI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KlH5WoZr4yentVje8uD/p2x17+c4WEMEKkPfzQ+E6jW7ye11TA57WK3Z5g7oKw0pucfF0YN1Ts7MsQmt+h06Efi5Jhqy/sx2tN7rn3Xuykuxt9wrsxAhRfEtQxPmrmlXTJ1N5Cd+NNv4/1q3/Twvy7Eeva+c5vuCV5sdtUkm3xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tef+K4uB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BfrAjBh5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tef+K4uB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BfrAjBh5"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GAAEhi1647704
	for <sashiko-reviews@lists.linux.dev>; Fri, 16 Oct 2026 10:19:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/GfCSAHxVxuL86t7uTRtCzziP8qEv+SHBLAo353w4f4=; b=Tef+K4uBkMBRv2OZ
	ZIiOtdCer65op6N/K79bjlIrA6CtrrEUEc9LXhP3QuzAnXN6uPRBFatwBZ+06z99
	1RhnVbmlxCd8x2teNLgAvv8nkog8QWwstqvaJ55Q6tCRXxpkHod0vYXZ5dxR2caz
	XnnmoeDEQbzukohzCJCp7iIGoqyMEmK7lBU7GS2/PkvpQsOQOSWbZlEu6u8oFZ9c
	q05GQIn31gG7eA1w/l5dBMG2ybl/sBk33R0qkTD8k/qct+qRSwOGmK5+61+TK3DJ
	L0y7dBIVNZBoU40FF3S8SUh1ClSHnIFIxSUkRDMuDqdlg28GLIuOSCvGDMbUS1VZ
	gwbkgg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbhumr1w5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Fri, 16 Oct 2026 10:19:20 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-341eff9e381so17471011eec.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 16 Oct 2026 03:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792145959; x=1792750759; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/GfCSAHxVxuL86t7uTRtCzziP8qEv+SHBLAo353w4f4=;
        b=BfrAjBh5C+xVdQBebzC9bfbkj1DsVto2joFzeRczYn7xfI0TWlWf/2GEwiIbEF79Kv
         XldZvabOaByl7zYT60nySEbalV59Hg9Cnrpsdj4QWZj43T8hoeLAqdXCHigPeE5Nnlju
         Aq4F3SCTlNdaUeWKbHeYO17Ue9AIznY4j/U5MLwAWXhU2VJl9L3qzCHMj6swvvC7UrhM
         AyfOq/dExNLv0oTbY3Nb28lN0ri5gRioQDgRomyZgkXzTTRBI61kjbx0dYtVDxQ3Vl2c
         psomA04i2QGq1qfNaU4NZnckWx70xasTEOY8ol5R0IcXfWFfmtktPHuAyIMa+WK7Z3ew
         h0eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792145959; x=1792750759;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/GfCSAHxVxuL86t7uTRtCzziP8qEv+SHBLAo353w4f4=;
        b=HVeJG7kxIVXFLhHfiLynByxoJKvA5tT5MjUzHdG6rjdj9jQPZ99FqKg31WHIvwdkGq
         aUu6T30/T6UruQXh1Fx/qrjVmapUud+hrgCpqmQr66ZkFT9IRXI+1W1AOR+H9OzVyhBx
         IqMamib0d7uYHX83WW6Bb8TR0rmn7K4kwz1/Auwazdy3AZc4YtL6j7C19fiNFu2XxIR9
         iW0GK1oDQf+ZMZ3QU0ceV6m3yR/PsSm8c28HHEtDD3dCMD3v+ZpnaD0KFvDj5fb7sY2S
         6/p9/Xk2uLuLOJC3HqGkCoycvpS1bOnjwjbBpyojdSDhyV4WtazI7ogskxcD5z5wc4kz
         1vCA==
X-Forwarded-Encrypted: i=1; AKwUvByvUav6JgesYMel2y9tpL/bAO04FPq3NGNkoafzATUMuptU49QbpqCXkQ3gyrDAIhg9cLInO3aOjx7jnt+TpRA=@lists.linux.dev
X-Gm-Message-State: AFq9FYLSpafA9RUklsmDIfg5O8KoBoCIK5hjndoDt1WhH6VPa3QmWvEi
	Udtgl1cRiA8Oyu+jtdjW52kPtR35Szd6A4a6sz1+uM92Cvm1iXPOUmlzQJZyLOAtbxbHhNeELkr
	cDBn8K0lR0ifSo7sZL4sAulPcYf+Unm0UI2wb+2pRpGSaiq1DcfTm7Cz0Ql9tHUBu4PIMC20=
X-Gm-Gg: AYBFou14vITvfKnMMly42J5wWYKTgC9kJjGourNtUIOHp49zuNJ0ieI3UeMLGLbBnDQ
	IKsYcHIAY7QhitrTZimO3nulAV9jINOrDiWx9RF3T3QhVtjr8va+DOsOEAmRd2qLKB7RWU4bYsD
	3MfJVsdnDvesp1Mp+e4SEF9dA/Mgh3DpxSz28JuqSQjiJ2tHVTri+PpJvgWgErKAhdyD6HkGtc8
	OnvI9nmGkXBaMD0qfnITPo4KSLPHm95U+/GCt+y8/pI3x1lbOVoyHqI8WePQqDtR0oclF3Ucnsz
	G4vTB3GpALVovqA4MCVnyIvcv531lRePYVa907GrFubEzFW49ouyNWn0p9OVoUdBW5ufRnD224R
	cWftKWE5jSeFB8FR3SkcpbAy5K96RDII=
X-Received: by 2002:a05:693c:2a13:b0:35f:a2ad:603 with SMTP id 5a478bee46e88-35fa2ad06cbmr4910714eec.16.1792145958995;
        Fri, 16 Oct 2026 03:19:18 -0700 (PDT)
X-Received: by 2002:a05:693c:2a13:b0:35f:a2ad:603 with SMTP id 5a478bee46e88-35fa2ad06cbmr4910675eec.16.1792145958247;
        Fri, 16 Oct 2026 03:19:18 -0700 (PDT)
Received: from [10.218.14.97] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36082a7b33bsm10937298eec.24.2026.10.16.03.19.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 03:19:17 -0700 (PDT)
Message-ID: <7337fb06-0953-42f6-acdf-ccd29549fd8b@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 15:49:14 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] dmaengine: qcom: gpi: Convert dev_dbg() calls to
 tracepoints
To: Frank Li <Frank.li@oss.nxp.com>, sashiko-reviews@lists.linux.dev
Cc: dmaengine@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        vkoul@kernel.org, Frank.Li@kernel.org
References: <20260926-add-trace-support-gpio-v3-0-8572bf7456b2@oss.qualcomm.com>
 <20260926-add-trace-support-gpio-v3-2-8572bf7456b2@oss.qualcomm.com>
 <20260925210244.D6D5F1F000FF@smtp.kernel.org>
 <as6nEloHzo_YkEW9@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <as6nEloHzo_YkEW9@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA0MCBTYWx0ZWRfX2iZ2MidJ4m2y
 SwG9CMVWhhO88PMPj++cywQbUSZES2/zzdzQvs3hA6QU6/dd5S6zI9rvGXgqQpED6KW7R7lDI0L
 j76bsVgUXrcanGLhHzH0OAxJ1G9cd4s=
X-Authority-Analysis: v=2.4 cv=H+BOUOYi c=1 sm=1 tr=0 ts=6ad1fa28 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=0yzcsfwEXPjLm50L98AA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-GUID: OfObsOl5ozPmsxTA_MEs51Atutmicli-
X-Proofpoint-ORIG-GUID: OfObsOl5ozPmsxTA_MEs51Atutmicli-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA0MCBTYWx0ZWRfX+4MCseRZVB1l
 hUOcgj/a8foFF8v+uDYHUYAFhDqta2DakMma2SFpunUQ0QW9M6uDT925EdNqZ3JlPlWySvtZAZq
 QsSAne8fg63jbT+812nrZCvFlKQcVm0shOKeto200jxjfRLMMRfqbZes1dmQJ41FFaGzz2TD7HW
 TfmjC8IDMQY8SnVpU1+KXdDBfrQWRpmo9/kT6qg1xZAhsqUkqU7/sP8omCBaSWHnNHpC5xOjEtc
 dejnNANKqWHxQMeEYh7MZ16GBOPEfBEsd4ka+JesX/S4xUKcIhGVSeksC+kku7KwQNlh3l4SfFg
 TgHh9tkEAq8wu96mYwY0lIosEktREKvkzisnimjwNgxV9yjkklImWo4iU8NcWb4LbGzeWQO0gHL
 SN45QroBhwyB+YIR30D5Ll9OH6auai/guKmIR6JKJQB4vWGcdmZf3UbW68VOnWPUrOUwgbI1rBe
 tirla4VRsNjeIYHvFxQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 bulkscore=0 phishscore=0 priorityscore=1501
 adultscore=0 clxscore=1011 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160040

Hi Frank Li

On 14-10-2026 03:18, Frank Li wrote:
> On Fri, Sep 25, 2026 at 09:02:44PM +0000, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>> - [Low] dmaengine: qcom: gpi: unused variable gpi_ev_state_str causes compiler warning
>> --
>>
>> commit 16ff3240f7873902688743d98570cd5eebf13594
>> Author: Praveen Talari <praveen.talari@oss.qualcomm.com>
>>
>> dmaengine: qcom: gpi: Convert dev_dbg() calls to tracepoints
>>
>> This commit replaces dev_dbg() based debug logging in the GPI DMA driver
>> with tracepoints, providing structured runtime visibility.
>>
>>> diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
>>> index fafe6ac848d94..6aff2a0d54161 100644
>>> --- a/drivers/dma/qcom/gpi.c
>>> +++ b/drivers/dma/qcom/gpi.c
>> [ ... ]
>>> @@ -887,15 +883,14 @@ static irqreturn_t gpi_handle_irq(int irq, void *data)
>>>   				ev_state = DEFAULT_EV_CH_STATE;
>>>
>>>   			gpii->ev_state = ev_state;
>>> -			dev_dbg(gpii->gpi_dev->dev, "setting EV state to %s\n",
>>> -				TO_GPI_EV_STATE_STR(gpii->ev_state));
>>> +			trace_gpi_ev_ctrl_irq(gpii->gpi_dev->dev, gpii_id, ev_ch_irq,
>>> +					      gpii->ev_state);
>> [Severity: Low]
>> Is it possible that this change in gpi_handle_irq() within
>> drivers/dma/qcom/gpi.c leaves the gpi_ev_state_str static array and
>> TO_GPI_EV_STATE_STR macro as orphaned dead code?
>>
>> Since trace_gpi_ev_ctrl_irq() only takes the integer value, the final
>> consumer of the macro is removed. Could this regression trigger a
>> -Wunused-variable compiler warning for the unreferenced static array
>> when compiling the driver with standard kernel warning flags enabled?
>>
>> For reference, the array is defined earlier in the file as:
>>
>> static const char *const gpi_ev_state_str[MAX_EV_STATES] = {
>> 	[EV_STATE_NOT_ALLOCATED] = "NOT ALLOCATED",
>> 	[EV_STATE_ALLOCATED] = "ALLOCATED",
>> };
> Please Remove dead code also.

Thanks for pointing this out. I can reuse gpi_ev_state_str in the trace 
output instead of removing it. I’ll update the patch accordingly.

Thanks,

Praveen Talari

>
> Frank
>
>> #define TO_GPI_EV_STATE_STR(_state) (((_state) >= MAX_EV_STATES) ? \
>> 				    "INVALID" : gpi_ev_state_str[(_state)])
>>
>> --
>> Sashiko AI review · https://sashiko.dev/#/patchset/20260926-add-trace-support-gpio-v3-0-8572bf7456b2@oss.qualcomm.com?part=2
