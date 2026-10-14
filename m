Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBCCA23645D
	for <sashiko-reviews@lists.linux.dev>; Wed, 14 Oct 2026 20:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792011476; cv=none; b=V2qkNB0L3uorW8sTrQDTEbnl7bEj6mhPm/ZQ3bh88y2Y/L+v8efxxQU7RH3R6YLQplO0XFWBnmruDGru84TolCCZJTpnZQZ8hOeXjpwv9zaROiQvm6kTo9tP8n7diKpHAz6qgb0x1TFG2TYlesv/WN8Islh6A3J+hfWZqspUVzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792011476; c=relaxed/simple;
	bh=jiRBljgKuKiE+P6dq12P5OkOLeXucCVMJReCf6g+vnk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WZmgJjkspyzYfNy1rMPefZvhc5vwVhvtsD/aubMyO1FIcfQL7BTTQ7iKMhy5QIwiCgHf4L4JHrED99moDP2zEc8InRDwOY4uTj0xcE5Qr/ymiEqB/oAdfLWbcYksH38cU8HQCIV2sFjbNUYGIL3aqvhS+D+0z+JCrVu4Ju7vQVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GkHw6Xh8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=grrA1KHY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GkHw6Xh8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="grrA1KHY"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EEb3681013177
	for <sashiko-reviews@lists.linux.dev>; Wed, 14 Oct 2026 20:57:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Tdom7tnqrfqhiAr3bCDpoJLd
	konZqaXCM3eCfjDGwls=; b=GkHw6Xh8yvBfUCJGvTj1kZUo/GEDtrYx/IkPailO
	U9A00x8a4bHWd7+s8NvKGyJnHvCh0ac+SB+ek/pSkxbn4dZrHOaDJh8YmurDNstR
	1J2AwTGh72QKS35T8YLeYMhcjMq8yxU5PTTYjHFc4FnmVP9i1kUZx83Iq8Tp0iUM
	0bS87QKAB74ukuHfRYfo+nd2H5T58rYMK4JGY6y3m6UxLlMH5hWEuI5NBliTGgDb
	5r/qQKwrWx6L/LM0u2EWkOgM3dSXtWGCrkRdcTvZmzokL6/t5xaR/fhfTLaajKWB
	gp32Pe7sOVcq/O+tg9wj3Umvr661dEUIK4q7vfkFjB8Aqw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha80ctd7a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 14 Oct 2026 20:57:53 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cc0b31ecaso181239785a.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 14 Oct 2026 13:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792011473; x=1792616273; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Tdom7tnqrfqhiAr3bCDpoJLdkonZqaXCM3eCfjDGwls=;
        b=grrA1KHYpN9WoRtIXLbf37O2Dy1nL6o4eniU2LYqpdyOxQdgDOfTJDbuNpIhjWthpt
         kHW+L9ZhLAXaNCVtum5dl59EL7KRW+jeXb9GIjIb+WnSi2DQmciLH+gOBRletynIG5Zh
         kgjO1vqW/ZZv8+7WHA+3kJSFiPqycXzJJkbgCNuj59f1UGiqI4wvLD3Sfj7tpU/P/85K
         S0R8lf1JRzdjOe52iZ6x/D+qefXok7Yt1+c+Q3jTrYqgzLAMWwUtSFtTdQnbbeSD6MDL
         ThDvYJxjuGO/PlqppxjbIiIrPfKUE21srMAsKpa7hA2EyZ2XJv8QYLzaYHHqQHVUju1M
         si/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792011473; x=1792616273;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tdom7tnqrfqhiAr3bCDpoJLdkonZqaXCM3eCfjDGwls=;
        b=qM7NfORhMqat96AEIrhjbech3rNumpSGOt+KOrpQEux6Wwz9giwim7jQiqNAgr7UCR
         6QpKYoapQjvaRxIIEj7J5hMKvtpFWOtcNg3E+G/XLpUEQBTvxXYe5Qvs9JRZShjgqvlB
         24GQes/ewama0tyoWD1Vh9qf3GKi3dWa2PAlkRhxJ61OG1SY3dyWn9cmq2XmiB6mvPOb
         Dc155aq/CEdCqKlXjkg3P65IHgVvCIIN+FUzii0Xw26nOY81WR5aakNkwY6lTE+T/xUH
         fIyPe4xVUWKDvWehVkGYofp77VwgyoUMuNyA7wSeJurc6R9O+uTofMEb/ozrMClfw9oo
         UYSw==
X-Gm-Message-State: AFq9FYJrXmwOJSdnUozAYHN6cWxov+FpqZQ+ECB/O1F8bfznFJBqSHmE
	OnhW0vDA0SSeMPItxruqssgtovLbIPm8IZuIf6FbnvD5ZcJYXimVsOf1WKrODvzFiZo33lnqZcx
	QGAC4pz04JmSL4Kv5U9jla0VFxS+FzvDkrOLsBB5HAaEjJ+Sn5gQ3Sf8c1CF328ebPJESUlkcGO
	aMn2U=
X-Gm-Gg: AYBFou2Htr5UBkqo/+nV5pe4py3ypq+5igdPofsuChLQSiDhrvWXSk0xNQv7KOqM/0Y
	R5Xjkhnx9UHlpZb0kECFe86QUlG0I1/ZiFkw808CByD4rF/OvvppvwX6yw3GKePSeRv7/aqKu8f
	bF9O966IGVBqmPMbShCo+WW6gnggzHesvaMxumsk6QghQld07kE8b1UimZiWWZdniAQnumEgudj
	V68bJunuDj66PqjDV8w1qsKXdnBs1kIHew81UrGg4DlJJOH64p8yYeuJYg1jJLJ8DHYh31g2P3s
	rgb118z+azyMS2PCB4ldJdG2aA3QTgmTfK+T5Wv2WrCeuwr8XOTpfWkKLz1/iQ5bTqdamuH8/AN
	kUAHGewAZa/HZV8RzMeGS9wlx77QdosKlPVKshEJk7aAOugRTsAf+Q+i8g/pE8O6uzQYJpsWSux
	9sRsOwktEtSn7g
