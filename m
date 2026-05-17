Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 246653C3430
	for <sashiko-reviews@lists.linux.dev>; Sun, 17 May 2026 17:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779038305; cv=none; b=FPijabKTRai9SNHzZ91L7yNvjG56asEZUFZK6bWdGTcCZk13dYgbT+tPVbF9Qs8Mi+3Wb5sqgLRMYcwTYWHmLf2mnCNLPu9g8ypHbhEJgNtIktZ7uo7LzCSW/YkeVVh+7/+i9/5rKBd4YMKVEDXiUugFpk1bWAo/oYHp6DdCzK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779038305; c=relaxed/simple;
	bh=ZxjqzD/D/ZuXbB2Ju+afiJJqSzCUDtmshRbNdCUaxEc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cohFS76iQaRlu6YND/u8Y7+Gz9EICH7jo3Rw68gSZVFMCIFwrlEjPY4EGgeCacE5BUeypQvH66np2UQHJKd/NelLP1adwv6ajw/EkyEBI4Ue9gaTA84ElCKuxbpybg4PMVq6PNleCs3gxWtWWgFVtUyIdBlwe53og6XrB/gP4xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iL/7I7pF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TN3oZQdm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iL/7I7pF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TN3oZQdm"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64H2jaoa2343774
	for <sashiko-reviews@lists.linux.dev>; Sun, 17 May 2026 17:18:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Xgxp/eiQkFOSoDn0UOnSceK8
	3P+WFNS9eG0OJ/DVFw8=; b=iL/7I7pFnqNDPy9ybyiyYl0/3MM4vvKjYj+uBgP2
	f9rI4BsPhGGrD56McKm/MgvTLXmJsN/UvhBgZ9beTipTo/V8mHZaL154EGQatNpO
	X8LHSeA2pZe8yjtrowDwjUsvn1NuVZj2rRstgb6BFEX+j4nmVSUHucSMYAsvXv/L
	d7/6sg6BJroABTKtHR6ocEmuGm7VK5O5Molkl/tW44wNGCFSEIVmLj1+oAEd1bHU
	0QDgFubkin04Ud9u9cOmSTi2KhD9Yl1sInViQCiTUxH7YgeklXnj8+skON+STSVh
	TX3nQToIC0pMoRYKVH/jxq9YnUClFVD1jZG7LO4iefTRyg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6gx6u801-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Sun, 17 May 2026 17:18:23 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51009190feeso54225331cf.2
        for <sashiko-reviews@lists.linux.dev>; Sun, 17 May 2026 10:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779038302; x=1779643102; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Xgxp/eiQkFOSoDn0UOnSceK83P+WFNS9eG0OJ/DVFw8=;
        b=TN3oZQdmqBScPJ6+PWSbazaEyCDJg6G1nPdkVFXirxxIv5CjQ56NlR2KTSUenfc3x2
         4G5H2ca0Wt0lQ9qJhGcoCRsvMe4C+QS/V3xtq/6OBRLX9WPpPAtV14h50ymQQUwzYNHi
         1dBdbp5WqxHjJlAGOw+a4cpVsxwKoQ+pF/iTK8QwCd/e8ysiFlR7NQXnWrmx6L8TY9hB
         cZ8hmz+/muRBCyA8nlihwqoHpEde64zB6/K7M29nHFAyiWcNsjMzzENUYJRYtZyTliKJ
         zRmYmrwp3Ryto1mDZV3qnQxYwwBIThN/sONUyCjTXq0gFgQfTzqz5kemHzbkH1BhPSLF
         m19Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779038302; x=1779643102;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xgxp/eiQkFOSoDn0UOnSceK83P+WFNS9eG0OJ/DVFw8=;
        b=RmBAMAEO3sM61BHyjBXzO29przFPF9HUFU8yiMGExXcsjN5iECNe+nbcs5jH7++dRu
         NM0W2KCdg2Nusa4cNMz1zacJvhINEBgl1cPLyvyIRmPYS+7uNHHesWKQWBXN8AII721w
         oyhF+DOHW1JgEKPrWVVk6MfH/AAwuI8UuYtPbZDI4creq1RzB+MJNEHqou8/fr7AiGs1
         KLoFjGfYJe1ffcjlNWDZCC9CHlem2SPwkYVgj8HGQeKlEg3VksCone7YEZSTsDWDtHqf
         3FdZUq2pdFAnHo+30ZSl4Ng/yGRN/26mgWzXVC3Nv1UIdOR7DP1hlNzjSlbKRj+LEj5x
         iCaA==
