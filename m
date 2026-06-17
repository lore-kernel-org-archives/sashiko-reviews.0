Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF533C09F1
	for <sashiko-reviews@lists.linux.dev>; Wed, 17 Jun 2026 12:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781700513; cv=pass; b=HT6wlyx1hNFGm3+KVpTVUBgGZmBp0IaOkP8dMXala4Lu5OHAKte16uWSLZHQiztFspvmxFszwF3DoqCVJ7Mw0gKsKwY518PbwDHybM7PPc2/gFoAdlbK0umtO/q5OzgTko9bxrk5Vr6Rd2MUG8kI+VVIBh27AL3RGsJMh2VTbJ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781700513; c=relaxed/simple;
	bh=1QDlqDAENZKDUJNZlTH6erPxR/tMb1XUANlyY7Q1ycI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XLYBUCHik8r1s6t5ZpIOx5lu6V8UiOH+n/1JiBLVy3ezHAlI192fbk8LLR4p1gIw1T71GGoftI2zx/AxQd2UIbcqW0HuFF2BD6EGStpesD2u7Xnr2SfER7WPRmVY+0gf1gd1RJk5B+muTxNS+iBO60dSh3FVZ+QKy3/o47fiosw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sb0rsstT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=byCqbkVo; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sb0rsstT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="byCqbkVo"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8VYEW2190767
	for <sashiko-reviews@lists.linux.dev>; Wed, 17 Jun 2026 12:48:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZJF6u/a89oyxhTG3HTO28Hbg
	scfu0gN23dEPd4mDnnU=; b=Sb0rsstTnC6r34y5brXEKwpLM+MQYVbvU1Tcysyy
	WpcqkIF+10wTQjYCZNwqCE9Ptmji1wtP3Iy8lTvMJFSJx4td/yVhF1ZmwBeiOcze
	4fEIIZno21U488IWX8Minb5X03wCK/Ru2SE//9/1BlhK0OX5H64xOza9PaZI+9Y4
	6TIPRPhoeLQfhpsZu8tYuNBVqXvPLn6KVsLTcJE64Kl4PpYYR5DJGyYVZo7b6ScI
	U/KV4MAdzq4zgsi2JE4uNudVOoYGM9irMq4ryv9yFmWE9c+SgQuTzJjknJjY10vO
	fL44hN4Po2xiFjL0jjLTWtsas7phV6kuVtqQqFJDj9oI/w==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueesk6ru-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 17 Jun 2026 12:48:31 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8422b1354edso6985683b3a.2
        for <sashiko-reviews@lists.linux.dev>; Wed, 17 Jun 2026 05:48:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781700510; cv=none;
        d=google.com; s=arc-20240605;
        b=KaEJee9XtZU2FsXsvjQvA2EIph8TkHMIjqtg8UkEnE8Pf164wv8vMzhsEWTr75jijG
         kxxaiZXZolTtkCVYM+CrZT630apC6wsTgwUWFIPHVh0kXr67R01/GXPqyb9f+MxcWzC1
         obG4TIWcoFLL5QU4gXlDjPwq3CI+WO4iaApAPfGOwx6hdSRFqcicfQoFmfq40cSwRn5+
         ejtZ/ymhJG8shlXizhuZ6XmK3kvdTcZ4iZkS2Cu+YaPn6kZD+2vD3rBLvEnyB2asewrO
         a7RyRezTZq4oX7yG5S2UzNQwWryYgPAezjdJFYKTAHqR5Eg9Q/eekrJS+kdzjj2lw6tm
         +1pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ZJF6u/a89oyxhTG3HTO28Hbgscfu0gN23dEPd4mDnnU=;
        fh=GNYjzkZMZxRWvk+zLuT5OH0jCrRpnBmIpMrx9f8VbMo=;
        b=Ca54xpHLNi7LAoOPbyBe+Cirsz+8P9jYhi2YS4wfiuME/ecM44cvm98jtdXOYkRV9y
         bkGkDfhxJTHYrGsHMTxndZhXkepCYTNaKyj8vubrHQDQcJLCII0Nn1YwZI0WvNFSk+7z
         k0sVJHghHIYWxabk49xjykkPKJjvcEJAlwinAagMFjpBp/IYPT+y4sJGeWv+D/zlk/yl
         A5sCqRIqtcQb+elDdqHGVVpa0IvqVoj1CxNOFM/5AnzBt84uaqjV3V5Yq584aQ+AdovF
         akffv1i83Xc3oDAdVwJEaHAWxLKivyVxl9PNwSvt+YAfZUKZUj3CfCjC6bqo2Izns+9g
         PWOQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781700510; x=1782305310; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZJF6u/a89oyxhTG3HTO28Hbgscfu0gN23dEPd4mDnnU=;
        b=byCqbkVoSQuIcG83rddR5tLGZhiXWI4aKtwDVqgyDeesWoV6nIaApsZb+xmsl2aCd9
         Gi5rrVYoRpAtznkx8Yr10E+wGw1E0o6j1v8ZDtJ9bQKIHqN/YuSATtfBtxE+FWT9gsRh
         jZCyEzqb0/Hq7KX3VF0kSTOJvnZBXSj/a1bOoBFn4hV6Q46SSbps0SUXQ2EhNtkeMjTw
         zSgbBStNEi/+A+GUG+ycjKKYi8elry0MiLEDI6kI3xzzS6Aynhq/dKei9mAfqpK8XEOz
         //b7upDXi4WAr0p5grE1DZjH4SfbGw5PrWJuGRoYs7KXNScU5TAH767H+LqvkAGMVshI
         JBtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781700510; x=1782305310;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZJF6u/a89oyxhTG3HTO28Hbgscfu0gN23dEPd4mDnnU=;
        b=KCX/afs7Dophha5xHsQqViRw4kG8VpxWROE6VTfx0qFOsPRcnUdPxDjazRkbT2xZ4B
         Plw4ipe3dfftPWqi1Kp3+J2SbQHM95w9mYSiaM0HGuDMCaaeu48WJ71OOhHj5MlALh5j
         OCybHVtXShXOLI2uCqcUVpdS+J6wn+gG+Cz3asVK/xRkIlFFmhoeCcHjSb4mPU09m+Dp
         jipJ9V67U1PAWfUAR0eTISwWZLo8yh1tW+JiqLBHPJyp1IQh3zQOexT9HD0dwwQ+GcQH
         s3n3N+t9ox7EdHarN5NMhtPoabee8MJ4v3dKGx2GRmZfEpFbydbpOrE/+Czb/mUSKZOm
         2XrQ==
