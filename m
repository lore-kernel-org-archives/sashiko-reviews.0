Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC974D6C28
	for <sashiko-reviews@lists.linux.dev>; Fri, 25 Sep 2026 15:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790351649; cv=none; b=Icm8pqeuIewi6DZvqzqC1buHjSCJgF499jrQKkdqPBpvZeiBrWluN7j995PAb4FmLwubxLLgTaGEiN4IlwmXArw5bV6FC0URDQIABfTihNKneMAlMhyX6/IU5fQT1iZwfjIQ3Z890iqA3eV17xxKf2T2Lnv9gyMr8G+AqfswiRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790351649; c=relaxed/simple;
	bh=FIyGzBGb+RYhP8IDWtExS5czZtENC5WK8/oieIJLmXY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U23IaIG67XDIbKXtgPo7WRCSBOG8FQcGRRm9bZ6n31ik1oSo3dcdiQ+Hm2XnkAsv+Vhq1go5ExaNaFBbSfQIAaY7e+rJgZs1P3dBLoeaik/Lv4IFnrkhP/VVZgG5TbX5aRhVH5guWk1e4Osu/1NDpvT5w0Bl3dt2/hg0MjmDJqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YOFG+sYe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=knT6659I; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YOFG+sYe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="knT6659I"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PFHZNF2554013
	for <sashiko-reviews@lists.linux.dev>; Fri, 25 Sep 2026 15:53:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=e7cEgO8K1Kkv0l1fj7GcpaQP
	E8krEk6i5UR46iPiSaE=; b=YOFG+sYex1D54daS7CVtIP3OcQd+4HMg2+lBaAWY
	Zc/KZbhP137dJVX78uwHNYnFeeXdHIgwmbqRq5/6SmLC0+4dtcccK3SU5JF8ZyMJ
	4v3YjP0TfOxsjfkQYHS1RO+DK8p3+enYKkhcm3HgWwWyT1IbCNwvZbNJIztmwpiI
	0aFBUXvfL8Z3gViZ35tm2Sgsdau6sOqvOXaugeuZeIE079YyTUeQKgCb6gTZpDfX
	Q6f/qn2GzNkCGdDvSLMHu91M34MMdaO76IOAi8cIjDILcvfDwM4HFSEfo1SJxaJX
	TF+RC1UNeIM6Psel2PMH1fMqiKe6WgQieR/iHXRLMIcgLw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwufk04rc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Fri, 25 Sep 2026 15:53:58 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-914355c5a51so14273746d6.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 25 Sep 2026 08:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790351638; x=1790956438; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=e7cEgO8K1Kkv0l1fj7GcpaQPE8krEk6i5UR46iPiSaE=;
        b=knT6659IVStVtOfJcX01eInSu3R58d+5L2+I9GQZYthV8V1kqimMyBShaEfqo/I2UJ
         Tv8Im9ZmbsmbiiSmfmNcNvAEooewCOBgE7zF9LdKLfOnBMBHsQnasdTz98taLfdFOKCh
         8etlS0B6cY7ajl5GUZcgALGUSQ3IInjSYy+IAveYN2Y7emaefubyDB8nQRfUD2+35By8
         L1VKsvna1I+0KcrofNnmpOQngqdAdSBWDkunmyzuOfv9xRbDuv2V25pVR5gA8p/WNG+N
         U2Lq956uHcG3en82AcQCCus6hWM/uCN/F5j2JA++rUgjc0NKPkgUaLt/HedzolDz0agz
         4lzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790351638; x=1790956438;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e7cEgO8K1Kkv0l1fj7GcpaQPE8krEk6i5UR46iPiSaE=;
        b=pXh7nO7e9pbmCQGif8hvl+M0A/iTxsTL1bVVu1nweyRi1d4ZF6tffItcbkW4C8FMQ1
         jxXeCsYO2MhPx9qI8MegSErOxVkHzUTV6n1zPWHIQyWY3kPRSU4PzfBp1MyDEdBuUg8J
         Jnh/Q/1xI6SyKruSgItPuAnkgTdo+TEL50vVr5tzchU8682SXulTZ8d+18Iz0/bq+DVp
         a9a33pffqqAVkzyAj4F/gdMXejrlzp6g9VQVcVyFiqx8RYMaYHkWHqxVhtFAdldvR9Ko
         6LESGA/rfMhm/zrejCn7Q03dYu5xo+hrbC8SClijubv3z04VS2+KehRnRCHp9pJg2A8G
         ALDQ==
