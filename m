Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794550067;
	b=DUQmTx8MX9bvuoifxDq7rbVl4SWTaRJ64RBMiZn5yHeoSTtopZqAqlfmYkqMOHrJ1ZFP
	 NKkIxQ6h669WBVXhYPqHVYKgKr6Kydgq6/XhvsjbdotPaKSO9zy6cBfVl4eTm1teDYSej
	 gThq/0s+uBu7uM1n1q1wondfuauQiXCPtHlL0UG3YvPPro8yKWo59GKQubClzpycg0oGb
	 6wufCa1wAu5gsC6fI3PcR1Kb656q2qXDkYz6JTYAyqJK5uHsj0xHtGKYRpoFhV/ZG/tgd
	 ytktnEup5jyzc+1XFJE27yYN+bvi9GfY+ErrF2dPS9QNPotppoUmjnFroDsV2bxBqEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794550067;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2x3TZ8F862pBhusm32BXj5hqGQYk+ST7Iak5ml3obX8=;
	b=QuVAXhb7QB4FWnoQHV80r4Q0LwOT1qK7j6fh/wTAit0NxH2Mo/j8qiWbPlPidOMAn+OC
	 87APPA7/sBntbPeBNzTnL2KbVyhtvGwmEP4n67xI+KCjuuvytumF9JkGQJJIgTFsP1SDi
	 DdvkQTi8TqM2LGjMaqiChFVP2JsLwmIzoEl4ILJ3BhDGO8h4kWhU9A3JNatOF2Z2P9HB5
	 VFm/Kjj/s3f9SjHpvPZzjX35WmVjw+vGuOSusQwd9vWm0NwLurMQj9WwI9Y8SSfg6lEmR
	 AqpOyNxZ/t752WoMHt3xwaOi/SmjKxq5nlRvYoaEiT/pf88cIkI6wTiWGs1nPd/nYVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PAUfoIgz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eDes88a1;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C52606A32E
	for <sashiko-reviews@lists.linux.dev>; Fri, 13 Nov 2026 06:07:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03C52606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PAUfoIgz;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eDes88a1
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD57NRn3616271
	for <sashiko-reviews@lists.linux.dev>; Fri, 13 Nov 2026 06:07:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2x3TZ8F862pBhusm32BXj5hqGQYk+ST7Iak5ml3obX8=; b=PAUfoIgzarksVUyl
	XPv5Nz6jj6f6eOfdd5efZeeQ1WX0Wqouy4s+/S26eRVFePc/y5chl6XV2F8Cq0QO
	nycNEvoanWAmNGiGl4/DZRvDpovjX7qG2B7dB/mQwNBJcp7n4tHxO9naVXH0Cq1Q
	j/7WHvYlmvdJy1uhlvaFYmnIys3MC5Mb8Kol9GShiPdwL5nKgTktrBniAuBQSDFP
	+0hzvV1f+URgDecKHpq/HTJDmvo58cvEPPMcib7ZJplq/oC7/dvThzh+O8LVk8on
	TFAwF5n8N1ronC9TW+xJbrYD5Whesc09QXzKyWREFj23SRQ5WHK8+2EgxX+w5DTB
	/4L9xA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwh0ajdyw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Fri, 13 Nov 2026 06:07:45 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ed08be1c84so10194805ad.3
        for <sashiko-reviews@lists.linux.dev>; Thu, 12 Nov 2026 22:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794550065; x=1795154865; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2x3TZ8F862pBhusm32BXj5hqGQYk+ST7Iak5ml3obX8=;
        b=eDes88a16XVkkjkLm7C3AAHNrhzD/jaUaTv+I0Y7vP5RejMHNESSfah/xZLjdeOYua
         a0g4Al1FoDYopkyTbNHlzhzSTFq0DEN4wZQt35xNm951qTZXTvdDgkCO1QE3wUS6GYXM
         mn2dB4sjwybqVGFcDdVdaJ5Ozr+ElbULDLqhu5esithJJXX7u+zpPPf1WVRdgKTPG+d2
         pNL1Ofs9XvvK2d0JVDPnTSpKdgfOWe5gjgoSdH0GxGYuctucZ0ezYEi7+w5wx8qm4zSq
         884L9IVDElfrYUMoMG1fiIJn+1c9G7yUf+lMo8VCAUD7HLxk/YkKqadBT6kAmQqOXTD6
         rgYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794550065; x=1795154865;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2x3TZ8F862pBhusm32BXj5hqGQYk+ST7Iak5ml3obX8=;
        b=Ffa6bu0l1zJLoDgyiQHBn+tK7Yl304r7QzP4b3YTlpRFMI/L9Of85fq2GTV+hGTtJs
         1yE5Ha32+qve/F+kfMAoNjTbKhyWZ3eZurpiE47fKIsoeC+0Pbax+Z6O1Is5z42Si7A+
         rGS42kze1rLu8pwB+dR6M7NILkjAipdEsmnTZNgHrm6baHEW0sFdd/7IHpDRmMMyTGFp
         SImSKf+nSXoaitf7P1fudWGbNvfl6ET8idNV7A6UGYgTEqsCXWIxTz7uNEsrde8OGsKg
         yNLfM8h/j2EGHEpiXHyI0Dy4LyNdqZpAgZlRWc5IXhpUCxsQeVV4zhPnPrs4XRk4vjmF
         aXEg==
