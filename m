Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D61F843846C
	for <sashiko-reviews@lists.linux.dev>; Tue, 21 Jul 2026 08:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784621333; cv=none; b=VbRIlQ4pJ/3xMFGPtU+Dv4i2apZTab6jFbmAo9kEgOrRfAqdrsrw+97tiU2jKKvhjVX2KsKoF2e4MBtuabM6MunkvlHaeur4Uwg7vltHsX00y/INfK64b20is3F9UFJETLlDI8yqpmZhxXRa0I4gIzSqRsAj++8hwYYUS1v+BQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784621333; c=relaxed/simple;
	bh=MnJJznTNb0T2HRhw/9Df72HjOjsDh+evdHwrOlq8d/E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KKTzrQCzMLciABbu2IpMhTg/Pv9gcFr4dImtDnu210USk8oV4+nArpZKzH2Ti19cYE37hR1AnEkNu402Wv6nyAYX2RvEGYct8+Xn9kQQ6czNPfcob2CD6k3igjqXieR+VR2gyOWopC3Y9TcIBHQdvBQmcIDE14dvMQQxz3LcJZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C/rlAThi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VfvOvgqg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C/rlAThi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VfvOvgqg"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L6FqlF4107084
	for <sashiko-reviews@lists.linux.dev>; Tue, 21 Jul 2026 08:08:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HtLBlAg4r0+Aka+/4sxNKNln
	C5hTN13yNk/Kzymsu0U=; b=C/rlAThiRCvbpy6/usGw/BT5RxBapOsPrC6mOdfd
	HltX+qIiRmq1taP0prZ5nI3P7aTQAuJoWy18yyLmrPeC7LQXl3VnB6Gay75Y21i3
	AphPtpb1w7EqaIL/Abm+a8VyVNWhtdpA02wLOxSag8DUvHueUdLI4a8LCb82IfVG
	RWLQ2IL9N1+UC3L81gV0qsF3hslskbcVuw0OQp4mE74UrcKwh3NarEe+wJnPtLRd
	nXXc4iazYR5kwtpi5F5kJS97VrdaAZJONjlVXLvjHAdTFP7FP8fW9J/IWneEUDby
	aHsU4IVjFWGqNYs1lP2O4WzrBS88ZgsxtQ7ML1jEsB01ow==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhvqn9w90-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Tue, 21 Jul 2026 08:08:51 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51bfe3fa93bso226346161cf.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 21 Jul 2026 01:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784621330; x=1785226130; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HtLBlAg4r0+Aka+/4sxNKNlnC5hTN13yNk/Kzymsu0U=;
        b=VfvOvgqgbg0I9a3VtN+yKoe3OQrgzeVBHh7yeCgD4yvBNxLNQFlFceAtTkC/vP5cQp
         UDZJ1B6C4YSRnc+VBsjhsdMgOQMdGqrm4F748VSnUA7iDdOAZgwVTSqU1YGNyX8M9QY3
         IrCiqU5NCH/RJj+qSdfKvpklqQi4OWeAWJ52lzXwmVDPAWbQxV8K53n5KKk+3aFZW37Z
         TwsPaiSk3tA4V/OBzH5v0lspjfwEPXwE+JZ5sLi9CoXRd6bR6skfhACfCPYa2zquBfj7
         5XS4nrOACid3LbWXWmZYcxYO2QEFO9Jp7IrBXjkZyyEAyMKyPEgUvXBDaBePAEz1bEkU
         Sj1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784621330; x=1785226130;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HtLBlAg4r0+Aka+/4sxNKNlnC5hTN13yNk/Kzymsu0U=;
        b=ZdJK4u3m5XUQop2F82fKyOCH4kGmUBYAKxwFql0HnVw23VnPgnRgJRDvUee7AlEEp9
         6dcmoZ2hX4wjjnSXZuPvwSlZGqvo6U+oXpq6U/jMGxnhyDLcS3M0Sb+DFun9sNF7uX70
         etBzyTomsfU0vj4DOLpvXWRqShb9xztiq522P3fPsgA03AIs+WaydfePh4hCiPC3e+gQ
         UW663iibqwHhRl3v2aMohEPxGQux964wY209eQShb/1N94S0xXVDoHK1zG9PVqR1VWDX
         VWISxoppk3PW7F8StWkHcOJAoGD4MIIGDKeD8vVclK0Yn1eYj+iaw5BKL6xv5d6Nn2tX
         Vzhg==
X-Gm-Message-State: AOJu0Yzb0/QW1OknrVxG7Q0chv6c3q3uoiZdvdo9egzw636+2Q6PH5xF
	8eg7pgDccf5oPuu5ybuLxGZHgESd6EGNcLh4/L3KXCkXW1sKFupcSp6JrlMzeiTrZfGYwusL3pg
	afcgHGKcYmzLuh46qqQFSDSSiEty6QnXlL25LgJJDT53P9fPT5AMvLL90d6am5Mx7+3lFKT2vEl
	jdij4=
X-Gm-Gg: AfdE7cmkdAr1rzKxusbQ74gM24mp7103iiExx3GUwaN3oueTfl5aJDfrFCDwcBtxnTc
	a0B4tUueTvUjDjWutbpugM2VOQFb7DUWjGQm1oZszAaSTqdY4txwlw/ha8fArws1YF1GmvjyYpm
	sCgxvCbiJES8YJN+Bu9JRzAdplV7ERfGK7Lcv+T5USySLflf0BoGSYXP0OgyqyrsF86Gkxn4c8A
	jWLWIeQIXbqIyT4n++i2I5yfHgnxfWwsGsWJ1WkZuJ2EZ98ZsbyDqQ6W5oNZbQv6sIfzUruf5yU
	7IpuUds6lQNb4aKY9fWoKb329buFwwm2fvu1gqIAHhgwb0nBzVnhabQ+GJVOgkcSRtRnDFK2vxa
	7LG6vkbhlslExSSE=