X-Gm-Message-State: AFuF++lGS+hKw+JZm1KlnLc0IgpsodoqxAJRjj5uzydfNBOUZ6+KBgEU
	nSqoeH/tm0H9wXjr/1QOCUgWQrYs0m3EsyzeWLxVPtAeEmR3yFGG9lfkNbgHkc4FG1NRBLvf9iQ
	GqJLPLpkMd/2YUoe5nb8aYND3bdyLiDuxCD/PhQSQZFtt0Hwm3UfdTlyla6IBgQtkfdZnpczpNw
	ieezs=
X-Gm-Gg: AYBFou2YnxTKmVuUhSEFtMBqLFOOMj3OXXEhrV/P9bFt6ToEZyUz3WqGin7zwVKmHqB
	VzUP563n+aGe5n8Bgq4O1oHmTZ5+tc3QNhgk2xxSTYbXH14BVrxR+ByRtoCz3O1DzsNoORD7D7a
	bZoh9RJiG7erwSewtH86p/NKeiSql1tduxvErrvJ1ediI5On+9JQG4HybL2sUD9LoiVWQ3MAkjF
	twEKVv2G7yHtkER0PlIIFx3IwqEohQThM0qzFhkeDY7hKaQSvtAk48lCWwQTEMAxz9xjvYG82Hs
	ipsXbNdxheqwJgoYEsSrhpmzETFu/gAL5dm05BLXZJdS5B/EcXPpheDsP9k3h4rkXRJ5jQofM9n
	dJMFJhmb+/ZyBQNI=
X-Received: by 2002:a05:620a:4614:b0:939:a9d4:50b7 with SMTP id af79cd13be357-93c43be19f7mr547160585a.26.1790351637491;
        Fri, 25 Sep 2026 08:53:57 -0700 (PDT)
X-Received: by 2002:a05:620a:4614:b0:939:a9d4:50b7 with SMTP id af79cd13be357-93c43be19f7mr547156985a.26.1790351636904;
        Fri, 25 Sep 2026 08:53:56 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dfa6a7sm252013645e9.12.2026.09.25.08.53.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 08:53:56 -0700 (PDT)
Date: Fri, 25 Sep 2026 18:53:54 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH v5 34/42] arm64: dts: qcom: sm6350: Add GCC CX power
 domain
Message-ID: <iuuu6v77jvukq3grlng47p7767lzrooln6loq7to2t4emnxmix@zmxaww4lqjdu>
References: <20260924-qcom-tie-cx-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com>
 <20260924-qcom-tie-cx-to-gcc-v5-34-38732033e5b5@oss.qualcomm.com>
 <20260924110259.19BCA1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924110259.19BCA1F000FF@smtp.kernel.org>
X-Proofpoint-GUID: nsn87ENWLVNIaULcHZ0cwpxvrTK01WX4
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2MyBTYWx0ZWRfX+6pq5qgAaMtS
 5Cm+mBtcMy9/xQiONBt9bW6840ZWT5RIGNBxx7ZPtLHvr4Z3+M6RKUsau52qfNPSNJa6YATAFVN
 Yxf9a3I9twNHFmhH8UBaogFWNSBV3VU=
