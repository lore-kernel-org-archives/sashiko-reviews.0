Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795600701;
	b=zSxNcNe9HuIX8PrTQO8WaeNd3f+scBblYpRk6sD/lrbFJTIFkKjn53U24Lj+oT5P1wxI
	 mXHvSWoM5rX7jt9xbWp7LHXIb9waBnix0b1IirCJ3flx2275lNJ1n3djk/RD8yXyPYHLM
	 Rf5jUReU2zo2y5XN92f5P1RIkyT+Ykv7+lZgAkE1m93pYNBNpkB4FYKC5ttbP/7/J2joV
	 8AlUVoXBUAivbM6zT4n4hSe+H9iE9tfaohU0fMl55CBiGGH0qBLexMhs0b04m/hrv5jDc
	 z1VglSwt5Rd+irhZoVYeQomawMV2xDhI/P8DSSjMRwjRt4p0O/kluURIldhLYrO5j+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795600701;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=sgyVdXWHLy/VaK6Nz1G82ifQVYoUNMdhodHec1iy7m4=;
	b=jdqIyvRElY+xDFXt8ZaTck24BZ9fW6vLzFUkGv59ee1gXcWDkVDU5u+9+0glRRewpVHO
	 S5+JfC7FaGW9cq8FkcoZcaN+RzBFTmJa0xexBmLOuE2Lndx5e5wDjO9h7kW9mZTyYGlJc
	 5wz7N+9z8hGKTMiSPp1/dE4XylclKsErxAwcnhQccZIagS2htiOqG89mQNF1qSOcndEnG
	 fKTgItwyDhCcP9GpS3tpTf+UVINFa+ApXgMg7BazCGV1X2EIizglY8uTVM8TMC7uab0SC
	 xMjn1CgOl6RsvN4+gfW0eGGP9Ro60aI8WBh3igDABXWQMQPAEzdwT+fdbQ0hBYVGY8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e5RYolC3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZjkJ1BTp;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8234B606A321
	for <sashiko-reviews@lists.linux.dev>; Wed, 25 Nov 2026 09:58:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8234B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e5RYolC3;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZjkJ1BTp
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mBWr3763913
	for <sashiko-reviews@lists.linux.dev>; Wed, 25 Nov 2026 09:58:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sgyVdXWHLy/VaK6Nz1G82ifQVYoUNMdhodHec1iy7m4=; b=e5RYolC3pB6Usbq2
	NArehm3NoaeHNknyv789flqC/pn1zW7gD3S1kSBxJHoznDVry8z4SARtLqwzVAVC
	wR1MpIKm9AC/K+ZHQRq24HPMmct7MKfVBptr0zlXEJfJKw29IY74VEIVpINBVj4u
	U82T+B8N7zt5q8/mD1rKYNimTYNJW7/63kvH1DcgKUOIVetTE4trte/VLkEiJwuA
	NQCVu5doHt+ksFn62bQ3uevaPjg0Ee5qxQZ0srkXAXpLicjeOUmiu92BuwO5T0Ir
	d4hUcCOnq4BAs9lz4prQ/2hn4SXvyJo00VvkHROBfObgPHjf0WwzAK+4NapNoyms
	QHufrw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vv2r78w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 25 Nov 2026 09:58:19 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2f069d0d27aso6501975ad.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 25 Nov 2026 01:58:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795600698; x=1796205498; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sgyVdXWHLy/VaK6Nz1G82ifQVYoUNMdhodHec1iy7m4=;
        b=ZjkJ1BTpGdk2TINMQKUduztQl6Jl8/VhmISe70ypk0++N8KTBKSvXfTlwREBbqGHKT
         iZ9+lLE6pS4VGInb0Kw4aTGuuAjWFfMTgaB//6s5XYhZoD1ycl6HtQkM87k2laCO+cKz
         35eA4CKgePfceddTQVTGaDBzZLoOPg76NlBMPKfmp1GPBa4Kq7DBVI0rGTUcjmLqx6xS
         pibhRDDUjvioOhbyrQOk9n50yT9gnOyA1W7TutaD4mPsp9Rwy1ALlqkxfx0POIXfYGTS
         q+SokQ9ceSM1vAuIgRh8ds6ZOLfW4/tGjt/KQSE9KrLova088qlIdYo7WR2cEt5X5AJy
         XQrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795600698; x=1796205498;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sgyVdXWHLy/VaK6Nz1G82ifQVYoUNMdhodHec1iy7m4=;
        b=sEHEWJAO2vXE8/+hGoFGz2VUxkbXUoUUMSPr1IBtK6RxXX2JFTVdDgF3mlkg9HU+Vk
         kESYOA8cvMzrzT16VsaZ613MiDppfegLQJ3nd47I6E+4ZwrUwRUtg6LD1AnIndVNHOxm
         MmSgWf5myisxzxDz0+PX9lUCjRXbp4VIHAmqTGniL1yCNN5McWpKxjESpf0CXZAuIir+
         X/icK2iM18/6CvC78/RPbwYQfp3Q7pyP5UK3pgH5t+zSuhxCY+EOyG+WbzgcY9f3wLJv
         bbLVPzpKDpy2hzC6bk5kvBWe6mStv7WS25IJBPoqd/fxlh4Ukq7VAiZ0gKBy554GolLf
         AJKw==
