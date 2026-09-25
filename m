Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831954D0A16
	for <sashiko-reviews@lists.linux.dev>; Fri, 25 Sep 2026 15:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790351268; cv=none; b=qjA3AR/M9ZUD3NAW7UDGsu/zV3eNVuhvQdJpcJmvMQeecpfxBv2L66osOJ/ja8cGoDesP4aiywgLY/DIbzeQYtlBMF7l2QKNEedRs2szmw2aahRkHn4hMePcJ6rN+xznKjOqVifri6QN8i2ZOTfC1vJWBbCsavTydHnZBTsKVfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790351268; c=relaxed/simple;
	bh=n6ZpxRZU14E+7+A25NQhruw3U62Kw8+/vBlkDNEX5H4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FuXHdPD4/DHPezvvFdvHUqTpKY/qNa8RTjTYFoRU/7dNpGutZIkALyG7OrTCBvU6/WCExrKbW/XUDqUfahjLqL1vCktEsMgBZQwZFVuDXihAKEmz7SGJoH7tm6b4KBwEBZZtxxIzhqmppDh/J4SrKtZR6iTtFxpOqpFnhgCEVxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cqf6P1Mq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HqkThpnV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cqf6P1Mq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HqkThpnV"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PDF0cj3532135
	for <sashiko-reviews@lists.linux.dev>; Fri, 25 Sep 2026 15:47:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cpP2+xnejZW6ZVcS0rDuSfZA
	riRIlFDBK4YQ4B+TXW0=; b=Cqf6P1MqnEpo5I+VTmXXNFOCJoRF7T2TQ34MnQMP
	MDGD1WapnO59LHJ5xN7xESLKMSgCuMQ00HFd5FTEVyEoDIAB2iCpUceZ2dDObZUj
	Htqe42d97X7EDTl9cvkVYDZMjJ87Ja1Xx4Ys81aO9v7wJc9WHbL6Gx0r6lOl1npw
	DoLGOAtvat3Orv6Ks8Iz+yANLAR4v0IV54BgtNYAoDe+H+p6gFgB8CSKLxwXKT0Y
	Um+/1Z0KvwM4ucC7+MfMcYUzTNM4WoYCBvt9P5ioPHsT01G3+VY0JWBpG6OR8iZH
	2Fh8eE/9dEez99n3v9HCHKtRYqhFi4WKhTf8udxh3I46qw==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw94kbvyt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Fri, 25 Sep 2026 15:47:45 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-986e79a43b4so120032241.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 25 Sep 2026 08:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790351264; x=1790956064; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cpP2+xnejZW6ZVcS0rDuSfZAriRIlFDBK4YQ4B+TXW0=;
        b=HqkThpnV0zoPEhqTb5DlKJwGfj08mSz+mN5uFn5MSh02B51xZYIBPYhplRYggLMAW8
         MPKQkrpp2cNXiZTGMcybd48gOMQQakB4mLyxyCQLGCSPc+xX/WbZG1f7Z6+I0xyARXH8
         Bj/5KWUDC3l8NU1W/IkP9LSi1Vj9UURFOVd79Mw2F4ecrZv/+BKBmYT3EBnzo3SjaVlK
         7TjowWZXvbeKfXlTYcD5CYApYr6wgJMhqd60q3O772qduFkX5hr/BcBkwTOdwfWVDUjG
         sXp54q3LDX6ftj+qi7TQoANNt7sZ/8TtWUTRBstDabY9v+4CaGESZFFP2rPCRV5X6HnN
         KsWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790351264; x=1790956064;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cpP2+xnejZW6ZVcS0rDuSfZAriRIlFDBK4YQ4B+TXW0=;
        b=f2qcieqUTN0QV/Zdd9pVPaGDAkkyySTFfynQXubfmsd3ZANFcnsTvxRtrEoJLryB0u
         bxJ41bsgeJNvmYvS8e41uGbm9y24fPjUAJoPI3FOfw00eZ2RdrBbD0O9qeDVu/NZ/zis
         upq07xEvyB7BiH4e5cnA+7UWGtYANrnM5eBx8Ie1earu3Rk8Fpv4ceTxqaMpEpBF+MX+
         qE96tWEBCUsqepwHI1cu5AMV5upI4e/Z5HLTYCQIa+aId89SEEAzIHedsZgOMZ+JA0ct
         PBZxq0gfkymTpymc5bnyeGyCLSEjQVyjcTFiE2lOrOdROkKcw81zS4/BRwK06EjDAquU
         mC8g==
