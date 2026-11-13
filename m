Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794550025;
	b=iH1O7p05W/afOBUETLIQVEFevo0p1RDNhGGmPn3wqk6ygTkH+bIqwVSyGgKxdqSDE/wk
	 xMwrwV3ZrVw/LwuHsGL06iXol1mn9XSOjR2WuyAdm/fL1Aiiz3DjyIH6PlweRlITP9vV7
	 ma58i8Cz6DDTPFCZqe6uJBkvDj+n3MbyF8cbcYrYZfD8MDquzEUP8IIMeNqmcI4Hrptkx
	 I/3QJhYcfkLdNduJyP6QxyqmeBYvQ8yE07yzSjLWvKDgF3RAn93ZMw94KX+lAeNQ47xoJ
	 PQGj4QQkub8kQrpsP7voWstDd6tCjeXQz26Ws4fFELKJKe8Hs8RYw5v4fem3UtQ7o+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794550025;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=UgAMXzwGiFMedIrvcOyftAo5u6xTyBMmfWnPz10pLMg=;
	b=Q6cOoC6sPXxMy9sWnPNY4pbHDmRPcqNzsxQc6iCJj3N338iFjuupJOGs+CeinJw2TMpl
	 +OuiUkBvSxDeaokvY0WphmTdpt+yIDIcZgjTIpjGW0PZnATdCTF6i5iDkqVzCHbBxA6rW
	 rXJ0RIHLiT9VAR2damMIsXFIZiAXPnt93fznK2akXA5PSdVAXO7U2AxPG2DiYlrrpOOvD
	 C5DTUeOORIiEi8Y7I+hDfSEtwimcSSeAoWD3F//PtbVv5pzq+KWYBsyRCebRKdCN1+4yg
	 iEgUppG4ikLVVcjgzstEGuxoR1naU1+yWtqeEaHrI17ICd3Bpgs4h5cjVdNYB/fHBqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fXYVRi1k;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YlcXJiVC;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D58606A321
	for <sashiko-reviews@lists.linux.dev>; Fri, 13 Nov 2026 06:07:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93D58606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fXYVRi1k;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YlcXJiVC
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD5tfU51756089
	for <sashiko-reviews@lists.linux.dev>; Fri, 13 Nov 2026 06:07:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UgAMXzwGiFMedIrvcOyftAo5u6xTyBMmfWnPz10pLMg=; b=fXYVRi1klN3xbDYX
	ajjK19vTr311U0EkD9DFTO49pkZx9aK6RyM8vnzvX252b6K/hQWA0JkuZ7+rzPgp
	gECco2NeGtkk8cA7KBTjaF+IfdS6FVDy6cArUP1iiraQxtZl6EjOaix0wDriCPP2
	ooS044+iWe9456VP1HCsiyOI4H/tIOrZ/fx2GCJA3QvQottvvv6Sm6VoEB9KKIaj
	zSKMYlMCgFpn58HhgX/cixO3gfP8GooYnxWGN6MNMcpptRs78zCod3jemvXy/OM6
	lSgsTZaasGJCv1sWcvReTpbd+mTsqBj3SCY92duXPhkOpKcs/dD7fy5wVuvZkJ/N
	Qk5Tlg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwvu6r1hv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Fri, 13 Nov 2026 06:07:03 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cd652c0385bso407765a12.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 12 Nov 2026 22:07:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794550023; x=1795154823; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UgAMXzwGiFMedIrvcOyftAo5u6xTyBMmfWnPz10pLMg=;
        b=YlcXJiVC+yrarF3I89GD/OVSr/peW1XIo9dGkYDgi2lmiXwu8wiBI80SqosnZlH6AW
         vc6D7y2SrcuR1tIVYnalP2Amn9pVHXRaLITicBi+VFBlrMPwtNVghEkD8q68Lj86PfVH
         WOb7np85uIngqpdCfMfM0RhQbvl6ojwFX0q7TqneZHj6IVi36GyVwVhkmV0wMbVmjNO1
         4WxoX64VajKczKAcHkB+R8KY7OOe1htbMrHujU2SDgPB6ynFYeYp442efOCIAFSaXovN
         PahtPGuFU4h4NXsbsvN50u9wrF3c26QjkXkuP/1gv7HP5q8k8oHke6d7n9s4+/IoYQAu
         193g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794550023; x=1795154823;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UgAMXzwGiFMedIrvcOyftAo5u6xTyBMmfWnPz10pLMg=;
        b=2CzBOHE6I26wuKebIeS/oofZ4BxhfP5EbGrVx1rYW7iNtr99j1Fg8x6t8mEIYANa42
         7kQ45X+Y2h0KSct+Wzhfdhfsyowadhjt10Rekl94C5inrtjeIjsUYqHPtOWxAD/VAqxK
         ME1OcdoMkJtaDjKHBFlD9GBQrJxMmlN6ei+waMKxgpjeE6TYlFGvOCSgdzaMNb50SZ84
         3+k0HjcKi12qsSJHnPG7irk1ovHMLLE5JDkOX/8+SpeMbpEAPoTYuMpZuhMv+yKsagn6
         IPW8J/p9WzEFyl3t0VlDckWUuFdJC+EYT5S+o7canHWVIZDD2cGag3qpdfSAhIfY/E5J
         ziQQ==
