Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 216303AFD09;
	Mon, 20 Jul 2026 12:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784550196; cv=none; b=CyH9OOThg4koIZmR0x6wgY+H3itFnykkO2yUH1y0KafNZVo2Oy///pARkivRFn7l8N43GjpoIpxmruEu23uipb7dCn6tv5iEbV2VqdMR4g8hdri+Z+an6a/HPTwFlGVCNsPxnGQRojb+JQSmDEcINvk/t4E81vY5UNQ7TvSGW08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784550196; c=relaxed/simple;
	bh=UMDKl8dJ44BBGkesQ7g/9JyMHf7E7n3PYfq2QkPJpCU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hJs+ifxncg2VpHa8Q8aYG01yWrC+/G6jZFZ6zafUjBEj71rGpicXnX5WRfUwnYfLBVmWvT19yWgZ+zlcR0IJPCq/jqBx4KDocGxRPgCNrrVbCHRGKAFH3/bb0YcHi73Vnuo0Z01DZSwcHdIdXU2ODvB/s772anJ3N1xYXnxPFTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CYMD5HYE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CYMD5HYE"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KAvrOx2078671;
	Mon, 20 Jul 2026 12:23:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dRyzcsAbdZAS4gQ+StKibkxzxnTst18uUQHOn2WP8lM=; b=CYMD5HYEW10WLUBF
	FOKRv4zBdwuEGuxDCmqalqboI2K9rwcyPDRlfap4jhGvwlxVv1rf2qqaLAtPMh8B
	INTAY73GU6HaplDu4mFrxuLz9K0sOrgtWqjU+f68K2VhxhVMrG/YJSZokhNMd4jd
	yN0TQwUIHto3JKYt4XQa1FHG/3GPaZx7ixEdxgPL1D4pStp1BguLXKhU6FZzhXLT
	ieA8PeLix5hBrnyY9It+5lI+ob7gS75qoZGpQPMD/y3F3sVHFpURGx0r5XfOkmT5
	OHQrjgbLm1ZSc9awBAspd/RmiQ+QMfeL51AA1X7sb75Ef7fn3IQ1mr0FrH1FcaDb
	OPS/DQ==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhh5y0pq8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Jul 2026 12:23:12 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 66KCN7PE024044;
	Mon, 20 Jul 2026 12:23:07 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4fgj53dp2e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Jul 2026 12:23:07 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 66KCN7Hx024037;
	Mon, 20 Jul 2026 12:23:07 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-kotarake-hyd.qualcomm.com [10.213.97.140])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 66KCN7rJ024034
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Jul 2026 12:23:07 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2389607)
	id E03F1B0C; Mon, 20 Jul 2026 17:53:06 +0530 (+0530)
Date: Mon, 20 Jul 2026 17:53:06 +0530
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v4 4/4] arm64: dts: qcom: Add PMIC thermal support for
 Shikra IQ2390S SoM platform
Message-ID: <20260720122306.sur7quly2u6km526@hu-kotarake-hyd.qualcomm.com>
References: <20260715-shikra_adc_support-v4-0-5e07b6d21429@oss.qualcomm.com>
 <20260715-shikra_adc_support-v4-4-5e07b6d21429@oss.qualcomm.com>
 <20260715075839.B05821F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260715075839.B05821F000E9@smtp.kernel.org>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDEzOCBTYWx0ZWRfXwDw7oBDZ/1v2
 QKn7IxeTfWQ0X9SoqWwm6CJfQzfEibuutHxDsyJIXdu1n8XZac3BPiFGOlXFFT2uawmK3OyDiVC
 F9rZgW+hNNUeQZ61mBcyHVnnqWoejnk=
X-Proofpoint-GUID: wqBQSkqeJXnWStq138v3FJcabUoHOQtm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDEzOCBTYWx0ZWRfX4NxFeQm/0Au4
 Yt+5rL4GFlQxy8N+pnS+HMZpGiN1H0tht0UmxGzVQ2GjfUT7PVqHJVceZcfaZK05AYbWoEx9MAw
 YK4MztlMBmLiRnevfKa4ivyScXu161LWxMsXG3H8Pyv1L98lojKb17lTP6ekrfhzrLd0UsbvC7p
 JuXkZemsilr0b/+nkiHrFacxNgQ1uQcqFjmIiRQZb9JtalJxJGmOR5j3M2NDstueODATldt2xnz
 sTQQfPb8eHUNcbSvG8ZTvvQ7ukI703MeJUPRKqM6TLdYk5TqL3XY0tQusOZ3mS7Jzh1kMf2LPwK
 2ve4BZ3Q51HQXp4AT7P8/jehSnzUtyE4ua43ePbikjr2hEzCEinVTq+MRKL92hJsCjVmn4mvfjz
 gQGCu3JtDjLDxvZCgFupELlJ+IHUDVl+Rni6R1hg6RWXflUpZPbAKdqJRMMdu/svKEVNq3NWJFh
 wrGRRHsIEfQUNBPZ7Ng==
