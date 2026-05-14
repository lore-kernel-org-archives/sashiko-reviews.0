Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5677E39E183
	for <sashiko-reviews@lists.linux.dev>; Thu, 14 May 2026 09:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778751028; cv=none; b=DCfpc0X7294ic3lhLBnvh1TC6SNucg3/4wfDV3ZNpaOUlu7cPlOScHnd7YYx3dbev/G5sIe0NGQVR6rrYHMuKwSkfrEO13kdv2kgykdn4FyMWIu4pIHGhHMX6OWAut8p/uL9ZftqfQzJ+LvTBrPv6KrarNOenpp3EPMX8mFAC7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778751028; c=relaxed/simple;
	bh=LyFf995dNEgEaB23LV2UQvB3BQjVdJ9TXjohIsaE8F4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q+M5w4PSoZVGHTuSvwph5RUUvhidPkeodssl+0/J3mtgqcJhKwIdODHG289/6lGG8mOMwG6vgHQ0ZKFmYW1gR7goED4IsTYE1hSRT6M+yFZVDvAsTXHeKx4rkXTCEZGuddRG3Tu2npS9cP+3o09kfI0U8GLGFboHpXlFfzNYIUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lGLTJmJN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EpGi9Rgp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lGLTJmJN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EpGi9Rgp"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64E9AGAm1095327
	for <sashiko-reviews@lists.linux.dev>; Thu, 14 May 2026 09:30:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7TNaHVHvzRGoJzjJ8UVs2Dp0KY9HXSlRl8lXaUGNQfQ=; b=lGLTJmJNQ3lzYVYM
	bFgSgLn3ppjdiEKtS8s8JHxPtwoRu7RIwM7Ra/nqKbfKnRTZpk2Izldub2wKUQi9
	63lb6G0Wsa/MFwdE6v3VNNbpisSshDbzMHP2phCxrYHh0D2eAKVbQ8mIGtjOmkuX
	7hSkYxaPo75qHEryhJXxL4R+AV9oVsRwFmNxMxhEfjxFI7N3GxjxmUYyjgaO4tb1
	95cdQM2ERK/+Y99owVx9xlWLmIskniDpNXe1+OeFVipIbkdZOZfl/FMXYJve29HF
	sqXHPT0Dga3XC2q0UKNKijZJNsjG6IX4O0PdHuG8KLyzxueQQSgj70lmULkUSNlr
	MtRAoA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e563hh8ge-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Thu, 14 May 2026 09:30:26 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51650041428so2643231cf.3
        for <sashiko-reviews@lists.linux.dev>; Thu, 14 May 2026 02:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778751025; x=1779355825; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7TNaHVHvzRGoJzjJ8UVs2Dp0KY9HXSlRl8lXaUGNQfQ=;
        b=EpGi9RgpLBAqsyERXuCCdg+4Ed0FOX9tlIP/WAToZUBgXRMFzd+fpplLicR+tSmjpM
         24fbMRgzYQzrd/s5aWtsMIIw3sgO6fqwjtyIW4i2WmuBLs28NKa+fybT3knKROEP8bqh
         Ra9fjs9L6AErgW+YD7PbVNkIasgHqOtiM3pmBRLzqJ7y1tVu7NJ8kpEerz5yK1bJIWgF
         WQ3eL5tzqeHwBmJmBMOxcZwtz2LI73HQoW0MVq6qGQOATP63me6Lgz6KQ8M16jTIjUXd
         dx6eElwPT6a5gOSv2W9BFjqp5xFbu7JmxBmidMxAhB6PIyCGWPvu8Dbk0Bf2uH7vTlPK
         dcyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778751025; x=1779355825;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7TNaHVHvzRGoJzjJ8UVs2Dp0KY9HXSlRl8lXaUGNQfQ=;
        b=ow4rCFXBhJcBm1Vf/xXLy4AyCqiee1ybUbyF0f4eJGcm3BbjzwsjgOJUglwxbXV+0c
         1qJhem/OsABToUpcclGt7wGGGc3iNK1DxijU9m1CIaKKFyowCj/VGCY664z27PlMyeL6
         /H1B4EUwNVrJ6olC72ASNyyk87Zq6r2ty81staXzHKTVOAk7KULocQjmejRnc9mZPG1d
         UbwmAtWqmEM0moJ6k6o9cnmEVhRjuYZmAcutcWpfiGJzxH2ZRcjgnx4vMzKFU9S4fI5T
         dl/teLrJjtLedWEjoL80f1g1evjPXiAKOeVNRUyU8MMki5m0We57udxFPB3a2RxWGOeL
         Za0A==
