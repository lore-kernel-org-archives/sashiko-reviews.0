Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF9C4FDE6F
	for <sashiko-reviews@lists.linux.dev>; Thu, 15 Oct 2026 10:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792060158; cv=none; b=LVo6Dc/2pNxiT/A5NSahlk7iPyLI8LwG7X+5aowlL9/0b8UWHNSgeb+cUwwc/GEYvtc8Zor4CrxtW+ITZ6V+biVEfXfHIkdyKCz5Qh5wwKILtU1qeJjQcrHfrVAo++izyQ/Bw6PjfHng3EvSfSjDTDgDmUcZLKABWluk0giCB0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792060158; c=relaxed/simple;
	bh=gMPxkH7kmanXF7At9nXmoTOLGr4QXETgGBVdzfdLFnM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nijDRPviyajDUYHKGjkBndqLoayqVDoN9NskTaEdO9Ju+UsjAU8VQmZzFl7lntu4YbZAFOCh8gwwwpOP5ynXvrZuJ6gFW4H63k+dLhp24dtQgI/L+WSYNJ/Cj65tZcZk2GqEHe/G9oqNO/e0rwB7cxPCxzLZtt2WCJMa23v7Mrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FKmpnYOL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b3juFihQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FKmpnYOL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b3juFihQ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jSGd2662666
	for <sashiko-reviews@lists.linux.dev>; Thu, 15 Oct 2026 10:29:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OmbFgJmvEHXwXsxMN6rXgxgcJ2kmAcWfcjuPvuxBd9c=; b=FKmpnYOLCBDgEO5q
	HladjQqGKeXKLtdGw32wme9wR70WmcihhqlJHo/qgxCGfrapBp9t502egD93FLku
	nLNt44t4DIG2F+0En6xb4kN9346Ek7YqrN8nIEBZlAqvm6o1AG0op3kj57UUYzOw
	E9v1bwWardp/3KAB6fps9gEoNPQrZTTfv+8Y8ToZj08kZGxIVJzvYUkt3PV3PmQw
	zmVocD0nwLPkz8Ebwmsed9++xV+5T9MPPZyxpEnOMUTxxO1rrmo5knNfcKXJbkKp
	130A8O/LhiMOAmEQNqwXzyyO/BIMuyYBHth7TxtAvKO144GwnQX9HIOFyLc6v10+
	jwqCAw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haqda1j3x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Thu, 15 Oct 2026 10:29:16 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3a47617a0b3so5042005a91.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 15 Oct 2026 03:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792060155; x=1792664955; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OmbFgJmvEHXwXsxMN6rXgxgcJ2kmAcWfcjuPvuxBd9c=;
        b=b3juFihQ5SHyQAAGK/kr7+85JLDvzX+rPHiBFHqHAvliPuRr7+iZMxtqhYEroZ568k
         ykeu9BPk+5vYlTptSJH2E/1nMThEVQm3s9F4vMEOcmfdSTdtUISDpNNf60iLaobZEkon
         8S1KnyaqI7/sOfAhbke/xGjsvqVGRI/Yflpu79CDhatlaxWhP3enr/5TCZ8G7lR7kCTO
         On6Ga9FtADOAbOA1ShR2rXT8ZDTRQ3MRZwGPh/5OfPx7sPO2J6ftDSltSjogz0qDoIAZ
         E7rtqhn50lNrj9jWLyVsxZTDyCjclXtbRmn1l7bzIWOEq5PgS7C+VYqzbh6uKdMTrEkv
         BQnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792060155; x=1792664955;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OmbFgJmvEHXwXsxMN6rXgxgcJ2kmAcWfcjuPvuxBd9c=;
        b=XpUhR/L5FTrcdJzWBb02T01LcORaTpWCSWlEqHTqiQADEi4GcIt6j1M1aKB7ZUcE38
         7A9rUDYHhn1O2rsFx9BlAtZiqf0IZmGDjzxVudvkYvD8DFgE9RRG3Ig1PzuMRyOB1vZi
         5MBFV2C1aZ+ToEqhZlBdZuIAgWBjGDzSiMtgeAvSYblxvoU6peFAX6vfAPr6QxNZSUG+
         /x4/TONlvm1LAuirieQAwKfydkk0PW9alx7S3vbObt89RtZoBBo2aMd9UGd8xURImJ+G
         TLAf2lgAnyK+9CmHzJdggvknM4WcRyLFvtvhbYbHe4F6FA1ueMKJUFFInWflV8SMuDrB
         OpAw==