X-Gm-Message-State: APuU4Z+JcdH62f/rYg/O5DGkuXy4EVwDrGyB46MId0HQE93dXPrK05Ba
	t+2i9JLbCycvfS6MdMvQy9Lsgw1N/+aVmLLn51PaATsYJ0X2lt+cSUKdzLwrOmAVxbQ0QqxZuXH
	oC5yd9xwoKXQDKnrNqhWBJPVDR6QNWSWWkF7YIyos/6FiuocLzJn5g0qSp9mS7EGWwEwGW6uy/D
	XMkpc=
X-Gm-Gg: AYBFou2brd8KJJgOXNTmzLhkvGVYcjtrXMgxzB2r8DQ3yE5rIzEqqwjrXTbhuCOK8FH
	A1HufqFL5UdhQdBTW+8u3/XByEgR1U4iVc98JqO/O4TZBv57/qAohcEbxNOmLLkrz3up7CdESPM
	hqLZ2nDWyVnsolj4nhiPzkDwwY78Kx1YkE6/gTV3uMAdUIf8hk6qN3+5t1r/8rpGQopdn2X9X/e
	+2X+zcsK6JhpmHLSnJDl6yvLFFgDC4z/6HxWIqV0bYDaaKJ90kxlg/foLXeQC48Xi50+dzTveHb
	rm1TQuB+9JW3oH6ZR5gFaj3NDZWY6t2u/QgwVYrpFfpiETqYKztrWeLctuj0PUNCyw0L0MREOu+
	GVnTLHZvo1IAIdEH9x1xl5BfvcIbzztF0luF/kbsRbTCVr57RrKJAnZJ1OdPz6GeZ1kkzJR4u5a
	c0iLQ=
X-Received: by 2002:a05:6a21:888e:b0:3eb:a2d9:58f3 with SMTP id adf61e73a8af0-3f7a7cc6890mr1255578637.41.1794550020711;
        Thu, 12 Nov 2026 22:07:00 -0800 (PST)
X-Received: by 2002:a05:6a21:888e:b0:3eb:a2d9:58f3 with SMTP id adf61e73a8af0-3f7a7cc6890mr1255566637.41.1794550020241;
        Thu, 12 Nov 2026 22:07:00 -0800 (PST)
Received: from [10.239.133.243] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc18cabc9sm705020a12.30.2026.11.12.22.06.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 22:06:59 -0800 (PST)
Message-ID: <5a4d7f96-32e4-454f-92ef-3437f42f7a11@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 14:06:57 +0800
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
Subject: Re: [PATCH v17 07/10] qcom-tgu: Add support to configure next action
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20261113024935.3173715-1-songwei.chai@oss.qualcomm.com>
 <20261113024935.3173715-8-songwei.chai@oss.qualcomm.com>
 <sashiko-outbox-212115@kernel.org>