X-Gm-Message-State: AOJu0YxFV1Qby9re7oF6vxn/n7lYH1TuaLGXna4Op/vymt6Fnbj5cqE4
	j3gO7v7hr2xh3Y2cNKwDggXZLyLbUkBrVifZWDi884fom0WL9J9x7tVoFlnRbRbtiYEgyTsE1MN
	PhFIINlTsG9mUjEiQV9GjC8nfa54c3v6455sbtUxrh73B3g6cAuTuoXt7x/14IAnOBpCBcmhh7d
	oaB0I=
X-Gm-Gg: Acq92OFzTMmOyQM7wHs+pPY91+yXG56l9jecxaVokgb41WAD9yCOeBdlIZMktY5Bdso
	aoJeZW3w49zSIF2D62oQuU7G3H4sMZgcQAkZKmx2q1emejheYD9iJkMVXY6OGo1jryom7yZ7lX1
	HS/F2pPUnOSWGeH5fiRSqBN04lNP89oaWl/OzbZV5S4JrMWayxudRFbet/8E66W0tk3I9y+sZAe
	HyKTxkJbWUk8r4T4M6QF5t6Tu0aXaCKDgWd73Dv8eDB/pzUdYdf3mCdLUY4gVFu0BpN9K7GgWYn
	W3s196totK5TdNIVyOFcP2sXR6WgOB24j5Ui1Tgsxumt+xaCHA2QNAO8b124vMX5YU5ShFyALiP
	C8KZtjWn0ZVh3vdpsHKiTDBXfkZEQX98Mblh83eIfyoGVtLQvIVoMrXPK0ceGFSBrYZ3M0cGJJF
	i9FzUmSycSAAPBSAhQCyTw6wQZLFFmr6jn9aA=
X-Received: by 2002:ac8:5dcb:0:b0:50f:b8e9:a0a3 with SMTP id d75a77b69052e-5162ff0dd7bmr86756711cf.34.1778751025491;
        Thu, 14 May 2026 02:30:25 -0700 (PDT)
X-Received: by 2002:ac8:5dcb:0:b0:50f:b8e9:a0a3 with SMTP id d75a77b69052e-5162ff0dd7bmr86756321cf.34.1778751025045;
        Thu, 14 May 2026 02:30:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3945c58139dsm4672921fa.0.2026.05.14.02.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 02:30:22 -0700 (PDT)
Date: Thu, 14 May 2026 12:30:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, robh@kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v6 5/6] arm64: dts: qcom: sm8350: add Iris device
Message-ID: <fhxdcymqai4numca64g35zil5ing6u4nujdgf2hgjndlbtxyn3@bgfujizpfaej>
References: <20260513-iris-sc8280xp-v6-5-0d11d90d3e26@oss.qualcomm.com>
 <20260514053808.38185C2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260514053808.38185C2BCB7@smtp.kernel.org>
X-Proofpoint-GUID: GrjLRVbOY3GrRq4-vMu-aZTxnuKHX0dU
X-Proofpoint-ORIG-GUID: GrjLRVbOY3GrRq4-vMu-aZTxnuKHX0dU
X-Authority-Analysis: v=2.4 cv=DewnbPtW c=1 sm=1 tr=0 ts=6a059632 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=c92rfblmAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=Cw5jVxbl6wvLIJzyfCIA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDA5MiBTYWx0ZWRfX31W+7URiygse
 7ejsf3Kdna594Q0FmwGigw0OFbV61nr+p+zRgfKynIyjVYDNdbedblti30raP0XQIxMhR8vSg6r
 5vkGdvyqnOGfFXTPf+JSQzUHs7gOYpeFVOXIWe9jlTYSlF1XSGP5hjTYlQm7nuBLAq2qh8E7quS
 +UDeI2lUX2CVqQCIEX25mTg0DH63qbFPOIeqQP19dIskO24ruUWabnwBNuqVH9vwdzQjWiY3bHF
 pj3xI0/Zt/aNtwB2YcR4GGFJ5a/JgomrdhDpyCpfCrE0MuuWkkoexbKv72Cve4390geteDh7szx
 Bqwuw8IEQZiZ1AtAUFmrVLlOGPj6nZVT3qlIyaw0vndES3c2dMRqwLTRSIwkuBLrE0t8ayIbe+t
 ucubV9SzF0CcKaBt6OPeCo6pESG/fsC7ZPUQRb/Kz99yeyZBxKL7SLRR7fWbCbHutJCa0TOxweW
 17hTgiQU01f1X2JVpgQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605140092

