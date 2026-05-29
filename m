Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3137C2E7383
	for <sashiko-reviews@lists.linux.dev>; Fri, 29 May 2026 06:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780034547; cv=none; b=FWDecx3HWv1mPAmbnoC3ZiST2RI4azQ8dR9C8/ZFJ34QuLR6mVSGpgcOTUhZgqD9USqOwFnkz7NRRLSPLcCltUAYk8yCKhH0Zh9XhsYmepJMEkdxn5gkPK2B/74VplhKlumvSkWM+/3iIUL0MQMwFdGLpRtDMif2yYqTgX/BWUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780034547; c=relaxed/simple;
	bh=THHivrv5h392/d/ysU3/xwu1yF4Rv5QNxm1IsHFIIG4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CsACCG9xaXzzeLzdzeGisOPDy7q0SVgMvLI+VUVvNFkH3mfwuyINE0aFiRZ6ThHOxgtKDafFkpUp8tK3kWmyi8QNFKxlywSkgu7Iw1uhCRE3RSADgoUv/nDx7hBGn9DqV+rCfbzVqTb+Ul3gbHInt8fAPpIuneaHKygbvLGAGLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ktiksQYg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W+N78eE/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ktiksQYg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W+N78eE/"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64SKkitL1386686
	for <sashiko-reviews@lists.linux.dev>; Fri, 29 May 2026 06:02:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hNrYnk4lnXXJn+zuG6R9jelZ
	mbhQiVGsdJjDOZ/vxjs=; b=ktiksQYgfoZbFxriECRnyQBLEwJ70YgsooQ4PJYu
	mkETrMYmyjSePBcE5knZii/oxd1rAwHVq5DerRmPQYpFsKnxmwJehV6mXavUthOs
	RXdrH3kRByIyxLa7Xheg/Sne2jURMfVdLBW82HyNC3XXPKOA0yWBwwY9tKD8TW7m
	Ow2MZ2+5Dxh1OEkkCmkdC80qS3neTEXV3n+9jppF217kazkL2WKjtch1cH1rma/P
	0t3ECUpIFq9H3QhPdWRb92mbtxAI30P40XbJlLvhFhFYU29O/oKkW8Hr/UwRKwr/
	A40MvxoER8dquLNgDDJT7dVYj5vZYUCmmRxhsJ8Hi0rlXA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eevumsxh4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Fri, 29 May 2026 06:02:25 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36bb6c41341so926427a91.3
        for <sashiko-reviews@lists.linux.dev>; Thu, 28 May 2026 23:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780034544; x=1780639344; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hNrYnk4lnXXJn+zuG6R9jelZmbhQiVGsdJjDOZ/vxjs=;
        b=W+N78eE//kEQuNa0JS3ebadbBiI6ZoPh6gdQQzED6SL1Kf5OrcPCFfI2akJXn8UqBj
         CmDmdcBjSH8YGd6R6Yraw0HitIFkau0U26DWBVTPID1IH7ZNpCJls4tbkEfL5I/OwBaI
         EYwiOxoiLVfNoxlkM+MpeiEzxZ68h+k6uh8oA+JwkVOlyo2P6W30CHfDI1Zs+hXVShT7
         LXtc1wuOhjFzePmKv4+VunYHF9+eFT6HpbZXhKDrnVjQSGAh99VF9MvA6D4cdupaNjvz
         BdPb0AfJvedFWYD7HNUiR19HRS0Rs3TqsXWyOy2KzOwwDJxg7tZfi+N5buwzlVFZM9Tn
         2CeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780034544; x=1780639344;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hNrYnk4lnXXJn+zuG6R9jelZmbhQiVGsdJjDOZ/vxjs=;
        b=lql1lJE9PKjjKkfn0dWHx6xcRk1TTU3cYGi1ckSrg7ayXiXtRnaBT9hBjR5kOwy6S8
         FDEYiXfvhAB9hJWGeO1aI38ITRs+E9bR1WVkWgU2bfaSWRoLEGpbSuvGjouXhQ83Y9NM
         n8NW7v1GBGnC+Spfg03v3BN5vPQm2dddkqTkS+NciGq+WLEfDykM8ItUhM1V7/IQ3HJL
         3L6COUaZ7qnc1AY3T/ohI38HkC23ori+KbHFbcSN+WWEoaDMHFe2wvhnhw4O+n82G1hE
         QzaP3Drq573Pb/A4DZimZzt1pdhfCtEcdNXWgDa05atNLbpA6EtF2HEBEDeLVV3GG0UT
         xcBA==
X-Gm-Message-State: AOJu0YwmM5EdD0B8Fh1niVDbCnOyvR7+ESzY6mCZ/OSs9GgFBnT/+T1Q
	v2aJpIYR2CkHOrKRqSzDkEkZGtX0+Z3Ndb80RB1t1GDk0aVxtapCTTd18GvGEIEl+DCRNk25JQl
	zv7oWL/eOOSWZ+/FJwDLl8vgzSM9cG+kUUImy82b2AwxZjtZDLmZ3gfA9ndnRlloTsfwbC53sfh
	Gp1ok=
