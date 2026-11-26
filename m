Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795696283;
	b=izVnqA0yMAqlixP6NwHlZY2pWDA+i8a9CwDf+9FopILEuTTRZRajp8D4j1lMb05WLbeh
	 Yk0Rm8jN8kSIB5hoeklkJXgp7W6CdRb/VmJumwgxY9SsFFZdme7k1J2Fb/CnkQtSVi1iL
	 mhnrw7wmJiBlRrF0iOywcTa3qXD1QeNPPImAZSp6T93VakPVZwQKUOJcZsch45JH50h/F
	 lJIijN4OHIJUMVVGRzgCGPBgGlHa5BChQzKDvC4wvaAIKn3HA6PKSUPQrtGgCpP2516yU
	 WZMyDEaSTNPSx7D6oDIdeQVF5eXlttRnG26uXE5BN0TFGsUn1TdR/HxQ58gsOQcubEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795696283;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jZPQLLdSKDr70Ex6sF8g1B7/IBeWUUwY5iPE3L01UtA=;
	b=IBA16abuQ4vKZ3iONsclHoXyImWf8kezeDMNn0IAOvMPVSLiNyE0cWY4CNbkvgx5YZ8H
	 xqQ0kOWkXcEGIhKFznE4qs3TCjUbWp2KtI0CsgxN5SgPYnHGjzKuiPjMN++WXG9SuRj0w
	 vDNiWmMqhs2sg9iLcJzQanQy0Mx0TUpTp/Ph963vWy3rmp2bLeB8kJGooYkXzsEjZ2+5f
	 Sw/9kAHtul1H8Q5oFqo8yYsNHMkFMhaf1EzUx/YyYH90tH1fWaYZCpBHABBpLDij4s6iz
	 T+PHxnO+XzdE4ATyHXI/4XILEZtUYOnoRpzbIlhliimosB4ibePyx3GyQKuJJsGdAVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Z37F/eph";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XhCZk5PQ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E97606A32C
	for <sashiko-reviews@lists.linux.dev>; Thu, 26 Nov 2026 12:31:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15E97606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z37F/eph;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XhCZk5PQ
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVHCt3476063
	for <sashiko-reviews@lists.linux.dev>; Thu, 26 Nov 2026 12:31:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jZPQLLdSKDr70Ex6sF8g1B7/IBeWUUwY5iPE3L01UtA=; b=Z37F/ephUwpXH83D
	PdMuxOfAqwIpAe/YlnbUZ8ljayC8BKQSvv3A/cvyHEZto99TpsE8JVJVO4jxlrsF
	j15/doXvijMgVBNOdQEeCCWZzYoWdTh0VqYQ/QM/WxEhZ8GjwQlWMkb0OwP7lgN2
	E2mlXKgim8VW/XMg0aKct7YwwQQb7I7mAK9mcdG1XWlvosE9OmM0Wqm2xCjd/+zz
	FMe0DaQN+7mizbEHcmuxNnDIBC1NWAvJiqsgIitiveKsFIK9El4XqZo092Krt/Z7
	JWEO9KVogU93hlCdNqV4Puj1eRZ0M+rmALCp496gtK3hrEuCqcM8RfThDjbrvRYQ
	K+o1Fg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6f8rhd8r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Thu, 26 Nov 2026 12:31:22 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3869db50548so500447eec.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 26 Nov 2026 04:31:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795696281; x=1796301081; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jZPQLLdSKDr70Ex6sF8g1B7/IBeWUUwY5iPE3L01UtA=;
        b=XhCZk5PQYOE6d5XS4nvqYhSReXbk+zhekj4TosJd4M4Bn8ku7BgoY6Sd/uAFSQMfo8
         cWF/r0jlu+QOrrQ7OZBnlKP6xWWQGjH2nTnbGCY9Gtk/s8ynHfhwH9tQim+Wy2mJstjF
         zENv3h94wNauFXoL9HhKywIHyfPYrcRIB0KgkCDv+c1kQ6e3xpaC3IGoZ2f3yXKUPMsl
         OeivALuPk92bvw35jd0wd7soVIMMl4gx7lNTKhK66BlvAgnwN35S0paehizQbTn3RgIQ
         7iiREGORUISH4ou9lAoUkpDd518+UoTJOSVjtwKnTur+HM7zpK9DikMUlLd5hjFlVef0
         4Ubg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795696281; x=1796301081;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jZPQLLdSKDr70Ex6sF8g1B7/IBeWUUwY5iPE3L01UtA=;
        b=CSZvdA//Thf0XXNCW/mw/mDdBYU7D7+5doUwWWJKGbXUtF4GxT5ZsQE8/W3NpZGFqB
         brZDKl2+Ged9VYoy+Yvu2UEG4Qpk7+XLy0PLaEtc4IUuvoHCrXT/Rx0WVrJHR4P4f2ne
         KD2ekejvW9FULpNwALfw/0brl4R5+pKpFXwbGD1OyU1kXD19mugNjeiIpYrqZRdKtRjq
         h74MvXc00uf6TCZIXqh945zOWxoB91HrkxAHVaI3OUWWhanlksS1X3UVKDOSPpVxcpD0
         NYso6pQWkIEZei1MA7yrVAAp+OI1DBZro0Iimxgv0iojiAkf9LcFpR/i4zwGwQx3E7e6
         GTiQ==