X-Received: by 2002:a05:620a:3194:b0:93c:7d49:7b69 with SMTP id af79cd13be357-93ebd2963bcmr2795852985a.60.1792011472912;
        Wed, 14 Oct 2026 13:57:52 -0700 (PDT)
X-Received: by 2002:a05:620a:3194:b0:93c:7d49:7b69 with SMTP id af79cd13be357-93ebd2963bcmr2795849885a.60.1792011472382;
        Wed, 14 Oct 2026 13:57:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3aafdefdc4asm1613741fa.30.2026.10.14.13.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 13:57:51 -0700 (PDT)
Date: Wed, 14 Oct 2026 23:57:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, robh@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v2 4/5] arm64: dts: qcom: add device tree for SDM845-HDK
Message-ID: <rqsztjjpis5ddd3adpwds56svbbeugoh2zhzlat5jilozkzncx@jrwnidovsh3j>
References: <20261014-sdm845-hdk-v2-0-6d0b4b42f267@oss.qualcomm.com>
 <20261014-sdm845-hdk-v2-4-6d0b4b42f267@oss.qualcomm.com>
 <sashiko-outbox-171533@kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-171533@kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA4MyBTYWx0ZWRfXwdRGOdKFwMyA
 ZUBIYzr551tRh03n/PPdjtrefyMeWHQiI8y3Tc67GfhDoFKyoYr9yp8PH+CsADP3YGYDgXN6pu9
 jheK71jX6m4Uxvl4vX4ZAnuBshTC7zo=
X-Proofpoint-GUID: ugSIPqs3E0mCyrlcRT2JSuauiHYmEhCN
X-Proofpoint-ORIG-GUID: ugSIPqs3E0mCyrlcRT2JSuauiHYmEhCN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA4MyBTYWx0ZWRfXxG+k1xaxkwnS
 /fVKY3MeY88JfGmiIy13+AJvjb16DZjRXkF3bLjHtyJcFRBZrJtE/FhFGgS80P2HygnxM+XFLml
 dJYovi3/DGDTRCpC0oze+qm7+TJihDeSJyAH8liigNXw5sFJM4M8D3i5b/Wbwn3CIFYWNoFe8oa
 kTzmXDkvmli1kcFpINPZIsmGcXbbfqSuxFmpvDlwLEZQhQCkLzjk+IgeYHS0FcJE+ugo1JpJdPa
 7pBD8LX6KB/YaekIHq6b/0uOqB0ZreCSKGH69CWcnzjomVjSEVm4MHU3gT9mo8ev4YD0+EYC2XJ
 A7gbDVWUYI9PwjhK9qpbnxEhekTNW21jDvdjRhbpWu7XL5WTWezAKjzD96hszZMfS8ozYlkPf0h
 9fAFwjDepAHBGsNIJpZqWksMchsU6g8D9EVvtTv4V/gX+q3P7qkBv+CIRGsSy2vqPkk7JQqQ8dz
 mY3NQy9Rq1o3NueFZYQ==
X-Authority-Analysis: v=2.4 cv=JegpPkKV c=1 sm=1 tr=0 ts=6acfecd1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=s4Caojyv45IKULvEKnIA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140083

On Wed, Oct 14, 2026 at 04:31:17PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [High] dts: usb_1_qmpphy swaps vdda-phy and vdda-pll voltage supplies
> - [Medium] dts: home_pin_a pinctrl incorrectly configures gpio6 instead of gpio5
> - [Medium] dts: impossible 1.8V vin-supply for 3.3V fixed regulator vreg_sys_bob_3p3
> --
> 
> commit 48f1c407e24f3899e533d5dddbd59a77b4901a02
> Author: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> arm64: dts: qcom: add device tree for SDM845-HDK
> 
> This patch adds the device tree for the SDM845-HDK board, a development
> platform utilizing the modem-less SDA845 SoC. It introduces initial support
> for features like HDMI display, uSD, UFS, USB, and various onboard peripherals.
> 
> > diff --git a/arch/arm64/boot/dts/qcom/sdm845-hdk.dts b/arch/arm64/boot/dts/qcom/sdm845-hdk.dts
> > new file mode 100644
> > index 0000000000000..4dd426912d20f
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/sdm845-hdk.dts
> 
> [ ... ]
> 
> > +	vreg_sys_bob_3p3: regulator-sys-bob {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "sys_bob";
> > +		regulator-min-microvolt = <3300000>;
> > +		regulator-max-microvolt = <3300000>;
> > +
> > +		regulator-always-on;
> > +		regulator-boot-on;
> > +
> > +		vin-supply = <&vreg_s4a_1p8>;
> > +	};
> 
> [Severity: Medium]
> Is vreg_s4a_1p8 the correct vin-supply for this regulator?
> 
> vreg_s4a_1p8 provides 1.8V, but vreg_sys_bob_3p3 is defined as a 3.3V fixed
> regulator. A fixed regulator cannot step up a 1.8V input to 3.3V.
> 
> Could this create an incorrect power dependency tree, potentially causing the
> 1.8V supply to be kept awake unnecessarily or turned off while the 3.3V rail
> is still needed?

This is the least awkward description. This regulator is powered by
vph_pwr and enabled by S4A. Using S4A as vin-supply is the most logical
way to express it.


-- 
With best wishes
Dmitry
