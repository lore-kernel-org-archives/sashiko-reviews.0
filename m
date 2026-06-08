Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD93318B9C
	for <sashiko-reviews@lists.linux.dev>; Mon,  8 Jun 2026 05:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780897189; cv=none; b=esqacYBJ4jzfT5BYcD3wRZYxu0PFRnfuQ/o1gc1rWKlwhY4aPpfHdG4tK643qdkuYjlnUXyAQvGzLseax2hft2dBxgYDUpQdoQszsKzYxHB1b1q03IkcsHol8rKSnk2kAwCOlKnSeejCwOre6bKn6LKN678ikFJR4uTi1kS37YE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780897189; c=relaxed/simple;
	bh=JpoZHFk7B+FNKCUvCv8J0gju7j04clYLRSjUZtit+yk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=u4Dji27HyzHNGdgJS9VQfGGGEwof/vyEM3AoEPdV/nvoOFWrmawdJjOQ8ADRbVRN4zYhdYopoSYEwsnv5+auPvtVCWU6ay2d8Ze5wF0edl1xY4se2TkgAsPZPWCCsuweSSg+GeiWDWYq7ygrNIAWCG/Ku53KfNvQM3R+92odEYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZW08KphT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SSmLSMYU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZW08KphT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SSmLSMYU"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6580EnED1511930
	for <sashiko-reviews@lists.linux.dev>; Mon, 8 Jun 2026 05:39:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/LumdMRl3N4whwwMsWXm6IkVbxduPsWVFlMKwRHEwLo=; b=ZW08KphTphXnC36N
	GUzk0MrtCx+iw/2JCZfN8FeZf0/NRqINvL6ngXFroi7t+Un5TeQiztt/Ec/wUHX5
	0yoSUJSPjHuJf/8M1nl9nP1gPUnJpFGHnZsHEO4zPA5P6bmP6oAN8LHpitWK8b7w
	rI3XvkKgLtyeLzoj2MWCuNCpxp+cWud0aO/UbNqwXc9jPjClzRSpTlbhqu3Pvos5
	WiifpslfGwVriPt9ZRIAvt/n8t1ZKvdaXEWY/wwVGc92CLmWfD4i4H9c16v9ko+a
	un8MXP1KdZbi8LZ24S6gKudBhZI0Ter3IEPkCpQl2j6oX9PTfNs5jt7sU0ghKbvs
	+KN9lQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcadwpt1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Mon, 08 Jun 2026 05:39:47 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c85a2f19558so2313115a12.2
        for <sashiko-reviews@lists.linux.dev>; Sun, 07 Jun 2026 22:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780897186; x=1781501986; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/LumdMRl3N4whwwMsWXm6IkVbxduPsWVFlMKwRHEwLo=;
        b=SSmLSMYUz6cM+QJu2ud9o9emyGdMJfHCnoKWNY+83eUMFUbY9W03/GSOkHmRkMMCp+
         mLNQElQm0fKvvrlJUJAJxx0JDkBYn9/eH41EFWiPMdlKjtuVQWEguJCk1rm+HMe74gwl
         zwqs7MPcvb5GHfm9KQYjEXp3akzYIb/b03nrp7JfwW5G06RbhgBlFX7VkQKuYRXTXrvP
         h1GrOAtVPIMnxFthhHIHFQUzqp5msC7nD6bM0ygoCt8qN6/B1l6LR2aSNpfia/SHREO0
         NhmY17hnPHKKZ+AQ6IMbU6exiF+1f16DreYXEDRNszZP0MfBKKIwh/XK6JNOmTU3I1+l
         bZNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780897186; x=1781501986;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/LumdMRl3N4whwwMsWXm6IkVbxduPsWVFlMKwRHEwLo=;
        b=lzB3ZsUbLbWT7+OkcvfXnGv+9KRLJhJcpOUvws9A/lkTWvrbkvTUT8qqMq0M8s3vB8
         S6c5iy028wUh+2zaHFOdYurr+d9lo4LgE5Xwyu2C3DQ00Btdi34yuD2vJC8/35Pd+XJq
         iSeT7hzFx7Lz5OvGYerOyvrfDdKRBjY31AQm4tApAzInmEGVjIVYJkPZgwBgUbvrFgxV
         h/Q30eQUDKlRodBchgBdykWBU83df9nU1kiegpIsbjKjA2pemimmry7/WETaGE3u1L8z
         3WQlyv3euWK7W9+Opnje0IE0N76J4b2rwl0vq6JN5R2A+HEi0EA7ZFzM0Pro1cXnYe3G
         tPzw==
