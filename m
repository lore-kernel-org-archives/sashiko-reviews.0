Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792576924;
	b=FEwy45IKp19c+sYQJZHSP8zdSrJtnixCJvROrPVy1pwdixx/d0YEwdhJgLc7HKizhcPh
	 7yfgHPXTSTVXvdOgxIOCtX2BGD3B9BiOka/CK1y6cZNktPfti718K8c7ZiSjTlDZPJc1O
	 uOUm6AKsPeby+Pe7OeJyEYx8cDMUrp9A+nQN7MB8WalIiIdeCztD6JiVGfd34pY8hmZOI
	 CVGv0xDr/hOX/6JV52i5DRE2bkxM7oMbxQWmYDgH5IZTOCo2AwS/nN0rS+XZ5xNVcFXxl
	 hRkNYSOnAxX+K8hoj2Td2SjuRIzfVc6MdVN6ue9aUXZbExjoKfUTu1w17C+PxzajYzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792576924;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=CJOiUgrxjc+64U0G2mkIKbgMGJKdd6rz8j2md+6Y6n0=;
	b=iPa8w4kjQTWyxKVLF3xEViL4Tkgb5Koa+Zlou0GWU+7hP08/oqOh8nuOaYOMxeI2Sl1I
	 4xYYhnKIgqzC4aoqzENy8Tg7J/vDRezcEg8+i7SBV+xUoZAtamtxQ9ls3j5eXfh7fNhGx
	 xL4naPKp+MHy/XjLoh1lw+yoracUxU7Q6V0JkQIgucTc/URqId8A2X9roHYPqSwhVsDv4
	 IAV5k7JPZ0sK7fcQ6iNotjA5MW+cD/7NQYlkKj+OXqlKrJA42+qKy13yRs3HA1b7BtnIg
	 iPzBhW1TVrtRvi1trXmjdVJk0u+roFSK/4/oYV5xVcVaYzDb8djjSRqtkeC+/2sGqRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Jw1qjqgg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HV+pdkVM;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D10606A31B
	for <sashiko-reviews@lists.linux.dev>; Wed, 21 Oct 2026 10:02:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26D10606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Jw1qjqgg;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HV+pdkVM
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L9stYm756329
	for <sashiko-reviews@lists.linux.dev>; Wed, 21 Oct 2026 10:02:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CJOiUgrxjc+64U0G2mkIKbgMGJKdd6rz8j2md+6Y6n0=; b=Jw1qjqggAC6SQMwo
	wCMcOCaj+FZz0W6Rzn3sjUodPfIWWDb8DHeh3p0qFhTjiIdKubwHLuLAkOZF4sb+
	wZ9VyGkBobHnwxwjCAFOY4u7UCS14z17tdyoboIna7tlIZtZQA3VwMWbtwNTp2oZ
	D9z9LIODIif4MxLyyf23hmaHuyifkyBDB9UHzRmp1XwXKWo4GC8ulvQGkNSXEZR4
	COqcQfdzxazU1n/+y7rtspk2AOqcWsiOAnIf0xxXTGHjNNE94c0j9rKlBsc+8CPh
	d3zYQkt6EFhCEt3NyasjqPJvfjxH5Iboh9gpWA9zcClQkvHHdmsgcCLZYOJ1G/r6
	/laOzg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda4ubm2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 21 Oct 2026 10:02:02 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ac7a4ba546so1091182a91.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 21 Oct 2026 03:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792576921; x=1793181721; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CJOiUgrxjc+64U0G2mkIKbgMGJKdd6rz8j2md+6Y6n0=;
        b=HV+pdkVM4PLJlSpR30YeROmMtt7WR90IMczXPM0o/s1AjOFDYvvgPxKoYiEMdu/Luc
         5lpySsbZibO5gb4uIqd+2ZQhy0srxDLT6YIMq33UYeTeFwxou9jjuY1G9/LoZC4B7alP
         DJ7qOVATLbhW6CKoeklHPvvl77NofIM93CZsfsrjXwh374jqbACMZVrN5/UCwGBWw5H6
         XWzkh1mTHVEm1weTZuiosjZzKoHAJ0J4aWf6V6eFVgna/7MfcJj76gSTIMLKQOj7tX/K
         nL280Nqp65YKqPxaJ1cePhIJ6Md9kmhioU9WSVgUMr+8k0YNCdK0nsMM2kI4EHHPBoWD
         34DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792576921; x=1793181721;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CJOiUgrxjc+64U0G2mkIKbgMGJKdd6rz8j2md+6Y6n0=;
        b=uyGQxLZESrNGL3oDq/G/psHIvqcbENmIR5DlerZIBoW/WPOKJmv8vIfBv+iSlOsoOs
         KNzwLLwcHChEibAqGlUyNUax0qXj8IrBsBJqUiKxPhQmI8DW8IolXD68E6Q2NuP2pY0C
         XQ+Ax9Tqmm4M3JuEp2t4TWnfQdB5yncnmtncilAYclLYchXnhkVSsKjCaSkBJgGNXLSV
         Ko1wtle9Xrq1bfimOkiavBhu7Ly0voeJ1tPveY/4vNI+m+rlmejKAGIa5OY8YqkyyjzR
         ZyfHnPE4ytRkdvsX8MfEzbzMzp+UkaUGhN2KSv9lZaW6zzBzJCNDZYaHfr5ddONSe+k/
         AAEg==
