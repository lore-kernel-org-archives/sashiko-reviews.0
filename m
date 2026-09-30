Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5939511E65
	for <sashiko-reviews@lists.linux.dev>; Wed, 30 Sep 2026 14:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790777556; cv=none; b=Gt1Vg7YK677mMm3Eq+oon5ypH0mGEmynYqFApfgAQxVCx+dUBARR/lqxxDkpbl/JCnG9sVdnrICCDRcUTNsAkH+qOMnhUV6l+MnfGUN2aqWUzlnGRH71zuh/xLc+utYRmDQUWDpBwX5YXKERyKPw/CxMfzLvDbRQjZ7qFp2JAjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790777556; c=relaxed/simple;
	bh=BAfVVG4YeNyLYWswmxxI4gyFcDhsSkcKNuXMTsotkM4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RZL6kDQLQ5RaY+K5IPbouuYlF6ulIxDHXgSNIrZw8LlfgJ/vawLHqKyXWrsEDy/Flu999c/y2KLT75QgyzH0yJypdwJnAo7GMgPrcnEgqDZ95twqtEentf2i9Nu9S5SuktQ3G1xhqet6FVpLf/xaXe8NooRDinndvbrFHOTV+Q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LvstrZ3F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cWFhsmpE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LvstrZ3F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cWFhsmpE"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UDxkD4612259
	for <sashiko-reviews@lists.linux.dev>; Wed, 30 Sep 2026 14:12:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GmTEgmvcedeaRztRcqF8ocCncIDFUGQAfG0sHwoFEVA=; b=LvstrZ3FmNqKMCU+
	YOINyttxrcLdo6zYFXhCPETIYunbXuJyuTqRGDLu9Otuqgap/pqrgWd6vcZ2SZL3
	mjLol0XuWqD6dWusIvRgwWSAyxSWT/C+N+OdgjeV1jxx55YwDlHQEaVtafWpvXSd
	LB7tyGOd3O8MAseyX0xzFMsFgChrnqw70H1sDxyn2R9WkoTcUBatDC+U9nt7iYMD
	LEpIQCVeJFvzlH16r7yEEG/MEM5fOve+umiEgAmbMOhnOhR9mRT6jZ/eDpxzyYvR
	VSIc/Tc1+c9t99ivi6EW7dBsOTZG47ZhxGgG+ctpWAUNMlYReI7vHi3FzF06a5JL
	293foQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0yh81955-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 30 Sep 2026 14:12:24 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2dc7337e2a7so52995825ad.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 30 Sep 2026 07:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790777544; x=1791382344; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GmTEgmvcedeaRztRcqF8ocCncIDFUGQAfG0sHwoFEVA=;
        b=cWFhsmpE5FHUdX3p4OYUrv8adavTbQu1T5c5UyZ+8oT+YWGp+sqhJRVXBVSfqVxvZE
         d00ztJGfRb95DJkwFerVVSzMdPYyIsQ4a6l/b0s4g16Sn09WwFq8YYBYwDYmkr4yyJl7
         qMvtSvM6xDw9QHkspEcNDq5yrbvpevEyxRbr3BzmyAfkqSQ7z7QSNrNPMV0jirZw4rXQ
         QLPd6vwq0gIZ/AbnzHuVXbyTMJBlAq0nEOh0SbGz/48wa53eL6f+IHlcBMJMcZpWVpYL
         iDQP/UBVWCWnXxWQTdBXexQTPSlvNUuooa3fGzKbx4J8UbwCzMhFA+NLky2dKX7wb6zS
         h8DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790777544; x=1791382344;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GmTEgmvcedeaRztRcqF8ocCncIDFUGQAfG0sHwoFEVA=;
        b=s9mBu6lit8fxqtKsekDjpVT0NsZ2IxgHmPIGgCSGGOizXpdraZp9Z5g3P/DgITb82N
         ndDt7oGnpG3sGIrcknAOA4+ChoJdIOpmE9DlrrC18LdHApUcC4iTa+wIaw1UPNo1CBlF
         04X5NXdeGEUFBQRECDMSpG4JS4B00L6ijDPQT0D1iPe1HorNJpsyVS7sfepk86Ai+qK1
         EwFyyP5tG7SbcIuPt4qNyQ6Hss2MqCRkb31r7mRqFjhdS/MM9FsOBXfkvQGr9R8NKUQX
         bE3/pJmxzmiBl/EB/25bqxlueASRlW4lNNuLbZ/n7gUwn5pLuu3/ucl8uYAzLXjxtmAM
         Qadw==