X-Gm-Message-State: APuU4Z/aeuynpCXQAsP0b1EkZycYw+dtVl/YdOttB1To01NcmuYZiY7o
	XO+xLSp+EfIjLBeyN2KSexsXtBNT3sLOZfsy713L/X7fidzF4LYJFfFKocz5MszmPleSSmmovcy
	O4gBm6DIVcNr4Y5EN3Btd8Z12nqpNQImzW5atR+ba5DrBKhNJGdJ3uapHcKj0Eqi8b3tlHvFvW7
	0RzzA=
X-Gm-Gg: AYBFou0NNiomjGLci+rvxANdRA1ds4Wk9/Yv2brkVKfCQcsqTYzdg6di9eoDQUp1IvW
	zd6IYHwbQc1Ok0wK2fSv+XkN7qjfIWvUpoSuRghVKvljekTSr0K7ql4cpHkuQcj0s61w7SztQ6F
	O5WQNoXXNSrUL9+veZ5n1TiVfqxxV7N+ANjbBLCJcKp/Cwgq7p6+EbN4nE1CNOB9Ox5pE6l6Soo
	SOPm4mRmX3K/i+UR4EKdGA9IbA+kfmModp9B8uwN8A32QWCcseNnIsh1PGO+TKv1pBOS8H3d90O
	1xnxSvhVw2g0QcKxwyXaZI8Zwt54RSbmEonnyp8NITWM0RfcCfyuLNER2+1BrW1PrD9O5tLdt72
	n/O9+IWJYspX+7C3gWHpy+gL+LECaEno6mtNO1+D3d6eZPxTxre5+LF+4GJapAp+QYCrRMLzqW9
	O6TV8=
X-Received: by 2002:a17:90a:c2ce:b0:3a4:7730:33dd with SMTP id 98e67ed59e1d1-3b1b0d3b75fmr1260186a91.58.1794550064825;
        Thu, 12 Nov 2026 22:07:44 -0800 (PST)
X-Received: by 2002:a17:90a:c2ce:b0:3a4:7730:33dd with SMTP id 98e67ed59e1d1-3b1b0d3b75fmr1260169a91.58.1794550064369;
        Thu, 12 Nov 2026 22:07:44 -0800 (PST)
Received: from [10.239.133.243] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aec63b9bsm2850307a91.12.2026.11.12.22.07.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 22:07:44 -0800 (PST)
Message-ID: <ea103c7b-217c-461c-b5e7-401b78ade7df@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 14:07:41 +0800
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
Subject: Re: [PATCH v17 09/10] qcom-tgu: Add timer/counter functionality for
 TGU
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20261113024935.3173715-1-songwei.chai@oss.qualcomm.com>
 <20261113024935.3173715-10-songwei.chai@oss.qualcomm.com>
 <sashiko-outbox-212117@kernel.org>
Content-Language: en-US
From: "Songwei.Chai" <songwei.chai@oss.qualcomm.com>
In-Reply-To: <sashiko-outbox-212117@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAyNCBTYWx0ZWRfX+K1mlya28H5Y
 EwRCRxzM4/jDKUbZKsece3D2JvySTFLTdfBKBgU/Xql4D/sMa7rjPWeWA4xhWQnyw3vgJ74dn25
 B+VNFqofqr/QxzypUmELoTB4mIUoQOg=
