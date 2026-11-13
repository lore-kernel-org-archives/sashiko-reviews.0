Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794549955;
	b=q2dS6w+Q0yvmSUCF0VpbWPP2ccNj7V8u7EaLp+RkACpC8Bp2KpTs41a0XeAM2gSo+RzW
	 VvM65yaKdc43Opb0umrD9To2wfCvmTd2lLr4/7dkQE7yV+SdMQdSeBcir/o8QLekbpNjI
	 gkZamKK3NqOQ4bwHDY9RZezugPSV4glFnvmOBTxkqv/GBnLnw7GoRD16Imnqe1rrEjxr7
	 tOTWuzAGoT30eLa41CULN2hwh8gK6S/kMMXGL71Fi41HssvUSowplVZ9OkjGmXI0oEhtv
	 7X0VsOAIiJTmLxRtDh9BUTLp+ky6eq35d3l+DBG1DQmrJo8x5K6swJO50eBLMuTIhrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794549955;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=cZb/Vxwnk5i0rmxVkJY09IQ9GprsoSJqpVPX6mlp4WM=;
	b=OA5R+i6JOT9EHSrm3UHC5vB3TJFzWzhTc+ihe/3ART8hLfrUojwqzQvvFTfafqZLDoqT
	 jb9u3ZOESMBz+yEb9ttoUYSbhxJ0ki5U68Dv+KIRETRYXLwK8NjmmUss7pNB98zh+QBQQ
	 2Y668lRmIPooyhU1UwT3LgKZhpa2t8y9hBGeDwUcZ98t8ZO+G5s5y7vUZw9/EfwgfLFRd
	 bd92qWjwtYdU2UtsJKfXX7mJwCXytsxPEfIRFWpzjDmkkLZrIGxT7WbqQovGgTibmxsyR
	 vp10cNdKQSvzpvRhgTrqRGL4aCUvYI4z7+0KHFOFtWgiw7f6H8Ms9McyKJwoaLCQwYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iK5azXCa;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=apqeOhdp;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BCC9606A31C
	for <sashiko-reviews@lists.linux.dev>; Fri, 13 Nov 2026 06:05:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BCC9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iK5azXCa;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=apqeOhdp
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD5tfdZ1756086
	for <sashiko-reviews@lists.linux.dev>; Fri, 13 Nov 2026 06:05:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cZb/Vxwnk5i0rmxVkJY09IQ9GprsoSJqpVPX6mlp4WM=; b=iK5azXCaJCPVKurd
	A7xRECXm0jzpDgcuH80i7qEzkJ7G+JTaA4JQYjvGRyI9ZSzyJAzM03I2YFwqa6Ev
	tJOpFb/iNmI84HoIuZtTxB40VdSKYw8sOAhFEK0AlLx58jn0Rm5cgT4jkqMapCdU
	ayrNZcr2E99ePIQlJCslG79aTFGJZs0X1i0IDselNteMjcEgzCIIO567bF3YlxtU
	aPREa1BJZeKzb9ZWKP6iZH+xBvYOqNg8AFPZO7rFFM8v6t8IAcmXSREsRxKRrgWl
	f8bC8w9UeMCJALc8hu6251nAFUbnFZ7lEnkqWBL5AV0eiMvRoMI/w31e7vwwhhgS
	NsP7Og==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwvu6r1e8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Fri, 13 Nov 2026 06:05:53 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cd6969473a4so333909a12.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 12 Nov 2026 22:05:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794549952; x=1795154752; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cZb/Vxwnk5i0rmxVkJY09IQ9GprsoSJqpVPX6mlp4WM=;
        b=apqeOhdpafMH8TqMriTiHr8qdCIjsIWykEHutpGmrOpL9NvQGGiiNX8vLpCfzPhMiy
         Rg91gkK7r4zzCudGx8lC1h3GsSFh3/sYLs3SHaA6E1Mtvyc1XoSXGhjIeN31jXaJcQz7
         vCBtJrvoZd/R28dAvdOiXFRf3+YxX7M9eSibqlZRWGajRAhELsusmwZICPa+H/hWVvQl
         VsSz7LJkwVQNcoz3mja3vkAD3Lqc9bfz4coDjMX4Il2jJUfG0OnGtDbmD81kCrNhwtx6
         MJaWUyUO/nOJ1e9Igi5y3p2L5rgTnkg8tvubqUX4FELC3pZ+crv5NyKQtzvOSnpD+Swd
         xTYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794549952; x=1795154752;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cZb/Vxwnk5i0rmxVkJY09IQ9GprsoSJqpVPX6mlp4WM=;
        b=RtowMRBbHlp75q8FDPpF2pXdsqw2gh03k6FmwPyvMSeTfRd+1co98owSLekk3mg7/K
         PCo5jCSvbfCfCzGo5bCkrqCLvtl2kUSl9u1lellKPknkqq4yg9tEVmyk1jTYcbzZGmrk
         OzjCHweVay2/Oi2RScM2IIoF9xj9bs7WYNeAw13Og/TOiRAs93iqNCL58dzU0Dyh5lku
         CFKko9s2V+VmLqqFpofPzIcE2iJQhGERW+fiud5yrcSpHNO6wbsM4SoRxFLEVSPRsMXS
         u9h2srSK5x65wJPfds0OXC5NICZEdZ5zIlnPV7uuKV4o7cApoQLEl3yYnGe7HFtkxQ9J
         phYg==
