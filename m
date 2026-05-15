Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 791DA47DF96
	for <sashiko-reviews@lists.linux.dev>; Fri, 15 May 2026 11:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778846064; cv=none; b=oIgb+BxqwePiZVKlgN6wCTytVb7dIdDdbZnlYjGRJTg9hHHmpTLNrZSA1gFaClIMbBu9xUeyARhL9XCYh/aB191oMvQCSDak0rNhy7QZOjerSTjxmdJFCMuxI2gpTrDPPwpaGsVU+sZWLcqZ1SZohIUtYmJ3M4/VYmDNaOZxNU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778846064; c=relaxed/simple;
	bh=9Sho0fI6NMkCeh4ivAx1th0lJtyk1bZr1iXmawYJupg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HLohugeBNyVLhQLS0Nren6wJ0ktlTMUgM5/4+TLxJ+cb2GGlWEsWfrMc3zHoo8w2lCaZGaBfUD4+cwIvW5wRyERQbW3glBP35pXqDG5c5cdxSdsqJmaAfZNU4NEDs8qUV47KNPrp6YfAZqwzpc+Si2tsW0wPBdoFoYXOACHgyxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O4Ubf9SE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D9KUShtf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O4Ubf9SE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D9KUShtf"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F5bGWN1847994
	for <sashiko-reviews@lists.linux.dev>; Fri, 15 May 2026 11:54:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F/w0biPfBm7tGN3XiFzZ+RM/IeqIJzrVr9O3LBKg0qE=; b=O4Ubf9SE6YBD2URc
	uS46GZbrn82iC0ImqkJmmGevdmdWGJrY6qGPRZSEAj7OtjFEA341qP5cq6ucMdre
	l25Xud0tHil1kw4WysLzq6S4H4p+gQFrIFcUnatoC5SnvPShX0ES/7YwYSQQBvsN
	EGMqlDjg40RXxx9D3BZ+E+nCo+GgVqfGPW+B8ixTERSsmtfAGWlMOwRhZMRT3+if
	ayB62B3xZ+1LWnadWsMTDXZPw6ZvXEVRoTMan31sSsnLzZRoWcN7v4PE/M38rMep
	a8hcFGVbrPQfoMMBQIgZ0RS6n5OeIWNuRNqwT8mG9r0uDmkWK0JjB4HZi9eetFj1
	UVl33Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1t32wt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Fri, 15 May 2026 11:54:22 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51650041428so27542911cf.3
        for <sashiko-reviews@lists.linux.dev>; Fri, 15 May 2026 04:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778846062; x=1779450862; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=F/w0biPfBm7tGN3XiFzZ+RM/IeqIJzrVr9O3LBKg0qE=;
        b=D9KUShtf9WtvrQxBbM5WgoFbFXeIOMkseFzmJUHKlNaKWPpcxyj4uf6FtZVYJ7yMyL
         U6VkKub5/fGYmFliHTWaijDUO1gcin50xz8yuOZ1mOkocTI/4VzlkWNvlNNFjQLYGOlc
         yDMPOrKtrH2eXcECqSxA/C7g5inPJ3KKzgjnPr7mkfKjrlQ14zd7xRrHVoFjnqCFZgjV
         2Svce+emxV7c11nUt5ZpA+bAtdwG/TpnAk40j3D3umi4GKwhBpFu/0uOPsqRiaoZhtnK
         PdANb/lwvk9FsXy8v2RcYh0v0gNoPXsHw1+8DSchEWamMEhUV9iiUtHtpwgnLsU3KPHI
         GgKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778846062; x=1779450862;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F/w0biPfBm7tGN3XiFzZ+RM/IeqIJzrVr9O3LBKg0qE=;
        b=W5bxrdmbsJeKmYvK2OltnFnloxflPoatbQVb3p2Fz9Z6h0/pfMlHnu0Xb/dVhfJ19x
         iofK6nOFx1F9Dc2L9N9vyXRuS+fLIp2UAlIFB7RgfKr849lJhY5PFZ7XK6dv76HEUKSE
         jPVMINGKI/AtXU8EzI/0xxDFfg82xz99L0D0quVHAxVVVWV1Dfpg2j1R5awR+ufoe1Pt
         WZrIYpkSe6se0hhttGVM6f3yi+Cp1iMe5D5LKwCxFJInk/RtihBy8He+ZC50Bm4xZO8M
         TiXG4YVQNJvjPrJeVviLy6O5eYldnhl+H8xM3rWMrJAUjdSP2zXRTDwhRvg6RUHsqaiR
         eb9A==