X-Forwarded-Encrypted: i=1; AFNElJ9RfJmRbBQN17WPH3rUgZ9JRxjX/eyLxRyz0j2cUnoDhIChLpuoCAWz7PWM3UpDOb0jFZsNm0gf39GH/iaCTh4=@lists.linux.dev
X-Gm-Message-State: AOJu0YycWC37RXfcxX0edYqJEPc1BFxTp2Wb544kucrgMnL0PDPhqwPm
	pNcVsPa+29hBJI5qA1uM1xOM1vIWfaTD9VSBe2f0MPGZ9qM4wi+/NhxdiuqEZXKf5arRdFCPotL
	Z69g8GxKV2hnBv1FlSGUnLwXDPDZWh4ZuBTWZHxp+Obmygi9p3iVRlNHofGU77PYkKWmT9amCxn
	M1Pcpgy298tcW/TZoQ5CDOEqxsjS6dBrL71R8KRqm6XGxrdw==
X-Gm-Gg: Acq92OEWspv689E1pP4Ws097AWS32BCFAQ7kQJdkhjsJmJ+9oSVr2hQzUKjo1OT/pUh
	kddwCDPFOgeS4CuXTSq7EuFiDUeDa6ZDzo0dE4nQ/rCzFfAdp1z7qYzGr1j1Gq4/kYsMKemGkz8
	sfQ4/zczpZqGlAhfBDIOAxlS0YnegxR/Q2+eUG8UPDI7hoqnp7eQayrgHyw9JoH1j09WjWO96no
	XAeZcQAN8qLsCElVqEIPF8yrxP4aw==
X-Received: by 2002:a05:6a00:348e:b0:842:7992:bdbc with SMTP id d2e1a72fcca58-84524529a80mr3916400b3a.28.1781700510175;
        Wed, 17 Jun 2026 05:48:30 -0700 (PDT)