X-Gm-Message-State: APuU4Z83yV3gnJ8FFfqTcCW/6PS+sF5WF0aJaErrSnDoC0P0DD2nxjU6
	gb2dtc4h72E6HjbGdUb0kFRNr6dQCnmDWBiNkSj2aBkqgDhh3fYIACaL31k2XmSc5te9i5HnjEg
	Ku9maXP4wgpx63WS/op/l8IEy5HZutRDef13IDAC8oQ1lWbRY4gMJwtCFHKiVabmfqsHtn7qmF9
	/9IOo=
X-Gm-Gg: AZFdTZcxd2fwvUh+Mwc/gnJTuZHS6CDnjfy+53KsKgPIo4ORa5tzVwPR6C+fwrfmHAQ
	89ydY4IbyOhD9rXGFu1jX0n4MEph8SvtcziBEPubalfB+d0tlckBBrCrqUs7qRGVwPPk7dhJjw5
	G1wy2/QFThH9dNK7PZYQ881Ldz328KGI1grLxCD5PVgEBGgRmlMSJrOAya6LhcLIAhCK5fKGjL+
	CdqqC+GjpUIIWC8tzgacmrAkgRGBE1G7y4DHK9iZ/JvypVvJUTYKoZ07wtN1T9r3EyzqirHDjtH
	G/TCOA9NCDyrOGZZS4dWw4YbqC896Pc9s54baMxjcGVkOq/tm3LcNB4Mqj0ndrJPA8MaAip2cWJ
	LGD8kd+24tPrJUt1mQfgRCBeAlONFzueSa/J11eAsNNIkxr1juASWz9UwCoAZpSTUhue/QiU+/D
	GMkkT/vHjTSHwg3Z/iZT4nQXTAtFAZn3AqkuIbcoHsEsvhErTKza0VNxxminmZ0gWBNYoC3XRid
	F4Afm+f4rURMge+/uuXcp+XbFKt
X-Received: by 2002:a17:90b:3903:b0:3b5:a3:4435 with SMTP id 98e67ed59e1d1-3b500a3466cmr548244a91.6.1795600698352;
        Wed, 25 Nov 2026 01:58:18 -0800 (PST)
X-Received: by 2002:a17:90b:3903:b0:3b5:a3:4435 with SMTP id 98e67ed59e1d1-3b500a3466cmr548218a91.6.1795600697845;
        Wed, 25 Nov 2026 01:58:17 -0800 (PST)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ffa98esm29689157a91.17.2026.11.25.01.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 01:58:17 -0800 (PST)
Date: Wed, 25 Nov 2026 15:28:13 +0530
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: monaco-arduino-monza: Add Waveshare 8"
 DSI touch overlay
Message-ID: <awaxNbLxXBjaJWyc@hu-vishsain-blr.qualcomm.com>
References: <20261114-monza_waveshare_dtso-v1-1-4b7c80e90e08@oss.qualcomm.com>
 <sashiko-outbox-213671@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-213671@kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzOCBTYWx0ZWRfXzytmXPhINj8I
 70a4azzW3o8iU8UysuOUVkfBAtENiJQ1YeHUdFuwgfvn+799HeDNLs4FuSxzPtTVuL7D2K+oVWJ
 wvl09mZCWH5f72/iYIMVj6WWY3au3cU=
X-Proofpoint-GUID: OUhGJZDZI5MNoav6cgQlCcwHE0-T3Kct
X-Proofpoint-ORIG-GUID: OUhGJZDZI5MNoav6cgQlCcwHE0-T3Kct
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzOCBTYWx0ZWRfXxqtN4+hL4urA
 0fxhRrMRg6YhiI4ooL8V/3Vf8QEgZX0Uc5R4H1VbDZz5ACo2Zlsf4U/nUcBqBQM8kZ5/RobllhN
 iz78PlieY1OPq5coAwf69CRmcf4wLZ/lpbg7yLrwWWfUtlmkebGszx6N4yu3fDJjAyZwz+lOcVN
 cMQzUZlFfrjlELnmkkIGvB8RveTM4k27SPZ4DVdq/u/UBFxxCPNtx5j6AgQJ6CKF6YiJ5WXRWff
 8lWbI3X/Na2+Ri7FBcmOWcL7yE9LgqS0GrJL7t1Rf2Roo7wAqv6z8Hp3MuSNpFy4BMGMMFUc00Z
 7Vi+ALWEDQNxxYk+Th3ZJml8bphUQnadVqJn3C3IAcH3xXYbxpIMvuOoXifZ6PsIgRLCfLX76z0
 01rewBVZXW0HD8BKDaci9U3RzbaG6mHpETG8vjdsyf1Bj10FE5OCFKwTV1PhmWoWmQKKfOA+tBs
 ptL8Mw5uO+jVigXHphQ==
