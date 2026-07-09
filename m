Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B519019046E
	for <sashiko-reviews@lists.linux.dev>; Thu,  9 Jul 2026 00:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783558096; cv=none; b=nYz1qVoSWDvJuQQ2a4k8S+nesP/pqvzlf744gxMlHXEEs2+t0abO/Vc08YxCHmC9UeHtVm6pnpoT4I2JLqJtZicjHPvJEQYenpqDi0wfr2NaFdh4BF9mRP7Lq39X8ClGNK4ggY3Ot3OWqfJigZDsR7LCWK7DVOyBeMjjFb33YIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783558096; c=relaxed/simple;
	bh=0kJ2IMa/afXUZWKFGfFlPo9i1DnpVDCTWIdgE6KoPac=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k/pazskTyGHS/12gqJer7Q3NkBe+8J1grR/mQAiQU002INM9FdRS+MOP7e+bb7BdHllttRooEGImLN9/cJqNEMF6YItEPq5ydO4ce+GLreUi3zXHAfyXo24MHIgpAp0LFMKDq5kiWuv3CmqGJaDtfE2DS6bOrLnztJP9nRRONqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fYaCyh8c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kpp1ZdDJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fYaCyh8c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kpp1ZdDJ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668N8xLJ038229
	for <sashiko-reviews@lists.linux.dev>; Thu, 9 Jul 2026 00:48:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gz2zzoiKa8nBCLIddH2LPjpf+59l5OpZUeFvfC9iTuc=; b=fYaCyh8c/XPGnP7L
	cn6GO06ER+TezAcOL7FiE6/nDX9Txh3CpmSGfJUsD+NO0bNmEJ4ifwqY10Dmuv72
	uZvBPwrL5RTO4g8PorJYZI02dpVaY6u5SNU+LKgbB3lvP2bqTbGubfXG0UEqRN9a
	oiJINlfBH7ksFSiBegvIupXVtKnGQ/gyWduwVK7b6nEQEXdy4M9WMhdFqD5924gP
	pEhgr8CgaZpkwUyIvdynsxC8cASfdL4ioDRm4pVZwYtncS2eW2zYFZq9yMl2Cpzl
	P3WSWlVGhCBjItEgkOLZ88kWlrVNiwWgNJzLihNQSE0Sg5IEDQgQYugeybJ6K5S9
	wZo0Ug==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9ug6h6u2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Thu, 09 Jul 2026 00:48:13 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c88ad1558f4so772312a12.2
        for <sashiko-reviews@lists.linux.dev>; Wed, 08 Jul 2026 17:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783558092; x=1784162892; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gz2zzoiKa8nBCLIddH2LPjpf+59l5OpZUeFvfC9iTuc=;
        b=Kpp1ZdDJppf+aLAiwZ3W1jO72oi/MxArgj1/vKXIppukUqzucdhCvQu+wTun0q2t00
         OFnUiRCugXaXhvfAuALHpHwACLgTLmxovkk2M3bFOSY3CgF0wkkpuSSrq1Kv7graFMuS
         oPsRhGioICwi5N0tb/NxE7GouspY+FHvkkakt3kI3TT6AKB/aTm6e/Ap850O2Uz8gn0n
         6wdyRfjg+v3T/oGi3lZRKzqevZX8Bfub481hSNXGp51blaqi8nVLd3rEc86mLg7vTu7x
         NjFeIGeQhEZHEIkcpsLFZsrkydyDGr7tB3J3iqCvDq2K+eCpDXxovoIWE4XeLLEXxtvj
         210Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783558092; x=1784162892;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gz2zzoiKa8nBCLIddH2LPjpf+59l5OpZUeFvfC9iTuc=;
        b=YCCwE4wTINDHok+1saL4aX+kmHhnzFuFAyZjakKwUCULPP4uSSrauW4G2r9+jemYhm
         AFG9/GgJx3DRMWeS5Mj72JJ96OkmA34nTh+lwu2aSUhejor+sHhoMZNkDT2N5KRnQIe4
         VnDT89BIlpcWvEepDD2pVR2Sxt036+hY8A7WMaFsAPPXxOZ77+LpyRI0TofgR1vxgzJD
         S6fzI9ZMG9BhdGWjhV3b6aOtWI2MeF41G5vxF+rlFpWi5rKzFJ26/zlNdVc0kI3W6FuA
         1qEU26t1Z1DYljLfK623JzJPE1x4NC2y0EQoXplh/kVq0yTQVcznJanQxCewvehI+wO6
         ZznQ==
