Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06712DCF74
	for <sashiko-reviews@lists.linux.dev>; Mon, 12 Oct 2026 07:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791789611; cv=none; b=KQe5u8dJ2qurD9qixHq4HTCu9pq5WuIHL7UdKPsFsOcsIP1oWOYjD1mT+zuX3TWjB//A0Yogflp8wiItg0uG3OmBqLA0isKPfgQOrZzT3jIWFS1cNcf1WStzeRyCSP7RZXNfnCK4iRLNLS2oWEzYl2oZG6frmyWf553jjWd+8zQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791789611; c=relaxed/simple;
	bh=XciQQDY9y19AVvyZkwuyPiYCMBxrfTA4c/k6gnDhQqU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NYqByvvnHsiaHmFNhrNGJ2fKgxihi4+zJEAoe+Z7UTBirFqfT8czO4xtlxBcSmcNPCWrzWB0FenLV3zlmRL4IETOc2gH/EFbmTSe4imUtVz+k7JjheysFmc0P68+N8FY9YThdRxVGgiOR12MK/oXMJS1XMwwXFL7lPCF4DFLW0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QENyWS4L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kSv7lWt9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QENyWS4L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kSv7lWt9"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C55jEf750974
	for <sashiko-reviews@lists.linux.dev>; Mon, 12 Oct 2026 07:20:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3YLFp7Ql215BnyKTwtRM0IX48xqWM6YYgDQenq2aqPg=; b=QENyWS4Lwkkys6mI
	8IZFGH/Jmjd3svjCWNDhw1w4we0kDzS5xJ8glxyXBEZjYYbeaJXqWCGbVWl7DHxK
	90eaFj6dD0bv1mCgDkhhBaHPIeO7hWZArYkHG3HIjhds4DW2ZP+1Lmb2+epxnJ0m
	Jyj9o1I2Y6fvkmwCvj2Mon4pUX/uhmJv65nA34EsWdtmoyLSVPGz2ndcOB87tf64
	bz62YpSpzix63LnMdAKhF2q8skRTL5yuiYNjD27U22+CjR8hu4UPE+2jYvS5AAv/
	kGsA01eU8WCGLZdjYov6WlfafrNM7fHffa9siBKtJWBqhbI4T1HDfKPOdmAKXQcx
	dqY+ZA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7e4ed75t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Mon, 12 Oct 2026 07:20:08 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3abb4c24125so996965a91.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 12 Oct 2026 00:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791789608; x=1792394408; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3YLFp7Ql215BnyKTwtRM0IX48xqWM6YYgDQenq2aqPg=;
        b=kSv7lWt9xmsKifv5S3kPyipqrXGrH1ZuCd3J9plFN5LBfl82cBwlbnLzR2Fdy9qa/t
         EHe7pli+9BWtTVzr+dUSD1rJukc7vpJPUQaWUGggxoYy6SrArS/D06EJCVUtc0CowJRX
         3TEAGb9qdpYgNYq2dq2uc8vSu/p+2VtSWGU62rrdE2LyPtpsJ+/ORVZmc38dTWFfZgcp
         QGiDXXcmxvY0KSmrICxiRYOzv77e1MYwFAgmArFKjJprADgeYjSY/YWeKpCJaw8VR7c4
         jLnUtUg6FFLFjfUVEgcomak7eS5A7Jc03jS8GjYdvRJ/wrNcsHt5539YlgfZVnBTljRT
         ykDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791789608; x=1792394408;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3YLFp7Ql215BnyKTwtRM0IX48xqWM6YYgDQenq2aqPg=;
        b=RNkAbaqaGilvyIVkCrYhiL4Dm+z86ibHq35mKsm0KBsYJ90pizKP/Q6wuglz94UxaM
         jHU8a570neAfV4ypIPr8XPA1dX5BcWGlkKgGPq6/wTF66St4wyHPCoDr2mIDuiCzel0R
         LQJjIyUn6IuZqJnA8cJZnwOkLn+5mTYpHkJ+bAOPKIIiLLysN883FKFAXEtN2Rbw8cFE
         ZXskMT0ZfWaJ4ZbVmgxIlvbak6ICEZKQ0MRPdzSKgyisf0JMqAPT/TgAHNy48FQwOHzU
         RY3nkTEAyYc4fnfTsSTTW0P7V3Z3piwoovCdvM6gak4bUh4eWaBzkxXeP3huhNCZzD2N
         FIZg==