X-Authority-Analysis: v=2.4 cv=A/z5rKWG c=1 sm=1 tr=0 ts=6b06b13b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=8nJEP1OIZ-IA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=5ZI3I9StS4G_EHnV4-kA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611250038

On Fri, Nov 13, 2026 at 08:42:10PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [High] arm64: dts: qcom: monaco-arduino-monza-waveshare: wrong
>   mdss_dsi0 vdda-supply
> - [High] arm64: dts: qcom: Makefile: monaco-el2.dtbo applied to non-EL2
>   Waveshare DTB
> --
> 
> commit b8a3c8f8c7e536ea10afaadd72a3ac9f01d55e3c
> Author: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> 
> arm64: dts: qcom: monaco-arduino-monza: Add Waveshare 8" DSI touch overlay
> 
> This commit adds a device tree overlay for the Waveshare 8" DSI TOUCH-A
> panel and touch controller on the Arduino Monza board, disabling the
> shared DSI0 HDMI bridge path when applied.
> 
> > diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> > index 8329c06b60a3f..faa0e0f7b867f 100644
> > --- a/arch/arm64/boot/dts/qcom/Makefile
> > +++ b/arch/arm64/boot/dts/qcom/Makefile
> > @@ -83,6 +83,11 @@ dtb-$(CONFIG_ARCH_QCOM)	+= monaco-arduino-monza.dtb
> >  monaco-arduino-monza-el2-dtbs	:= monaco-arduino-monza.dtb monaco-el2.dtbo
> >  
> >  dtb-$(CONFIG_ARCH_QCOM)	+= monaco-arduino-monza-el2.dtb
> > +
> > +monaco-arduino-monza-waveshare-8-dsi-touch-a-dtbs	:= monaco-arduino-monza.dtb monaco-el2.dtbo monaco-arduino-monza-waveshare-8-dsi-touch-a.dtbo
> 
> [Severity: High]
> Should monaco-arduino-monza-waveshare-8-dsi-touch-a-dtbs omit
> monaco-el2.dtbo?  Including monaco-el2.dtbo in the non-EL2 target disables
> gpu_zap_shader and iris, and attaches EL2-only apps_smmu IOMMU mappings to
> remoteproc_adsp, remoteproc_cdsp, and remoteproc_gpdsp when booting in the
> default EL1 mode under Gunyah.
No, this is not a problem monaco-el2.dtbo is also a default configuration, Panel is verified without monaco-el2.dtbo  as well. 
> > diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza-waveshare-8-dsi-touch-a.dtso b/arch/arm64/boot/dts/qcom/monaco-arduino-monza-waveshare-8-dsi-touch-a.dtso
> > new file mode 100644
> > index 0000000000000..003c5bcea4973
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza-waveshare-8-dsi-touch-a.dtso
> 
> [ ... ]
> 
> > +&mdss_dsi0 {
> > +	#address-cells = <1>;
> > +	#size-cells = <0>;
> > +	vdda-supply = <&vreg_l1c>;
> > +
> > +	panel@0 {
> > +		compatible = "waveshare,8.0-dsi-touch-a", "jadard,jd9365da-h3";
> > +		reg = <0>;
> > +		backlight = <&wsgpio>;
> > +		reset-gpios = <&wsgpio 1 GPIO_ACTIVE_LOW>;
> > +		vccio-supply = <&panel_iovcc>;
> > +		vdd-supply = <&panel_avdd>;
> > +
> > +		port {
> > +			panel_in: endpoint {
> > +				remote-endpoint = <&mdss_dsi0_out>;
> > +			};
> > +		};
> > +	};
> > +};
> > +
> > +&mdss_dsi0_out {
> > +	data-lanes = <0 1 2 3>;
> > +	remote-endpoint = <&panel_in>;
> > +};
> > +
> > +&mdss_dsi0_phy {
> > +	vdds-supply = <&vreg_l4a>;
> > +};
> 
> [Severity: High]
> Does setting vdda-supply = <&vreg_l1c> on mdss_dsi0 overwrite the SoM's
> 1.2V DSI supply with the LPDDR VDDQ regulator?
> 
> In arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi, mdss_dsi0 already uses
> vreg_l5a (1.2V), while vreg_l1c is the 0.3V-0.512V LPDDR VDDQ rail:
> 
> arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi:
> 		vreg_l1c: ldo1 { /* LPDDR VDDQ */
> 			regulator-name = "vreg_l1c";
> 			regulator-min-microvolt = <300000>;
> 			regulator-max-microvolt = <512000>;
>     ...
> &mdss_dsi0 {
> 	vdda-supply = <&vreg_l5a>;
> };
> 
> &mdss_dsi0_phy {
> 	vdds-supply = <&vreg_l4a>;
> };
> 
> Overriding vdda-supply with vreg_l1c leaves vreg_l5a unvoted and causes
> the DSI driver to disable the LPDDR VDDQ regulator on display suspend or
> probe unwind.  Both vdda-supply on mdss_dsi0 and the redundant
> mdss_dsi0_phy node can be dropped from the overlay since
> monaco-monza-som.dtsi already configures them.
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261114-monza_waveshare_dtso-v1-1-4b7c80e90e08@oss.qualcomm.com?part=1
