Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56129366822
	for <sashiko-reviews@lists.linux.dev>; Mon, 18 May 2026 11:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779104979; cv=none; b=jr0XTPzCeE1fE5n1Gu1uDDh3Cll9iTzqhV7VRlS6QImZYF8U5Xp7zgF7pgE7S4VZKylVkVmciA3indPyOo2Qjghwg5Fm2S0KIoBMdwyVrhelXA95+52Y8zuyMQ4mbmvtpF95+c+BUiKDU8LO/x27c/MKrgjQD/+7JBemaS3Sbow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779104979; c=relaxed/simple;
	bh=ggMEHcs5HFtDlO0Y7BOPL05ocsgDej3md/z6l1tZZTU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uQ6sBV0tTV3rNFafvallQauPfyDx6Qg1qa/HVhg3fK710xUnGgogXUMj0SKjOgog62XNAXgeekCQt6q9pAaBng6345LjjkvtATQqbW5KFZSEezJb7bwl+40wEDt6ou65qhYpFLUK5N5TZk4n/+FLe0skr8k0lfD958KMWXELtSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HXlVxNh/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TfLTF+db; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HXlVxNh/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TfLTF+db"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I73bSD3838482
	for <sashiko-reviews@lists.linux.dev>; Mon, 18 May 2026 11:49:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZQaHAH77x0UG4O6dV4fD7MS0
	JvjE3rw7N/l4jr5UMT8=; b=HXlVxNh/Q+dNp8wB16Qx23FRFj0Aw++Ou/LkEs3a
	CIThIg69eKJs6wBCPu7eB+eSXvp1A0E5OLSsTraso3AWCJa21eLjQrCdcFOjKU3F
	NFdZCPF3pSaXl6zsAm9KOwGhKHKSdwS6ipfViW+gz0GVuPzSyaAFLpvXyD8aag6l
	2CHX0aRkG/YeXNyEBKSz0tn37PcgCPXaMVDGosnn6ikAWC/f/Jhvbraw6p2Psz/h
	SH36LhANVIglbpMzx67cft/dNyJKEjTNJEsRK5zZ8zHuDmLQ1TTHQYUi4zWNzaN5
	bShTzGUc9lQFzMLjOcJXcmFWM0Ed7URw8m2AzZGgFNgn7w==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6hv7x7m3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Mon, 18 May 2026 11:49:35 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-837cc5bc6deso1246466b3a.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 18 May 2026 04:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779104975; x=1779709775; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZQaHAH77x0UG4O6dV4fD7MS0JvjE3rw7N/l4jr5UMT8=;
        b=TfLTF+dbAyQxBjVcwdc4RXwAzsIXGQCKf04CWw0t2yVT20TfEr79oucKOGkpEB/4P3
         I8HPMQNLT8k3wKylctqbN28CZ7aKjMaUTN9MTkdc7Yo+HjmlYK/CW4EI0+frNBxG+9k7
         gQIHhSH/AexCysd6dw8QXTyMjWHKpMmlj3Q6bDyk+RUUBMQgGJQFz7jtl7SI/7r8u8a2
         WobQj9/z1IvInH6lfTvmZBXeHF3/aP4aLiOHW3VcnqNfn5coya9cCSjyt48gLs7pQsrT
         udju20295G4Px6RWZzuLU9KdBfFS/VJizEv9Cx5nCeaPwebxCaq7gDE1qVLi2IVQBJTN
         2XJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779104975; x=1779709775;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZQaHAH77x0UG4O6dV4fD7MS0JvjE3rw7N/l4jr5UMT8=;
        b=CA5F/4ZRJnNKLlGi40HQiEyxU1HjBqR/wSTCEfQYHEVtrSGu4uwCq8Hq2yGzEsH6DK
         zHkIZxtNs034ZNbJy+PNSX67ON3LF5hCdA/9eD8hg3jYXUcoYSZOHMjr/NB8wDUXmSpg
         yD3NEzO0NhhRP0yeFZh5zKnjJ+gJlnXZAWicMSJxKJa0E7y4rikCM+EgX1uWy0SWt7B+
         QnR+FctdNSv5flKAtL8NOvnpSjxMmHe4j/W0u9bs5lq+N3FzvrgY3T89yAtWIBOBlv/e
         d7y6r5o3YHZs2JHJzTwtNBRGZzdSStrSzqbMYjwqCJ5VauC14V2+z/PfiBm5GBn8Z89W
         Drzg==
X-Forwarded-Encrypted: i=1; AFNElJ/fcfh/5uwWaZ6b2cjtkmmSehhfWIPQOSK4XufMlyB2C/gzD1Nkhcj/Zcka9KEn6sI+lkmflj+A0tk64XqkXaE=@lists.linux.dev
X-Gm-Message-State: AOJu0YzxnpajR99GD2kenwnqkrr6OBhyTnAuKUTqP3aAcH09s+LxsLSP
	RLifXVJ62g4J6rR2cV+Y2fURY/4n0dnsrXxUrAgItzuvi7OpEacxBJL+Edkdle2Hnj0vTpogodP
	teBdkDeFArHBbjQzBnhBvH2cCjOyB3SVJ3TUtkPhoZMFZX8M+wiz/+tqRoXrMbH3Jr8KR688=