X-Gm-Gg: Acq92OFWB69xwGcig+NCQYuKF5rPb5Q1Z33igNaxgCDxeED6J85JPa+q3gWsGqnVJVf
	NTZf5LftAjfI3a4DySVL890Y6Y4NgWjEEg6VMU8QLjVcVQUM1BEK7CSTsqpX+DBpn3/ogPGsZZO
	k9bjkmw6thg0HJ/yD4qs+uJjthXXWMlb/EeKI6q/6Ck05qFLOLGnhiYcNetthfHocmd6fifwYl5
	1yA6DRyzpjg0902KQg5ajzMM9E4zOs/QOt0IRnGOY1IZDT2ZqNrz4C2EmANBudlWMezYUV6QkSw
	DrGZiQrEpM5X3H256VhJ47XizNdVg3Qh8I4zTCpPwOloF1LwjZoTBothb7bUPtPT4R0dOU/T+2v
	mOzt8W2W9euWKZvWzE4M5xX/dA9nYX1BJMvdbXe9SKJFzBi3IXR+MgNvxvw2fLlPk+OCB5w==
X-Received: by 2002:a17:90a:f950:b0:36a:f623:7224 with SMTP id 98e67ed59e1d1-36bbcd340abmr2032291a91.3.1780034544016;
        Thu, 28 May 2026 23:02:24 -0700 (PDT)
X-Received: by 2002:a17:90a:f950:b0:36a:f623:7224 with SMTP id 98e67ed59e1d1-36bbcd340abmr2032251a91.3.1780034543510;
        Thu, 28 May 2026 23:02:23 -0700 (PDT)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36bc6bc0b2fsm638328a91.17.2026.05.28.23.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 23:02:23 -0700 (PDT)
Date: Fri, 29 May 2026 11:32:19 +0530
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: lemans: Add OPP-table for ICE UFS
 device node
Message-ID: <ahkr613YCCWR+EdP@hu-arakshit-hyd.qualcomm.com>
References: <20260527-add-opp-table-for-lemans-ice-ufs-v1-1-3f97f5ce60db@oss.qualcomm.com>
 <20260527101620.A83141F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260527101620.A83141F000E9@smtp.kernel.org>
X-Proofpoint-GUID: _jOs3TUXsRReKPeGmjT7CBKAcnnLkfDZ
X-Proofpoint-ORIG-GUID: _jOs3TUXsRReKPeGmjT7CBKAcnnLkfDZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDA1NiBTYWx0ZWRfX56hFsidsC/uG
 /BIv1Lwu+jEqt1CsUdCJDBEnjGW2DTiYpnqwlUEpcM0ZKB3bJko/F2A5Adu92D9nvfntPONQlz3
 XfS9IyfyDK8BxeHiRzVQbkuUBZkHPYzI1Wwput9VpNOQThy7+AD4Ryg01UegcTacIj6EvqcLU7K
 r3hEEBu9pyqfJtaJsNDLdIeVJJzQOp1szFP0b+ZqGQJL+KHwTMn3I0JAspNJCP1siiGnh5/IHtK
 SPvmTPRLHoqsnpvyzYywnV5n8hRzXWkCk19GEyIB/bEdsPmsFL01/bCI7A8tAQijLODdEnzX2/8
 F0SJGfGrq6ebj72Jr/BQ6I4UrN2HpQv9hP/S0u65gf6mER3Vfb5XatjYR/zLFJLsefNZ9C//GSa
 ndmYUx3H3v1ceT1U9jKQ1Y9Sk6eaZ54hdpKbB2AIb58p0KPFTpCitZ7Zy4UZBP1USbgznTUsdpj
 wxOUU8nt/tHXH9Zj8FA==
X-Authority-Analysis: v=2.4 cv=cObQdFeN c=1 sm=1 tr=0 ts=6a192bf1 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=zQloMYte6k70bkImtrkA:9 a=CjuIK1q_8ugA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1011 spamscore=0 malwarescore=0
 phishscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290056

On Wed, May 27, 2026 at 10:16:20AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Mismatch between OPP node name `opp-75000000` and its `opp-hz` value, incorrectly specifying 750 MHz instead of 75 MHz.
> --
> 
> commit 7df0ac8d5186b38efd03084ecec240e439760d84
> Author: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> 
> arm64: dts: qcom: lemans: Add OPP-table for ICE UFS device node
> 
> This commit adds an optional OPP-table for the Inline Crypto Engine (ICE) UFS
> device nodes on the Qualcomm LeMans platform. It defines the operating points
> by specifying required clock frequencies and their corresponding power domain
> performance states.
> 
> > diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
> > --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
> 
> [ ... ]
> 
> > @@ -3109,6 +3109,32 @@ ice: crypto@1d88000 {
> >  			clock-names = "core",
> >  				      "iface";
> >  			power-domains = <&gcc UFS_PHY_GDSC>;
> > +
> > +			operating-points-v2 = <&ice_opp_table>;
> > +
> > +			ice_opp_table: opp-table {
> > +				compatible = "operating-points-v2";
> > +
> > +				opp-75000000 {
> > +					opp-hz = /bits/ 64 <750000000>;
> 
> [Severity: High]
> Does this opp-hz value have an extra zero? 
> 
> The node name is opp-75000000, but the frequency specified is 750000000 
> (750 MHz) instead of 75 MHz. Requesting a 750 MHz clock frequency at the 
> rpmhpd_opp_svs_l1 low power state could potentially cause clock scaling 
> failures or hardware instability for the ICE block.
> 
> > +					required-opps = <&rpmhpd_opp_svs_l1>;
> > +				};

Thanks for pointing this out.
Apologies, it's a miss on my side.
I will fix this in the next patch set.

Abhinaba Rakshit
