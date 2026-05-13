Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 985FE25A33F;
	Wed, 13 May 2026 13:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778679121; cv=none; b=cV6MEZFEGjOE8YlZqiIhlU+Nqi3jki+Heax2XEJr5bcPrxZo43ikN9niODbvwTEutGipFKWe0cfidoTTKngmPYbaKF57rNYhTCvPiDdVKQF+3RrJUsXpecT49Tq12dkr6DIVrugrvKShnZvpehqBGUsB8Leo+gRJv09RiowI03k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778679121; c=relaxed/simple;
	bh=JR52Ov9pxs+GhxeSP7Wdp7k5v0uGN4/ysN2z3C1z1uM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rRX/s90KFlhlQYcmr7w6U6WN4e+Sc4jS1dKq417eu+KJEQnLEq+MvQ4dfLCo3yJiyL+ueOySW1NU7XnC/9Gq85fYjDduvaUwOzXLHFRzUaD+P0Ki4PWnHa/U2h14/aDzxOgKJy3xRlwIMP/1ng646SEb5k32x4j6XB119OV7ZsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L35RNrRb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L35RNrRb"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DAVLFS3430151;
	Wed, 13 May 2026 13:31:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+Z9CF0PHRUZfgrMFz7Ke/C/05Lw0TTbfxjvrqLAahqw=; b=L35RNrRbcAY+NK6Z
	jDurbt2fX7mVDoQdYaMCWxYWr+xP6uJKyhp/+TEbZboEQL86TFzAQxnDK4RyNpwX
	J+w4VNnjjt5o+TgSz34DxnGALaA6XiPSpDaW3d16kaN2zlfzDorz+GcglHrZzrCL
	MpWrpbUVJtjRQDuTMLvfTz92mBDSsQeXLKHJ3D3iaTzpXzP8oHXCtmqPjwqzwbqr
	LsrYf2+emPAGeH0zMmH9Tfj2vTLKJWm0yVbHZ9aGXAyYMmrYju1hk+QYdNk08gd6
	w3ZbqVCrcH4TB5f1wPee/v42iMt7zumd3aVSbMdb3VnoQQso8lK5u9abbXMdwWRH
	ByhV9A==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4qmcgmgr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 May 2026 13:31:50 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 64DDVlVW014639;
	Wed, 13 May 2026 13:31:47 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4e1x0jemsh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 May 2026 13:31:47 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 64DDVl5L014632;
	Wed, 13 May 2026 13:31:47 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-kotarake-hyd.qualcomm.com [10.213.97.140])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 64DDVlxs014627
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 May 2026 13:31:47 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2389607)
	id 4DAD8B35; Wed, 13 May 2026 19:01:46 +0530 (+0530)
Date: Wed, 13 May 2026 19:01:46 +0530
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: Komal Bajaj <komal.bajaj@oss.qualcomm.com>, robh@kernel.org,
        linux-phy@lists.infradead.org, neil.armstrong@linaro.org,
        vkoul@kernel.org, olteanv@gmail.com, krzk+dt@kernel.org,
        conor+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: qcom: Add Shikra CQM SoM platform
Message-ID: <20260513133146.doe4rr6ahb4nrri4@hu-kotarake-hyd.qualcomm.com>
References: <20260512-shikra-dt-v1-3-716438330dd0@oss.qualcomm.com>
 <20260513042836.073F9C2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260513042836.073F9C2BCB7@smtp.kernel.org>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: y4GziVTAWi6UdMV5wtMI6r33G-6ETHa7
X-Authority-Analysis: v=2.4 cv=Hu5G3UTS c=1 sm=1 tr=0 ts=6a047d47 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=8nJEP1OIZ-IA:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=c92rfblmAAAA:8
 a=EUspDBNiAAAA:8 a=JfrnYn6hAAAA:8 a=VwQbUJbxAAAA:8 a=RkLvNQZQ2IQHFO4gP24A:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=GvGzcOZaWPEFPQC_NcjD:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDEzOCBTYWx0ZWRfX7EWw0QuoGMYa
 dIEqMmNVfYDKFAJo0aMnw0CmdjYtD0p355iZ0aip10De/KdxMNA3HdLQ4+4Sny7qGMnhhXblQM1
 hUbtF0eo+1FRLenY8eJ0rjmo0rcQth0IyVS7WML2Ko2YcrmfSWJ7QwP5WIX2PRVfeLHxLcqYkBE
 vMoKcymcWmaTRbLvde5aRk2RIny4B8LKIgAWh+m2edDsvSleK321PHkNE4VKidmeNkKNSPU0QDA
 HYWI8fEqG5OhwkHtUPParPdN+KhYOZm2C4YzffMXKvxXvAlfTuvyPa8U0hn4LVEPK4kNbYJkcou
 pOe4CBb1No5czzB6ZwNMk7QvLih6hf8fM5WcMlrMCOck2JolFcNgDxLUi1LK4qdsh7c9H/dNSQC
 xe0q3wp95JxRFevioAEpegROiOzGRPJ7xmK5Ow/OYHc64Nf2NHqvg3abRb6/uXeErvaZgCq+FUQ
 FQpSf2keJVSd0aIC8YA==