X-Gm-Message-State: AOJu0YyOb0e689maHS3GfIju8uDzqMwBszj8vBwm4aUdL0HK+pNHsYQs
	+XIa5FBx1RMN2Mv0WAmPUI+uCw4JS6c/TW2MEzrq6ZvXE9Rl7ggJiZbJLHA2D2FxQgqR4kZ/TVT
	GIaaTvUaHKZzaot/zgxsy0IAZ1J0dWC6e1D7iyZGR7SCAQSAC5yWMqL5JIMFp3EnCH2EzwN5cic
	b6df8=
X-Gm-Gg: AfdE7cnETC0KwJSGNj97AZunEx7jfupicvtPpsIp38IiWwxjXDyyItahYFTQe32nT83
	xjb4x1CzX4mi+lK5JUKA7IXXOHYalMwR9XCKGe0dVAYWZOCq7A537Z/mqhob2syl9NjfrZWPn7h
	16b32nMmhaUWWNn73vmmWVOxCL++7xv3rTmbvEUs76BGxyddtqoLh7zspQfXi10uRJOV9Xaof2T
	sHQi3EkRzXHCAkdtggRlrxE5+mLkCSc2Hb3sGhxd9T77UsLwJTSz7ag+cX6dxNM+PKPhs2KZPgS
	7qrr8xuxyLkJIi5jdFEi0A570j6TZVdK6UDo9i8jJRFCJQ5nhaCJUjhGj3In2VF15zCMdrd546p
	QHvW3KQU1GB5w/Ic2CXpYpQiICHyxets0UhFsc+X32OimpPWzBuukf9L46ovF05AFAlU=
X-Received: by 2002:a05:6a20:428b:b0:3c0:9c19:658f with SMTP id adf61e73a8af0-3c0bd00234cmr5913865637.73.1783558092561;
        Wed, 08 Jul 2026 17:48:12 -0700 (PDT)
X-Received: by 2002:a05:6a20:428b:b0:3c0:9c19:658f with SMTP id adf61e73a8af0-3c0bd00234cmr5913834637.73.1783558092110;
        Wed, 08 Jul 2026 17:48:12 -0700 (PDT)
Received: from [10.71.178.173] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31189cd8234sm13895635eec.9.2026.07.08.17.48.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 17:48:11 -0700 (PDT)
Message-ID: <5bb46fcf-d769-4ef7-889b-ae1524cb3492@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 17:47:49 -0700
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] cxl/hdm: Enforce CFMWS HDM-H policy at decoder commit
 time
To: sashiko-reviews@lists.linux.dev
Cc: linux-cxl@vger.kernel.org
References: <20260708213047.267024-1-mayank.rana@oss.qualcomm.com>
 <20260708215718.A584A1F000E9@smtp.kernel.org>
Content-Language: en-US
From: Mayank Rana <mayank.rana@oss.qualcomm.com>
In-Reply-To: <20260708215718.A584A1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDAwNSBTYWx0ZWRfX8j7/U+FzidFX
 1aMaeniK0yXD5VNowNiRJ7pIt2ZtBi4t1/i1I7BFGHTlYpk6BdbTuixDkBJ2cocBx5yzaK3MI4z
 nrmc2e9KpbkUPDSQxA4Oduw2MInxlyo=