X-Proofpoint-ORIG-GUID: nsn87ENWLVNIaULcHZ0cwpxvrTK01WX4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2MyBTYWx0ZWRfX6/5AOffETD8q
 g891sRY02PpOt4EZyU7J2FUvYNRcJJ4qlMJuGG8eLJ9nJp8BkM3cC7U+CBmd5hDjwAM9d2dLKfQ
 9cStz1EEa1XFZu5VE8kXvu7BtUnBMUOINq3Otr6zepNLld9Nc9HwmTTxPafCxXoN9BPzTWwidxz
 7PKRsqKWh8/D58axuQDQLTN7IIQcepnAM7W75DdSd/bLQMBLDqwsFEaUr99LDDIJIm4kuS/9bCL
 UfwXBe7TOdIpCOPwxzDDG5Xbop1aDg+Ni7qdtuBkjlKkB/ksMVjkNVxBX8hwZ7ZHYhJtm53aNIc
 0doOf5Br1T5E7iJ8koqAqpyztzEZoJpw0/NXB61YZhFx/vZ3j1WKO/8ck6He/cGSHHmbkqM3e50
 ZixOqTJS9wiaEdjmind6a6FL2UoMOb0tsouNxUwbtXPThJx+/Hv4DP5cM3nmwhIy1QW05L7yFsI
 2b/xB4qSDT8OEJMkeXA==
X-Authority-Analysis: v=2.4 cv=B+wsQ+tM c=1 sm=1 tr=0 ts=6ab69916 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=EwBXSBkPT_h72g6H0KkA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 spamscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250063

On 26-09-24 11:02:58, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] PM regression: GCC device pins CX power domain ON permanently
> --
> 
> commit ee5fe8d5caad7b14e28c23c20f2b192fd4ae6ab2
> Author: Abel Vesa <abel.vesa@oss.qualcomm.com>
> 
> arm64: dts: qcom: sm6350: Add GCC CX power domain
> 
> This commit adds the RPMh CX power domain reference to the GCC node on
> SM6350. This allows votes from GCC GDSC consumers to propagate to the
> RPMh CX domain.
> 
> > diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
> > index 15d38b7e803c5..ded5c3a45891b 100644
> > --- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
> > @@ -794,6 +794,7 @@ gcc: clock-controller@100000 {
> >  			#clock-cells = <1>;
> >  			#reset-cells = <1>;
> >  			#power-domain-cells = <1>;
> > +			power-domains = <&rpmhpd SM6350_CX>;
> 
> [Severity: High]
> Does adding the PM domain to the DT node without the corresponding driver
> supporting runtime PM cause a power management regression here?
> 
> The genpd framework attaches the GCC device and unconditionally powers ON the
> CX domain during probe via genpd_dev_pm_attach(). In order for genpd to
> subsequently power off the parent domain, all attached devices must be
> suspended, which is evaluated via pm_runtime_suspended().
> 
> However, pm_runtime_suspended() requires runtime PM to be enabled. If
> pm_runtime_enable() has never been called, the device disable_depth is > 0,
> causing pm_runtime_suspended() to unconditionally return false.
> 
> Looking at gcc_sm6350_desc in drivers/clk/qcom/gcc-sm6350.c, it does not set
> the use_rpm flag to true:
> 
> static const struct qcom_cc_desc gcc_sm6350_desc = {
> 	.config = &gcc_sm6350_regmap_config,
> 	.clks = gcc_sm6350_clocks,
> 	.num_clks = ARRAY_SIZE(gcc_sm6350_clocks),
> 	.resets = gcc_sm6350_resets,
> 	.num_resets = ARRAY_SIZE(gcc_sm6350_resets),
> 	.gdscs = gcc_sm6350_gdscs,
> 	.num_gdscs = ARRAY_SIZE(gcc_sm6350_gdscs),
> };
> 
> Without use_rpm = true, devm_pm_runtime_enable() is never invoked for the
> device. Does this leave the GCC device permanently considered active and the
> CX domain irrevocably pinned ON?

Yes, but that is the expected behavior here.

Runtime PM will be enabled in the future, once we figure out if CCF
critical flag can be safely replaced by the enabing on probe.
