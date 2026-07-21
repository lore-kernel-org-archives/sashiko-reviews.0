Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4BEE2DECCB;
	Tue, 21 Jul 2026 05:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784613044; cv=none; b=N8npJSdsw57noSusKCW6TVPptbxCruWwmeFL6ORzdaknUHy1TwoiBBTc79cG5Qxpt96ijs9Qa3TRmNGlPvbYcFS0Es338NJALCy4qNVKBhbdne1Vw7bn7vpoCqt6DjFxGva3iCG5T7JZ37EK2xBOFWTYFM1LlNFyHaawusZNhBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784613044; c=relaxed/simple;
	bh=qJf4xj8eHna2gZzSDhjjNbilIqNvFeAtewBAIGnxRzQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OFx4UGwY/U1LoY6lZcyfhY0F85brjnIAzcMcnMAiOlD89qkGxP0W2uUIAtEUcgWJRkNBVt3J2OY+MWMp/lmN1PmuiO6lwUP+2o2Qpe0wwk52tASOpX3yY2W6V0hmXqYVRtPzHqx7ENAp0Ufiu2RmjkWCDtF8MCfLFLK3zCj/0Xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gE5Eftcv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gE5Eftcv"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KNCrLI3978764;
	Tue, 21 Jul 2026 05:50:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0ttyE4dA+ZQXApM+QbKZ9VY2oMP3udeahN6MF9zx6xM=; b=gE5EftcvMfVwLTue
	WYm9dC6GFjYVsUX/tywgghSUcs7liqeZVXPa4sK+psuAzbWiwAIarDcnyJqUhnYT
	pQ4buJTdOnL8UZgo6bYRpqtn26n6x1i7Z0SqIYbTxld8KckdS9uIUsdwVhpms8x4
	ovyfvyETphpOPXIPOTBzaTEs4wOhQZiYd4LttjEMGgngWXBUBdEmyul6E0fXtJwP
	7zib5pjxzJu8SyXiGNWhGbtn+f5Sv/S2Vp8bG1Ye30mSncsSKRE5EIQomzdtdGS1
	ynx88ojxHWnw1W7hyaKTxX7Fb8w69fLq6ewh/X78BWHs0i+9Zd/hR/zz903woP1K
	gbddVA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhqv42mc5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jul 2026 05:50:39 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 66L5oZRT026960;
	Tue, 21 Jul 2026 05:50:35 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4fgj53qqj1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jul 2026 05:50:35 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 66L5oZlE026953;
	Tue, 21 Jul 2026 05:50:35 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-kotarake-hyd.qualcomm.com [10.213.97.140])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 66L5oYqw026952
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jul 2026 05:50:35 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2389607)
	id 428C9B45; Tue, 21 Jul 2026 11:20:34 +0530 (+0530)
Date: Tue, 21 Jul 2026 11:20:34 +0530
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>, robh@kernel.org,
        conor+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 2/4] arm64: dts: qcom: pm8005: Add temp alarm node
Message-ID: <20260721055034.pechna67hrbbydxk@hu-kotarake-hyd.qualcomm.com>
References: <20260715-shikra_adc_support-v4-0-5e07b6d21429@oss.qualcomm.com>
 <20260715-shikra_adc_support-v4-2-5e07b6d21429@oss.qualcomm.com>
 <20260715075322.1E7861F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260715075322.1E7861F00A3A@smtp.kernel.org>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-ORIG-GUID: 65ZEQSYJcd5rB2WvcKQkmxAbDxI02MEA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA1OCBTYWx0ZWRfX7xCwRNGSq8lv
 lsABHuY7j39yo9nDGZ80yc9Hk5xn0+ZwRxL8/TUuPyz82ScH64fJsdfTueNjHeNf5PMNEv940dh
 fkVuhirQNxnCHuGugbGx4GmQm+BasX9PCiY9b5/K7DaVMYgyamnMMMPwy7YzuuDo+L6BwHqFMK9
 ZJpZtfNtuGsclqTG+tDMzfCIfL+XpkMI+AZn8mP256MPEWDPgvNYZhw9Eu7wRegwEOZi5vZGXJC
 m8SKEHIpcPomY9JPdjesYZKzmRLCcYjlWTAdJzOlTyrIZ41a/j/oi0SZ7lRAPPBLzUBRwdxDtLI
 mNyBJKmG7XNvsUiWmaHXus8JafMEwWxfiTu0/e79US9iUhA7OV3ab6XiCWiJEuSIcXYHLP9E/hV
 e3yALu2+UCU7Hc3t0Dd7R9naJy8cN5Yyde18bgwVz1XlCcXbrEWqCS4HYBLJbvUFHfkTxZaKfdW
 pGPxEaChN8VvQrDK9gg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA1OCBTYWx0ZWRfX2E2RYYB3tNCI
 7oxdh4gQ+3J/+FFB5pLHx8P1DmHntS4bfFJ7TZyGjHbU1RRfbZ+vqUskFVnmVvLl+tLxCYqLAS0
 OWwensYHz1Axt13iQ1u5Z2B/K0st0aY=
