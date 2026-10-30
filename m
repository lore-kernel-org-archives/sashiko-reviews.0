Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793345631;
	b=4TdrNyW/fTzX0k1zyohq0ZMugwOLZQ4dDbVJtq3XJ92cQCwU8H1mDy/F0L0ra4PjIrVl
	 cdnw/UgB353KYTOLRlsPjYQHJzakDgzR3wl7U6vg4UWcLPbKaMC/kN4oEUFAkGCrisG8q
	 IbxPWC/mqOONgaYrhf2T/Z/fMum5bakkDvBqBW3mUGFfhdzi0kmQquCsjmRpIEeECr+Mn
	 Pq+/rlvNvPrwJyk/tqrbt4H4DTVNYwGeXBRuc+JR2tkMTCll4LMUkX3BxvSLjdbj5VdsA
	 8/WQVu8fSFZRWHL5hxgtK6VXBw2UsGCnK2AmWpzyODd1SyO5ZEEcVNgJQShvVgDk4qQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793345631;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7XJIAhiidxeglvGcwqGX9Zevy6cLKtQ1yDQdXG6Swds=;
	b=0j/4Be8HISif1pIAh+rQW/aLXnjytz3p630R7gGLbxSpK/D5TqBpMwfmtcJBKmqzkCc2
	 aT9VBWBYkk+AgrlAKs6p3LyAT+WepLrgrLaogtFeuu+fOl956bC9gaLEQqzFig8ibiNnV
	 dIvFFQ8YQvC2QuhWVXYHj1pfoqVeTfpxVQ34wJj6ORPZymXd1cAkH+3k0IyLKTTEsY6NM
	 Enm0gLI2jX+HJJDyXIlxiGYaRsPWXx//j0kQLKV687ayKLEze1i+teScKUFd/V+PgKvHg
	 FzzR5nuBr2daVZtTeYUROoBmorUwzjubmYI/klGNxh3bg3Q5WDcC+c0xsHLHSJirqVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="gY/6Mmo1";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MCHzqzjm;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B30606A324
	for <sashiko-reviews@lists.linux.dev>; Fri, 30 Oct 2026 07:33:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0B30606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gY/6Mmo1;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MCHzqzjm
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U5FaRw2328978
	for <sashiko-reviews@lists.linux.dev>; Fri, 30 Oct 2026 07:33:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7XJIAhiidxeglvGcwqGX9Zevy6cLKtQ1yDQdXG6Swds=; b=gY/6Mmo15swaovij
	7QMQ3lMnOhPfkyE3bAzID94ZAShm6ILrwGaluc1tf9/fKPL5e+jOHUDCioCQKEUl
	3rkgFh6uFVnz57nnnlpAObCIGHcHLAayL2VCxJRL0GL/5Y1Ob9seGONFIvjVUWnJ
	eSkrfdjkHHaVKmCiixMu/NrrPm3uy5ryWZ4iAyAHtOr8VMefaRS0e+c7Bv3ULRic
	Kat5L5TBjgA72YHB89NgDOVLUpBylOFiwJlVBl4XMZlAK/3Xye4+MwfzBztMtHtL
	VsDHDYm1pwpPEiaOIc6s3JZOlm+w1KYtKq+PDQUGaTa/dYg2jnSBqAxXO/mtH4uo
	JP+s7w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qhsk4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Fri, 30 Oct 2026 07:33:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f1f2fafeaso46155885a.2
        for <sashiko-reviews@lists.linux.dev>; Fri, 30 Oct 2026 00:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793345628; x=1793950428; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7XJIAhiidxeglvGcwqGX9Zevy6cLKtQ1yDQdXG6Swds=;
        b=MCHzqzjm7nIuDhHIg8mb7+tx0abvPUgW4wjZ7+Lcl0RUVzZ1IftQNDwkciBGWEeb0L
         tkfTZWzXNiLLa+oi/PumbjWTah3XZXc4MCctf5soq+GDPWeol+Ov9p/B1PDztumAODzh
         ALxIlwu/hvL7Ok86yHqt2MpgtT/vmdy2HRZGpTEB+c8KYeYdXqn7FVsB8DOnEtLQNb+s
         /YCCbq/5BIq4fGkPf2TxhFBFLC78F/ZASD8Eoc6uCuu5y43J2dqmqawVjKW3eGKAuCKh
         GBUJGR4c8In9GWOisc1Q2ufYGDEYr/K1ZRgybuEAoNhiHgnCEKuwk9MoDysxAuV4teq1
         FZrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793345628; x=1793950428;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7XJIAhiidxeglvGcwqGX9Zevy6cLKtQ1yDQdXG6Swds=;
        b=LxbTRdBYqni9xq22Fo1UZclATbrCgks0kn1CoKa+KJV3QSom9JkxcxX1Zt7uIKxuTr
         AXX4QVuUisCBA/F+Gi9JzUSkS3PghkxCkpu0qlODtbOzYDcjw24fjPFhmB0x2ez40xFH
         5P2VHlFsOW20Nda5BEOqvZb5U3lEVnWjS0XouZkZzMaZ479lFiV54j3em4A6hRSZqwML
         ouUW0pJ3VWDg+IDTX6hzl0segjKOwEr9p8lDPtWQXK60Lbo7I3YQiLs7QrNzI52uP/sD
         mg6IbRHmGZ8pd9R8AZnxcdCHkwey93a+wbozflwbNa3pJIy/Axyj/x1zLoZndMO9Fx0c
         OGcg==