X-Received: by 2002:a05:6a00:348e:b0:842:7992:bdbc with SMTP id
 d2e1a72fcca58-84524529a80mr3916330b3a.28.1781700509240; Wed, 17 Jun 2026
 05:48:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260512-shikra-dt-v1-3-716438330dd0@oss.qualcomm.com>
 <20260513042836.073F9C2BCB7@smtp.kernel.org> <t2sw6owdxy5iyodjqsldbw6bfaqnezhgvc4hhylxuyrrbjkjto@iwf4dr5nmot3>
 <20260513142936.kauwa3czigfs7qs5@hu-kotarake-hyd.qualcomm.com>
 <0ac665bb-1a21-4077-aa9e-97162f7f4784@oss.qualcomm.com> <20260514103918.cs5m5kcxcrcgukvx@hu-kamalw-hyd.qualcomm.com>
 <obdxony34ckfbtsqj66siszw44sgieskcye5hg66ulkisctpwl@fyqczpze5tnw> <20260518114927.edxbzvklqatlntv2@hu-kamalw-hyd.qualcomm.com>
In-Reply-To: <20260518114927.edxbzvklqatlntv2@hu-kamalw-hyd.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 15:48:14 +0300
X-Gm-Features: AVVi8Cfcg5pAZuZTe-ugeVW0fqcByYJhAO0tSKWmmXXpUZyQiDgZdXY2-T4O6-4
Message-ID: <CAO9ioeVMieo8HtpRw+n4ZU9uV-_RQM061q5XfAA1Dtk2fnp4+g@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm64: dts: qcom: Add Shikra CQM SoM platform
To: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Cc: Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        sashiko-reviews@lists.linux.dev,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>, robh@kernel.org,
        linux-phy@lists.infradead.org, neil.armstrong@linaro.org,
        vkoul@kernel.org, olteanv@gmail.com, krzk+dt@kernel.org,
        conor+dt@kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDEyMiBTYWx0ZWRfX2jDAZz7vRzBZ
 61/klFxvfyde3SxxKe1KU34pkc+vucwo639QAFQzP99bSTWE9tBsMqbupjoSs5IBLxPr3PMBeN3
 WGnzadcpEfgkE2zV1vfnleGNk0QMM8ei56TxXPjdsPwpmsP5B0X67eVjN9XLzvjllyeTCql4a+N
 zdVEK34nvYZsJiMYJgtfa5A/h7H0GihBBe7zElZ5TqueXPRaIfTZVycY26v91g4bd2x+tHmftLp
 ycsn+6/5FohEvakkv1AjExeNaYnmU1OCyZ9aO0gVmuZDKfHwCLPfRxW1T6fpkRk7Gy3IxFxxRQa
 VK+yDbwHyMLhDS6Y8FNeH2xAm8Me1ux1ZAR8zTOnjUgRZJ251Q/Odb4a3xhINU+n1SRcTflkgaO
 cK+qaeD+ctPbFqVDpu7LYCDZUkfO5WJl7klhEwm1yK9Cxm9ow6edQZduJSIluDTK4QeFpM6gpnl
 4vc1mIyG1qQ0nYKSBPg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDEyMiBTYWx0ZWRfX64hGmlj7mQn+
 JrbDU8sq0iI+AkviwXpqMT8MmCiHKPfmYIeSQq8hBlyaI6R6Ps18ACwkB3RhQKGL80ca1Hq2Mzs
 88/U1loTgj4JIr2lfM+4KqyQg76WBoI=
X-Proofpoint-ORIG-GUID: QIpluWpPUMlIMY0HE6oTIlPOE-_ZwKbk
X-Proofpoint-GUID: QIpluWpPUMlIMY0HE6oTIlPOE-_ZwKbk
X-Authority-Analysis: v=2.4 cv=ePojSnp1 c=1 sm=1 tr=0 ts=6a32979f cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=AXN0PHSXbqqaHeSrhoAA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170122

