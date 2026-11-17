Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794922926;
	b=p9rM99yD+0RJinp69B+CQ/HfLIQ1H2WzwYDP0wvhGI6wzPSJ5hDoaEFudI07m96XMxTb
	 HtrJeiF9IkYA7+RYroEz4F0Ekgl/IHkAugHj8OVI/cBaHR3e6ed7ndJqUTeXy3t3MnNP2
	 fhIDXGTrbMmb5Y0zFRASQu1vG2ADzHlnwJNopOaVb2P/rBYWg76bonbf70Tgk7I30vZ+o
	 CXlWWEOPM+tuI3olbeS6KHnO53u8vmLrCIl5sLaFxpJcUkcYVRindOyANLN31PnUrA95W
	 oFmQdYUnoTffEyZglHgBQJotKb2ziyOPINOl4JvQOF/aCXF3J1BnMFAx/BvBeXowEow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794922926;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=EBYE1poZLtf5AVV7eO44k1qDi58YcG4fcPuqIb90KEQ=;
	b=QQGOtkil+guxWMCieaSaQ53xoiGec6eP516gNsKQl5jB0kA5nn8Ada1GZWQu8gBFNmnN
	 +asGmo24JgiCXt4VKNQAK1tIz4lNqPGsKYYMJwAT8E0eLict9C6+a2eWu24HG+dm6bS5m
	 4snrvWde/Ycv8jOPKJwnUba1vS8mNuNdH6wSMcRTSwqrHODOCaB4/kPq2o75ryVb8tPdi
	 jk8siRxvoMZVCqB3eeJ8Wxwe1GxIi8aKmJISyALWTL9ZH3r+n84IONHuZLPOriCR+vuOJ
	 hMwXaewA/jAFdI+Nz4RUJwb6Fnx2DH7VKAi0N5Jot+ibO7NLy/wXW66srISVHBb0LYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dckrF8Bh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MsHzJjw+;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74F97606A32A
	for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 13:42:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74F97606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dckrF8Bh;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MsHzJjw+
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHC19e33713901
	for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 13:42:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EBYE1poZLtf5AVV7eO44k1qDi58YcG4fcPuqIb90KEQ=; b=dckrF8Bhirhdbxf4
	+mdH4R0eGB4BFPnP9uZE6GWViJbg/6EleLYhqoRK0viYCXNnMuHnYhoLUVs8KgnU
	ZNTRsp6MU8CvGL/0wm66m8rPXyAIU3xzcgonDw1O53fdejMmIc4v+K6H9+5JDZje
	z/jMO2Xus0zQkSlCG+F++bfGWCDERAV/CgAbqwYXJ9kMeDh7lJKRQNCRdtduKdBi
	LPPhmsHXCK1drBkldw/fGkGH/nP5yyJEfNQoWaMTnVCo5WJibfyyZNTA6IiNd+XA
	og+EIdP84OeSdQx+79s8pg9HLVjnx2Ad5aW18cASiLEZ9tYLwUe3OxPxHZ4WHF4q
	kLrtXw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0hve1ngp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 13:42:05 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7d2c415bb8fso503845137.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 05:42:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794922925; x=1795527725; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EBYE1poZLtf5AVV7eO44k1qDi58YcG4fcPuqIb90KEQ=;
        b=MsHzJjw+Uh9+bJRzyYpZr3J4byE7/X/Z+kGKpgc0KdPrNB8mnLzdLT/rwshRgco8qK
         Wet4pXHRs2P2Zt7hsBeay6/ATDID3i4F1xrM9y/iAxxWzRInFV5dbIvFgQmHtyR4OShd
         rQ0kzyhyQy/3BmvmI/hzvzNSKn1rgX+ir6xLGmARp3cbUR1dp0BT1IsjyOm6mg2tX5xU
         1KIN+c03Kbx/a5T+uwa/2Zpv+gpBKvRWOveBaPVQheYiR5fRJDUQ6J7mk5Zpzd+qU2BX
         3aJd6uiU5ctNz96F3+1/5OfqyDiIWVGJk5yAgFyArrSGvIS2UfEkwhnv74kxYqPd/6X/
         f4vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794922925; x=1795527725;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EBYE1poZLtf5AVV7eO44k1qDi58YcG4fcPuqIb90KEQ=;
        b=Ar7Tpl28kS3LjtX6X3/CHJogCfrsiY2n3xJRGV89SYRTtDBoMt47+XaZJOBN4drwtV
         RL7OVs+cNoVd4b9Gge+YYz/rt5g6NSOTrK4gxXdCmnqWHJQtC03h6aWfUathA6CJQ8Fl
         V2lCPRcocxYLHgt7F3dlWEca63SN8qVoTVKAWNpkYcKqJplkAx1bTbBSbNJJS6bDm0sm
         4Cvy6zrybIheRwLE2GwFSNowcl+1f1deXVul0Ct58PCwOvO07DIVT4NGUq5691uwobMC
         YqtZYqARr07DQTzJEuEziKpy1tDXigt/hYiTAkYsry/NhMcXjAIuncPTO7lNbwonkAGL
         FCQw==
