Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6EB6225403
	for <sashiko-reviews@lists.linux.dev>; Sat,  6 Jun 2026 12:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780747374; cv=none; b=YwNgw0gd3YjDyBmw1WPzAVo/LbUFnlPTY4sP1OJ0vmtjXO0VMLyQpWe9yNPmoxb3sQZSicI+gmAy157rqefy7bdNewSgo10Gp//L4D8K/S/8JsiKi6LarhkRQk9oLdaWIdirUjbSKnrWueu4ydrbcG5aEBLIzbVrq50YC9iHPzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780747374; c=relaxed/simple;
	bh=oWWpN1zxiu5J8Y/bTtJzFgyjG5a1WOJRqB9bJO2rILw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M1iTaEDBAulR9nBA6sUL+2z1Z8nCNCxDdInBhonQ+xwIdOSgGOvV0KX6Ul3hu+41akK6cGNQCRywAdGKNVaxNzKTXVkcuJwpd4J2y3xVpa1VurD2VqYYZNg7JMeQkOCVbmBeLkZcEwDrkO5IJDra4X4bjFTiWN9q9OpytuhgpYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YoOai+79; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jAIqLf9e; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YoOai+79";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jAIqLf9e"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 656BHv7Y1252232
	for <sashiko-reviews@lists.linux.dev>; Sat, 6 Jun 2026 12:02:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HTLkryQUOY6UVfWCdPn3v73k
	EhjUV/6i8u7yum0ea7U=; b=YoOai+79/7ZSq6TWz/5Rd7v6nvjo4TWPR6UQZOaS
	oiXhuNUdPtgRA69dJY8H1rL+ESQPamWpIJVZe3g2ySq5RHcD6Wb87ZjoPW67vFdW
	Dc6who/MyzQgsxm5ys7/zdSjaNI+/nzUK6TQD7A7PSnG1JBP/4kksUX8Cu8Q4rdP
	tmIURpOtMz1203p2nKqNm5cVNTgYbSNdJeW4lHgbA+R+Oz50E8s6GaZ7a2TCUf2/
	kRjq9JoQtVaK6jOsHK2cdghLjEt+n5fCEI7hwF4BHdtJxr/PDkqUgx7kzmNcykSq
	ndNeZJDL8bbpNDOBPyr5mY+DTE8NKvHcH8rx5XjdooRRXw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emavf16fs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Sat, 06 Jun 2026 12:02:51 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6c4335eef08so2971732137.0
        for <sashiko-reviews@lists.linux.dev>; Sat, 06 Jun 2026 05:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780747371; x=1781352171; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HTLkryQUOY6UVfWCdPn3v73kEhjUV/6i8u7yum0ea7U=;
        b=jAIqLf9eV4uGfUh5nMQP4tEg+JzAxB3iqa7zwXkyu5WUcIVmawRZnlW18LmGMmNrP+
         p3PgXSEnXrQd6q/4cF8xJBAA6+Dxz4XeXJcXWl94i/gTu/mzWJIy9eBOOT9FjQAn46tv
         D0N/U4y7a/GYKxiUt+eRk6j4j/5UNmcCHT9mN01arg4TssVcK5zUHV4JQeH8aFr5jg5r
         RuYLWJkxNaOE/4xi9npmridKEd/nOZEIKS1U4oJ7aAXYs8DVxxOxS02HlTQiO1vhdu/L
         6pmgb9yMBB//WN85B2n623llIyyQM28hyJPwNoRMWZ/rhXckFraeUUQG6y1GVNxlyyXC
         KeBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780747371; x=1781352171;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HTLkryQUOY6UVfWCdPn3v73kEhjUV/6i8u7yum0ea7U=;
        b=UIeqdPbLhaYENWdPE+Ai0DHcSusUMzriQe3sVkTqNSk0CQBp9ii50YWHkkyplamkx1
         CHw0kh5j5MOPdzte4Fd8RjvAvmqO0mEfzv45INa7JGAg+RU4BFlXZZyQcFpCSqxWTaaa
         03lzc4onV6o8uEK/OSUNKB4Nx+Ttm3h1BJBLhOABGcPS64b5TlNj/8jOGXxrq80WFPiX
         rNk6hcTMRhNX9ZLaS6y34/I3iDwgpKg2E/6QBUlXbzdv1xkP55Z3wSWd55/kroAKNAUn
         JVu29JDhVcfu6LDoqk1ZlKYudSgMYXP8iFBbHgVx7CNpFSK3Q0ApteemsQ6w6Rok4lQP
         cc1w==