X-Gm-Message-State: AFq9FYKHxXzcZKCgpY47CXcMPxeb6qZbpj6667y8EiFE1dWKGFDG6BZi
	/8IY61TnNkBQJtRlGccPZsawYMDUx3u09rFdqcqym/ZBcP9AzrM+otmzoOF5BQfQnZiO8nQC078
	Cckq+qp6LRYEx0DifwDQq3kou+8HSNb3GFTdMOJhgNpgZ66fVJFTexWUFl+5aoJ7VfvkC9QPJVs
	OXS8M=
X-Gm-Gg: AYBFou0/2R6U9+3rL/DFN/oH2SFiApFEmQUCOBn4mKRKuzZxWNS40wZ2XLquyFkUicp
	rqKUngWK5UFGgSfzW9LEjwfDhMoWBUvX57CbVeheA9WFfr++y7Cv0gO02EV69sZENBpMtocWF+x
	LGTODb02ku58ZautcDZwJ6vJvx4HPqzeNvmAMLijoQYAw955MGHO4vM+QcvFNArPpfz2L80DhzL
	CZ7cwhtrTlV272QOaJ7XvP1ZpCuiMwwLK7sMRebeBVl0rfQjXLwj+LtfC6WFToAXxX+yy0cDYfV
	nDFB6ANkfhMoEsCWUVIyFYFL/s6jUMg44E8ojmkyjiSq0aRSB62g/xvTGfr1N9G9lXMDXrr8xkI
	kI6afqfRcbZIzPOjGrp5hPXv3EVuQYDjLfSeBfs3a0S4Wq7rWfqMcAL8PNCmHyS4=
X-Received: by 2002:a17:902:f64f:b0:2df:8c28:886e with SMTP id d9443c01a7336-2e2e49172bcmr13489565ad.4.1790777543820;
        Wed, 30 Sep 2026 07:12:23 -0700 (PDT)
X-Received: by 2002:a17:902:f64f:b0:2df:8c28:886e with SMTP id d9443c01a7336-2e2e49172bcmr13489355ad.4.1790777543304;
        Wed, 30 Sep 2026 07:12:23 -0700 (PDT)
Received: from [192.168.1.6] ([117.143.161.217])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e2e5bd5c67sm8402635ad.48.2026.09.30.07.12.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 07:12:22 -0700 (PDT)
Message-ID: <5286c573-1331-4bf2-a97f-e06fd004f6c4@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 22:12:19 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 08/11] media: qcom: camss: tpg: Add support for v2.4.0
 TPG
To: sashiko-reviews@lists.linux.dev
Cc: media-ci@linuxtv.org, neil.armstrong@linaro.org,
        devicetree@vger.kernel.org, conor+dt@kernel.org,
        linux-phy@lists.infradead.org, olteanv@gmail.com, robh@kernel.org,
        vkoul@kernel.org
References: <20260928-kaanapali-camss-v17-0-dcf3fd37f76c@oss.qualcomm.com>
 <20260928-kaanapali-camss-v17-8-dcf3fd37f76c@oss.qualcomm.com>
 <20260929061248.E035C1F000FF@smtp.kernel.org>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <20260929061248.E035C1F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA1NiBTYWx0ZWRfX3ps3JQb/IdTN
 gV2GiIWD6COJ9Nt4g7xXR40yddw4fMl5V885cSIe51GTfv2WqzPSgIGHiL1AQ3v4OizAhipbsXU
 MyAMT6lOS0+wNpqjCw+9JsHny1masV66uO4E8UPo0h5De2pj6GVE8JOy13ipLQVfpUw7DLHjmOZ
 Gb5Ss4qNKz7a9UsKsxiXC47wUYypnjaSPhK0BjJgy9fso40K4tIPaAHYbWf5uITcjpQj8hzIM0u
 2AAV2S3RiKX2PmlgMSZ2Bp1QDKQu6zZju2dZbArV4woJRmVrXHjPRyVvxVko1ByAsT/PSqMI96z
 tsGnaABKCn9s+rqeje6GGuD76eB21BzXCc+h1d8PESe000xXBS4q5PlVSh6tsKaTd0ItcEZN0Ct
 HCbyUq4qKCwASm4Cr42VuLgzz+nw7/6rKGnJkSLcNzMStxtEjcF/WFzoJTYL5sAnlSdU9LhqMhE
 YhWQT0cquwWGRG40thw==