X-Forwarded-Encrypted: i=1; AFNElJ+Z2+Q/AwIu3Z5nHqHzv7yUL5CLXxxJ39/EktbztzKlb1v38IRHWEU2KrHGegwXAUxSDdeniymsICHnBAXL6/Y=@lists.linux.dev
X-Gm-Message-State: AOJu0YxF/OtCOSM9RRfjcN9HyL80C7ppxiDPkKlAg9IbNCYQCKOLwzyN
	t5MJbq6Qr8tPsLrlr0tpmzIi1prbspTQEJh95CFc42YARYya+3Hst4baqR0B6ZQOzQ6pRQMO+vW
	dKH22kmWCMZVV1J4N6l1zVAMLGlZRnrp3tDFiI+M8lxYfaaY1HvSPbra52b3U1WBXsqb1t1M=
X-Gm-Gg: Acq92OGZeDEDy/5Fy0fpRs2lGRasFhRbfC77dZROODICYlkbAGgPb4M2T0huvpdWx1g
	XKzQ0fTyip3bR4bnnGnF+3SHU3pQYxnovhKgzDgc3UxwTNnpEJ/dwm3t+7sKvUEbkUYZ6m34AgR
	nUpVgaWmgRuaYG3nMvrftrAnaYv2ZkmqmMiR9in0Fe8WeTyBr5SAP3NUNQOoBM/zswXeEqXoaK9
	wgczuQ3+ao5BAhq5tmCIUDNthnMf3T0FCNm+F1OVCybeK50trJlNmADdXJI+lPGnnKKDsEjs0XX
	zI9pJ/8qxcy4WXFOWfUg7bgNa+yla5GCujnZKiFdY9O5OGndYRcEvh6HKkBOuu6+WxfM3jyuye4
	uQggKXCDh10n9rY31vdFpdJQpzL+ZCHrTX/cifpRRUxukKrQG9Zc8GuBW/T1ZfJzsKAr2u52A9l
	3fuVb9RBjUrb/BLh2zsZl71VwgHJIG6o1XUXI=
X-Received: by 2002:ac8:7d0e:0:b0:50f:c2f8:406f with SMTP id d75a77b69052e-5165a0758fdmr173916001cf.25.1779038302269;
        Sun, 17 May 2026 10:18:22 -0700 (PDT)
X-Received: by 2002:ac8:7d0e:0:b0:50f:c2f8:406f with SMTP id d75a77b69052e-5165a0758fdmr173915501cf.25.1779038301708;
        Sun, 17 May 2026 10:18:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3958874ff29sm6416181fa.22.2026.05.17.10.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 10:18:19 -0700 (PDT)
Date: Sun, 17 May 2026 20:18:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Cc: Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        sashiko-reviews@lists.linux.dev,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>, robh@kernel.org,
        linux-phy@lists.infradead.org, neil.armstrong@linaro.org,
        vkoul@kernel.org, olteanv@gmail.com, krzk+dt@kernel.org,
        conor+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: qcom: Add Shikra CQM SoM platform
Message-ID: <obdxony34ckfbtsqj66siszw44sgieskcye5hg66ulkisctpwl@fyqczpze5tnw>
References: <20260512-shikra-dt-v1-3-716438330dd0@oss.qualcomm.com>
 <20260513042836.073F9C2BCB7@smtp.kernel.org>
 <t2sw6owdxy5iyodjqsldbw6bfaqnezhgvc4hhylxuyrrbjkjto@iwf4dr5nmot3>
 <20260513142936.kauwa3czigfs7qs5@hu-kotarake-hyd.qualcomm.com>
 <0ac665bb-1a21-4077-aa9e-97162f7f4784@oss.qualcomm.com>
 <20260514103918.cs5m5kcxcrcgukvx@hu-kamalw-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260514103918.cs5m5kcxcrcgukvx@hu-kamalw-hyd.qualcomm.com>
X-Proofpoint-ORIG-GUID: 2ZTeXBh47SBNVsdJsEpdg4YH8JFfHbHW
X-Authority-Analysis: v=2.4 cv=f614wuyM c=1 sm=1 tr=0 ts=6a09f85f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=fvtwTOuhFqfjIg9toagA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: 2ZTeXBh47SBNVsdJsEpdg4YH8JFfHbHW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDE4NiBTYWx0ZWRfX4HLQhRewrdMN
 9eyHJeGbeg04mI/z1KJyZ68lyHBYiX+REhyAQXcBvyKsp7ghffqWFGWx/8iEq05TxhkcOAS8WYT
 +kg1cgBYXypB/pyOr4w3Y9xNPrpmb3/TLa/J5ZMGMvUA7TCrIlETmIgUvH66sbttHHFj0g8/LGF
 JFf087Pu6dNZESn0QIdvBoETxAkJIvF7t3dT7V7FjVTYpyyfZ2um7maETJdkJUhhN4PwR6XoqLJ
 1a32uCH63hPBX2zcnDHv4ziHw0H4whXyzmFn49P38VT1XsQ2xIwFICW0y55a2aOXrCx/NY4IN3R
 yDwqTLXaL7w4WHZMU0BQFRzWzV9CkrLiZTGlYZ7e0EMMDcNfuI5Em4jIxoB3cHMGxft0AWhuIah
 lpn80v+N4F9XxPgKxQPbQ/QzlRzl0e0fK/pCmTx+o+Pt0z2EPbkfAPDqHIQzxra+nu0oERtBLK6
 9tHFi+wEeqxcTUpKb9g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_04,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 spamscore=0 suspectscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605170186