X-Gm-Message-State: AOJu0YzMCpztat5DDg++EyICEhdrTzs2ykYwLsNKxK6VXDVleNO6D16A
	7421Uy77EPKDsO6EpxCwWhc+kpjyOwmVBdVJYyR8vHXVIqnm3Zc4CERVbHgYzJB6sqouUb/j38I
	V2jEyVVnAW9P4uy+Ax8at152s2O+wZx7/0IEc+orBZtLJOU6mcCOGxWeq+2NzLn799GYhWQyBFw
	7JvWc=
X-Gm-Gg: Acq92OHN19xFhBzPT2mAIhP4O8UX8q9EdOt3YvPLe1F4JlRD7ZMVyaaiKkL9OvqKhOk
	Hv49LeHF6GoY8xOxjE9MAColOCjLV/thH5JDN7ZKrhgzerRbK2JsNlRtHliW/BopdNnTnxSmk8t
	mtHJ01Nc1jr/UBhoi10ub/ZkSRqJLrMQIeo9ghpTjUMbfJMazQoKrFdJNt46v28YxVXK5f+PQR5
	lqzNSLjtiArkpqDnyLE5ErE4ccBvZk+0dqzRapevfK+7m7g41eDf5Ci8AnKyn8CXaYzcQea7mpl
	0glkcPB6DH+tV6OrfCvYks7Xymrx32l/cskbLDqkntE9vhAVB3qSwS/YO2uabAN3oF2U+xJBdQg
	wmhYsPT4Tc+0blmD2ZlBZu3baMsTdfU4B3vi7xT6GV7rd+ZdjKAor6vMKMZnSaM4ojSqNT89vTL
	VPWPIB5/MbK64qs6rBUiAtj8J7H7C2evCNQ+AlmT1xga5Aug==
X-Received: by 2002:a05:622a:4d4a:b0:50d:8cad:2381 with SMTP id d75a77b69052e-5165a263955mr46272581cf.54.1778846061543;
        Fri, 15 May 2026 04:54:21 -0700 (PDT)
X-Received: by 2002:a05:622a:4d4a:b0:50d:8cad:2381 with SMTP id d75a77b69052e-5165a263955mr46272151cf.54.1778846061069;
        Fri, 15 May 2026 04:54:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f11a59dsm1293974e87.25.2026.05.15.04.54.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 04:54:18 -0700 (PDT)
Date: Fri, 15 May 2026 14:54:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v6 1/2] arm64: dts: qcom: sm8250: sort out Iris power
 domains
Message-ID: <a66m3qbpxnef5alqphm275s2lbrxvymvvgxzhasfg277sdnuxd@6uhm5f52vgzt>
References: <20260512-iris-venus-fix-sm8250-v6-1-51856dbef83c@oss.qualcomm.com>
 <20260513214204.7BD77C2BCB8@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260513214204.7BD77C2BCB8@smtp.kernel.org>
X-Authority-Analysis: v=2.4 cv=D7Z37PRj c=1 sm=1 tr=0 ts=6a07096e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=c92rfblmAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=jl4yj-lrKLgicftm15cA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEyMCBTYWx0ZWRfXymeqz9EGTqd6
 UGijC5/H8u3U5x0tt0rePkK6Mv6bwL2r5GirkMkUss6insrULOzPmfKO+XmnqnxfP3DK84hcQs3
 jWAa+xVo1Br/2gFvjmt4tmiA0KwGai8ZwhNUSB1hgqDH9MSN7YmDZmy4B38SuWdSLqXxPzl1K7x
 Y68Z/9hmxeL7uKmjTz0RueJ0dGhnv9dW+VDyZtx/YmIZ9vzTOa1X+lyW95IpD8tYfHR0iW4jcyR
 iioYP8RgyGNh7rAwp4nRg6avAUiCKZrm/puevbpcdbrmR5HAeWyCEs6Nakx4DgT6w+YihylifjC
 tiPuODy5DqnosCIl1j3B682OXiADtyhdUlFFDsce9ncyhxKMhhefyk/uAsmX4mAcz/cPZr4IsyL
 4liO9vsqoFnqjnUnUW4QBRLQ+DAPRoTxjwbgN5wf6fGQxQsQTpAKXrFbvBDUJEb9hG8iklhCL9F
 l6mfzHU7BEgZrmPXR8Q==