X-Gm-Message-State: AFq9FYJjpoJm0X4DiDR4JtuQP9jClvd6NuUU6Rf91AuiI5AN5OHetGRX
	KQivZWXOBLEvWd6JwR6HBzXkpNJCXvfcPSZM+5c3cX8yFa7IO16oXsGsdF+qvEpXRT1YXZiFjl4
	XN/JgOVZhKNJRoSrbKzuK+XgQAgg2FmlVnoybXmuyFlNcw5xLYum/Si+8a2/3ewhqlZdsv8734y
	Le6lw=
X-Gm-Gg: AYBFou2tgCs+Fu16PhxkrerBokAxddYlwWF+9ZBBV9FJdh+vnyAKd9WFSSRM+SadW8k
	5jZJoS1oC8ABfH1FomMjtkUq9kVW5vExxeJUl0ew6Hm2JlKjUlfEhMVplyY4tbLSvk5NaW3mrFl
	d1CZY2pfzSkohC56hYwhFZEW71pb9wxNJY6yuYfJDulqugzSRxa0O3aT2K2MVSxeDBy74hwqLdV
	O7euK7vZKT7mGKsmEJJj7aQ6D3i0TsNnNSiS982p2oJEgmG5JgdEUTjb8w0WYrUgyAVUFizgPJh
	KKbKkEWd3yiyUtcZ5gXpi6VAp/NQLgMkF50Oaa/55wIIFQohVHPuFyRVYQHgRM9eo7FdChP3wbc
	C8hkjaMjogEeLEMt6z6ldKd/hN8EUKjUBnwFceG2L+NFq1wXr+gCjTSyAgosEm5E=
X-Received: by 2002:a17:90b:2790:b0:3ab:be66:ddbf with SMTP id 98e67ed59e1d1-3abbe66e03fmr2667654a91.54.1791789608137;
        Mon, 12 Oct 2026 00:20:08 -0700 (PDT)
X-Received: by 2002:a17:90b:2790:b0:3ab:be66:ddbf with SMTP id 98e67ed59e1d1-3abbe66e03fmr2667641a91.54.1791789607644;
        Mon, 12 Oct 2026 00:20:07 -0700 (PDT)
Received: from [192.168.1.6] ([117.143.161.217])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab57c05724sm8573913a91.4.2026.10.12.00.20.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 00:20:07 -0700 (PDT)
Message-ID: <6074e2de-ac54-4af2-b8e0-ae3350af0cdf@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 15:20:00 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v21 04/14] media: qcom: camss: Issue stream-on REG_UPDATE
 from CSID
To: sashiko-reviews@lists.linux.dev
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, linux-phy@lists.infradead.org,
        robh@kernel.org, media-ci@linuxtv.org, devicetree@vger.kernel.org,
        olteanv@gmail.com, conor+dt@kernel.org