X-Gm-Message-State: AFq9FYKS1X8sIV77jNKrlPX+gfn+i24Bxb/uIAuqN6nGnuruZ3s8Op9Q
	SXNFd2ATOfTApvfQ8PUli1fXG9RznQIgeDilOoMV57Hzffv04VLiG+ETSjXBh6+z3wI7yKvjBBI
	e71/gFTXfC5fyNUBYeNcozGtRQjp2H5IMbqmsJXGLqMzu/P2S0Pavnhhho6pkbHwylrQ9ta4pMd
	xaw9Y=
X-Gm-Gg: AYBFou33/lJgl+gpwvjyHk7lEDKcrpm3sgutUs3gdwr2aDjN2HnBDbhcm7MJRnrrLfL
	cjXp+aJkA16wDE5n27U47W49ZoPrmn0kh/1DEfz5gsZQbPhWHKVyk9JtuJFmzFbg1Kfg2+BBkwB
	Quw34oXqZYhwFoN1whqw7xWGunaPvc+noF2Jz+Z940axrVi0VvGiJdo2D07JfXTl3yQLVHLL8an
	sjJPD30MMez13W57qtZizGu0gUEkS1l1d4z9yL4b9qkz3Wmdmh43pBgqPG/lwISikcZ3CjP/+gq
	7w5nMcYX1LFCXHbnLQe/3i8x4VPNMVkmpW2VzNLCJPXKPHoOUQa9I4R5g2Pf0mKMiUIqzbbVfYV
	ZfxSjryuwcyFDvQBAPpH7FxqQ3i0=
X-Received: by 2002:a17:90b:134e:b0:3ac:9259:1234 with SMTP id 98e67ed59e1d1-3ac92591527mr2146599a91.39.1792060155088;
        Thu, 15 Oct 2026 03:29:15 -0700 (PDT)
X-Received: by 2002:a17:90b:134e:b0:3ac:9259:1234 with SMTP id 98e67ed59e1d1-3ac92591527mr2146578a91.39.1792060154527;
        Thu, 15 Oct 2026 03:29:14 -0700 (PDT)
Received: from [10.64.69.173] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac945e74bcsm3856778a91.3.2026.10.15.03.29.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 03:29:13 -0700 (PDT)
Message-ID: <3bec0e74-3f69-41a8-907f-983becfc8914@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 18:29:11 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 12/35] drm/msm/dp: add support for sending VCPF packets
 in DP controller
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: sashiko-reviews@lists.linux.dev, dri-devel@lists.freedesktop.org
References: <20260929-msm-dp-mst-v7-0-4b81473185e7@oss.qualcomm.com>
 <20260929-msm-dp-mst-v7-12-4b81473185e7@oss.qualcomm.com>
 <20260929045000.55AE01F000FF@smtp.kernel.org>
 <t3klzrnzq3oicg6djkv6ixwy6oteo6c6zvnpddbqk5pjhsodoh@qz7pcou23no7>
 <f7e864e9-8500-430c-8f02-915a162bd2a2@oss.qualcomm.com>
 <rd73b5ovrmqlanussaj5cugi4fx5yzuvwam2kzcizdiusmxzib@ko5xasxrjrzx>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <rd73b5ovrmqlanussaj5cugi4fx5yzuvwam2kzcizdiusmxzib@ko5xasxrjrzx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0MSBTYWx0ZWRfXyoD0sGKh/lqR
 F39I58X+nqRRorzXv066rQbO0LB8TCOfFN0aLV5cQIDhbgFAOxCvhYl1m6je10HGHswYuNr02K+
 dUbp3hM0vDrx/iaAsMLdOxFsNJ7cAkA=
X-Authority-Analysis: v=2.4 cv=K9u3jCWI c=1 sm=1 tr=0 ts=6ad0aafc cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=pcNVBdCq2x3xfCSnuIwA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: khwBuOZBz2AULCuMWfVb0LbigsuhKX9y
X-Proofpoint-ORIG-GUID: khwBuOZBz2AULCuMWfVb0LbigsuhKX9y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0MSBTYWx0ZWRfX3AoPKYtKjJhi
 4Dj4QC/2q8Mg4jG2aAIOlEd1lSl2mugV5KNH+ITdSonouJLuO7DessUbfyVElh7rB434Xohv/oZ
 4Mz0QGHpUiMOMgE067q2LXGQ/s2LZtjkF/9C/WfLCeZ7VBS+7fOuiaAqBBvcTBuoTJvPTBeFSIf
 cW6NHaLq7W2+Q6n+0O0ea0FEshruhvvYd8Rsu8rGLBb5q7YcW1D4uCTv/zw1cX3R69YiL4oSVIU
 drnlTjlX6Y6Tw1eMq6wzO7sSKkTILS5WqL/Em/g6vuhhKKCG2PF3BifoE/hoKehXVgZeaDqD7wc
 CEv905wUa8m3DNF7jwb2QYUu9dSLq01rc0gJRjF7zyd52oAH0S4/TZOiV5w4Lobn7g8j807FfWW
 CNpmwrRLRQWAJOUJCreuP18BLJnoo0u0rHQU+LofkRh5TvJAaa+wr7NyOCVbKOMd46qunnqydNz
 nA+fVc/tf5xJQjFWukA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150041