X-Gm-Message-State: APuU4Z+u+uhTzAHpnLGVi2wKeCiYIgZB/992BKeb3FKD/akXtt7XL62Q
	LHCU1dIX91Ecgpv+yc9syuv5DBuwcex3+XprnlS1d1sH0IhYJyzldJ6uvSdayh+eD1xIXRw0pS8
	j7+YKUzjMG/w1QlDEY37Xxs/l7loT+uJxYYa1bTtxfCUsAOg8uHgr8LAjYrQsu6UIw2Zf6Xo+mH
	jAMMg=
X-Gm-Gg: AYBFou3w5CmgjZsqyAFH+JOYs+3KIuyfxNrGQIYjKCQ7ysliiJdrhsrnqaDF5QOzMHk
	ooHO1/l6+H3qn+XXQBsX3NAwJZCfU4AmW+FK7491qC3SbR83a2Am+cfwFgQfcYITPNncoorXWrp
	aKdv68CvP/TcqDSvTViScO3LPY/cAZkwuSDrNwHLOdpDR6h7i0I8y2TzjInt2ulccT+jcx6ctpN
	6H4yHeVeKRhdRcXJSoKl4EgvpQVXNK4o32UGxecv/oqI1+7X7hBmg+8UByJWpzV+6q4UaRXIV9n
	V4DAIOPe6p+J8qJLTIEvmyia6JcXTAEEFtcpls68pfDGmrregjkmJ0k4UCae4KlwdJPtlwOaii9
	zIch3WM3nsVln+NbW7xQAO08a3JnFqOwvTna319HY8Ue46W7GeY7J7X0YIhW4j5fYkTZn/z/oqA
	A=
X-Received: by 2002:a05:6102:d91:b0:7c5:4da3:aefd with SMTP id ada2fe7eead31-7d64d6f5f73mr3467012137.15.1794922924694;
        Tue, 17 Nov 2026 05:42:04 -0800 (PST)
X-Received: by 2002:a05:6102:d91:b0:7c5:4da3:aefd with SMTP id ada2fe7eead31-7d64d6f5f73mr3467004137.15.1794922924252;
        Tue, 17 Nov 2026 05:42:04 -0800 (PST)
Received: from [172.20.97.102] ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7ad9430asm38621785e9.15.2026.11.17.05.42.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 05:42:03 -0800 (PST)
Message-ID: <3afc4286-78d3-484e-a213-8e4e917aec74@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 14:42:01 +0100
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
Subject: Re: [PATCH] arm64: dts: mediatek: Remove undocumented, unapproved
 aliases
To: sashiko-reviews@lists.linux.dev, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
References: <20261117130556.234785-2-krzysztof.kozlowski@oss.qualcomm.com>
 <sashiko-outbox-218859@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <sashiko-outbox-218859@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA1NCBTYWx0ZWRfX63d72Nb+e3wX
 Gs0oNtZPOOnq9kcGpmNq6zIB8DMHg6WbiMrQpZ0oNa5LYqIM6JWIUaT8Ks/30R6r99H5CU+L+sO
 yYL4mCm6WcUh4OkDD8li3/JYf/K7F60=
X-Proofpoint-GUID: SBxEcdr-CZLcduLunnJIrV8_ayQ3fRCR
X-Proofpoint-ORIG-GUID: SBxEcdr-CZLcduLunnJIrV8_ayQ3fRCR
X-Authority-Analysis: v=2.4 cv=dqhOmFg4 c=1 sm=1 tr=0 ts=6afc59ad cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=kE8215XNsLT8r3ff5lgA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA1NCBTYWx0ZWRfX87Q2K43NrqYD
 GpdlQUPa+SrllyTM1j4D5AmNuC/CgtsKB3NXjySZ7ociAnQDmHv7xA4RgPb93F5c9DW/nRFbk9/
 eVh+djHK+KcFelPpcsi0dwQ+YzTdYe/dGldwDCZTEjBRKx1NmDnf3e5PSsPbu1NijK11iXItkxa
 5gWE0awrYoOeskrakyhlY/S+kq8t+OTwWH3HFlm0kjr7dUh25zj+3UCyC1pr8eT1DPtLBSo0ipi
 PvAYb3cQPoDAAxs/zGem6xSa+cN5XqIQI10+f8guLLfv5YW3EssTGPaxR1hTEH8X3HRrTAbRI2v
 kTtBmPxjo4z2Q9KDeJCOQO90WFeYvvrXCre84AL8yUfm8WR6VZiQsKE9csD0WfLhW5781xfuFHI
 PzNKyhyryO1xM899RfgFITMQKFETXk3nRZvFy3PKRXrvYXiKMKkrRZRPFgIxyLjkich9tFHmbrf
 H/V/qwWaerMgEbAfVOA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170054

On 17/11/2026 14:19, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential
> issues to consider:
> - [High] arm64: dts: mediatek: removing gce aliases causes unclocked
>   MMIO in cmdq_init()
> - [High] arm64: dts: mediatek: removing ovl_adaptor aliases breaks
>   ovl_adaptor_comp_init()
> - [High] arm64: dts: mediatek: removing ddp and mutex aliases breaks
>   mtk_drm_probe()

All intentional.

> - [Low] arm64: dts: mediatek: mt8173: incomplete removal of undocumented
>   mdp-* aliases
> --

I'll fix it in v2, if needed.


Best regards,
Krzysztof