X-Gm-Message-State: AOJu0YzJGiApYNkCag8deanXrvHZ+9MzcJH9gEpi5Txs8+3r1c5cFbhT
	EhbxAeR5x8ExuwKDHfRF30Pyrb4yMh4LBkIJgcJTNtoF8AcrA1qEAnLfrZsdaB6arpsE4Ekcmkw
	DiDehnUL+C5FdBevNqijnO/U8s4uJVGpckZhAYjC2Fg8KI2EZoMsudj9Ms0MCc6d/ceXRoteO6h
	4xWv4=
X-Gm-Gg: Acq92OEQH4fhoJnil5RCUHJDSYc3Al6j0hhY6TewYlpOpX6sLpIS2vLgJ+I1xZGM0Ql
	41O66x/SddlXvkvjwwGUhH67f1pNxp9AmolFuf9epVd47yxLe9Rt/u2Ba8xNh6uzstG8XAsi2gX
	UqtmbHw27BhIN/C88kZplLY+x1K+kxQlUUiGngyy5o8FKmr3k6TQCpIR5AL2T33j3OxB7ZJKLe4
	Q329vLauIy1CAbe5KR39bCAfNcBVpukO7kXTfXjOYy7KrMvqOEnogpeQW0nL7pPrh7Zumg4bL0d
	1/ilWGdbGF0w1j2/ddHyRCUE4RjMbC/OIV5RMdSIyvtMvVCc5zL7YNvnv7IXnKDYl6x3ULsKG9N
	hJ7xcokih+XsIRjlGJjWnwaHgpgZa4oRKFiwcAn59P3jC9YK3U//oogKLt+8psqgC
X-Received: by 2002:a05:6a21:6e04:b0:3b3:2703:110 with SMTP id adf61e73a8af0-3b4ccd1b49cmr16495570637.4.1780897186470;
        Sun, 07 Jun 2026 22:39:46 -0700 (PDT)
X-Received: by 2002:a05:6a21:6e04:b0:3b3:2703:110 with SMTP id adf61e73a8af0-3b4ccd1b49cmr16495533637.4.1780897185956;
        Sun, 07 Jun 2026 22:39:45 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df0a505fsm14522572a12.20.2026.06.07.22.39.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Jun 2026 22:39:45 -0700 (PDT)
Message-ID: <6fb0c372-d77c-da95-5cad-c620b68c2bd3@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 11:09:42 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v7 09/12] media: iris: Add support to select core for dual
 core platforms
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260603-glymur-v7-9-afaa55d11fe0@oss.qualcomm.com>
 <20260603144434.928EF1F00898@smtp.kernel.org>
Content-Language: en-US
In-Reply-To: <20260603144434.928EF1F00898@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=DIa/JSNb c=1 sm=1 tr=0 ts=6a2655a3 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=8D1nwKgvKgv7XXS0Yz0A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: mT87UnJeYllpFm3i6XfMLKyHl7KzyqKm
X-Proofpoint-ORIG-GUID: mT87UnJeYllpFm3i6XfMLKyHl7KzyqKm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA0OSBTYWx0ZWRfX5edmqXJhYiYF
 yZGpsPA7xLZvMC6Gbs/nPp2ZhwMFQnVMb6IrjmsHF+NI2g3APIUQrDrJk76/o6Tq+3GHEIFzIij
 pg6LbWInzIFfu3Az+MqgA0e1naJ0lrmCGFicDORmckUONut7xGCsymgzha8nbqL0FTfecHrTm6E
 D8aFNTaru7eKd5PSHyvPv3keJYEyYzQvX4vB84nlh7nKmclJE0dqeC2kdY0tNSDCl8ng33utfQH
 PYWW2qFwSiJhtYuJSX9FiB2+JManqZMqURRL65xed721h1PWz1en/EwrtvE/eNXXtPSllopG4so
 fmHHZ41Uk00aNPh0oL3eVkcN5WsJScIfgfnSIcECppofqkWnKRyRX6kPZeiYvqXzG8Gkjrkr5s8
 h4NaXc7pYVHl4001LhCnPU7wfdVDrdurisDpBUd4TNHAdqf3UIJsMv9w+u6UJ+AU1b4Xk/QtLw+
 zREtCF+QpJHZw99rCuA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_01,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080049