X-Gm-Message-State: APuU4Z/IB88BuXcGkycr7ubvpsu4PoTmKNIbS/u360Dw12reZyOYh1Cl
	iZ2WPryV+iuV4Lhdhj9kPwOpc7rlfLpPn02OwZr+cZS5feLINOHx3RKIu9WTjQM58Uytr9W0aFq
	dnStvg6PyWUtNzaN40GwQl9WN9soRYWn0jULP/UK573vLZVEmsXZ8p/jf+52nBvz3HBn3GT3o1w
	m2h5U=
X-Gm-Gg: AZFdTZd+QGMRAIgl9C/FqpM4K5wOjVBKe2EKF+Q/1YDwoQbRGhbIL0QSj5j6JqPUyh8
	RBuC57jjSZunorN5F3a3ArH42mLe1nOeKOa8oKpofLhTLyAVhRZlnkspg6SIOJavnJ4D5EsmQnt
	/DKUjkQuDLnWiHARm+Mp9oywXhfQiRNPox88OessFIT6OnPDcgvYsuR18Nohl+g6/eK0rMCnXuw
	lK5GwZdIgVQeFpPkpmzCwWwrJrNIkRoOKKrscqgHCHbwc04a0WHxYibqEvNIWuQFRQ+j7+C/T//
	IkjY0VQtTy7Lyyhy/wnscFFY1nctNA3X4AUo5usK/W2cFYaNj/5mYvUJ/Eitf2GBg6QsLMQKyGA
	E6Fdb7bL4INOV3nW76V46WceL93jLoIQdSxSiH4IWjFP79aK4n0+G6iQKZtZViMGgiqIfIuyXDK
	PiRtRVSFh5+quRV4hmprblaSKbAWC5hoIBL5BO0mq42Gh0suXgr1w4cOcRk0fEewlsBcxoEn0v4
	P6vXBruntWMrs6rwHvXJxJHK7+q
X-Received: by 2002:a05:7300:1c24:b0:384:a0cb:a6d0 with SMTP id 5a478bee46e88-3856de58f7fmr34445200eec.1.1795696281161;
        Thu, 26 Nov 2026 04:31:21 -0800 (PST)
X-Received: by 2002:a05:7300:1c24:b0:384:a0cb:a6d0 with SMTP id 5a478bee46e88-3856de58f7fmr34445156eec.1.1795696280483;
        Thu, 26 Nov 2026 04:31:20 -0800 (PST)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c0c1dsm70375739eec.21.2026.11.26.04.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 04:31:19 -0800 (PST)
Date: Thu, 26 Nov 2026 18:01:15 +0530
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: eliza-evk: Enable DisplayPort over USB
 Type-C
Message-ID: <awgmk6fPb7piWGs+@hu-vishsain-blr.qualcomm.com>
References: <20261125-eliza_evk_display-v1-1-78a56df97a26@oss.qualcomm.com>
 <sashiko-outbox-232960@kernel.org>
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
In-Reply-To: <sashiko-outbox-232960@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0OCBTYWx0ZWRfX9Sev9pmlDKrT
 NuUig0Oy/oCD+J+324mjYylNVikVVOdYyY0kqdhZfWMOWuDOOnhgq0eOxDu2No9ioEt8+jnIq5f
 vw3aMt30nQ0DkOW5iCr/KtmkLaVPAan6ajGhUv8abv57Ki/cRRkYwAg+SD4Nalagrt6DHJrbsDW
 IQH1NGO2sGx0RKvMCgqHeeRJrpbBsPTTRGcxa7Uq17GJdOsuYxUCg22v2a6nde1SU0v0YaZP6PJ
 IzUuTnXmphDWOHjW4rSXPjC8go3JYtHeYLo7q80xeJvzHvdRM7ONu1ZVO2hHuwhBScUUFuiGnpH
 Ifr/o18spxssetL+lEpn94YevK+2BJj2YN4meTH+VTd9mOBF7CvPGdGCINj6wyvkZulsHMkHoTY
 Gla0Y7VGoS9pD6rtSAFg1vjcLOjVzjZpn+xjiuP6hB01nl7TJJK8c1IY/4+Xo+G7YEi0XVn1D/X
 a1sU2KzvXPv5AcG7lEA==
