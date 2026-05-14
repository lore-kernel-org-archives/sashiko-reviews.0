Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37753955F5
	for <sashiko-reviews@lists.linux.dev>; Thu, 14 May 2026 09:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778750932; cv=none; b=rGcrvifHvKuUraO9DIePgyvFBuD36//D2IvuWM8ZyVmPmUTF+E2pScSPIFJ/fXrkqugOPjA+DDFCcRUDR4zvUuJ59LW6V2C1+YgVxdLcZtBoYouzVqCUPYpRw6IfzGH8jpyk+l+eD5fEVWIFLq6YBMdEIs2A8cjGHEIH9lOsEKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778750932; c=relaxed/simple;
	bh=eb9GI3Ik7tKkTtsi+hd+WYKwmb9P4O3AFMHxum3Lw9M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nJ1CUkB0Bjms9SAvsI3GImcwMQuF+XxFx9fRgHiP1xyxInxaNINn1ui/2ydxFKUwpCsAv2u8fn+YmLzV+y6ORDIFbOC07usW51adn4VUqZTbIxHIMYO/kxeDLA3nzhzx6ZUg7dc4fZ0sOfmp6sql/jgssyiSr7qYYAzf7FbmK94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AKoJQpi7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TvXL+TCc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AKoJQpi7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TvXL+TCc"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64E9Gni81095283
	for <sashiko-reviews@lists.linux.dev>; Thu, 14 May 2026 09:28:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JZdaKTAzggE+dJA6GpUXOyxK
	2DDdS9Y3B1CJJnVdArQ=; b=AKoJQpi7pC883APWeeBtFtrD7+wxf1Ww7N6xAOkx
	D9qinPZ1C6JUi+P2cH75/flvdIojK80NG01uK23AxNZTwuHk0tEVbH/17EYgWFUM
	/9psiQtFHN3Zx4E8fs+UO7MiKhQIqwdGbqIeE0xPw0BYUCHuQsLxVO33PmuwUdLO
	52BwXvkgAcMMO+mPsjOfqChDntoSvrB3x3rdhEBSRiNojnucUr9T/tNu7rx/SPXb
	rBO4coJmCRzGCTaflf5qs7mph7R2vvT/oiruVVshJ6s2Vd77l1nFYhAmDSqQg1kJ
	YY0LQtBxmL0Izlt8EQITYRudSns1YaUYLz04aTAXvsYvZw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e563hh8ar-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Thu, 14 May 2026 09:28:49 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-514b5d6bb45so61660491cf.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 14 May 2026 02:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778750929; x=1779355729; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JZdaKTAzggE+dJA6GpUXOyxK2DDdS9Y3B1CJJnVdArQ=;
        b=TvXL+TCcIx6WIQ+xVvgW7NbOa+KOzfBP3TtsHKeqnc/CNdAUInn6HuOUp5vFO33A6Q
         +ymcLwM2Qiio5JB7mSiFZ6sBaKQahq/+wAq95BOmO8/jfI3PfirxFGJn6njMHR51TdCs
         jxNxb2laaxSzQD5dFYUrKniVV6+BYhwzYq0N85DWMxFESFBspwAFFQUE5EI1+hAT9uDC
         8XnWwn6qZfY+JRWjnGwTaHSJ4B1zv+WhgfD+HE9md7aEQiGYbTa7fw8KJZ+E2mOVTws9
         oP4OQwsysFxhfqS8uOmEQzSKiImRptbJK/hUelgqERBhLbPLJl+Olh2PvLs8Jj/gUcgB
         rfnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778750929; x=1779355729;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JZdaKTAzggE+dJA6GpUXOyxK2DDdS9Y3B1CJJnVdArQ=;
        b=rbq280PWQPTTg3Tu6NRNvxxrCfaUgslCy3xk7wwxFm61ywRAlV4NHpDCRcqFky5FBr
         yaxUxPCsL9YiscTKAwwsmwC58xdxhrYA9fubqcD+s9OD8KDmqnskk4Cb7n2IqpDTWBct
         l8px9BXXtKRQIQ1ZOssDuwRuyRc721it0gB78I3LyGcruApQhQ+w3KBcryoNRjufLAAx
         BF+qBf8Ez0ndZ9SePEmHS1dv6dceq+TC/9HdePVubfgeALLi94PgySnyyFZP/PMMUahC
         psxNhtshCeHAy9RAoPpNGS09hqD0ghIw+gg5ihq9xpF4mF8EeTtslD+Pk3Y7Yuj+O1K8
         sOmw==