X-Received: by 2002:a05:622a:ce:b0:51b:ff00:46e with SMTP id d75a77b69052e-5213c7e64b6mr167047871cf.32.1784621329918;
        Tue, 21 Jul 2026 01:08:49 -0700 (PDT)
X-Received: by 2002:a05:622a:ce:b0:51b:ff00:46e with SMTP id d75a77b69052e-5213c7e64b6mr167047641cf.32.1784621329310;
        Tue, 21 Jul 2026 01:08:49 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63eeece9sm35872990f8f.37.2026.07.21.01.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 01:08:48 -0700 (PDT)
Date: Tue, 21 Jul 2026 11:08:46 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: eliza-mtp: Enable CDSP remoteproc
Message-ID: <64uogzqxtz4sfwhg3kyrxcspuv7bmq6u3kxelbwun3d6wmf674@rayzujuahc3r>
References: <20260714-dts-qcom-eliza-add-cdsp-v1-0-525e757a23b0@oss.qualcomm.com>
 <20260714-dts-qcom-eliza-add-cdsp-v1-2-525e757a23b0@oss.qualcomm.com>
 <20260714134955.CFFC51F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714134955.CFFC51F00A3A@smtp.kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA4NCBTYWx0ZWRfX695Mb/YkyGQs
 gLvxtxiCGtu3ZUm9ESE7uJfxfUltAN4L273CIYtpCQDIi3OZ3r0aWwQkLh+if83ViseRs9SxaSK
 9p8Ylrsyn/07IpN4ykXTqE9WHYKaGESzMJutgShhzRok9FdTIs5ITs7flVW8zOjuGO//MZG4mkx
 BYTBLJlNz++xZxWZBPUgfC8QeCUKfTYM3P8oK2Q5+0ckG7KnwTczv1RUVEw5MW6xp4RL+ABtKUT
 5r+njngQbIpC2W0hebA7LKvDIXzm9HoqHg3h1ApnwE4mwzuTYCZU0MU8F5AKFTY2V0Y+H6r07T7
 t+e8afiGn/1Zo2HPYeGJLjL123WaEkfUYeXqX7mFyPK6u/qLJ2Ku8Q0rqq8R5VfWZ8USfyOjRg5
 p0hndBU98D7s56MEJtMxNr8dc7qTd/AuIVQtlhZDzRzPXiVJJxJIMe4e6o9BbHr0SaFned8S0MJ
 vc1HA0yc2hiYw4ZRXCA==
X-Proofpoint-ORIG-GUID: kss03R0tCiM1zkTR6PR_fhSnP6gHQTWe
X-Proofpoint-GUID: kss03R0tCiM1zkTR6PR_fhSnP6gHQTWe
X-Authority-Analysis: v=2.4 cv=M5F97Sws c=1 sm=1 tr=0 ts=6a5f2913 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=g-jXLJ6NlkpF3N7jzMkA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA4NCBTYWx0ZWRfX3oR6rd1+cNm8
 IjlJFYB8tY/bCHi3B13YBDNLT78HRAOYNxUD8XiRjCBkiterAFg2mbDVYzOXWhHsCE4UN2sjj2Z
 aRrB63o4q4PnQcMtb9VGXRA1BC6u+ec=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1011 lowpriorityscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210084

On 26-07-14 13:49:55, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The `remoteproc_cdsp` node is missing the `glink-edge` subnode required for IPC.
> --
> 
> --- Patch [2]: [PATCH 2/3] arm64: dts: qcom: eliza-mtp: Enable CDSP remoteproc ---
> commit 5af49a73d9e2d56636adad16779d928f64bfc0a3
> Author: Abel Vesa <abel.vesa@oss.qualcomm.com>
> 
> arm64: dts: qcom: eliza-mtp: Enable CDSP remoteproc
> 
> This commit enables the CDSP remoteproc node on the Eliza MTP. It provides 
> the required firmware names and sets the status to okay to bring the DSP out 
> of reset.
> 
> > diff --git a/arch/arm64/boot/dts/qcom/eliza-mtp.dts b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
> > index a7d6f9d52ef31..7de4ee3935e63 100644
> > --- a/arch/arm64/boot/dts/qcom/eliza-mtp.dts
> > +++ b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
> > @@ -484,6 +484,13 @@ &remoteproc_adsp {
> >  	status = "okay";
> >  };
> >  
> > +&remoteproc_cdsp {
> > +	firmware-name = "qcom/eliza/cdsp.mbn",
> > +			"qcom/eliza/cdsp_dtb.mbn";
> > +
> > +	status = "okay";
> > +};
> 
> [Severity: Medium]
> Is this missing the glink-edge subnode required for IPC?
> 
> Looking at the base device tree definition in 
> arch/arm64/boot/dts/qcom/eliza.dtsi, the remoteproc_cdsp node is defined 
> without a glink-edge child node:
> 
> 	remoteproc_cdsp: remoteproc@32300000 {
> 		compatible = "qcom,eliza-cdsp-pas";
> ...
> 		qcom,smem-states = <&smp2p_cdsp_out 0>;
> 		qcom,smem-state-names = "stop";
> 
> 		status = "disabled";
> 	};
> 
> Without this subnode, qcom_glink_smem won't be instantiated for the CDSP. 
> Will this leave the DSP functionally isolated since the host cannot establish 
> RPMSG IPC channels (like fastrpcglink-apps-dsp) to perform compute offloading?

glink-edge subnode will come with fastrpc as a separate patch, since
it wasn't ready by the time this patchset was sent.

But this is still enough to load the firmware and start the CDSP.