X-Proofpoint-GUID: IApFzC9lnClzRFs5ykL-Awgket8payx9
X-Proofpoint-ORIG-GUID: IApFzC9lnClzRFs5ykL-Awgket8payx9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0OCBTYWx0ZWRfX+eB+awzBhoXK
 UhKj+jkaQtR9nUSBKRfzjq3WyJnv2x4H+mlXJI7Sd4gS9Oa5ZOXwUatxYlnZ64sJ2cZ3Z6Bu9nc
 8bCdvSR811Q8P5s6RYSNSlH+QtXjcj4=
X-Authority-Analysis: v=2.4 cv=FuOQbGrq c=1 sm=1 tr=0 ts=6b08269a cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=8nJEP1OIZ-IA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=Fg7rGGv9YvjlHdKCETkA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260048

On Wed, Nov 25, 2026 at 08:57:13AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] usb: typec: gpio-sbu-mux: vcc-supply not enabled in
>   gpio_sbu_mux_probe()
> --
> 
> commit af0d0775b3f67c8bf2ee5b677ffafbfe4186fe02
> Author: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> 
> arm64: dts: qcom: eliza-evk: Enable DisplayPort over USB Type-C
> 
> This commit enables MDSS and DP0 on the Eliza EVK and describes the
> onsemi FSUSB43L10X SBU mux and its pmic_glink connector endpoint for
> DisplayPort over USB Type-C.
> 
> > diff --git a/arch/arm64/boot/dts/qcom/eliza-evk.dtsi b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
> > index 02e58a4bc91d4..8c663ef6718d2 100644
> > --- a/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
> > @@ -61,6 +61,35 @@ pmic_glink_ss_in: endpoint {
> >  						remote-endpoint = <&usb_dp_qmpphy_out>;
> >  					};
> >  				};
> > +
> > +				port@2 {
> > +					reg = <2>;
> > +
> > +					pmic_glink_sbu: endpoint {
> > +						remote-endpoint = <&sbu_mux_in>;
> > +					};
> > +				};
> > +			};
> > +		};
> > +	};
> > +
> > +	sbu_mux: sbu-mux {
> > +		compatible = "onnn,fsusb43l10x", "gpio-sbu-mux";
> > +
> > +		enable-gpios = <&tlmm 177 GPIO_ACTIVE_LOW>;
> > +		select-gpios = <&tlmm 178 GPIO_ACTIVE_HIGH>;
> > +
> > +		vcc-supply = <&vreg_l17b>;
> 
> [Severity: Medium]
> Will vreg_l17b stay powered for sbu_mux when the eUSB2 repeater is not
> active?
> 
> gpio_sbu_mux_probe() in drivers/usb/typec/mux/gpio-sbu-mux.c only acquires
> enable-gpios and select-gpios and never requests or enables vcc-supply.
> Because vreg_l17b is not marked regulator-always-on in
> eliza-cqs-som.dtsi, its only active consumer is pm7550ba_eusb2_repeater;
> if usb_hsphy exits via eusb2_repeater_exit(), vreg_l17b is disabled and
> the FSUSB43L10X SBU mux loses power, breaking DisplayPort AUX.
Thanks for the review. As per the Eliza EVK schematic, the FSUSB43L10X VCC (FSUSB_VCC) is tied to
VREG_L17B_3P104 so vcc-supply = <&vreg_l17b> accurately describes the hardware. You're right that
gpio_sbu_mux_probe() doesn't acquire or enable vcc-supply, so the rail is not held by this consumer and could be disabled
when the eUSB2 repeater releases it. That is a limitation of the gpio-sbu-mux driver, not of this DTS patch. I'll address
it separately from driver to enable its optional vcc-supply. The DTS description stays as is.
I will add this in v2 in another commit, Bindings already defined this as optional, let me know otherwise or
if this needs to go in a different tree.
 
+       ret = devm_regulator_get_enable_optional(dev, "vcc");
+       if (ret)
+               return dev_err_probe(dev, ret, "failed to enable vcc supply\n");
 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261125-eliza_evk_display-v1-1-78a56df97a26@oss.qualcomm.com?part=1