X-Proofpoint-ORIG-GUID: taQvc4ScOP6PNfbuAgPlEqIbWv3VB5G9
X-Authority-Analysis: v=2.4 cv=NedzRGD4 c=1 sm=1 tr=0 ts=6abd18c8 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=K/RrOd38U9TixX+j9hIN8g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=N7nUT5zUQ4Ea-L6S4pIA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: taQvc4ScOP6PNfbuAgPlEqIbWv3VB5G9
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA1NiBTYWx0ZWRfX8o4sCMQwqjeV
 8KyBomgEAdKYjDt7rVNeLaMvPSko0Xu/2OKTCgmN8QJm2nRQaB3RaBj3kvm4rzprOl0IG3x4yyI
 1KOs9JjUAmMgrdE2dRU4v8jXZdOPuX4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609300056

On 9/29/2026 2:12 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] media: camss: uninitialized tpg->hw_version used in tpg_reset()
> --
> 
> commit e2a0aed20f3751127d25b2596032eac51d537c58
> Author: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> 
> media: qcom: camss: tpg: Add support for v2.4.0 TPG
> 
> This commit adds support for the TPG hardware version 2.4.0 found on
> Kaanapali. It updates the configuration and reset logic to use the new
> TPG_CTRL_CMD register instead of TPG_CTRL.
> 
>> diff --git a/drivers/media/platform/qcom/camss/camss-tpg-gen1.c b/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
>> index d29de5f93c18e..770a9e5d5ba5f 100644
>> --- a/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
>> +++ b/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
> 
> [ ... ]
> 
>> @@ -164,18 +167,30 @@ static int tpg_stream_on(struct tpg_device *tpg)
> 
> [ ... ]
> 
>>   static int tpg_reset(struct tpg_device *tpg)
>>   {
>> -	writel(0, tpg->base + TPG_CTRL);
>> -	writel(1, tpg->base + TPG_CLEAR);
>> +	/*
>> +	 * On TPG older than v2.4.0 test-enable lives in TPG_CTRL, so clear it
>> +	 * first; v2.4.0+ drives both test-enable and reset through TPG_CTRL_CMD.
>> +	 */
>> +	if (tpg->hw_version < TPG_HW_VER_2_4_0)
>> +		writel(0, tpg->base + TPG_CTRL);
> 
> [Severity: Medium]
> Will this execute the legacy reset logic on v2.4.0+ hardware during the
> first power-on sequence?
> 
> When the driver powers up the device, tpg_set_power() calls the reset
> function before calling hw_version():
> 
> drivers/media/platform/qcom/camss/camss-tpg.c:tpg_set_power() {
> 	...
> 	tpg->res->hw_ops->reset(tpg);
> 	tpg->res->hw_ops->hw_version(tpg);
> 	...
> }
> 
> Because the tpg object is zero-initialized and tpg->hw_version is not
> populated until after the reset function is called, tpg->hw_version
> is strictly 0 during the first execution of tpg_reset().
> 
> Does this mean the condition here evaluates to true for all hardware
> versions on the initial power-up, inadvertently causing an unintended
> write to TPG_CTRL?
> 
>> +
>> +	writel(TPG_CTRL_CMD_HW_RESET, tpg->base + TPG_CTRL_CMD);
>>   
>>   	return 0;
>>   }
> 

No. The version data is always valid no matter the reset is called or not.

Best Regards,
Hangxiang