X-Proofpoint-GUID: EQu-y4y3-ZpJ-VzNHECANTW1vxKkJTn2
X-Authority-Analysis: v=2.4 cv=cL3QdFeN c=1 sm=1 tr=0 ts=6a4eefcd cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=oHVBGa2KwL-N18TGJlMA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: EQu-y4y3-ZpJ-VzNHECANTW1vxKkJTn2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDAwNSBTYWx0ZWRfX+UexWRvhd+Uo
 TXv+XxP2y+qVl5XLr3HOSfdfSXQu4X7AEG6fltT6euSJORSdO8I2aE+78++VBwGVKPVAvIzF6na
 ATdPT6uRDiksZSO/70M3/eqUipRP+synVH7z9FPquS0DjYU+x6hh9hQN8df0wKGfMYdIDQNLMOj
 8MZs7aJpJ/HX3YmV0mn2HOsqgtgxNUB9pg3Be3f2pk9bn4Gn5+EZvnOg1NWNK/bqhnNl0AW8JiE
 fKfwM4Nba1cnTo/a+hVdV3mU+ODIGPVHAItcOS0zHjJgol6TMk6319tsiNYogzLF72aO1ZJkg9b
 Shd9eVfY40UptlwgBmxMSN9LEVxk5fXRxhUUkFcHyI4ch2zEWvFWglhHzH0942DXMG/uyBHaHXR
 ZGjUPsp6ExDxlVpYvTs7YUfiLPd/sYpqwow4G7KGuM3ULTglWcyGGxFw+3hKCPVkYb46WNxcLLG
 ile1RlDxdrshFQTtbVw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_05,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1011 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090005

Hi,

On 7/8/2026 2:57 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Incomplete CFMWS restriction enforcement allows HDM-H commits on HDM-DB only windows
> --
> 
> --- Patch [1]: [PATCH] cxl/hdm: Enforce CFMWS HDM-H policy at decoder commit time ---
> commit b323fb5684f24e6f22174021a05686b301fd4e31
> Author: Mayank Rana <mayank.rana@oss.qualcomm.com>
> 
> cxl/hdm: Enforce CFMWS HDM-H policy at decoder commit time
> 
> This commit adds a check in cxl_decoder_commit() to enforce platform
> CFMWS restrictions, rejecting HDM-DB commits on windows restricted to
> HDM-H only.
> 
>> diff --git a/drivers/cxl/core/hdm.c b/drivers/cxl/core/hdm.c
>> --- a/drivers/cxl/core/hdm.c
>> +++ b/drivers/cxl/core/hdm.c
>> @@ -834,6 +835,19 @@ static int cxl_decoder_commit(struct cxl_decoder *cxld)
>>   		}
>>   	}
>>   
>> +	/*
>> +	 * Enforce HDM-H: reject HDM-DB if CFMWS lacks CXL_DECODER_F_TYPE2.
>> +	 */
>> +	if (cxld->target_type == CXL_DECODER_DEVMEM && cxld->region) {
>> +		cxlrd = to_cxl_root_decoder(cxld->region->dev.parent);
>> +		if (!(cxlrd->cxlsd.cxld.flags & CXL_DECODER_F_TYPE2)) {
>> +			dev_err(&port->dev,
>> +				"HDM-DB commit rejected on %s, CFMWS restricts to HDM-H only\n",
>> +				dev_name(&cxld->dev));
>> +			return -EOPNOTSUPP;
>> +		}
>> +	}
>> +
> 
> [Severity: Medium]
> Should there be a symmetric check enforcing the HDM-DB policy by verifying
> CXL_DECODER_HOSTONLYMEM against CXL_DECODER_F_TYPE3?
> 
> If the BIOS incorrectly leaves an endpoint programmed as HOSTONLYMEM on an
> HDM-DB only window, the kernel will auto-discover it.
> 
> If a privileged user subsequently uncommits and re-commits the region via
> sysfs, cxl_decoder_commit() would run.
> 
> Because this check only validates CXL_DECODER_DEVMEM against
> CXL_DECODER_F_TYPE2, could it silently allow a CXL_DECODER_HOSTONLYMEM
> commit despite the root decoder lacking CXL_DECODER_F_TYPE3, thus violating
> the platform ACPI constraints?
> 
Ok. I will extend enforcement to cover both directions: HDM-H commits on 
HDM-DB-only windows are now rejected in addition to HDM-DB commits on 
HDM-H-only windows.

>>   	scoped_guard(rwsem_read, &cxl_rwsem.dpa)
>>   		setup_hw_decoder(cxld, hdm);
>>
> 
Regards,
Mayank