On 10/12/2026 8:24 PM, Dmitry Baryshkov wrote:
> On Mon, Oct 12, 2026 at 05:08:53PM +0800, Yongxing Mou wrote:
>>
>>
>> On 10/1/2026 6:34 PM, Dmitry Baryshkov wrote:
>>> On Tue, Sep 29, 2026 at 04:49:59AM +0000, sashiko-bot@kernel.org wrote:
>>>> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>>>> - [Medium] drm/msm/dp: bitwise OR of STATUS5 and STATUS7 without masking in ISR
>>>> --
>>>>
>>>> commit 987123505b6cfcc4664c72feae6b070ad91b79a8
>>>> Author: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>>
>>>> drm/msm/dp: add support for sending VCPF packets in DP controller
>>>>
>>>> This commit adds support for sending VC Payload Fill (VCPF) sequences in the
>>>> MSM DP controller when stream symbols are absent. It introduces interrupt
>>>> handling for streams 0-3 using the STATUS5 and STATUS7 registers to signal
>>>> VCPF completion.
>>>>
>>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>>>>> index 9a0c9737e6d00..929e0f94f8ddb 100644
>>>>> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
>>>>> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>>>>
>>>> [ ... ]
>>>>
>>>>> @@ -2801,6 +2877,16 @@ irqreturn_t msm_dp_ctrl_isr(struct msm_dp_ctrl *msm_dp_ctrl,
>>>>>    		ret = IRQ_HANDLED;
>>>>>    	}
>>>>> +	isr = msm_dp_ctrl_get_mst_vcpf_interrupt_0_1(ctrl);
>>>>> +	if (ctrl->num_pixel_clks > DP_STREAM_2)
>>>>> +		isr |= msm_dp_ctrl_get_mst_vcpf_interrupt_2_3(ctrl);
>>>>> +
>>>>> +	if (isr & (DP_INTR_MST_DP0_VCPF_SENT | DP_INTR_MST_DP1_VCPF_SENT |
>>>>> +		   DP_INTR_MST_DP2_VCPF_SENT | DP_INTR_MST_DP3_VCPF_SENT)) {
>>>>
>>>> [Severity: Medium]
>>>> Does this bitwise OR of two different status registers cause false positives?
>>>>
>>>> The msm_dp_ctrl_get_mst_vcpf_interrupt_*() functions return the unmasked
>>>> register values. Since the values from REG_DP_INTR_STATUS5 and
>>>> REG_DP_INTR_STATUS7 are ORed together here, bits from one register could
>>>> overlap with the VCPF bits checked for the other.
>>>>
>>>> For example, if an unrelated interrupt sets bit 18 in REG_DP_INTR_STATUS5,
>>>> and it gets ORed into `isr`, the condition will see bit 18 set and assume
>>>> it's DP_INTR_MST_DP2_VCPF_SENT (which is bit 18 of REG_DP_INTR_STATUS7).
>>>>
>>>> This could cause a spurious completion of ctrl->idle_comp during a VCPF push,
>>>> allowing the driver to proceed while the hardware is still executing the
>>>> pattern.
>>>>
>>>> Should the return values of msm_dp_ctrl_get_mst_vcpf_interrupt_*() be masked
>>>> against their respective VCPF bits before returning, or should they be checked
>>>> independently instead of ORing them together?
>>>
>>> Please respond to this comment.
>>>
>>   Thanks for pointing this out. The issue is valid, and we will fix it in the
>> next revision. >>
> 
> Please respond to other Sashiko comments too. You got a review. It's a
> nice practice to respond to them (unless you agree to all of them and
> are going to fix all of the findings in the next revision).
> Thanks for the reminder. I'll respond to the Sashiko comments that need 
changes and address them in the next revision.