X-Gm-Message-State: AFq9FYIKqkqp3iu2VyCX5keJyILz/1xw22Za0dvSTYrTai7qVwaB0050
	PVy9R30B/PwZYcCdHXpssUID0wPwHtJslZU09q4zdjZYKH0i5h9z30Y3Buuy+pPsNzYkvr+r2sm
	P3ct9YFCv/O8Hz2GCBd7ySd6p6qy+YVfORMY9gR4tKpKPwO5J2XziT+YON8AnEtMRWK5xn4pJwi
	z0caE=
X-Gm-Gg: AYBFou3VYQp0SthcsSjroUT+l/9RfjxQNFYbRRAtx2SF1dwkV2CeCdWxEw7+jQx5Qms
	VZWWBqkRstIg2e7rPMIqBPiJhueCGuPZTU+o1EHp0KLSZdyJMVrO/8Hv4pOIrBjAgYPl6wq3dGo
	ZtzaNbINHNYbEjh+gMKshUEgrh3oQtYGTVSTz1HXwMkcdxW2oRNA+XVP+VT0HhqsdFiAxwHD4Ce
	M5ymmJQb/+266zSLQSuhOV7+QvKk/lXZB3RwBDTOg4yrHYjQkgSDQEE8aG/3phR1IkCdb+5j/Bz
	wWVKUeY4pz5Hd/TQF5grm6ry5u38Ano9Tato/SKNbTann7csuOtbr4xIslFiMfmPEzREsxK7VsE
	w8CryduR63CszEFM8LNc89tgsAvE02mgluw==
X-Received: by 2002:a17:90a:e707:b0:3ab:b39f:41ca with SMTP id 98e67ed59e1d1-3ad86f397e5mr726750a91.31.1792576921558;
        Wed, 21 Oct 2026 03:02:01 -0700 (PDT)
X-Received: by 2002:a17:90a:e707:b0:3ab:b39f:41ca with SMTP id 98e67ed59e1d1-3ad86f397e5mr726729a91.31.1792576920944;
        Wed, 21 Oct 2026 03:02:00 -0700 (PDT)
Received: from [10.152.193.243] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad811c515fsm3426879a91.9.2026.10.21.03.01.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 03:02:00 -0700 (PDT)
Message-ID: <02c95465-fca7-4324-bb9a-5bc2b34049b3@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 15:31:57 +0530
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
Subject: Re: [PATCH ath-next v2 13/17] wifi: ath12k: use CMEM write for PPT on
 hybrid bus devices
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20261016-mpp-bringup-v2-0-f510c33bfcf5@oss.qualcomm.com>
 <20261016-mpp-bringup-v2-13-f510c33bfcf5@oss.qualcomm.com>
 <sashiko-outbox-173688@kernel.org>
Content-Language: en-US
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
In-Reply-To: <sashiko-outbox-173688@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: LJPti9MrB9GoBj9mLNT7aCAZVNv9gC-n
X-Proofpoint-GUID: LJPti9MrB9GoBj9mLNT7aCAZVNv9gC-n
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzOSBTYWx0ZWRfX2E0IlBJtja3C
 lH6NU0nJxv7JubcMOFJxZCt3MWafwThHRMTFeKHdRAcmnJnFjJ4zJOgLc9wNIyHgryAXlKYtvKz
 kEULJ4Ho8PSxpNhW9QJvBZc3STI6Ypk=