On 6/3/2026 8:14 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] Dynamic core assignment logic mutates `inst->core_id` during streaming without firmware notification and without holding `inst->lock`.
> - [Medium] Initial core assignment bypasses MBPS constraints.
> --
>
> commit 2b81abf719d22ec30cd3764b2bba16be2af15168
> Author: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>
> media: iris: Add support to select core for dual core platforms
>
> On platforms with two video codec cores, select the hardware core for
> a new session based on the current Macroblocks Per Frame (MBPF) and
> Macroblocks Per Second (MBPS) load on each core. The selected core is
> communicated to the firmware via the HFI_PROP_CORE_ID property at
> stream-on time.
>
>> diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c b/drivers/media/platform/qcom/iris/iris_vb2.c
>> index a2ea2d67f60d0..dbb89396e6514 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vb2.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vb2.c
>> @@ -176,6 +176,10 @@ int iris_vb2_start_streaming(struct vb2_queue *q, unsigned int count)
>>  	if (ret)
>>  		goto error;
>>  
>> +	ret = iris_set_core_id(inst);
> [Severity: Medium]
> Since this initial core assignment is driven by iris_check_session_supported()
> called just before this, does that function need to check both MBPF and MBPS
> limits?
>
> Currently, iris_check_session_supported() only calls iris_check_core_mbpf() to
> verify Macroblocks Per Frame limits. The complementary MBPS constraint check
> via iris_check_core_mbps() appears to be entirely omitted.
>
> Could this allow a session to be successfully assigned to a core that meets
> the MBPF limit but vastly exceeds its maximum processing capability (MBPS)?

Decoder doesn't know the FPS at this stage to validate MBPS.

>> +	if (ret)
>> +		goto error;
>> +
>>  	if (V4L2_TYPE_IS_OUTPUT(q->type)) {
>>  		if (inst->domain == DECODER)
>>  			ret = iris_vdec_streamon_input(inst);
> [ ... ]
>
>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
>> index 65896d0c1f16b..9f8dacfa768d8 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
>> @@ -318,6 +318,67 @@ static void iris_vpu36_program_bootup_registers(struct iris_core *core)
>>  	writel(0x0, core->reg_base + CPU_CS_SCIACMDARG3);
>>  }
>>  
>> +static int iris_vpu36_check_core_load(struct iris_inst *inst, bool mbpf)
>> +{
>> +	const struct iris_platform_data *platform_data = inst->core->iris_platform_data;
>> +	u32 max_load = mbpf ? platform_data->max_core_mbpf : platform_data->max_core_mbps;
>> +	u32 max_session_cnt = platform_data->max_session_count;
>> +	u32 core0_session_cnt = 0, core1_session_cnt = 0;
>> +	u32 core0_load = 0, core1_load = 0;
>> +	bool select_core0, select_core1;
>> +	struct iris_inst *instance;
>> +	u32 load, new_load;
>> +
>> +	inst->core_id = 0;
> [Severity: High]
> Is it safe to mutate inst->core_id here during active streaming without
> holding inst->lock?

core->lock is already acquired before control reaching here, so additional
inst->lock not required.

> This function can be reached mid-stream if a concurrent s_parm call triggers
> iris_venc_s_param() -> iris_check_core_mbpf(). Since iris_venc_s_param()
> executes without holding inst->lock, a concurrent call can clear
> inst->core_id to 0 right before iris_set_core_id() reads it during
> iris_vb2_start_streaming().
>
> Additionally, altering inst->core_id mid-stream without notifying the
> firmware (which only receives HFI_PROP_CORE_ID at stream-on) permanently
> desynchronizes the driver from the firmware.
>
> This could cause iris_vpu36_get_required_freq() to incorrectly shift the
> session's power votes to the new core while the firmware continues executing
> on the old core, potentially leading to hardware underclocking and system hangs.
>
>> +
>> +	list_for_each_entry(instance, &inst->core->instances, list) {
>> +		load = mbpf ? iris_get_mbpf(instance) : iris_get_mbps(instance);