On Thu, May 14, 2026 at 04:09:18PM +0530, Kamal Wadhwa wrote:
> On Wed, May 13, 2026 at 06:14:20PM +0300, Dmitry Baryshkov wrote:
> > On 13/05/2026 17:29, Rakesh Kota wrote:
> > > On Wed, May 13, 2026 at 03:01:47PM +0300, Dmitry Baryshkov wrote:
> > > > On Wed, May 13, 2026 at 04:28:35AM +0000, sashiko-bot@kernel.org wrote:
> > > > > Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> > > > > - [High] The PMIC regulator definitions omit their required input supply dependencies (e.g., `vdd_s2-supply`, `vdd_l3-supply`), breaking the power hierarchy.
> > > > > - [Medium] The device tree inaccurately hardcodes the `compatible` string to a different PMIC model (`qcom,rpm-pm2250-regulators`) instead of explicitly identifying the actual hardware (PM4125).
> > > > > --
> > > > > 
> > > > > commit 457abf6e7ac410430c866842e08e602ec3daaa51
> > > > > Author: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> > > > > 
> > > > > arm64: dts: qcom: Add Shikra CQM SoM platform
> > > > > 
> > > > > Add device tree include for the CQM variant of the Shikra System-on-Module.
> > > > > This variant integrates the Shikra SoC and PM4125 PMIC. The DTSI includes
> > > > > the common shikra.dtsi and adds PM4125 PMIC regulator definitions.
> > > > > 
> > > > > > diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
> > > > > > new file mode 100644
> > > > > > index 0000000000000..401e71720519d
> > > > > > --- /dev/null
> > > > > > +++ b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
> > > > > [ ... ]
> > > > > > +&rpm_requests {
> > > > > > +	regulators {
> > > > > > +		compatible = "qcom,rpm-pm2250-regulators";
> > > > > 
> > > > > Since the commit message indicates this is a PM4125 PMIC, should the
> > > > > compatible string include a specific identifier for the actual hardware?
> > > > > 
> > > > > Using a specific identifier like "qcom,rpm-pm4125-regulators" alongside
> > > > > the fallback allows the kernel to apply specific quirks if PM4125 errata
> > > > > are discovered later.
> > > > 
> > > > This can be ignored. The compat is a leftover from the historically
> > > > incorrect naming.
> > > > 
> > > > > 
> > > > > > +
> > > > > > +		pm4125_s2: s2 {
> > > > > > +			regulator-min-microvolt = <1000000>;
> > > > > > +			regulator-max-microvolt = <1200000>;
> > > > > > +		};
> > > > > 
> > > > > Do these regulators need to explicitly define their input supply dependencies
> > > > > such as vdd_s2-supply?
> > > > > 
> > > > > Without these properties, the regulator framework might be unaware that the
> > > > > PMIC regulators draw power from upstream supplies.
> > > > > 
> > > > > If the kernel dynamically manages the upstream supply and its reference count
> > > > > drops to zero, could it be disabled, causing an unexpected power loss for
> > > > > downstream components?
> > > > 
> > > > And this is a correct comment. Please provide missing supplies.
> > > > 
> > > As per the Qualcomm system design, the parent-child supply relationship
> > > is managed by the RPM firmware, not the Linux regulator framework. The
> > > RPM ensures the parent supply is never disabled until all subsystem
> > > votes are cleared.
> > 
> > How is this different from other, previous platforms?
> 
> This is not different. In the previous platforms too this is taken care from the
> RPM/RPMH firmware side, the only case where we may need explicit vote to parent
> is for non-rpmh/rpm regulator rails (like i2c based regulator pm8008), which
> may have a RPM/RPMH regulator as a parent.
> 
> Even on those previous targets the parent rail of all RPM/RPMH regulators are
> internally voted by RPM/RPMH FW at proper voltage with required headroom
> calculated based on the active child rails. This was done for all the
> subsystems (including APPS) regulators.
> 
> So no explicit handling from the APPS is required for parent supply.

You are explaining the driver behaviour. But the question is about the
hardware description. If there is no difference, please add necessary
supplies back.

-- 
With best wishes
Dmitry