References: <20261011-kaanapali-camss-v21-0-04fd28d815c6@oss.qualcomm.com>
 <20261011-kaanapali-camss-v21-4-04fd28d815c6@oss.qualcomm.com>
 <sashiko-outbox-167768@kernel.org>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <sashiko-outbox-167768@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAyOSBTYWx0ZWRfX1CAHpsmNRI+n
 ELS+/kPvCNP8kkyN1tj6C8fRyLCu36MNIDh9fxpEPW4TwzKPPs4o4q2W8netr5xPJnVECDpZ8Jd
 zS/CsHmfHmJ1xQC1Vp+zq3Th3D/1asVJ/1dGM9RxTEQNDFNdI6PYlWFWb7vFaTimJfDRDd+z7lL
 nmWwVLnwZFuZwOvgi1rHskv1lCpd7dAJDdS7Qa3jDLSMCfAqHg76QJgnC3bHgqGcAMS+m4ZUBdc
 vhGmQ88ai6tx9tKJuKpLFM1LcrDGemvbnlHP0C0Xm74Olx5rgRyT1V/EEmGiJ4GSIuW+NxRAtwn
 ErDMwM/6J175wli6aOqWoOoAtJPYoSsz6y0GMxPB9ORYgZTzoqpBudvcTWrL3Te4xP/RwDeWfIA
 7bnx4SEgn8ADrBW9deiNmyLv5gcM+sqSjK2uqJzMbcvB+StSBjKk5Q0vFQ49dDm06sEbgmdWHzc
 h+dhsa43oJSUhd7wTiQ==
X-Proofpoint-ORIG-GUID: sy0osOW8a4c64QJhXE9XNvPzqH_8GKxi
X-Proofpoint-GUID: sy0osOW8a4c64QJhXE9XNvPzqH_8GKxi
X-Authority-Analysis: v=2.4 cv=W5utxhWk c=1 sm=1 tr=0 ts=6acc8a28 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=K/RrOd38U9TixX+j9hIN8g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=MsFtPu2hbo5vfmcse_YA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAyOSBTYWx0ZWRfXyj2obt2F/ncG
 vvqBgTcnjZqUgK3VbisrvibExXrveKPf0nYvwwqJAcYJ9nwBwMWs/8YKwGhdOOBVk+I6m6luemT
 xJAXH7gG0iS1iqpHTY+xNNds+WBJpb4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0 impostorscore=0
 bulkscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120029

On 10/12/2026 3:01 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [High] media: qcom: camss: lost initial buffer due to skipped REG_UPDATE
> - [High] media: data race on csid->reg_update in stream-on
> - [High] media: camss: cross-routing breaks due to hardcoded VFE ID in reg_update
> --
> 
> commit cb036f0b44cb6248a2bce2553092074a74c00d9a
> Author: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> Subject: media: qcom: camss: Issue stream-on REG_UPDATE from CSID
> 
> This patch moves the stream-on REG_UPDATE from the VFE to the CSID for
> CSID 680 and CSID Gen3 platforms. It skips the VFE-side REG_UPDATE when
> the upstream CSID implements the reg_update callback.
> 
>> diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
>> index 0fdbf75fb27db..830c9c818d3d2 100644
>> --- a/drivers/media/platform/qcom/camss/camss-csid-gen3.c
>> +++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> 
> [ ... ]
> 
>> @@ -230,6 +232,7 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
>>   		if (csid->phy.en_vc & BIT(i)) {
>>   			__csid_configure_rdi_stream(csid, enable, i, 0);
>>   			__csid_configure_rx(csid, &csid->phy, 0);
>> +			csid_subdev_reg_update(csid, i, false);
>>   			__csid_ctrl_rdi(csid, enable, i);
>>   		}
>>   }
> 
> [Severity: High]
> Does this new process-context call expose csid->reg_update to a data race?
> 
> Looking at csid_subdev_reg_update(), it performs non-atomic
> read-modify-write operations on the shared csid->reg_update mask:
> 
>      if (clear) {
>          csid->reg_update &= ~CSID_RUP_AUP_RDI(port_id);
>      } else {
>          csid->reg_update |= CSID_RUP_AUP_RDI(port_id);
>          writel(csid->reg_update, csid->base + CSID_RUP_AUP_CMD);
>      }
> 
> Concurrently, when the hardware generates a RUP_DONE interrupt, the
> hardirq handler csid_isr() calls this same function:
> 
>      if (val & RUP_DONE_IRQ_STATUS)
>          csid_subdev_reg_update(csid, i, true);
> 
> Since csid_configure_stream() is called in process context without holding
> a spinlock or disabling local interrupts, couldn't csid_isr() preempt it
> midway through its read-modify-write? This could cause corruptions to the
> mask, leading to lost or unintended hardware register updates, which might
> cause streams to fail to start or stop.
> 