X-Proofpoint-ORIG-GUID: y4GziVTAWi6UdMV5wtMI6r33G-6ETHa7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 clxscore=1011 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130138

On Wed, May 13, 2026 at 04:28:35AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] The PMIC regulator definitions omit their required input supply dependencies (e.g., `vdd_s2-supply`, `vdd_l3-supply`), breaking the power hierarchy.
> - [Medium] The device tree inaccurately hardcodes the `compatible` string to a different PMIC model (`qcom,rpm-pm2250-regulators`) instead of explicitly identifying the actual hardware (PM4125).
> --
> 
> commit 457abf6e7ac410430c866842e08e602ec3daaa51
> Author: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> 
> arm64: dts: qcom: Add Shikra CQM SoM platform
> 
> Add device tree include for the CQM variant of the Shikra System-on-Module.
> This variant integrates the Shikra SoC and PM4125 PMIC. The DTSI includes
> the common shikra.dtsi and adds PM4125 PMIC regulator definitions.
> 
> > diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
> > new file mode 100644
> > index 0000000000000..401e71720519d
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
> [ ... ]
> > +&rpm_requests {
> > +	regulators {
> > +		compatible = "qcom,rpm-pm2250-regulators";
> 
> Since the commit message indicates this is a PM4125 PMIC, should the
> compatible string include a specific identifier for the actual hardware?
> 
> Using a specific identifier like "qcom,rpm-pm4125-regulators" alongside
> the fallback allows the kernel to apply specific quirks if PM4125 errata
> are discovered later.
>
PM2250 and PM4125 share identical regulator hardware with no functional
differences. Therefore, using qcom,rpm-pm2250-regulators as the
compatible string is sufficient i think.

> > +
> > +		pm4125_s2: s2 {
> > +			regulator-min-microvolt = <1000000>;
> > +			regulator-max-microvolt = <1200000>;
> > +		};
> 
> Do these regulators need to explicitly define their input supply dependencies
> such as vdd_s2-supply?
> 
> Without these properties, the regulator framework might be unaware that the
> PMIC regulators draw power from upstream supplies.
> 
> If the kernel dynamically manages the upstream supply and its reference count
> drops to zero, could it be disabled, causing an unexpected power loss for
> downstream components?
> 
As per the Qualcomm system design, the parent-child supply relationships
for these regulators are managed by the AOP (Always-On Processor) FW.

regards
Rakesh Kota
> [ ... ]
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260512-shikra-dt-v1-0-716438330dd0@oss.qualcomm.com?part=3
> 
> -- 
> linux-phy mailing list
> linux-phy@lists.infradead.org
> https://lists.infradead.org/mailman/listinfo/linux-phy
On Wed, May 13, 2026 at 04:28:35AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] The PMIC regulator definitions omit their required input supply dependencies (e.g., `vdd_s2-supply`, `vdd_l3-supply`), breaking the power hierarchy.
> - [Medium] The device tree inaccurately hardcodes the `compatible` string to a different PMIC model (`qcom,rpm-pm2250-regulators`) instead of explicitly identifying the actual hardware (PM4125).
> --
> 
> commit 457abf6e7ac410430c866842e08e602ec3daaa51
> Author: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> 
> arm64: dts: qcom: Add Shikra CQM SoM platform
> 
> Add device tree include for the CQM variant of the Shikra System-on-Module.
> This variant integrates the Shikra SoC and PM4125 PMIC. The DTSI includes
> the common shikra.dtsi and adds PM4125 PMIC regulator definitions.
> 
> > diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
> > new file mode 100644
> > index 0000000000000..401e71720519d
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
> [ ... ]
> > +&rpm_requests {
> > +	regulators {
> > +		compatible = "qcom,rpm-pm2250-regulators";
> 
> Since the commit message indicates this is a PM4125 PMIC, should the
> compatible string include a specific identifier for the actual hardware?
> 
> Using a specific identifier like "qcom,rpm-pm4125-regulators" alongside
> the fallback allows the kernel to apply specific quirks if PM4125 errata
> are discovered later.
>
PM2250 and PM4125 share identical regulator hardware with no functional
differences. Therefore, using qcom,rpm-pm2250-regulators as the
compatible string is sufficient i think.

> > +
> > +		pm4125_s2: s2 {
> > +			regulator-min-microvolt = <1000000>;
> > +			regulator-max-microvolt = <1200000>;
> > +		};
> 
> Do these regulators need to explicitly define their input supply dependencies
> such as vdd_s2-supply?
> 
> Without these properties, the regulator framework might be unaware that the
> PMIC regulators draw power from upstream supplies.
> 
> If the kernel dynamically manages the upstream supply and its reference count
> drops to zero, could it be disabled, causing an unexpected power loss for
> downstream components?
> 
As per the Qualcomm system design, the parent-child supply relationships
for these regulators are managed by the AOP (Always-On Processor) FW.

regards
Rakesh Kota
> [ ... ]
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260512-shikra-dt-v1-0-716438330dd0@oss.qualcomm.com?part=3
> 
> -- 
> linux-phy mailing list
> linux-phy@lists.infradead.org
> https://lists.infradead.org/mailman/listinfo/linux-phy