X-Gm-Message-State: AOJu0YzdLl4+XRaIjxOD47fgiZYWOlpk2CZOq7ECvQ+PoYg+SsMp7jrr
	mplTpBaZyrqVVLFVTs7EqMyhgwt7hLL2xqq9y255eyvf2Pqf4OVHgDeoUjcJW0DfLaiP1lBVnLk
	nx2oMm9D/ohCon0NRKP8Rq8r9b9UiKAm08mh1iEApy+Idnm4byJp5zolTjsuuOuOU9ch265Ul71
	DFALE=
X-Gm-Gg: Acq92OFlZhipTCM4kByYazw08LcLk3oovaQVoMI2TNsNIIt9lTUyHuIjFZ9xb3KfqX6
	vk+0h6JmPiNYG/vKAHD9SRV8CxAOl+YerHcpCOZj4CTBuwhyXouxfIXJb3Pxv3zLi/2GptNnDKY
	XoY+v8Ps+DtRWkN07F6kDovS96D5rjB+skdBAW3KhkZGndJ4AY/NYCYd7mwFMfImcpUH8q7ktG+
	6Kb7kJe8pJjp6ugFyBKekcqqWyU3sfKY0h9wUa/N+vAaJY94Qq11BT+bi40DNLf5p6W/SZ6h8pP
	fzYbzlgIbp7tbnh4fOEyw6e1Fo1UzTfqGLtUzAyElpz064oz4Fqj/0DueMJbGMwx/gulX6urAbj
	LODEVsKTL7pzqeNTTw6aZ8F1d5Fg3aI+EXMiOMElufSqqg6RkSSiGk4XEG20eNi1YpnZEUYpXjb
	pBYbNfRzQMhh0KhxZ7TOwCmfG7q4CKKxx/vLw=
X-Received: by 2002:a05:622a:3ca:b0:50b:4946:2781 with SMTP id d75a77b69052e-5162f5a3c6emr93345561cf.38.1778750928844;
        Thu, 14 May 2026 02:28:48 -0700 (PDT)
X-Received: by 2002:a05:622a:3ca:b0:50b:4946:2781 with SMTP id d75a77b69052e-5162f5a3c6emr93345391cf.38.1778750928411;
        Thu, 14 May 2026 02:28:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a9164bc518sm361532e87.39.2026.05.14.02.28.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 02:28:46 -0700 (PDT)
Date: Thu, 14 May 2026 12:28:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org,
        robh@kernel.org
Subject: Re: [PATCH v6 3/6] arm64: dts: qcom: sc8280xp: Add Iris core
Message-ID: <pfvh4kxhrorhykdhzackmn572wfqbeawdusn2qegsugueblagu@a3wf4pmozztx>
References: <20260513-iris-sc8280xp-v6-3-0d11d90d3e26@oss.qualcomm.com>
 <20260514045715.E22CCC2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260514045715.E22CCC2BCB7@smtp.kernel.org>
X-Proofpoint-GUID: IUuR0H0TnG65v40kmITD_RQhUp1VHPin
X-Proofpoint-ORIG-GUID: IUuR0H0TnG65v40kmITD_RQhUp1VHPin
X-Authority-Analysis: v=2.4 cv=DewnbPtW c=1 sm=1 tr=0 ts=6a0595d1 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=CKH5FQq_NqdB-pMRBGYA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDA5MiBTYWx0ZWRfX6N5N7j+bJUim
 eEdQi3z5Qy7oNV72S9LKJtGHyKoFz4TvR4Gdpbd+cS5g/vFCMruIKNtro/IJUbx/I0yFb0xQhZ4
 tUWRetl6R5TDCN1jyBtZJig1rwVRjKALpjVR0D1ABLh9Fx/o5aTTz7271dOXDUR62cqT7AfKIoS
 Becl/Z3nMykkRlKsX6pCUSXHvGnmmYnVwN6ZAG+8rEGhzmEFcK/GQ6xchGoYNc45mTQhIt3pzyr
 MEs3jZdWGODwaTkGR0Hf9KjkN/Ai70J7Kc7wsnqC7xiS+/tPV8J/qGgFAtHWG2Ff+xsKglWv4i/
 spJVZkHcfR30gzrpxK/C2U+Fzytzu3uwpHV44edm0402VbUKHfrBb5gDTC3aUs3l7r9AoGUnMaz
 5wnfuYbFdwth3MThrglsa3QVedhP9+5VWdKmTiJT9BVNxDwcyl88aXqxNWVICvldlCUYNgP+dL1
 p5q0F8XhnmhPVzyeqjA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605140092