X-Gm-Message-State: AFuF++l7yMlOv/lCsmkjHinly351Zdet0x4qVUpR9D58uDq6MLKXWqck
	YLcuYfZkQNJetsgLMaA8hqaXczzQEqqcwqlYn5ueSbIV5AxIbsyTq4oR66s9dtAbISDhLPOstMt
	0JU8GHiSpfWs1c6rI/mBphLlBZEjGCC6Ywn67vFp4tG3Acm0dblcBy+QKKNQvThIMPIJFufPGrT
	JU9XE=
X-Gm-Gg: AYBFou306SgZ3mW0UCaaC7SL0I4nfE1gZJEAxfJpHjYAo1e6u+0iIrFsYbB5zxn1z2x
	kpLDtElDd1Dm/GlQpeL4gEYZZz6nUTNUOTbsGJGJOh9BKQvuzt0KfotzpEVuiUU7sQufUcVS3Ez
	quwCsN9a1svMXM5MRHnoWyYtTc3NjVUT5j2o9FqIaEcb5m3RMxtWC5XDhl8c86ISle0xjAd0+7t
	D7rz5o332dMKMQ1nx5cNq+fr4RL/YXMpYSFcS8tH0LMrcsyh9RPiEi4dEnMIj4OnAQofDhjFgYO
	M8xo5szuHtGBR76zYH85hVOoIu3Fjc1hRH+KqQW7fkCq8b0g0NytsKbbJMBpeya/Y42qypqDmIw
	GtTHoQS7DXladOC8=
X-Received: by 2002:a05:6102:441e:b0:7a6:a24e:811f with SMTP id ada2fe7eead31-7af1c79966cmr3211543137.7.1790351263768;
        Fri, 25 Sep 2026 08:47:43 -0700 (PDT)
X-Received: by 2002:a05:6102:441e:b0:7a6:a24e:811f with SMTP id ada2fe7eead31-7af1c79966cmr3211528137.7.1790351263242;
        Fri, 25 Sep 2026 08:47:43 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff2884552sm51233485e9.10.2026.09.25.08.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 08:47:42 -0700 (PDT)
Date: Fri, 25 Sep 2026 18:47:41 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linux-clk@vger.kernel.org,
        robh@kernel.org
Subject: Re: [PATCH v5 23/42] clk: qcom: gcc-sm8450: Tie the CX power domain
 to controller
Message-ID: <kfx6o4tcdkdxy65nl4qq2ecqahd2zsp6dqe36uhosm3glwkhyl@lex2azg4sybm>
References: <20260924-qcom-tie-cx-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com>
 <20260924-qcom-tie-cx-to-gcc-v5-23-38732033e5b5@oss.qualcomm.com>
 <20260924111126.511671F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924111126.511671F000FF@smtp.kernel.org>