X-Gm-Gg: Acq92OH36i+czo0FnI6zQx2bav5lu3AI4nEFyyrNxB5pUrXp9B+RaAlIIDWqOUXkqME
	WFfNqPW4EjPVBGrCD4lK30BzyEy9IpW/1aq5z8Vf0ZxWGIzkDVaLtrF6Rb3eTRgZxD8LNkgWZOv
	WVntfdD4IVqx2MhmaTSVqDWKr6yxKfdBqn1luNrUy/20IT013Af1HFPJPGwrcOUcdwECLkbopVL
	gUtuSikaTpQ2Bx+XHdJpC2yh6VG6tKOXGl6UhMTGxvnKWAh1RYmTD6wd9jLfDVD2Ueu9v3OkSo5
	RSwRxD8UZmKp/VoSxLwXAqKxQjxPAgvXUM4GOef55IVEXXeu4Fu/zPNn1G23K0/FVzneY/4vCJE
	qNszxSB4yJNiLXFs7nRzue5+TTOtoJoR18OPkEI6o1Cw1TWbqwL4=
X-Received: by 2002:a05:6a00:3005:b0:839:3ccb:7038 with SMTP id d2e1a72fcca58-83f33d336fcmr15496732b3a.48.1779104974853;
        Mon, 18 May 2026 04:49:34 -0700 (PDT)
X-Received: by 2002:a05:6a00:3005:b0:839:3ccb:7038 with SMTP id d2e1a72fcca58-83f33d336fcmr15496694b3a.48.1779104974195;
        Mon, 18 May 2026 04:49:34 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19c5c3a9sm14436791b3a.38.2026.05.18.04.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 04:49:33 -0700 (PDT)
Date: Mon, 18 May 2026 17:19:27 +0530
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        sashiko-reviews@lists.linux.dev,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>, robh@kernel.org,
        linux-phy@lists.infradead.org, neil.armstrong@linaro.org,
        vkoul@kernel.org, olteanv@gmail.com, krzk+dt@kernel.org,
        conor+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: qcom: Add Shikra CQM SoM platform
Message-ID: <20260518114927.edxbzvklqatlntv2@hu-kamalw-hyd.qualcomm.com>
References: <20260512-shikra-dt-v1-3-716438330dd0@oss.qualcomm.com>
 <20260513042836.073F9C2BCB7@smtp.kernel.org>
 <t2sw6owdxy5iyodjqsldbw6bfaqnezhgvc4hhylxuyrrbjkjto@iwf4dr5nmot3>
 <20260513142936.kauwa3czigfs7qs5@hu-kotarake-hyd.qualcomm.com>
 <0ac665bb-1a21-4077-aa9e-97162f7f4784@oss.qualcomm.com>
 <20260514103918.cs5m5kcxcrcgukvx@hu-kamalw-hyd.qualcomm.com>
 <obdxony34ckfbtsqj66siszw44sgieskcye5hg66ulkisctpwl@fyqczpze5tnw>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <obdxony34ckfbtsqj66siszw44sgieskcye5hg66ulkisctpwl@fyqczpze5tnw>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDExNCBTYWx0ZWRfXy+NqUd6iPZXF
 uhxBkQH+Kcl4qtFevw4Rl6ggeOuGgAYhdTlFFzZNlqYTHA4jPe54MlBIiUAG+YBSm/xc+jF4Bhg
 khis9CIBObP1IDvhu7IJRsupCNGpu/MNfNWGNJozXV6herBeiY50To2HCEF1nw2anN4yJgeOfu9
 ZZ+NSOPVrUssEv+m1nJ8V5KQzCQiGN/RbqbJzt3dqMwiJJH+yZatUtEz5QgsWGtvlPYHOtvwgED
 6A1ACLRmTTPhZ7JJZKG3a1xKq6VZTR8IUHojsSbJicUkvqYQMHDK6uNqnO565OSMNCcHfTl9ybu
 b5Kcfvk6Kq8F1gXYYawR57vMvkijGjQr+8bXTjHYaPQKdTC6uQDpl5eo6MZlVOeg/OvcS65vGnT
 T8boxWdMYV7jkA44nKcXx9743FG8Ro5U5P8r/rkspkxjqjK960Nibv4xDUUloQ0nH01EawyrJDP
 Qpq00LoE8rhW2QzvIhg==
X-Authority-Analysis: v=2.4 cv=a8oAM0SF c=1 sm=1 tr=0 ts=6a0afccf cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=22Q9nnmWW0f7vvM8ERgA:9 a=CjuIK1q_8ugA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: FCNesFfcuVXmeA1BqvJbY9PktW0FfK_8
X-Proofpoint-GUID: FCNesFfcuVXmeA1BqvJbY9PktW0FfK_8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_03,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180114