X-Authority-Analysis: v=2.4 cv=R7aWitRX c=1 sm=1 tr=0 ts=6ad88d9a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=svsrqo6iM0rPbd9dxYEA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzOSBTYWx0ZWRfX2hLF2W5u92Kv
 EL2vrDDwf1RUOu7VmFEb6f+SdXvpJFGinnWWLHMTYVOeU+djj2rqKO9/zGZ22fXMBEXQQzLwBol
 ogLYVdYESVMg5dINt/40pbh9oI/uyv7Nj9ELZ66sDj5F/P3xSzGmrzzGE7KEO1S1IyShxMavdF2
 ALwqkrceES6oaGn4FKkf/2VxKz6ijlTVHzSz3VxTtqLTK+/nYe0S7tAz1No94Aa1BM+rsFRW79y
 LmlqrWDzlOleuV+D3FiPSXUbaSW4kSEz+Y26Pv5Y4uhx7bFPiVdsjmWt4hYVFCGY49BXUUDBe4u
 ZBciZyaRP+EaNsAc5q4e8WImAwhWQcYHO4KMdlkRATbqwjrP2iv93Hr4FMitWJxdo5ZEuyyB/X0
 89UVCIakwttQ4ldQMwbpwm9wOpMmJcHDUT3Z0RhDCYF0A2gM/vc1mbaHKNR2w7a4NDg3PI3BIyG
 PZZbVqgEDhSpV8U4uSg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210039



On 10/16/2026 9:11 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] wifi: ath12k: OOB array read in ath12k_dp_cmem_init() due to mixed MLO mem modes
> --
> 
> commit b4813e2e272b2801865377c6c50ae123db10e5d7
> Author: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
> 
> wifi: ath12k: use CMEM write for PPT on hybrid bus devices
> 
> This commit updates the Primary Page Table (PPT) initialization to use
> CMEM-specific write operations on hybrid bus devices. It also propagates
> errors from these CMEM writes during PPT and partner copy cache
> initialization, aborting MLO setup if a failure occurs.
> 
>> diff --git a/drivers/net/wireless/ath/ath12k/dp.c b/drivers/net/wireless/ath/ath12k/dp.c
>> index 83f9edfabf696..6cf254b2d2a78 100644
>> --- a/drivers/net/wireless/ath/ath12k/dp.c
>> +++ b/drivers/net/wireless/ath/ath12k/dp.c
> [ ... ]
>> @@ -1328,24 +1328,38 @@ static int ath12k_dp_cmem_init(struct ath12k_base *ab,
>>  	}
>>  
>>  	/* Write to PPT in CMEM */
>> -	for (i = start; i < end; i++)
>> -		ath12k_hif_write32(ab, cmem_base + ATH12K_PPT_ADDR_OFFSET(i),
>> -				   dp->spt_info[i].paddr >> ATH12K_SPT_4K_ALIGN_OFFSET);
>> +	for (i = start; i < end; i++) {
>> +		addr = cmem_base + ATH12K_PPT_ADDR_OFFSET(i);
>> +		val = dp->spt_info[i].paddr >> ATH12K_SPT_4K_ALIGN_OFFSET;
> 
> [Severity: High]
> Can this result in an out-of-bounds array read on hybrid bus MLO devices?
> 
> The loop limits start and end are derived from the current device's
> profile (ab->profile_param->dp_params). However, the array being indexed,
> dp->spt_info[i], belongs to the partner device.
> 
> On systems with mixed-bus MLO configurations (like an AHB radio and a PCI
> radio in the same MLO group) and constrained memory, the devices might have
> different memory profiles. For example, if the AHB device has the DEFAULT
> profile but the PCI partner is using the LOW_512_M profile, the AHB device
> will calculate a larger end value than the size of the partner's allocated
> spt_info array.
> 
> Does this mean the loop will read past the end of the spt_info array and
> write garbage memory values to the device's CMEM Primary Page Table?
> 

This is not expected to happen, as all devices in the same MLO group are expected
to operate with the same memory profile. The profile (DEFAULT or LOW_512_M) is
selected based on the platform's RAM size, so all devices on the platform are
expected to use the same profile.
>> +
>> +		if (ab->hw_params->hybrid_bus_type) {
>> +			ret = ath12k_hif_cmem_write32(ab, addr, val);
>> +			if (ret)
>> +				return ret;
>> +		} else {
>> +			ath12k_hif_write32(ab, addr, val);
>> +		}
>> +	}
>>  
>>  	return 0;
>>  }
> 