X-Gm-Message-State: AFq9FYJdAExelkEyA48G68tup2/62xIKzN4E6Dfx7esW2rKjIcxnUrQ5
	Tz71x2AN55co4ySow+zRLfit+c5K68fE+p52FoVN9JP1L36Bs/3ln+h9sS7jT+sUQmHsvgLQYrk
	7AYdSsCVR7HSn+hUlDmSUGNSW6lHYzEXhRH6m6Hmtbdo28Xn36vRGFRyGO0u9QeVz93qLl7McsP
	voHhY=
X-Gm-Gg: AYBFou0tXcwa92OCoCZl7RoFh9UnX5NRp8IPFvyytpG2w5+c2lqj7aY/YlcT5JW3c4O
	wGumvEdlugMXlnqkHHU+7bIZRKOq2clV6jkcDsPaj4mAk1jyXLcsa06r0xBG1hQkHh4k1Rl7iSQ
	lD0Xst5eZfn6kK+oyKNSQzvCk8DQaBuFmhQl7jgKevJc0/U2QBhsOAk33qDNGN+iaOFppB/JsDU
	kHeNv+Uwcl0jA060HwRBqG2jz40CmHfA1kD5vjpWWbNRfyljAEumlYuWio5WTxejkeOdhgUjY+P
	MP85mvXPaC2a2bPa/JW45+LtYP5H46D/9p2NrGgeumf/wStaUxynMKm4BBFwWhqgPuqlQIVJkHz
	0oBOLDQbRKBvwJAxAMunL3zK09WDr8YvDoYseubUw8qB8p3w69P2a8uw5sg50EPwU+YxaFUSjQ8
	0=
X-Received: by 2002:a05:620a:17a4:b0:92e:bc28:5479 with SMTP id af79cd13be357-944214d169fmr270108185a.2.1793345628145;
        Fri, 30 Oct 2026 00:33:48 -0700 (PDT)
X-Received: by 2002:a05:620a:17a4:b0:92e:bc28:5479 with SMTP id af79cd13be357-944214d169fmr270104985a.2.1793345627393;
        Fri, 30 Oct 2026 00:33:47 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71baa1b3sm1652381f8f.56.2026.10.30.00.33.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 00:33:46 -0700 (PDT)
Message-ID: <89a22b1a-2c72-4415-b3b5-81acdd5dc171@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 08:33:45 +0100
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
Subject: Re: [PATCH 1/2] mfd: Constify mfd_cell arrays
To: sashiko-reviews@lists.linux.dev, mfd@lists.linux.dev, imx@lists.linux.dev
Cc: Frank.Li@kernel.org, lee@kernel.org
References: <20261030071137.100954-3-krzysztof.kozlowski@oss.qualcomm.com>
 <sashiko-outbox-190635@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <sashiko-outbox-190635@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: I1tWMK3pH2ljf1K3borIO4wpMWA2X5_q
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAyOSBTYWx0ZWRfXy0jmEb9wDpBm
 9yKj+rlYPHWb8WeQSTQ9oGoC97glmF7UsXRlHGvu1cGdttOjWEmdN4DG2KmnlOEYOL3XfpleQYh
 iikJv8hl5Ch7NxeJiVaiSg2U+kzuKmc=
X-Authority-Analysis: v=2.4 cv=DfSCOftW c=1 sm=1 tr=0 ts=6ae4485c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=fELvzImDkAvHXwbp4t0A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: I1tWMK3pH2ljf1K3borIO4wpMWA2X5_q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAyOSBTYWx0ZWRfX5OxKrxo8+HmA
 PAzoMBWkVauyI44bS2XqpQeWUDZkxisTa9DOrtXWUkjKVVwUXrrT1/EeVpDvwaj55OEzmoPxGVW
 sMJmj11np/FyebW5cU4vyTRjf1G6sUIMaNUct3npQzo/nmIRgSUtYgDuqwNBvnyhqlO/L6ZXGPS
 b0CNQY/i0T2KkDV4p+co1sXZdpZ8L9dlbyzQHoZenR6GWJSOgDZ1qX83TmE/+nbISk6ZsBISq4w
 A5NSI6qZiykpoJk+T4v+93c8DB6toRaubVmI3mYaZhtuqypNqlb0pSC0rVOi4Rs4VOQIsu1PqHo
 ExxFymUdz3ys8MfDWfOUX98ajTBFcj5rv7oomgzmWYO+XACt0+69A0+2Uqn7Mxorh9Zd2NzB6ul
 kC9qLxpfKY2Q+MCiS6wwcRzmWzV+XmD1nodIkJhvMxrpupcywBDKwkRBmpegnJQmQFKdgXBG84y
 hd5D7aRTwKz9wblzmBw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 priorityscore=1501 spamscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300029

On 30/10/2026 08:17, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] mfd: wm97xx-core: rodata write and const discard in wm97xx_ac97_probe()
> --
> 
> commit d1e87419971e113856988eb45a5e61c55d61ecd6
> Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> mfd: Constify mfd_cell arrays
> 
> This commit marks several struct mfd_cell arrays across drivers/mfd/ as
> const so they can reside in read-only memory when passed to
> mfd_add_devices().
> 
>> diff --git a/drivers/mfd/wm97xx-core.c b/drivers/mfd/wm97xx-core.c
>> index 1566a9b04b6a0..c0ddcd5219b57 100644
>> --- a/drivers/mfd/wm97xx-core.c
>> +++ b/drivers/mfd/wm97xx-core.c
>> @@ -104,7 +104,7 @@ static const struct regmap_config wm9705_regmap_config = {
>>  	.writeable_reg = wm97xx_writeable_reg,
>>  };
>>  
>> -static struct mfd_cell wm9705_cells[] = {
>> +static const struct mfd_cell wm9705_cells[] = {
>>  	{ .name = "wm9705-codec", },
>>  	{ .name = "wm97xx-ts", },

That was not supposed to be committed, stale worktree. I will send v2.

Best regards,
Krzysztof
