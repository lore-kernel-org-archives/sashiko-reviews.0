Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792738443;
	b=fFx0QY4Vew4Toyyky0oeEHlTp1FS1ylmuP7PKHUAChRwun8vV+Zayw4eyR3+6pPLgdV0
	 L+ZMnWWAYFjNY3stuqNMSNWqv6AUVl3MW9u3vCXMsbCw+9KwW4x8mV1wy0Fq2yGVDMQU5
	 a+AD9i9MreeOrNjNUcS6ECI7qd7PxSHMTtthWJ/GkneHXXM9ERiHWpJwMY+T3/T5+RjPh
	 lD8qe/4R6zATYb1lLmPYVfre+tmOhn7SP1gtZanfw6t1E6jyMtarJw3b26CbcaEtbgG0j
	 p21noyDtG2uFe6RghfbtFWopfrTu/ggrXE1p8keUaeHB0n0+FweDCnIBzQgtQEvoWyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792738443;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3Q2dtfzQyTjGkp8598J/kIBhAU4uYfQdL/HvTo54IlA=;
	b=Ya08sVsKI2YTAoOxNVM8B0UIJv4ifBo1ILL0kPLMJ0PYwFVXNHSI0fJFC6rLQF8RAyzL
	 3av4fXp5KDCJ8/t3CucAHEruDFySlPKSfijO1pYkcuftiDAbMMcA4DxrP3Eo8AIsihC1k
	 T0SDEQeQhOj8/CBA8CSsb8mNv7WTFU/sLbuDTOrDLC2O5K3oumg5RFcn1R4oCOlU6Qr2p
	 iwuOVzryQi74padmAlk53G68FMyD4/jyQBXTtxHTioP1L6jxHEet2crtlsKt5HT8QDJFt
	 RqV1+l+yyGJFV7oPbenDFu1QBHb+i4TBU2XgShk4MPHBT/qy7LixuIx7x2h0nFxB3lA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f2HaWnm+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z69u767D;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E662A606A320
	for <sashiko-reviews@lists.linux.dev>; Fri, 23 Oct 2026 06:54:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E662A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f2HaWnm+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z69u767D
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N1FREE1318234
	for <sashiko-reviews@lists.linux.dev>; Fri, 23 Oct 2026 06:54:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3Q2dtfzQyTjGkp8598J/kIBhAU4uYfQdL/HvTo54IlA=; b=f2HaWnm+6OV8lVzx
	flukcxKDHVfz+kwCv2rNkT1mhVsKv/X+UBccQqFKC0UPH5ZRDidI5FG2yVaLUOKY
	ije9f6NoN6KGwfp9XB3m4M5VJvKTu37jPt6tgwG3kTcW7cR29quR7teBLThygOAI
	qmTXNNZHeQz5bQT14WlsFTInkMFgYPFkfP5ycNYIGn/bQZ/0COoWbgQyOTlV8o0u
	umCqh/l9oP5Z84btCWw1ZPU3M11bhl8zvxnLQKv+S7EsLBIbbV/RdLGTiPS9qjL+
	paC1P5Wtc+hpZpCDg7E7Np3LHQf+Z/lT90EmYvU66BpeC5c9w8+uY9sVIbyTLMOf
	Z+LZwg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hftyg9hr9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Fri, 23 Oct 2026 06:54:01 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e969b16118so1059075ad.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 22 Oct 2026 23:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792738441; x=1793343241; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3Q2dtfzQyTjGkp8598J/kIBhAU4uYfQdL/HvTo54IlA=;
        b=Z69u767DigCeX4BpFc5aHeTMEZK48nc4WyMw/+Yj4Y/Y1r6OwRcVC0WNC49lYBsKB0
         j0zsyld+DbyHAgAmNkykOgnN/CsjbEtzv/9fWLHKlzC9rzGwY4GzCk6mtJDuRVhY2vx6
         TnDasnSPlmVKdg4LamPJJNOmUJ8mgCDxADK4DJywkpCtI/AuIgROPwM7cohZ6biqYrRB
         soZrXrbT9B2NO99TqFnZsBRFgQVI0+iR98xHL0kpLcvc6tpuFWq3Q298hvPV0NjOcG1j
         uaO++z0gbqiNhGiMo2eBveCg0nH7n8w1ov9Xdj2vPZkEPdbhtdduQRoh+L+eck9XRZ4g
         UjzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792738441; x=1793343241;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3Q2dtfzQyTjGkp8598J/kIBhAU4uYfQdL/HvTo54IlA=;
        b=cXQM8SILdlN5zHMW0rUMDJzNJ+4XIsI2Dz5NVi3Vmg2opT1RJEHkGZ+qrcUq7JUBtN
         3OzB1PwWvibWCAGbDYsz19YawqU7N7i5hbm1NrBnk9E6jQnZE2dAswz218KTg/q1mrOR
         iz+Vp4B+f1ro7OfH+vxh/4sy3BIY5BDwEpBVUiiJU/mE5oGvT0SKuG42IUyvE11/NaU9
         YJywi5IuDczAHR9k8cRbcjhxLe34qvC2hwF4MrmuMZKJMDYpB33CXHZMHkEW2IIMtJs5
         8iDRmWccT+Wf9dqmEfrfMzfzOofqjDD1mPJPAoDSGNjm2dskCz0IIjPIfSh00ftX4ZAY
         uGCQ==
