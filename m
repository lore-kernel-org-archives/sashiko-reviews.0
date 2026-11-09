Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794190861;
	b=Njll7f77oSKAMQtt0CAyJsJyKbzWpJc9VYamyZGnl7d5s3prf92zPm2JHxXVObVPipYf
	 3NmJ1clDZdC0ASzwyEAP/vspbvRHszOanLlBBtWUCrq9fn8OmtdEQhlawcpFWwUrroo/b
	 LxW5+BRUb3plLp8vAPvtavs3ENVHcPRp/7Kr4HT/Vc9qf5LQu2v5vNnay1/FM107y1uxQ
	 oRxGnJCTuhic5+zTdl/tBnNzo6KJ/IRFkmPXSNMr+taW2DGOrAVSxbPbjulnnCVe1oodr
	 bK1TlxvNr8NDYScvMgJgZHgJKpjQWa/IMaUjJVKQffwEjNbw8lol+nZkAAI4Xli+9Nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794190861;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=vTHCJSTydXzyoZqC+6clQ/H8kutgx2FD4bqzC+SBHLQ=;
	b=1en/lKjE2bWMrzshHJ5zqeaiQENQOOw0zdhp2Ywp6FVyfhXRJXidpqnEfrdfJjOnpu9R
	 012JaV+Wy6FVTsx2hjf5MnVK4uqcaT4eSaaY6J3BQx3gCo2VU7khmC1KEcpX+odYpZ75Z
	 Ym4dGMeeAWSGR+veXN1mW36ATnyl+8GrPCJUCdkRPLvkt4R5TUCK9lxQnCuu2qnwaj5I+
	 91g5NJhz1E3ATcu0u5GsCwRhAhyyXKhW9P4cRv/VnrDxt9Zga5miM9YmWN8DOo4RLaBWX
	 zTWgsI0J54oUyWZ49z/ih0G1mAULY5V+1Bcx3rB5Zc4ISlnSYCXIa36q5qVYaKXGhog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Xq4YDBbg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FvC5zVxi;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54152606A31C
	for <sashiko-reviews@lists.linux.dev>; Mon,  9 Nov 2026 02:21:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54152606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Xq4YDBbg;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FvC5zVxi
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A90HSXZ1266765
	for <sashiko-reviews@lists.linux.dev>; Mon, 9 Nov 2026 02:21:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vTHCJSTydXzyoZqC+6clQ/H8kutgx2FD4bqzC+SBHLQ=; b=Xq4YDBbgOranx0+u
	WArNa9ZawxoY9HxYffDHwnZ+aN6p9hVwn/tSbbRi/E0PQBLz4UzNwokfi4UFpu6H
	CgG8kDSx4KUjuuQj/VzluU+ePM+0JJ1TTl9zwObGSrPYYNlZyKTabIApp6n1hIPS
	DOcHxxiGDwblZqf6TA2pAooDOHwR8N8fN+JrozW4MFB3ObLaKne3DGoU47TdFuo5
	q/HevaVpCn86rpqewqN/TR3u2pPIBzpREilS4A2FByUovbd9ixydMNYxL4SqQMPj
	XhlDThZWiEAw2jDAaZYoBCDHGfabnNciA/51OF7rdTn0mXI3URgdarXMuqYsa6AU
	L4XhsQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsw5k45ea-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Mon, 09 Nov 2026 02:21:00 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ae19907a31so318936a91.0
        for <sashiko-reviews@lists.linux.dev>; Sun, 08 Nov 2026 18:21:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794190860; x=1794795660; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vTHCJSTydXzyoZqC+6clQ/H8kutgx2FD4bqzC+SBHLQ=;
        b=FvC5zVxiEJhTYQ5U1wtJj1pp9bt/wsAiOlKXw/KxEvAK78gtWwsXd170OJ/feV8vxi
         NQWFkG7dMfEGsHUkazd7dML15VlxBJzcUfdTYsDMnciRInVnOy58pkWffeFtXddVII+u
         m4xjsP2Yp+xgNJggsqFXLMXy1plfA02h16YpMYF1fixX/i4gM3jVGXsbtz8Xm9+VoFx5
         bs/w5yxfCy7ZutnEF1PBx1hI+rBpnuqrwrqpfhR6o4od+B0mj8MdIZaJnFwmoW+hZ7IO
         j8LN7fSL+e0yLQbVCaoIy4JPuUSzxj30lISzl428uLDRFaqrpIewk5rPxA4rK+d8VFDm
         ipxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794190860; x=1794795660;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vTHCJSTydXzyoZqC+6clQ/H8kutgx2FD4bqzC+SBHLQ=;
        b=K5EY885FFh+GfWoKpltpfwfH3ON6hMNWzp2zI0bSjHPPcRmu6tZKG+y5EwRIUhR5vg
         CzME5t/Kb+cKfHLFSgP6h5IoZFzzCJkOo1yhWC7dno7cjr5/p72ZB5Et+YaWMhtiqPw2
         cRaG8DMFx12SVu1Ur0s23GgO17KK/zX/MegCeBWScfVzHKjEWBYWFRuvu2Qazgap/j/F
         A8JanQgYoH3XX45grHzgWHOomlfs+73Nb7ACWEGd1nPldp8cV5ZHQTB17okkCa3DtCcC
         1wMnlq2MjVeTSfgGhYHMb9IpSO86g5POXHma4b+jhmgFPGKwjyMusj7LUTIMNZ/0or4R
         T7TQ==