X-Proofpoint-ORIG-GUID: occTftMnz-JQAcv1o7z2c-KIQvIpd-ub
X-Proofpoint-GUID: occTftMnz-JQAcv1o7z2c-KIQvIpd-ub
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 phishscore=0 clxscore=1015 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605150120

On Wed, May 13, 2026 at 09:42:03PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [High] The Venus driver ignores the newly added 'mmcx' power domain, preventing its voltage levels from being scaled or enabled.
> - [Low] The addition of a fourth power domain violates the existing device tree binding schema for the Venus node.
> - [Low] Duplicate phandles to the same OPP table in `required-opps` violate the `opp-v2` device tree binding schema.
> --
> 
> commit b2dff816f619c94b6f1db957c2bb928b6d9248f2
> Author: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> arm64: dts: qcom: sm8250: sort out Iris power domains
> 
> This commit adds the MMCX power domain to the Iris device node on SM8250
> to support MMCX voltage levels. It updates the power-domains,
> power-domain-names, and required-opps properties.
> 
> > diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> > index 7076720413ab2..1fcbd400a3be3 100644
> > --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> > @@ -4326,8 +4326,12 @@ venus: video-codec@aa00000 {
> >  			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> >  			power-domains = <&videocc MVS0C_GDSC>,
> >  					<&videocc MVS0_GDSC>,
> > -					<&rpmhpd RPMHPD_MX>;
> > -			power-domain-names = "venus", "vcodec0", "mx";
> > +					<&rpmhpd RPMHPD_MX>,
> > +					<&rpmhpd RPMHPD_MMCX>;
> > +			power-domain-names = "venus",
> > +					     "vcodec0",
> > +					     "mx",
> > +					     "mmcx";
> 
> Does this addition cause a device tree schema regression? The schema in
> Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml currently
> enforces maxItems: 3 for power-domains and restricts power-domain-names
> to exactly "venus", "vcodec0", and "mx".
> 
> Will the qcom/venus driver actually attach to this new mmcx power domain?
> Looking at drivers/media/platform/qcom/venus/pm_helpers.c,
> vcodec_domains_get() initializes opp_pd_data with num_pd_names = 1, and the
> hardware resource struct sm8250_res.opp_pmdomain in core.c only lists
> { "mx" }.
> 
> Since "mmcx" is not in this array, devm_pm_domain_attach_list() will only
> attach "mx". This would cause opp_table->required_devs[1] to remain NULL,
> and the OPP core might silently skip setting the performance state for MMCX.
> Does the driver need an update to properly manage the MMCX rail?

The updates have landed in the media-committers / media-pending trees.

> 
> [ ... ]
> 
> > @@ -4353,22 +4357,26 @@ venus_opp_table: opp-table {
> >  
> >  				opp-720000000 {
> >  					opp-hz = /bits/ 64 <720000000>;
> > -					required-opps = <&rpmhpd_opp_low_svs>;
> > +					required-opps = <&rpmhpd_opp_low_svs>,
> > +							<&rpmhpd_opp_low_svs>;
> 
> Could these duplicate phandles cause a schema validation regression?
> The opp-v2 bindings in Documentation/devicetree/bindings/opp/opp-v2-base.yaml
> explicitly state that required-opps should not contain multiple phandles to
> the OPP nodes in the same OPP table.
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260512-iris-venus-fix-sm8250-v6-0-51856dbef83c@oss.qualcomm.com?part=1

-- 
With best wishes
Dmitry