Content-Language: en-US
From: "Songwei.Chai" <songwei.chai@oss.qualcomm.com>
In-Reply-To: <sashiko-outbox-212115@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAyNCBTYWx0ZWRfX2BEOx9ziWbJo
 9czPkuSnbr7flX+14Ks/4DAaHIuYiMBXrnp9I6wwC8PxMeioQjKB+1ulslbkvfZNWTeRP3gmKEl
 2S099td4ZSIxJXAQWI/lrgiRLPQ95a/KLbYkQEaphQXSkPiIRW55SFJswhqH+0NK5ZMEWFodaJY
 G9e7MxOoO+5zPCtMFrv6ZNes+6BzGiyB6vKGwqow7ekh9YqUnfTcYEeJ7ozwAamRd921yPmB2kH
 kx4MwFYcatbMuR8t0gxJNUJ9jMAmQkFigI7aaxzxZ40FOkxFdSHUwR7zu8AlDPuohb2GyY/N9uF
 +Tu6fLo3sfbs09YntPABxYMrDx8pQUXQ//jJwFBOtuxMXBBQ9zRN3BAog8D6fPetce6aorON6xK
 yvhrUa6W+8hKcRdV75ypYXD3mjsFJOaJ4Y6BbfeuzOLVKavCd8kglMoBDw5uJey65ddIthPrH56
 yjQEdQ8MzO1CpcHUtCw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAyNCBTYWx0ZWRfX4qjHDhbJIivJ
 OhKoOyCXfs4d9rTf+k3a+93KQNNEG77w68uirni0pRfImAf8BUIAtviGYLGGtrckGJdzxijorL/
 KDhyq0cHpeyFHdw6vOz+ir9BjutngUU=
X-Proofpoint-GUID: dMqg0KETLR8E_nAJv4PpPSvD6xDKX12n
X-Proofpoint-ORIG-GUID: dMqg0KETLR8E_nAJv4PpPSvD6xDKX12n
X-Authority-Analysis: v=2.4 cv=JfcpPkKV c=1 sm=1 tr=0 ts=6af6a907 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=seu3x0KXz8hfYJcQ2jQA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
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
> - [High] qcom-tgu: swapped operation_index and step_index in
>    tgu_dataset_rw()
> --
>
> commit 39b03844fdda185e25e4736b4873ab4173c403fb
> Author: Songwei Chai <songwei.chai@oss.qualcomm.com>
>
> qcom-tgu: Add support to configure next action
>
> This commit adds per-step condition_select sysfs attribute groups,
> including numbered select registers and a default next-action register,
> and flushes their staged values to the TGU hardware when enabled.
>
>> diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
>> index 72b98a96d7f20..6e66752a7b8dd 100644
>> --- a/drivers/hwtracing/qcom/tgu.c
>> +++ b/drivers/hwtracing/qcom/tgu.c
> [ ... ]
>> @@ -409,6 +473,29 @@ static const struct attribute_group tgu_common_grp = {
>>   		.name = "step" #step "_condition_decode" \
>>   	})
>>   
>> +#define STEP_SELECT(step_index, reg_num) \
>> +	tgu_dataset_rw(reg##reg_num, step_index, TGU_CONDITION_SELECT, reg_num)
>> +
>> +#define STEP_SELECT_DEFAULT(step_index) \
>> +	tgu_dataset_rw(default, step_index, TGU_CONDITION_SELECT, \
>> +			TGU_SELECT_DEFAULT_REG)
> [Severity: High]
> Does STEP_SELECT() initialize tgu_attribute with operation_index and
> step_index swapped?
>
> struct tgu_attribute declares operation_index before step_index, whereas
> tgu_dataset_rw() uses positional initialization with step_index before the
> operation enum:
>
> drivers/hwtracing/qcom/tgu.c:
> struct tgu_attribute {
> 	struct device_attribute attr;
> 	enum operation_index operation_index;
> 	u8 step_index;
> 	u8 reg_num;
> };
> ...
> #define tgu_dataset_rw(name, step_index, priority, reg_num)              \
> 	(&((struct tgu_attribute[]){ {                                   \
> 		__ATTR(name, 0644, tgu_dataset_show, tgu_dataset_store), \
> 		step_index,                                              \
> 		priority,                                                \
> 		reg_num,                                                 \
> 	} })[0].attr.attr)
>
> Every step[0:7]_condition_select attribute ends up with operation_index =
> 0..7 and step_index = TGU_CONDITION_SELECT (5).  In tgu_node_visible(),
> this hides all condition_select groups when drvdata->num_step <= 5.  When
> drvdata->num_step > 5, the default attributes and step[6:7]_condition_select
> remain hidden, accesses to step[0:4]_condition_select/reg[0:3] read and
> write drvdata->priority or drvdata->condition_decode for step 5, and
> step5_priority[0:3] and step5_condition_decode (which have
> operation_index = 5) are misrouted to TGU_CONDITION_SELECT for steps 0..4.
Same issue as patch 6
>