X-Gm-Message-State: AFq9FYJztP4K/086UqGUX12QgduJxvlm54t/eSVLe2bJHZJRFXfrR+WY
	8FIEQ4sK54STljAG3c03hgrnchP9FKhLMM3/zRuvw3FrMH2KUdc5pABiYnJ+I9ByXtCpA6e06kB
	Qc6hPEH+y0mbgXhOeKwGJv4rB3MTJg4FQGXx9ubFXyjSnJe6TorMpi+BilCgtPOncS6Q8ZmoWxm
	0rwqU=
X-Gm-Gg: AYBFou25ZNbYCjIxMkLJbYlvGh1ICRZ9ua3aGAitZykqi/AcwtNPT9sZurUa4ejuXQV
	ym+V+okBzORaeTqRBMKJLo9WXUIvPCrhAROi2xbS67eCXBXHK1Y/cd0/r/8y+XyeHpvfQp50sli
	QV916+Q++WFCqK8hqVvyYtLZu0Px1DKu9ytmhb1O+HJvPEllGuBIc8MbRAD5yOBDile4MTZQHlX
	zyJCGfwn1dQntJOkysVg04gwYsVFIGmgML/ABhvxAhcrIWplE/o8H4pr083fyB7tvvjXhCNBwfq
	b1iwDUo43pu/SWR6h6QwttoFfV/2p9ya2z9Takflzxb7Tcr7vSFV8PZrNGnRMjvPUD8g7ieTXx8
	nWvNUOVuhmJdY4Qx/G9wAsrRebtBnIfjP54zhBzPnlWHtIMj874Yi+7DFmzM/jihYhbCU0aS6o1
	CkReJcyWq7LanIKYhrdfdwlV2zZiIKfRNJpFuuArr8PWE0dRa2evA6
X-Received: by 2002:a17:903:b48:b0:2e9:5714:607a with SMTP id d9443c01a7336-2ea7cf5c25bmr25816455ad.2.1792738440583;
        Thu, 22 Oct 2026 23:54:00 -0700 (PDT)
X-Received: by 2002:a17:903:b48:b0:2e9:5714:607a with SMTP id d9443c01a7336-2ea7cf5c25bmr25816165ad.2.1792738440093;
        Thu, 22 Oct 2026 23:54:00 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea7b345e74sm6228205ad.24.2026.10.22.23.53.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 23:53:59 -0700 (PDT)
Date: Fri, 23 Oct 2026 12:23:55 +0530
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH 3/7] arm64: dts: qcom: shikra-iqs-evk: Add AUO G133HAN01
 LVDS panel overlay
Message-ID: <atsEg7t9SqAdMSZi@hu-vishsain-blr.qualcomm.com>
References: <20261021-shikra_display_overlays-v1-0-adaea735999f@oss.qualcomm.com>
 <20261021-shikra_display_overlays-v1-3-adaea735999f@oss.qualcomm.com>
 <sashiko-outbox-180380@kernel.org>
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
In-Reply-To: <sashiko-outbox-180380@kernel.org>
X-Authority-Analysis: v=2.4 cv=cZpHPXDM c=1 sm=1 tr=0 ts=6adb0489 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=8nJEP1OIZ-IA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=iikEsoYwSVwlKyaL4B8A:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAyNyBTYWx0ZWRfX9L7LhfvYBTvw
 NhOGl65g34kc3cY9+xb5b7+JO3bZSzCRAewyIDmIEa113Rie4TaK2VggEkNF4ynv3tD+CFl/uRJ
 Ne5WGZ4ADZe23mMtJop0rWKblMe1Rts=
X-Proofpoint-GUID: MQGbexfC5BNCcl96RpVpeBxJhrWoHP7F
X-Proofpoint-ORIG-GUID: MQGbexfC5BNCcl96RpVpeBxJhrWoHP7F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAyNyBTYWx0ZWRfX+YnDhqNbKWzi
 9/XBKWLAfFNbe+Zf+U6P3D2wnQroT7WoBh+Jo3Md1UikwrTR4e44sTZY8nFPW2gQHOglWXHBfWg
 yba5dsfu0bGQgLQWGhSkk6jGjLdgHVQGZ7zSNoLq0YxBpqMt/e1JaPkRckCJG5BqofWaVSX9xuW
 F3RqZqgkYsE2/amceRHFwfueBr4GlAaM4VB2m2ONRCYQJ1n9aqlwtQbywlGN9pEUO2802Psrdg1
 BqEqvjg5GkjdhSf9K4o4MePIaXwQk17RQ9fukHNFrO9XHq6F3AA/duOaYyj4jmpOgxenrL+BVFQ
 4Hi4+B0lkY7g0bskMlvFc+/AbsJ2t/uz66NO9bPv+zPK7t2gJnsRqwWgw6o80kVigxHYd7BVE5q
 LOGB1gLCscHkBKTSLn4eZ5f9Zry7b1Cl2FtSRiK1tsKfx2FnimY316DhbUCbsEx3T0V3Cz1Vxx4
 jRg0efPMnALUmBXLyHA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 clxscore=1011 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230027