On Mon, 18 May 2026 at 14:49, Kamal Wadhwa
<kamal.wadhwa@oss.qualcomm.com> wrote:
>
> On Sun, May 17, 2026 at 08:18:15PM +0300, Dmitry Baryshkov wrote:
> > On Thu, May 14, 2026 at 04:09:18PM +0530, Kamal Wadhwa wrote:
> > > On Wed, May 13, 2026 at 06:14:20PM +0300, Dmitry Baryshkov wrote:
> > > > On 13/05/2026 17:29, Rakesh Kota wrote:
> > > > > On Wed, May 13, 2026 at 03:01:47PM +0300, Dmitry Baryshkov wrote:
> > > > > > On Wed, May 13, 2026 at 04:28:35AM +0000, sashiko-bot@kernel.org wrote:
> > > > > > > Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> > > > > > > - [High] The PMIC regulator definitions omit their required input supply dependencies (e.g., `vdd_s2-supply`, `vdd_l3-supply`), breaking the power hierarchy.
> > > > > > > - [Medium] The device tree inaccurately hardcodes the `compatible` string to a different PMIC model (`qcom,rpm-pm2250-regulators`) instead of explicitly identifying the actual hardware (PM4125).
> > > > > > > --
> > > > > > >
> > > > > > > commit 457abf6e7ac410430c866842e08e602ec3daaa51
> > > > > > > Author: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> > > > > > >
> > > > > > > arm64: dts: qcom: Add Shikra CQM SoM platform
> > > > > > >
> > > > > > > Add device tree include for the CQM variant of the Shikra System-on-Module.
> > > > > > > This variant integrates the Shikra SoC and PM4125 PMIC. The DTSI includes
> > > > > > > the common shikra.dtsi and adds PM4125 PMIC regulator definitions.
> > > > > > >
> > > > > > > > diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
> > > > > > > > new file mode 100644
> > > > > > > > index 0000000000000..401e71720519d
> > > > > > > > --- /dev/null
> > > > > > > > +++ b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
> > > > > > > [ ... ]
> > > > > > > > +&rpm_requests {
> > > > > > > > + regulators {
> > > > > > > > +         compatible = "qcom,rpm-pm2250-regulators";
> > > > > > >
> > > > > > > Since the commit message indicates this is a PM4125 PMIC, should the
> > > > > > > compatible string include a specific identifier for the actual hardware?
> > > > > > >
> > > > > > > Using a specific identifier like "qcom,rpm-pm4125-regulators" alongside
> > > > > > > the fallback allows the kernel to apply specific quirks if PM4125 errata
> > > > > > > are discovered later.
> > > > > >
> > > > > > This can be ignored. The compat is a leftover from the historically
> > > > > > incorrect naming.
> > > > > >
> > > > > > >
> > > > > > > > +
> > > > > > > > +         pm4125_s2: s2 {
> > > > > > > > +                 regulator-min-microvolt = <1000000>;
> > > > > > > > +                 regulator-max-microvolt = <1200000>;
> > > > > > > > +         };
> > > > > > >
> > > > > > > Do these regulators need to explicitly define their input supply dependencies
> > > > > > > such as vdd_s2-supply?
> > > > > > >
> > > > > > > Without these properties, the regulator framework might be unaware that the
> > > > > > > PMIC regulators draw power from upstream supplies.
> > > > > > >
> > > > > > > If the kernel dynamically manages the upstream supply and its reference count
> > > > > > > drops to zero, could it be disabled, causing an unexpected power loss for
> > > > > > > downstream components?
> > > > > >
> > > > > > And this is a correct comment. Please provide missing supplies.
> > > > > >
> > > > > As per the Qualcomm system design, the parent-child supply relationship
> > > > > is managed by the RPM firmware, not the Linux regulator framework. The
> > > > > RPM ensures the parent supply is never disabled until all subsystem
> > > > > votes are cleared.
> > > >
> > > > How is this different from other, previous platforms?
> > >
> > > This is not different. In the previous platforms too this is taken care from the
> > > RPM/RPMH firmware side, the only case where we may need explicit vote to parent
> > > is for non-rpmh/rpm regulator rails (like i2c based regulator pm8008), which
> > > may have a RPM/RPMH regulator as a parent.
> > >
> > > Even on those previous targets the parent rail of all RPM/RPMH regulators are
> > > internally voted by RPM/RPMH FW at proper voltage with required headroom
> > > calculated based on the active child rails. This was done for all the
> > > subsystems (including APPS) regulators.
> > >
> > > So no explicit handling from the APPS is required for parent supply.
> >
> > You are explaining the driver behaviour. But the question is about the
> > hardware description. If there is no difference, please add necessary
> > supplies back.
>
> I understand your concern about descibing the parent-child relation in the
> devicetree, and given that we have been almost always followed this for all
> the previous targets, it will expected of us to add them.

Yes.

>
> However, we want to avoid the unnecessary access to the parent from APPS.

Why? What is the reason? Do we want to do the same for all the
platforms? Only for Shikra? Something else?

> At the moment, I do not see a way to avoid that, if we add the parent
> regulators.

That depend on the answer to the previous question. In the end, we can
make the driver ignore the parents by removing them from the regulator
desc.

>
> @Bjorn, @Konrad - can you please also share your suggestion, how we can add
> parent-child desciption, but avoid accessing parent supply from APPS, as its
> Qualcomm's system design to handle this on RPM/RPMH firmware side (you may
> recall we had a verbal/offline discussion about same concern in context of
> RPMH regulators earlier).

That's why offline discussions are bad - you can't include other
participants in them.

-- 
With best wishes
Dmitry