On Sun, May 17, 2026 at 08:18:15PM +0300, Dmitry Baryshkov wrote:
> On Thu, May 14, 2026 at 04:09:18PM +0530, Kamal Wadhwa wrote:
> > On Wed, May 13, 2026 at 06:14:20PM +0300, Dmitry Baryshkov wrote:
> > > On 13/05/2026 17:29, Rakesh Kota wrote:
> > > > On Wed, May 13, 2026 at 03:01:47PM +0300, Dmitry Baryshkov wrote:
> > > > > On Wed, May 13, 2026 at 04:28:35AM +0000, sashiko-bot@kernel.org wrote:
> > > > > > Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> > > > > > - [High] The PMIC regulator definitions omit their required input supply dependencies (e.g., `vdd_s2-supply`, `vdd_l3-supply`), breaking the power hierarchy.
> > > > > > - [Medium] The device tree inaccurately hardcodes the `compatible` string to a different PMIC model (`qcom,rpm-pm2250-regulators`) instead of explicitly identifying the actual hardware (PM4125).
> > > > > > --
> > > > > > 
> > > > > > commit 457abf6e7ac410430c866842e08e602ec3daaa51
> > > > > > Author: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> > > > > > 
> > > > > > arm64: dts: qcom: Add Shikra CQM SoM platform
> > > > > > 
> > > > > > Add device tree include for the CQM variant of the Shikra System-on-Module.
> > > > > > This variant integrates the Shikra SoC and PM4125 PMIC. The DTSI includes
> > > > > > the common shikra.dtsi and adds PM4125 PMIC regulator definitions.
> > > > > > 
> > > > > > > diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
> > > > > > > new file mode 100644
> > > > > > > index 0000000000000..401e71720519d
> > > > > > > --- /dev/null
> > > > > > > +++ b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
> > > > > > [ ... ]
> > > > > > > +&rpm_requests {
> > > > > > > +	regulators {
> > > > > > > +		compatible = "qcom,rpm-pm2250-regulators";
> > > > > > 
> > > > > > Since the commit message indicates this is a PM4125 PMIC, should the
> > > > > > compatible string include a specific identifier for the actual hardware?
> > > > > > 
> > > > > > Using a specific identifier like "qcom,rpm-pm4125-regulators" alongside
> > > > > > the fallback allows the kernel to apply specific quirks if PM4125 errata
> > > > > > are discovered later.
> > > > > 
> > > > > This can be ignored. The compat is a leftover from the historically
> > > > > incorrect naming.
> > > > > 
> > > > > > 
> > > > > > > +
> > > > > > > +		pm4125_s2: s2 {
> > > > > > > +			regulator-min-microvolt = <1000000>;
> > > > > > > +			regulator-max-microvolt = <1200000>;
> > > > > > > +		};
> > > > > > 
> > > > > > Do these regulators need to explicitly define their input supply dependencies
> > > > > > such as vdd_s2-supply?
> > > > > > 
> > > > > > Without these properties, the regulator framework might be unaware that the
> > > > > > PMIC regulators draw power from upstream supplies.
> > > > > > 
> > > > > > If the kernel dynamically manages the upstream supply and its reference count
> > > > > > drops to zero, could it be disabled, causing an unexpected power loss for
> > > > > > downstream components?
> > > > > 
> > > > > And this is a correct comment. Please provide missing supplies.
> > > > > 
> > > > As per the Qualcomm system design, the parent-child supply relationship
> > > > is managed by the RPM firmware, not the Linux regulator framework. The
> > > > RPM ensures the parent supply is never disabled until all subsystem
> > > > votes are cleared.
> > > 
> > > How is this different from other, previous platforms?
> > 
> > This is not different. In the previous platforms too this is taken care from the
> > RPM/RPMH firmware side, the only case where we may need explicit vote to parent
> > is for non-rpmh/rpm regulator rails (like i2c based regulator pm8008), which
> > may have a RPM/RPMH regulator as a parent.
> > 
> > Even on those previous targets the parent rail of all RPM/RPMH regulators are
> > internally voted by RPM/RPMH FW at proper voltage with required headroom
> > calculated based on the active child rails. This was done for all the
> > subsystems (including APPS) regulators.
> > 
> > So no explicit handling from the APPS is required for parent supply.
> 
> You are explaining the driver behaviour. But the question is about the
> hardware description. If there is no difference, please add necessary
> supplies back.

I understand your concern about descibing the parent-child relation in the
devicetree, and given that we have been almost always followed this for all
the previous targets, it will expected of us to add them.

However, we want to avoid the unnecessary access to the parent from APPS.
At the moment, I do not see a way to avoid that, if we add the parent
regulators.

@Bjorn, @Konrad - can you please also share your suggestion, how we can add
parent-child desciption, but avoid accessing parent supply from APPS, as its
Qualcomm's system design to handle this on RPM/RPMH firmware side (you may
recall we had a verbal/offline discussion about same concern in context of
RPMH regulators earlier).

Regards,
Kamal

> 
> -- 
> With best wishes
> Dmitry