X-Forwarded-Encrypted: i=1; AL+hErFniq/Fc3wVfrvIip0+uz62jZ+LT5/GYBb37FvSNOtnDFeKfwB3vFNS4Y7jTq4rgConvBpqt8BtRtXqzN/BpkM=@lists.linux.dev
X-Gm-Message-State: APuU4Z+b2FsaVubFEzaRN7rtVGFK6Uhkqa3bkwAGeQDAjQz1rbwn0Z71
	hUT+yHQSvEpvSR5SsJRxTUaF7IfuAl9oXc+Htm5GGHZI/wokR3vMZdkl7yA94D0zS7W4GZV7xFx
	9J91tobu1w3AFJnEkRqklpXioJIFjacQIx2PHOypF8w1qS3bRJ3CXIRU9H+aXRzps17YHi0A=
X-Gm-Gg: AYBFou0lIeYPYNhmguob1MmXkzMN5JTC/I4xOnGrRr6/upogDdTD9kK2NAIXNXDX0P/
	czPuuUvnPxlbI8zDtTzE59o79ogbpt8ikg/5qxUym+QyheNB9HVKmUMA5gfWM7xpcQdBLF35iBo
	wnms1C1KyoNlaY4oXONuuXLFuHSh6FRGSK6aOBTeTO9Q+cGhq+UKNDYSXWzkycxQhM+yQr/jing
	w1Fp69xb2RRmYZXGmk/q3DMFI1hhdRQm1CEg64+RixxWKHcfIoK/PCn4l3Zw2nf7rNePiytpcfK
	jeKPcF7NB5IAPtP9pN41JGMs4f1lPJK3+DGRUamD85+nMS8tl0yn0HhBlbm+wJnz+pCfVKrAPiU
	jf6e7aWIVrLdAKl8lkJj1U9GbBuyvNAg7kADCMD3Jt6qBQZ0ficKOAn6EOwobsM95yvYQKfo3lr
	aWaRtAYg3TTxY91RPbEb7eDvto4p/hkOIG
X-Received: by 2002:a17:90b:2588:b0:3ae:3b3d:c617 with SMTP id 98e67ed59e1d1-3b12d54a316mr2013102a91.29.1794190859732;
        Sun, 08 Nov 2026 18:20:59 -0800 (PST)
X-Received: by 2002:a17:90b:2588:b0:3ae:3b3d:c617 with SMTP id 98e67ed59e1d1-3b12d54a316mr2013087a91.29.1794190859258;
        Sun, 08 Nov 2026 18:20:59 -0800 (PST)
Received: from [10.239.96.176] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1032b8c55sm4961050a91.2.2026.11.08.18.20.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2026 18:20:58 -0800 (PST)
Message-ID: <f5a3fbf4-a7fe-429a-89d2-7334a2375da4@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 10:20:54 +0800
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
Subject: Re: [PATCH v24 11/15] media: qcom: camss: tpg: Add support for v2.4.0
 TPG
To: bod@kernel.org, sashiko-reviews@lists.linux.dev
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org,
        conor+dt@kernel.org, media-ci@linuxtv.org, vkoul@kernel.org,
        neil.armstrong@linaro.org, olteanv@gmail.com
References: <20261102-kaanapali-camss-v24-0-d6b8f3f6f66f@oss.qualcomm.com>
 <20261102-kaanapali-camss-v24-11-d6b8f3f6f66f@oss.qualcomm.com>
 <sashiko-outbox-193294@kernel.org>
 <179406416444.650304.12581893664974319470.b4-reply@b4>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <179406416444.650304.12581893664974319470.b4-reply@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAwOSBTYWx0ZWRfX1q0lkXyrImUv
 b+/V/NWzQJIkeeRoAPox8N95knA4M8fEW1eYUjGLd9fy1+MRMx4nGKL5waSaZF+y46gRue0FsBu
 cd0cAcOGqZog6HlP95T1li8P+wdHVJ+0rVwZSNmpLD1KFZcW7oM9BZz1BKv7WhK3MA0V4CS0hTX
 BcYTHRR9b/0sI4qKFuJO/zEck3t9/57Mq8QZ1BQphvNIKNceo3b/ve7vNwpkd6X52VD0fO+mHby
 WATbDnNraQ8gixMnLgr6406CzvthsZAXRxF0oMbbBaer2iBiYBSGFucbjDBFEgTVztOR+WNuxPb
 g51cBA+uAbf6bUSPywVb2QWJVdZBR8aO3JE9+6vdWTGn0wYC2UrcyN7KE/0yqrkewZ7xV4TYbFw
 L2Zg+bKZhr+TAHZ+iisObtEA2D2Hox0PoPdMMM2lYe8690Mg2+q2zHp+6eczpStMhFraGtIzHnN
 oaSl4c19Nf3LaOeufww==