X-Authority-Analysis: v=2.4 cv=aaj0Dhot c=1 sm=1 tr=0 ts=6ab697a1 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=JOqecPiLsEwRwh-fJcMA:9 a=CjuIK1q_8ugA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: GQBGaD_JAwJXw4WOypq3XvfIYm2Zt3Wc
X-Proofpoint-ORIG-GUID: GQBGaD_JAwJXw4WOypq3XvfIYm2Zt3Wc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2MiBTYWx0ZWRfX/PBcuh4TpbPv
 ga9oXkpUKJR3MG92rjM5VD7iA0ZmAv8DbvEOPHTWXOTBPxZdmzvDEhcvGYFYHv1xTtMNNocEIYk
 mLmu8u0e+WiAZHeEutu/BbMwZ+l7i1l4C7KNk+hKtjdNJMMWZKLro9HcR/SR9kERWbYCoh1ZLbZ
 hTXcPkh96NZrqPQOGKEBwBwuegkKO+WlPd+/s4D2ylq00NHf13UsoewkKxBERWkrhDolUVbif+N
 rD+ORHzLGmmSKvjs0cn9bnnZhg6GNHNUZHXPovcv+X7Yzj5tPmO737FA693b+ZPGL25pMeff0X1
 iSDv8YAMt5NXG+fYSxuY6BHHvSUef4PXtuni8Tz51kttd9iZsbMujLZaefAVC/F/PwP7WKnvM86
 cSoRyvql8YXr/gSKnVZvLGHNHCpKeybrFa0R+bjTnUrDJDj4HOO1I6VmkIpv/mNvI2PeT2nhR8w
 vvUuiYujAAZV1d8hwmw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2MiBTYWx0ZWRfX/LAmdNQje49e
 2wbuV3H26+GTTpO5yWdYYJUcJVzF2zcJS6pDKMhRxjqKjciFs//BbF1HgAhoBLnUE2msgvVhx/5
 zrRbk/twEWWwLDI/WFw66Uf+vii/GwU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 spamscore=0 bulkscore=0
 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250062

On 26-09-24 11:11:25, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] clk: qcom: gcc-sm8450: manual register states lost on CX power down
> --
> 
> commit 99d5496af370ec324c5f350b6121718a0028abd7
> Author: Abel Vesa <abel.vesa@oss.qualcomm.com>
> 
> clk: qcom: gcc-sm8450: Tie the CX power domain to controller
> 
> This commit enables runtime PM for the GCC controller by setting use_rpm to
> true. This allows the CX power domain to be powered down once all consumers
> have released their clocks and GDSCs.
> 
> > diff --git a/drivers/clk/qcom/gcc-sm8450.c b/drivers/clk/qcom/gcc-sm8450.c
> > --- a/drivers/clk/qcom/gcc-sm8450.c
> > +++ b/drivers/clk/qcom/gcc-sm8450.c
> > @@ -3400,6 +3400,7 @@ static const struct qcom_cc_desc gcc_sm8450_desc = {
> >  	.num_resets = ARRAY_SIZE(gcc_sm8450_resets),
> >  	.gdscs = gcc_sm8450_gdscs,
> >  	.num_gdscs = ARRAY_SIZE(gcc_sm8450_gdscs),
> > +	.use_rpm = true,
> 
> [Severity: High]
> Will this cause manually configured register states to be lost during the
> first runtime suspend?
> 
> Setting use_rpm to true allows the CX power domain to power down when all
> consumers release their resources, which resets the GCC hardware registers.
> 
> However, gcc_sm8450_probe() manually configures multiple always-on clocks
> and UFS PHY settings directly via regmap operations, bypassing the Common
> Clock Framework:
> 
> drivers/clk/qcom/gcc-sm8450.c:gcc_sm8450_probe() {
>         ...
>         regmap_update_bits(regmap, gcc_ufs_phy_ice_core_clk.halt_reg, BIT(14), BIT(14));
>         ...
>         qcom_branch_set_clk_en(regmap, 0x36004); /* GCC_CAMERA_AHB_CLK */
>         qcom_branch_set_clk_en(regmap, 0x36020); /* GCC_CAMERA_XO_CLK */
>         ...
> }
> 
> Since the driver does not configure regmap caching and provides no runtime
> resume callback, does this mean these configurations are permanently lost
> after the controller resumes? Could this lead to synchronous external aborts
> when the affected subsystems try to access their hardware after waking up?

Nope. Dropping the vote on CX does not lead to configurations done on
probe being lost on resume.