On Thu, May 14, 2026 at 04:57:15AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [High] The Venus/Iris driver ignores the `mmcx` power domain, failing to vote for its performance states which will cause MMCX under-voltage and AXI bus hangs at high clock speeds.
> - [Low] The `power-domains` property in the `video-codec` node has 4 items, but the YAML binding `qcom,sm8250-venus.yaml` restricts it to a maximum of 3 items.
> - [Low] The reserved memory node name 'pil_video_region@86700000' uses underscores instead of hyphens.
> --
> 
> commit 436af127f4d0421fee1976f98a2eab9818c98aa4
> Author: Konrad Dybcio <konradybcio@kernel.org>
> 
> arm64: dts: qcom: sc8280xp: Add Iris core
> 
> Add the required nodes to enable Iris core on SC8280XP.
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> [ ... ]
> @@ -691,6 +694,11 @@ reserved-region@85b00000 {
>  			no-map;
>  		};
>  
> > +		pil_video_mem: pil_video_region@86700000 {
> > +			reg = <0 0x86700000 0 0x500000>;
> > +			no-map;
> > +		};
> > +
> 
> This isn't a bug, but device tree conventions expect node names to use hyphens
> instead of underscores. Should pil_video_region@86700000 be renamed to
> pil-video-region@86700000 to avoid dtc W=1 warnings?

Indeed, I'll fix it.

> 
> [ ... ]
> @@ -4181,6 +4189,97 @@ usb_1_dwc3_ss: endpoint {
>  			};
>  		};
>  
> > +		iris: video-codec@aa00000 {
> > +			compatible = "qcom,sc8280xp-iris", "qcom,sm8250-venus";
> > +			reg = <0x0 0x0aa00000 0x0 0x100000>;
> > +			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> [ ... ]
> > +			power-domains = <&videocc MVS0C_GDSC>,
> > +					<&videocc MVS0_GDSC>,
> > +					<&rpmhpd SC8280XP_MX>,
> > +					<&rpmhpd SC8280XP_MMCX>;
> > +			power-domain-names = "venus",
> > +					     "vcodec0",
> > +					     "mx",
> > +					     "mmcx";
> 
> Does the YAML binding for qcom,sm8250-venus support 4 power domains?

This is handled by the series at [1], which is now merged into
media-committers tree (and pending for next).

[1] https://lore.kernel.org/linux-arm-msm/20260209-iris-venus-fix-sm8250-v5-1-0a22365d3585@oss.qualcomm.com/

> 
> Without adding a conditional block for qcom,sc8280xp-iris, won't this fail
> dtbs_check since the fallback schema restricts power-domains to a maximum
> of 3 items (venus, vcodec0, mx)?
> 
> Additionally, since this falls back to qcom,sm8250-venus, will the Venus
> driver properly attach and vote for the mmcx power domain?
> 
> The video codec driver using sm8250 data explicitly defines only mx as the
> OPP power domain. As a result, devm_pm_domain_attach_list() might only
> attach mx and ignore mmcx.
> 
> If mmcx is ignored by the driver, won't it remain permanently at the lowest
> statically configured state? When the codec dynamically scales to higher
> frequencies (e.g., 560MHz) requiring turbo_l1 for mmcx, could this lead to
> hardware under-voltage and AXI bus lockups?

-- 
With best wishes
Dmitry