X-Proofpoint-ORIG-GUID: YG1qbWYkoEWLY4C6dUF0HqFCYSPhxHev
X-Proofpoint-GUID: YG1qbWYkoEWLY4C6dUF0HqFCYSPhxHev
X-Authority-Analysis: v=2.4 cv=G/aJgNk5 c=1 sm=1 tr=0 ts=6af12e0c cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VNQ3AZqY8Cfn8RaTT-QA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAwOSBTYWx0ZWRfX5DNnvIUDRmh4
 Q4wkDXBxvJsFiYCctyt+VyN6nOV5/SIxPm/WDMJvvr2btnS8Q3zFkfB8os19lDFE8xKEc5qOuuV
 6rfb6cIDidwIkfItgT0mJIvijxAforQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0 clxscore=1015
 bulkscore=0 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090009

On 11/7/2026 11:09 PM, bod@kernel.org wrote:
> On 2026-11-02 10:52 +0000, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>> - [Medium] media: qcom: camss: uninitialized hw_version check in tpg_reset()
>> --
>>
>> commit ea18d39e5144ca1e8d628aa5ab708e84983e10a3
>> Author: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>>
>> media: qcom: camss: tpg: Add support for v2.4.0 TPG
>>
>> This commit adds support for TPG hardware version 2.4.0 on Kaanapali,
>> controlling test-enable and hardware reset via the TPG_CTRL_CMD register and
>> routing the TPG output into CSID 1080 RX through the CSI2 TPG mux.
>>
>>> diff --git a/drivers/media/platform/qcom/camss/camss-tpg-gen1.c b/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
>>> index d29de5f93c18e..cabbb2638cf38 100644
>>> --- a/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
>>> +++ b/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
>>
>> [ ... ]
>>
>>> @@ -164,18 +167,26 @@ static int tpg_stream_on(struct tpg_device *tpg)
>>
>> [ ... ]
>>
>>>   static int tpg_reset(struct tpg_device *tpg)
>>>   {
>>> -	writel(0, tpg->base + TPG_CTRL);
>>> -	writel(1, tpg->base + TPG_CLEAR);
>>> +	if (tpg->hw_version < TPG_HW_VER_2_4_0)
>>> +		writel(0, tpg->base + TPG_CTRL);
>>
>> [Severity: Medium]
>> As reported by Sashiko on v17 [1], is tpg->hw_version initialized when
>> tpg_reset() is called for the first time from tpg_set_power()?
>>
>> In drivers/media/platform/qcom/camss/camss-tpg.c, tpg_set_power() calls
>> reset() before hw_version() populates tpg->hw_version from the
>> TPG_HW_VERSION register:
>>
>> drivers/media/platform/qcom/camss/camss-tpg.c:tpg_set_power() {
>> 	...
>> 		tpg->res->hw_ops->reset(tpg);
>>
>> 		tpg->res->hw_ops->hw_version(tpg);
>> 	...
>> }
>>
>> On the first power-on after probe, tpg->hw_version is still 0, so
>> tpg->hw_version < TPG_HW_VER_2_4_0 evaluates to true and tpg_reset() writes
>> 0 to TPG_CTRL even on v2.4.0 hardware. Should tpg_set_power() call
>> hw_version(tpg) before reset(tpg), or should tpg_reset() read the version if
>> needed?
> 
> Hangxiang can you have a look at this, seems credible to me.
>   
>> [1] https://lore.kernel.org/r/20260929061248.E035C1F000FF@smtp.kernel.org
>>
>> -- 
>> Sashiko AI review · https://sashiko.dev/#/patchset/20261102-kaanapali-camss-v24-0-d6b8f3f6f66f@oss.qualcomm.com?part=11
>>
> 
Hi Bryan, You're right. I had previously argued that the TPG_HW_VERSION 
register always resets to 0x20040000, but that doesn't help here. 
tpg->hw_version is only populated by hw_version(), which tpg_set_power() 
calls after reset(). So on the first power-on after probe, tpg_reset() 
still sees hw_version == 0 and takes the legacy path.

This went unnoticed in my local and E2E testing because the extra write 
to TPG_CTRL happens to be harmless on v2.4.0, but the logic is wrong 
regardless.

---
Best Regards,
Hangxiang