X-Gm-Message-State: APuU4Z/QfENmpX3ZL8pu3s6CW2MLqhYhK3WahDwSe6JEC5+eRCfgfKeP
	JyRcwU2qb/Kt/B4u/qRRClPJonTUQIc3LMdpZx/LJMEwDDBOKjxKh9DmWLE4Qt9yHte8cSiRLgL
	8SkAy4MX3xlxZn352etbEbsJwP17Aqjdci5PFGvKyDxWiT8X/c0iDG1e24HoQQgBZTh+TRzHUKF
	PMxXk=
X-Gm-Gg: AYBFou2BySGipx3aJ+K1uXQmCWmM/78SlOlxEWHKTg4FP+E3dIPUdU3ZWJrD232d8xG
	zTqdS/ZtniYwODZffCyaVhT2ANKYLC2la/e19QqwwJhw185+o7GY7ha+W/Nj2JS+3fR2hA47ktf
	NJlT5nwtBMNWCyAIPeeGQs10oaLwTCydcTVvNdHfyDmWgs7VmU8RDCGAMTpy3RIxn9UjXxzxo4y
	vCeV+MVJYD0kb37XN7xYDWDctC+yWTk11dL61nwUW2PiwQwqjkuRbECknMh9q0elrHT7pLrE9Ao
	r11ZW3isXP+1xqyrUDkiwL6DL42lR7Gapk2125ZhJyWpWc1OGhIBKOK3DmcJQEh6DQItLsBMVjl
	N5IwzOyezORUyWhfC1jrHDlLlboOLpyDqKGwopsraq85GV0sYpwSrADkwrnyKUol/oFJHN3vuvi
	S3ick=
X-Received: by 2002:a17:90b:4f85:b0:3b0:91ce:6720 with SMTP id 98e67ed59e1d1-3b1b0a1ef3emr1153172a91.30.1794549952067;
        Thu, 12 Nov 2026 22:05:52 -0800 (PST)
X-Received: by 2002:a17:90b:4f85:b0:3b0:91ce:6720 with SMTP id 98e67ed59e1d1-3b1b0a1ef3emr1153150a91.30.1794549951512;
        Thu, 12 Nov 2026 22:05:51 -0800 (PST)
Received: from [10.239.133.243] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b3bf46b3sm662099a91.3.2026.11.12.22.05.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 22:05:50 -0800 (PST)
Message-ID: <9c0d7254-1248-4174-b858-f1060523eb3d@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 14:05:47 +0800
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
Subject: Re: [PATCH v17 06/10] qcom-tgu: Add TGU decode support
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20261113024935.3173715-1-songwei.chai@oss.qualcomm.com>
 <20261113024935.3173715-7-songwei.chai@oss.qualcomm.com>
 <sashiko-outbox-212113@kernel.org>