X-Authority-Analysis: v=2.4 cv=daawG3Xe c=1 sm=1 tr=0 ts=6a5f08af cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=8nJEP1OIZ-IA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=c92rfblmAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=uwttXugpz4HXKEI34YgA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-GUID: 65ZEQSYJcd5rB2WvcKQkmxAbDxI02MEA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 clxscore=1015 adultscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210058

On Wed, Jul 15, 2026 at 07:53:21AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] The critical thermal trip exceeds the hardware maximum limit for a PMIC temp-alarm without an ADC, causing sudden hardware shutdown and boot warnings.
> --
> 
> --- Patch [2]: [PATCH v4 2/4] arm64: dts: qcom: pm8005: Add temp alarm node ---
> commit 6fe65cc601cbda83fdc5adbaeaef49d876e5ddff
> Author: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> 
> arm64: dts: qcom: pm8005: Add temp alarm node
> 
> Add temperature alarm node along with thermal zone used
> for PMIC thermal mitigation.
> 
> > diff --git a/arch/arm64/boot/dts/qcom/pm8005.dtsi b/arch/arm64/boot/dts/qcom/pm8005.dtsi
> > index 0f0ab2da83055..ce31a85450200 100644
> > --- a/arch/arm64/boot/dts/qcom/pm8005.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/pm8005.dtsi
> > @@ -4,6 +4,34 @@
> >  #include <dt-bindings/spmi/spmi.h>
> >  #include <dt-bindings/interrupt-controller/irq.h>
> >  
> > +/ {
> > +	thermal-zones {
> > +		pm8005-thermal {
> > +			thermal-sensors = <&pm8005_tz>;
> > +
> > +			trips {
> 
> [ ... ]
> 
> > +				pm8005_trip2: trip2 {
> > +					temperature = <145000>;
> > +					hysteresis = <0>;
> > +					type = "critical";
> > +				};
> 
> [Severity: High]
> Does this critical trip temperature exceed the hardware maximum limit?
> 
> The critical thermal trip is set to 145°C, but the temp alarm node below lacks
> an io-channels property to specify an ADC.
> 
> Without an ADC, the qcom,spmi-temp-alarm driver will clamp the critical trip to
> the hardware maximum (140°C) and leave the hardware auto-shutdown enabled. This
> can cause an abrupt power cut at 140°C, bypassing the OS's graceful shutdown
> procedure that was intended to happen at 145°C, and will also print a warning
> on every boot.

Thanks for the review. As per IPCAT (TEMP_ALARM_SHUTDOWN_CTL1), the
hardware max for pm8005 is 145°C, so the critical trip does not exceed
the HW limit.

regards
Rakesh kota
> 
> > +			};
> > +		};
> > +	};
> > +};
> > +
> >  &spmi_bus {
> >  	pm8005_lsid0: pmic@4 {
> >  		compatible = "qcom,pm8005", "qcom,spmi-pmic";
> > @@ -11,6 +39,13 @@ pm8005_lsid0: pmic@4 {
> >  		#address-cells = <1>;
> >  		#size-cells = <0>;
> >  
> > +		pm8005_tz: temp-alarm@2400 {
> > +			compatible = "qcom,spmi-temp-alarm";
> > +			reg = <0x2400>;
> > +			interrupts = <0x4 0x24 0x0 IRQ_TYPE_EDGE_BOTH>;
> > +			#thermal-sensor-cells = <0>;
> > +		};
> 
> [ ... ]
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260715-shikra_adc_support-v4-0-5e07b6d21429@oss.qualcomm.com?part=2