X-Gm-Message-State: AOJu0Yx62gpilUg5+hUO9+2RGadvTHNyUb62pTYV1jWE47YjB1+B/iS1
	h/HK2FNBV4srxWoqXPlRyOjg7l+2AmVedLCSXqq+wte/l/ndH1OXI0VbdTiM1fgTlFwnG9wb7fa
	NPA2gyeZNFLgJQtgRd9vmS3ErT6+Nu+UJj1ksEAF2NNa6TDs1jFRgGxBvzcutnJcn94fc1vVWk1
	gf5ks=
X-Gm-Gg: Acq92OFU82lvfuQow/8wuXhCI+Fy7IZJliFrp393cElvl1GSGqNHB4GYrGiz26C04J/
	Zql+9plH/KjsSG026Q0m0joGwWCf36rzYxJ+JFzk1BGFd6T/aaXHyAqc7VYeC4XIvjsck92iYUE
	unnRnXYw8SRNwmfKY/dmrpV8CAXrF1rOMrqLz42amBqli4BSaDlHR/b8W1ieeyGOhozDjBGneoH
	WkfnbzwnJchSWHzoCGIn2oZygqWuAtE80QUBbse7nmnbqnyYfTSdh92IKIyZrFHOiuyhkOFufvt
	PeY/rrqHs+RppzcsU1KSDrT3onAQbl79h7eDv+1p9hkxGybxxuIiKAl1wczD+zGAwA+4PwTK+qK
	I1q89s+Lnx7V4wN3SLhiBdgLa31N1Fm8gcocXYcAxVUnFX2PTTmVnFMJttQq+J/hNGDcsrucR6q
	VX/8kZSrXkItahrzniFTiEMTAT0FpOxbVDpT52YVOg+qyTPQ==
X-Received: by 2002:a05:6102:5cc2:b0:631:2973:5c2c with SMTP id ada2fe7eead31-6ff0a27a19cmr4452022137.21.1780747370815;
        Sat, 06 Jun 2026 05:02:50 -0700 (PDT)
X-Received: by 2002:a05:6102:5cc2:b0:631:2973:5c2c with SMTP id ada2fe7eead31-6ff0a27a19cmr4451973137.21.1780747370417;
        Sat, 06 Jun 2026 05:02:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac302983sm31038251fa.42.2026.06.06.05.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 05:02:48 -0700 (PDT)
Date: Sat, 6 Jun 2026 15:02:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: David Wales via B4 Relay <devnull+daviewales.disroot.org@kernel.org>,
        devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
Subject: Re: [PATCH v4 2/2] ARM: dts: qcom: Support Motorola Moto G2 (2014)
Message-ID: <q5asqrk64isjfoei7vyfg4esiibxws7x6gffsutqh7tcfqgwn6@6pv2zqx4ppse>
References: <20260605-device-motorola-titan-mainline-v4-2-08a7be31f05c@disroot.org>
 <20260605133245.BD3661F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260605133245.BD3661F00893@smtp.kernel.org>