Content-Language: en-US
From: "Songwei.Chai" <songwei.chai@oss.qualcomm.com>
In-Reply-To: <sashiko-outbox-212113@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAyNCBTYWx0ZWRfX6ahcivEnUMnq
 lV99kyT8kqoq2KfZRyHmP+IGbj4W12OOOYfhTSqkswdtV+sL4xFMpW5vbnDhBybUPZEHqwHmns+
 Jqe6cFZDBGTRjVvP26qrK0OCG5SLJn980SEHhOoI4A9rkO6gZdhwTHjYEazErg43xesoHFLw87N
 ZjkEsa/OdoJlXrtQzB7sMnhNfO7BzV31fDgsQVNXOvtmL9zhPLzmc30GU8QXc1HKbO7bi8xG5MN
 P+yh6+UyK4Gkl/u071maqCHg7h8AL2IPHssmbGYjC4z5dCvxylSihRxMkmqHvAoUtpCiiFbVjyR
 zNC/loU6jF40m/cP9AZFJZh87jeXohGJeuu2P+DFqnQSVDCgjK2E45y4WC9L9P8ffp8jmhpKYF1
 R3Y2iIbHDPTOaYwFF+s9qS8GKeJXOTLDdROkuUEY/4kPz5cBSEQpm0LlKcTZANR/yX78g81hpqa
 8EfMX57b1Ee887EQMMQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAyNCBTYWx0ZWRfXxOLddMMowrg8
 k7Mo+GWQbKkzcbRfO8fjbB7VPv20U2l6e0//l7/PJ9kpAt+ovtepd5aQ6XP2vtxmzxcJaJv1eB9
 rs0VFllKFchtt9HQaPiYgIYAsT6th3U=
X-Proofpoint-GUID: MKuQ2_Wn3lwZrnCdwks6Twhyl43Wi81S
X-Proofpoint-ORIG-GUID: MKuQ2_Wn3lwZrnCdwks6Twhyl43Wi81S
X-Authority-Analysis: v=2.4 cv=JfcpPkKV c=1 sm=1 tr=0 ts=6af6a8c1 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ip5MbSc5NOlZf4faZLsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0 clxscore=1011
 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130024


On 11/13/2026 10:59 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [High] qcom-tgu: transposed step_index and operation_index in
>    tgu_dataset_rw()
> --
>
> commit be12a60019509b692fe89759e5c9e8345578b9d2
> Author: Songwei Chai <songwei.chai@oss.qualcomm.com>
>
> qcom-tgu: Add TGU decode support
>
> This commit adds sysfs attributes and register programming for the
> per-step condition decode registers on the Qualcomm TGU.
>
>> diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
>> index c00e95e68214c..72b98a96d7f20 100644
>> --- a/drivers/hwtracing/qcom/tgu.c
>> +++ b/drivers/hwtracing/qcom/tgu.c
>> @@ -18,8 +18,8 @@
>>   
>>   struct tgu_attribute {
>>   	struct device_attribute attr;
>> +	enum operation_index operation_index;
>>   	u8 step_index;
>> -	u8 priority;
>>   	u8 reg_num;
>>   };
> [Severity: High]
> Does placing operation_index before step_index in struct tgu_attribute
> transpose the two fields in every attribute initialized by
> tgu_dataset_rw()?
>
> tgu_dataset_rw() uses positional initialization and still passes
> step_index before the priority/operation argument:
>
> drivers/hwtracing/qcom/tgu.c:
>      #define tgu_dataset_rw(name, step_index, priority, reg_num)              \
>      	(&((struct tgu_attribute[]){ {                                   \
>      		__ATTR(name, 0644, tgu_dataset_show, tgu_dataset_store), \
>      		step_index,                                              \
>      		priority,                                                \
>      		reg_num,                                                 \
>      	} })[0].attr.attr)
>
> As a result, operation_index receives step_index (0..7) and step_index
> receives the priority or TGU_CONDITION_DECODE (4).  In
> tgu_node_visible(), tgu_dataset_show(), and tgu_dataset_store(), this
> hides attributes for steps 5..7, maps step[0:3]_condition_decode to
> drvdata->priority at step 4, and transposes step and priority indices.
Confirmed.

Will provide the fix in next version: Changed tgu_dataset_rw() to use 
C99 designated initializers (.attr =, .operation_index =, .step_index =, 
.reg_num =) instead of positional initialization

-#define tgu_dataset_rw(name, step_index, priority, reg_num)              \
-       (&((struct tgu_attribute[]){ {              \
-               __ATTR(name, 0644, tgu_dataset_show, tgu_dataset_store), \
-               step_index,         \
-               priority,         \
-               reg_num,          \
+#define tgu_dataset_rw(name, step_index, operation, reg_num)              \
+       (&((struct tgu_attribute[]){ {                 \
+               .attr = __ATTR(name, 0644, tgu_dataset_show,             \
+                               tgu_dataset_store),            \
+               .operation_index = operation,            \
+               .step_index = step_index,            \
+               .reg_num = reg_num,            \

>