X-Proofpoint-GUID: -V7MdxYF_s6aJFCD7XT5uQcxWLrVbLbA
X-Authority-Analysis: v=2.4 cv=N+e8hG9B c=1 sm=1 tr=0 ts=6af6a931 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=znVQ-4POmxq_k8OWJtUA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAyNCBTYWx0ZWRfX8SnMg9CjwkEw
 gq2kGxncmpCQUtUy1ZwbE8qdaOllzKz6aaEtY8NS6r5UbImYRXSp681pw2KoIQ+K+Ac1lFMWzhO
 E3w/TE/dCSABBV1CO/EDSZaGSUCIO3zqQNv3n1vfFXPudSOnge3qCybKChaJOAvsZ/waCKdPtiH
 v8XqirAB6MotQ/77Y+8glvszHor6Ka5U5FWAq859KeKt/E65Nlcdh3vC0woSh8ZHCSukGzJz/+d
 rBsRraReZceWXFN7zkM4WXl3Ce94J1+YQBrbHJ3p9ZOhbqYYia1yTraqYe8b5Fy9yBk4krJDoyj
 Ldmbbbv9NdCkuedJdFkL6ZMKTLv68vRzj1TiGkfmMX5LIlIXIzEIopHA8UR4yAoF3DySHwXryVn
 2sA8CqnzACefzsAdKjd0G1xO4a+V1xiWHmce4dP4t+EFi/i+t01v3ng1x38/v3B9CMwDTujs9Hh
 81p4lHqH05Dcd80IlNw==
X-Proofpoint-ORIG-GUID: -V7MdxYF_s6aJFCD7XT5uQcxWLrVbLbA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1011 malwarescore=0 bulkscore=0 priorityscore=1501
 phishscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130024


On 11/13/2026 11:01 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [High] qcom-tgu: swapped step_index and operation_index in
>    tgu_dataset_rw()
> --
>
> commit 55838204d9ea620c8df4d9d4233a3561aeb9ea39
> Author: Songwei Chai <songwei.chai@oss.qualcomm.com>
>
> qcom-tgu: Add timer/counter functionality for TGU
>
> This commit adds per-step timer and counter sysfs attributes and hardware
> register programming for the Qualcomm Trigger Generation Unit (TGU).
>
>> diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
>> index 6e66752a7b8dd..1cb131a3c5213 100644
>> --- a/drivers/hwtracing/qcom/tgu.c
>> +++ b/drivers/hwtracing/qcom/tgu.c
> [ ... ]
>
>> @@ -496,6 +566,38 @@ static const struct attribute_group tgu_common_grp = {
>>   		.name = "step" #step "_condition_select" \
>>   	})
>>   
>> +#define STEP_TIMER(step_index, reg_num) \
>> +	tgu_dataset_rw(reg##reg_num, step_index, TGU_TIMER, reg_num)
>> +
>> +#define STEP_TIMER_LIST(step_index) \
>> +	{STEP_TIMER(step_index, 0), \
>> +	 STEP_TIMER(step_index, 1), \
>> +	 NULL                       \
>> +	}
>> +
>> +#define TIMER_ATTRIBUTE_GROUP_INIT(step)\
>> +	(&(const struct attribute_group){\
>> +		.attrs = (struct attribute*[])STEP_TIMER_LIST(step),\
>> +		.is_visible = tgu_node_visible,\
>> +		.name = "step" #step "_timer" \
>> +	})
>> +
>> +#define STEP_COUNTER(step_index, reg_num) \
>> +	tgu_dataset_rw(reg##reg_num, step_index, TGU_COUNTER, reg_num)
> [Severity: High]
> Do STEP_TIMER() and STEP_COUNTER() initialize operation_index and
> step_index in the wrong order via tgu_dataset_rw()?
>
> drivers/hwtracing/qcom/tgu.c:
>      struct tgu_attribute {
>      	struct device_attribute attr;
>      	enum operation_index operation_index;
>      	u8 step_index;
>      	u8 reg_num;
>      };
>      ...
>      #define tgu_dataset_rw(name, step_index, priority, reg_num)              \
>      	(&((struct tgu_attribute[]){ {                                   \
>      		__ATTR(name, 0644, tgu_dataset_show, tgu_dataset_store), \
>      		step_index,                                              \
>      		priority,                                                \
>      		reg_num,                                                 \
>      	} })[0].attr.attr)
>
> Because tgu_dataset_rw() initializes struct tgu_attribute positionally,
> every timer and counter attribute gets tgu_attr->operation_index set to
> step_index (0..7) and tgu_attr->step_index set to TGU_TIMER (6) or
> TGU_COUNTER (7).
>
> In tgu_node_visible(), tgu_attr->step_index >= drvdata->num_step hides all
> timer groups when num_step <= 6 and all counter groups when num_step <= 7.
> When visible, tgu_dataset_show() and tgu_dataset_store() switch on
> operation_index and read or write priority, condition_decode, and
> condition_select for steps 6 and 7 instead of drvdata->timer and
> drvdata->counter.  Conversely, adding TGU_TIMER (6) and TGU_COUNTER (7) to
> enum operation_index causes the existing step 6 and step 7 priority,
> condition_decode, and condition_select attributes (which also use
> tgu_dataset_rw()) to be dispatched as TGU_TIMER and TGU_COUNTER.
Same issue as patch 6
>