X-Authority-Analysis: v=2.4 cv=I4JVgtgg c=1 sm=1 tr=0 ts=6a240c6b cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=OQN141zOAAAA:20
 a=VwQbUJbxAAAA:8 a=LpNgXrTXAAAA:8 a=EUspDBNiAAAA:8 a=tNN4VXHrT0xOU5zs9-sA:9
 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22 a=LqOpv0_-CX5VL_7kjZO3:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: X7bakRFBiQMsc7pFdFWuvMVb0b8fB98f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA2MDExOSBTYWx0ZWRfXwmwCk+zi+SP5
 Oti2q1iVGKWVKNFG1f2ZMxm/fgMS2Jz+2OvSA2NQEK3kxCv7YDPUDIixhGercwCZqnq+9qfhlgs
 5sfWfu0EZynDOdgSHwZJIMWxaQxrDt/VRryeVuM4P8W3VJ4Xx9BPN4tV2qyW3lYlQwhOAdkhe6g
 R3uBC2CWU3NusSn+KJUxhQaehp9nN2dfRxidZyN8cWbjLREMXuEpbK/w4qh3nH2tV/LzmAWHN56
 Fnt/5go0P31r2Z3nYx9qOLyDesTP6uaBf/w6z+KCmkwLCO6cVQ5cK5M3x/JQp0tJ+pBxpzBN77k
 Q03DwvLsZZyUU5DBTQ3GcfI8HT9T3CzlEwcgX6nUcGEp7EeiL7xbpKAAi/UMbL+DrL4/rrZn9dF
 1y+/3xlCblYCCg0vfCcu2JRN0vTCsGHIh5Kq+6UgsrZ8Nh8CB6q3XdkEhw2i0h5bXyjlZvuYptU
 vviEfrfeV878JLFQkDg==
X-Proofpoint-GUID: X7bakRFBiQMsc7pFdFWuvMVb0b8fB98f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-06_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606060119

On Fri, Jun 05, 2026 at 01:32:45PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] The fixed regulator `vddio_disp_vreg` is missing its `vin-supply` link to `pm8226_l8`, which will cause the display VDDIO to be unpowered after boot.
> --
> 
> commit 70499333aacadd0ef2c646a655f7350a4c0e3f57
> Author: David Wales <daviewales@disroot.org>
> ARM: dts: qcom: Support Motorola Moto G2 (2014)
> 
> This commit adds the initial device tree for the Motorola Moto G2 (2014)
> smartphone based on the Qualcomm MSM8226 SoC. It adds support for buttons,
> eMMC, a Hall Effect Sensor, simple framebuffer display, and a vibrator.
> 
> Link: https://github.com/LineageOS/android_kernel_motorola_msm8226/blob/cm-14.1/Documentation/devicetree/bindings/misc/hob_ram.txt
> 
> > diff --git a/arch/arm/boot/dts/qcom/msm8226-motorola-titan.dts b/arch/arm/boot/dts/qcom/msm8226-motorola-titan.dts
> > new file mode 100644
> > index 0000000000000..1609fb21c5448
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/qcom/msm8226-motorola-titan.dts
> 
> [ ... ]
> 
> > +	vddio_disp_vreg: regulator-vddio-disp {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "vddio_disp";
> > +
> > +		gpio = <&tlmm 10 GPIO_ACTIVE_HIGH>;
> > +		startup-delay-us = <300>;
> > +		enable-active-high;
> > +		regulator-boot-on;
> > +	};
> 
> [Severity: High]
> Will this regulator fail to supply power if its upstream source is turned
> off?
> 
> This fixed regulator controls the display VDDIO power via a GPIO, but it
> seems to be missing its vin-supply link to pm8226_l8. Without the
> vin-supply property, the regulator core is unaware of the parent-child
> dependency, so enabling vddio_disp_vreg won't automatically enable
> pm8226_l8.

I guess Sashiko is too creative (or too susceptible to c&p errors). Only
two platforms use L8 as display input, so I assume there is no reason to
believe it's true for all of them.


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>




-- 
With best wishes
Dmitry