X-Proofpoint-ORIG-GUID: wqBQSkqeJXnWStq138v3FJcabUoHOQtm
X-Authority-Analysis: v=2.4 cv=f/x4wuyM c=1 sm=1 tr=0 ts=6a5e1330 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=c92rfblmAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=e8m7mRO4VQPBql9L6qoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_02,2026-07-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200138

On Wed, Jul 15, 2026 at 07:58:39AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Mismatched PMIC ADC channels and pinctrl configurations for thermistors.
> --
> 
> --- Patch [4]: [PATCH v4 4/4] arm64: dts: qcom: Add PMIC thermal support for Shikra IQ2390S SoM platform ---
> commit 5e80ce0d3c9c4dc567c3d3d335a508d11f309e50
> Author: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> 
> arm64: dts: qcom: Add PMIC thermal support for Shikra IQ2390S SoM platform
> 
> This commit adds ADC channels for system thermistors used for thermal
> mitigation. It includes ADC_TM nodes for PA, quiet, and MSM thermistors,
> along with corresponding thermal zones.
> 
> > diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
> > index 73945bf42112d..9ab0b44b00bed 100644
> > --- a/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
> 
> [ ... ]
> 
> > +&pm8150_adc {
> > +	pinctrl-0 = <&pm8150_adc_gpio2_default>, <&pm8150_adc_gpio3_default>;
> > +	pinctrl-names = "default";
> > +
> 
> [ ... ]
> 
> > +	channel@52 {
> > +		reg = <ADC5_GPIO1_100K_PU>;
> > +		label = "gnss_therm";
> > +		qcom,ratiometric;
> > +		qcom,hw-settle-time = <200>;
> > +		qcom,pre-scaling = <1 1>;
> > +	};
> > +
> > +	channel@55 {
> > +		reg = <ADC5_GPIO4_100K_PU>;
> > +		label = "pa_therm";
> > +		qcom,ratiometric;
> > +		qcom,hw-settle-time = <200>;
> > +		qcom,pre-scaling = <1 1>;
> > +	};
> > +};
> 
> [Severity: High]
> Is there a mismatch between the pinctrl configurations and the ADC channels
> being used?
> 
> The pinctrl-0 property specifies configurations for gpio2 and gpio3, but the
> ADC channels instruct the hardware to read from ADC5_GPIO1 and ADC5_GPIO4.
> 
> Could this result in the gnss_therm and pa_therm thermal zones reading
> garbage data since they point to unconfigured PMIC GPIOs?
> 
> If the unconfigured pins float to a voltage that translates to a temperature
> above the 125°C trip point, it might cause spurious system shutdowns or
> unnecessary throttling.
> 

The pinctrl state names (gpio2, gpio3) are symbolic labels only and vary
between PMICs — they carry no functional meaning to the hardware or
driver. The ADC channel selection is determined solely by the reg value
(ADC5_GPIO1_100K_PU, ADC5_GPIO4_100K_PU), which directly encodes the
AMUX channel the hardware reads from. There is no mismatch — no garbage
data or spurious shutdowns are expected.

> [ ... ]
> 
> >  &pm8150_gpios {
> > +	pm8150_adc_gpio2_default: pm8150-adc-gpio2-state {
> > +		pins = "gpio2";
> > +		function = PMIC_GPIO_FUNC_NORMAL;
> > +		bias-high-impedance;
> > +	};
> > +
> > +	pm8150_adc_gpio3_default: pm8150-adc-gpio3-state {
> > +		pins = "gpio3";
> > +		function = PMIC_GPIO_FUNC_NORMAL;
> > +		bias-high-impedance;
> > +	};
> > +
> 
> [Severity: High]
> Because these configurations explicitly target gpio2 and gpio3 instead of the
> pins actually used by the ADC, does forcing them into high-impedance mode
> risk breaking or interfering with whatever hardware is actually connected
> to them?
> 

The pinctrl state names are symbolic labels only and vary between PMICs
— the ADC channel is determined solely by the reg value
(ADC5_GPIO3_100K_PU, ADC5_GPIO4_100K_PU). No mismatch here.

regards
Rakesh Kota
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260715-shikra_adc_support-v4-0-5e07b6d21429@oss.qualcomm.com?part=4