I agree but this should relate to CAMSS framework design and now it 
seems the CAMSS hasn't taken this into consideration. Future framework 
upgrade will cover that but KNP series will still focus on enablement.

>> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
>> index 2680a9914765f..16a0b5663fe2b 100644
>> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
>> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> 
> [ ... ]
> 
>> @@ -552,7 +586,8 @@ int vfe_enable_output_v2(struct vfe_line *line)
>>   		output->gen2.active_num++;
>>   		ops->vfe_wm_update(vfe, output->wm_idx[0],
>>   				   output->buf[i]->addr[0], line);
>> -		ops->reg_update(vfe, line->id);
>> +		if (!rup_in_csid)
>> +			ops->reg_update(vfe, line->id);
>>   	}
> 
> [Severity: High]
> Will skipping the reg_update here cause the first queued buffer address to
> be permanently lost?
> 
> During stream initialization, this loop runs CAMSS_INIT_BUF_COUNT (2) times.
> The vfe_wm_update() callback writes the buffer's address to a single hardware
> shadow register (for example, VFE_BUS_IMAGE_ADDR). Previously, reg_update()
> was called after each write to latch the shadow register into the active
> hardware queue.
> 
> With this patch, if rup_in_csid is true, reg_update() is skipped inside the
> loop. This means the second iteration will overwrite the first buffer's
> address in the shadow register before it is ever latched.
> 
> When the CSID eventually issues the single REG_UPDATE at stream-on, only
> the address of buf[1] will be latched. The hardware will then write the
> first captured frame to buf[1], but the driver's completion handler
> vfe_buf_done() expects buf[0] and will return that uninitialized buffer
> to userspace, resulting in silent data corruption and shifted frames.
> 

No. We have tested on specific hardware like 680 and 1080 and no issue 
is found. Actually, this is a recommended initialization sequence since 
CSID 680. However, on Kaanapali platform, the requirement for sequence 
order becomes strict and we have to follow that guidance. The reg_update 
is split into two parts since 1080, rup_update and aup_update. The 
CAMSS_INIT_BUF_COUNT should only impact the hardware starts from 1080 
version. The previous generation won't be influenced.

> [Severity: High]
> Does this logic also need to be applied to the runtime buffer completion
> path to prevent cross-routing failures?
> 
> While this patch correctly identifies the active upstream CSID for the
> stream-on phase by traversing the media graph, it appears the runtime
> path still uses the hardcoded ID.
> 
> In vfe_buf_done(), when buffers complete, the driver unconditionally invokes:
> 
>      ops->vfe_wm_update(vfe, output->wm_idx[0],
>                         output->buf[index]->addr[0], line);
>      ops->reg_update(vfe, line->id);
> 
> On Gen3 and 680 platforms, this routes through vfe_reg_update() to
> camss_reg_update() using the hardcoded vfe->id:
> 
>      camss_reg_update(vfe->camss, vfe->id, port_id, false);
> 
> If a user configures a cross-routed media graph linking CSID N to VFE M
> (where N is not equal to M), this hardcoded routing means the register
> updates for new buffers are sent to the wrong CSID. This leaves the active
> CSID's shadow registers unlatched and potentially corrupts the unrelated
> CSID's state, causing streams to freeze.
> 

This should be one-one mapping for CSID and VFE. We have moved the 
REG_UPDATE from VFE to CSID since 680 and the BUF_DONE event can be 
found though CSID id. These two evidence from hardware can prove this 
intentional one-one mapping design.

---
Best Regards,
Hangxiang