On Wed, Oct 21, 2026 at 02:33:23PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] arm64: dts: qcom: missing status okay on i2c3 node in lvds overlay
> - [Medium] arm64: dts: qcom: missing backlight property in panel-lvds node
> --
> 
> commit b4b78d829d507a91f08f278892b57ecc12f421d2
> Author: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
> 
> arm64: dts: qcom: shikra-iqs-evk: Add AUO G133HAN01 LVDS panel overlay
> 
> This commit adds a device tree overlay for shikra-iqs-evk to support the
> auo,g133han01 panel connected through a ti,sn65dsi84 bridge on i2c3, while
> disabling the default hdmi bridge and connector.
> 
> > diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk-lvds-auo,g133han01.dtso b/arch/arm64/boot/dts/qcom/shikra-iqs-evk-lvds-auo,g133han01.dtso
> > new file mode 100644
> > index 0000000000000..80b9dcc920612
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk-lvds-auo,g133han01.dtso
> > @@ -0,0 +1,127 @@
> 
> [ ... ]
> 
> > +&{/} {
> > +	backlight {
> > +		compatible = "gpio-backlight";
> > +		gpios = <&pm8150_gpios 1 GPIO_ACTIVE_HIGH>;
> > +		default-on;
> > +		pinctrl-0 = <&backlight_pwm>;
> > +		pinctrl-names = "default";
> > +	};
> > +
> > +	panel-lvds {
> > +		compatible = "auo,g133han01";
> > +		power-supply = <&vreg_lvds_3p3>;
> 
> [Severity: Medium]
> In arch/arm64/boot/dts/qcom/shikra-iqs-evk-lvds-auo,g133han01.dtso, the
> backlight node is defined without a phandle label, and panel-lvds does not
> have a backlight property referencing it.
> 
> When panel_simple_probe() in drivers/gpu/drm/panel/panel-simple.c probes
> auo,g133han01, it looks up the panel backlight via drm_panel_of_backlight():
> 
> 	err = drm_panel_of_backlight(&panel->base);
> 	if (err) {
> 		dev_err_probe(dev, err, "Could not find backlight\n");
> 		goto disable_pm_runtime;
> 	}
> 
> Because the backlight property is missing on panel-lvds,
> panel->base.backlight remains unset, so drm_panel_enable() and
> drm_panel_disable() will not control the gpio-backlight device during
> display blanking or system suspend and resume.
> 
> Should the backlight node be given a label and referenced from panel-lvds
> with backlight = <&backlight>;?
Yes, the panel is functional without the backlight reference because the gpio-backlight device is enabled independently.
I will add the label and backlight property so that it follows DRM panel enable/disable lifecycle. 
> [ ... ]
> 
> > +&i2c3 {
> > +	#address-cells = <1>;
> > +	#size-cells = <0>;
> > +
> > +	bridge@2c {
> > +		compatible = "ti,sn65dsi84";
> > +		reg = <0x2c>;
> 
> [Severity: High]
> In arch/arm64/boot/dts/qcom/shikra.dtsi, i2c3 is disabled by default:
> 
> 	i2c3: i2c@4a8c000 {
> 		compatible = "qcom,geni-i2c";
> 		...
> 		status = "disabled";
> 	};
> 
> Neither shikra-iqs-som.dtsi, shikra-evk.dtsi, nor shikra-iqs-evk.dts
> enables i2c3. In
> arch/arm64/boot/dts/qcom/shikra-iqs-evk-lvds-auo,g133han01.dtso, &i2c3
> populates the bridge@2c child node and &mdss_dsi0_out is redirected to
> &sn65dsi84_in, but &i2c3 does not set status = "okay";.
> 
> When this overlay is applied, i2c3 stays disabled, the ti,sn65dsi84 bridge
> at bridge@2c is never instantiated, and
> msm_dsi_modeset_init() -> drm_of_find_panel_or_bridge() defers probe
> indefinitely waiting for sn65dsi84_in.
> 
> Does &i2c3 need status = "okay"; here so that the parent controller and
> bridge@2c can probe?

audio-codec is using same i2c in shikra-iqs-evk.dts
 
> [ ... ]
> 
> > +&mdss_dsi0_out {
> > +	remote-endpoint = <&sn65dsi84_in>;
> > +};
> 
> [ ... ]
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261021-shikra_display_overlays-v1-0-adaea735999f@oss.qualcomm.com?part=3