On Thu, May 14, 2026 at 05:38:07AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] Missing power domain management for `mmcx` in the fallback driver leads to voltage underruns at high frequencies.
> - [Medium] Device Tree schema violation: `power-domains` count mismatch for `qcom,sm8250-venus` fallback.
> --
> 
> commit bd1540a2aea97fb87b08697e9a713ca663a208e8
> Author: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> arm64: dts: qcom: sm8350: add Iris device
> 
> This commit adds the Iris video codec and video clock controller devices
> to the SM8350 device tree, describing the Iris2 core present on this platform.
> 
> > diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> > index 5c8fe213f5e4e..eedf677a7070d 100644
> > --- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> [ ... ]
> > @@ -2745,6 +2747,85 @@ usb_2_dwc3: usb@a800000 {
> >  			};
> >  		};
> >  
> > +		iris: video-codec@aa00000 {
> > +			compatible = "qcom,sm8350-iris", "qcom,sm8250-venus";
> > +			reg = <0x0 0x0aa00000 0x0 0x100000>;
> > +			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> > +
> > +			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
> > +				 <&videocc VIDEO_CC_MVS0C_CLK>,
> > +				 <&videocc VIDEO_CC_MVS0_CLK>;
> > +			clock-names = "iface",
> > +				      "core",
> > +				      "vcodec0_core";
> > +			power-domains = <&videocc MVS0C_GDSC>,
> > +					<&videocc MVS0_GDSC>,
> > +					<&rpmhpd RPMHPD_MX>,
> > +					<&rpmhpd RPMHPD_MMCX>;
> > +			power-domain-names = "venus",
> > +					     "vcodec0",
> > +					     "mx",
> > +					     "mmcx";
> 
> Does this configuration violate the device tree schema for the fallback
> compatible?

As with the other patch, no, it's handled by the merged series.

> 
> The qcom,sm8250-venus schema limits power-domains to 3 items (venus, vcodec0,
> mx). By adding mmcx as a fourth power domain without updating the
> qcom,sm8250-venus schema, running make dtbs_check will result in validation
> errors.
> 
> Furthermore, because the kernel lacks explicit driver match data for
> qcom,sm8350-iris, the device will bind using the fallback qcom,sm8250-venus
> compatible.
> 
> The driver configuration for sm8250 strictly requests and attaches only a
> single OPP-scaled power domain (mx), completely ignoring mmcx. This means
> mmcx will not be dynamically scaled by the PM OPP core and will remain at its
> static initial voltage (likely low_svs, as requested by the videocc clock
> controller).
> 
> [ ... ]
> > +				opp-444000000 {
> > +					opp-hz = /bits/ 64 <444000000>;
> > +					required-opps = <&rpmhpd_opp_svs_l1>,
> > +							<&rpmhpd_opp_nom>;
> > +				};
> 
> Will this cause a voltage underrun when scaling to higher frequencies?
> 
> When the hardware scales to 444MHz, the opp-table mandates that mmcx
> requires nom voltage. Running at 444MHz while mmcx is starved at low_svs
> due to being unmanaged by the sm8250 driver configuration could lead to
> hardware instability, crashes, or synchronous external aborts.

The same.

> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260513-iris-sc8280xp-v6-0-0d11d90d3e26@oss.qualcomm.com?part=5

-- 
With best wishes
Dmitry
