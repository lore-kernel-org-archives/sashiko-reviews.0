Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA0A36CE10
	for <sashiko-reviews@lists.linux.dev>; Mon, 15 Jun 2026 23:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781567995; cv=none; b=aT/6bZcIz7p+ks1Mrny1FMKG9bA6mv/HudcBqY8ZvokW15DixP4eaDJNiwe/O6E9tSzIbuboThhRAoMivCGJoC96Sb1j6NUfxwGYdmeEjVvBElUtYJrMdHquV/h8BQ84I7v0LdDyOJSXkZd/83q2JShJGG6d/TCx0bTAevmH4q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781567995; c=relaxed/simple;
	bh=qYdZANNrh+1rBcjj0sjdqPZQNdJybPkQRdix2i2ADhk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RaOKmeZRlKrDsB2fM/sNYu3mfjCeCTdvpq1/co520RpeOF1Mwdp74mPpUfYITKTeKo09IA06Fnf3AF/tobBl5k9zsHA7cfk8vWcEH9Xf22ujjPnAJ4KFOUPftAZJZBF7Tt/albiTAOP21hpljA2D3unFR5p0CCAl4Si+c98UkL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IqWuZMg3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=firpvDaL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IqWuZMg3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="firpvDaL"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FJ1TfM1220614
	for <sashiko-reviews@lists.linux.dev>; Mon, 15 Jun 2026 23:59:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X1+NqhAiejMS2vQskIfQNFtVS24ac5HJGsGoWPBxgNU=; b=IqWuZMg3kIdD9sTc
	A57tdiKBThS/I7eq4ivqXQAgBEFvTsudL6Vgu0ZRltdVuEQIqWzCxnW2UzInq7nc
	isd4dU4YqqbqxuWzDmB2hIJHp6LSXeDG8eW/9svutk9aEBgQdVbGDc7EinGrqL8/
	GwSS8h4TzyPCJyhyrGxAEY3uCdpBmMpEl+tA9expTkCGPTHZWEGQDG1FlCHi4DCb
	bfIAp/Pp+vTFEwPo5PQ3jrIhFG2gZdeLGoryI3J7Mc1f8weuqe1vlG+R41hRIfcM
	lPjKm6uGgb8J0UoZpPbpYvJKKC97qwNF8Osn+rj9u1z3yjWUsD2kTF16tNqDelnT
	5+NvUA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etevx3n9k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Mon, 15 Jun 2026 23:59:53 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8cce1cc8cb2so81160796d6.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 15 Jun 2026 16:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781567993; x=1782172793; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X1+NqhAiejMS2vQskIfQNFtVS24ac5HJGsGoWPBxgNU=;
        b=firpvDaLHgmIhRYCQrWGfGZQMOV43Z17VlAUAAgpSj7oDeWjApCKTW1JQfqJZre9wu
         OPcZPWXmyYFaZvu2aWL1+3DyRVuRRAlP0ayCw5HS0zzNYp2Ly2KIVbpp7YcyyvKM/RdZ
         QogtJ5Am2XALsE2GG8cNxAf7wDmYSPynaA8rjNj5R4qECEgxibRG06vovbKe1VvyKMqx
         XlEVgXI1faQLDlM7kXyLv6I0OTax0xCA8EQEOlnU/dsqjU+2glhhyilBwCYMY8Pp0iIu
         WkdR8NM2Y/ZfR9GYdHnMQ5A3ax7K3CA68PJgDlgJ+5VgXnIZ6qNqDMdxwHQlPXMl2uS0
         CaiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781567993; x=1782172793;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X1+NqhAiejMS2vQskIfQNFtVS24ac5HJGsGoWPBxgNU=;
        b=Xtm8hkLjZQHj9kjfdkcaMkjZXKZRPqWtV7RneCYQBG98q5iatVL6vkJ5w9DyUj7UDG
         YQa9aw64rLUSYJ/AdnoJiiFv24cJ/bVKIPoIEWO9jpKGn7LIsHd79JDuA4zFFaFnh1Bj
         vbPpxI0OtKgt3tN5FalpyMw+GW5idUglUCcBz2JiLHPGnpwSX2fPY9sPUFgXNZbrH39M
         g/C2oyXZ175PQiQyFfU8UIU4aYiOVyGcMRL9aACgYdL71oFL7/aMLeRnBy0GOlFSN9Je
         AM7sHkLYJqm9946jMqOF838m1OmC/hzaXCPqRc0Ts7OJ4HzZbFtkJI8NmUK6k43IU1cm
         GlZw==
X-Gm-Message-State: AOJu0YzIZWpb9CwTIjnLNL6z2DZW9Fm6XdWhzBhd0vIaYIrpRF/49iIi
	8Icfafr51/TyxQK5npY+d4Q4aMvs72hMAL2GzQePNKrjtUrKPqgbcTahvtdiWk65VjSyEWzoiOg
	FExkjLNf6z5JN6QvI9s9CJMBu1aYpviAY+kPcSnCVvPi2yjVXmy4KvB0Jxk4sUuc7PkM9Hwj30r
	IJTUg=
X-Gm-Gg: Acq92OHE3xgu4U/8URrLyAxJqq5CGw2bKrK8xX6Uoeiqn0OcsdkOV3HY0EQoaoz54/s
	TbYWNMXObgFeva+dJMhYTbi1Q7+V9VKzh6X37V2y5AIRnENfmLWt3KK1zT1Q9XuWqB+JtzfHPik
	rtzwiTUPq5r48gdV2ix2Rhw5UPxFA+cpDKygcpVXWp2x7Rg68rCUzFeHaPHZDcxjrAaNwbftX02
	DIM00AnJiYJAQG5yEwmQmwh/Va5EgQqZ1QNFYepmmkdVdhPVw1ecv4rHutSWFyWjbHnlkoY9U+H
	ADjNbqLexJw4YY2avHNU60VHtTzDyT/Kub9Ra1nQnkFkca3awZfh2HvioKvZ0MgAt4zwj+J5iGh
	yiX/3XgSXCIqtay5x3uZrhNrbYrC9P0ryI/Wy6d6Won/Xq0guoyJriEOK58gqPSlfSMGpU6ybxU
	xXUkd0ID7OJnpuodiK6l3BGksE/4T11Bef/es=
X-Received: by 2002:a05:620a:7084:b0:915:94c7:5841 with SMTP id af79cd13be357-91c23c7c7dbmr316922385a.12.1781567992751;
        Mon, 15 Jun 2026 16:59:52 -0700 (PDT)
X-Received: by 2002:a05:620a:7084:b0:915:94c7:5841 with SMTP id af79cd13be357-91c23c7c7dbmr316920385a.12.1781567992329;
        Mon, 15 Jun 2026 16:59:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e161fc7sm3159486e87.12.2026.06.15.16.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 16:59:49 -0700 (PDT)
Date: Tue, 16 Jun 2026 02:59:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: Neil Armstrong <neil.armstrong@linaro.org>, devicetree@vger.kernel.org,
        conor+dt@kernel.org, robh@kernel.org
Subject: Re: [PATCH RFC v3 3/6] arm64: dts: qcom: sm8550-qrd: add SPMI ADC
 channels and thermal nodes
Message-ID: <dz2leajz5bh5knzzhjlbisosfg3ujaokaoo5rq7lf2dzvgut7u@s44eop5u4li4>
References: <20260615-topic-sm8x50-adc5-gen3-v3-3-216a2b5ccb85@linaro.org>
 <20260615171519.F2A851F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260615171519.F2A851F00A3A@smtp.kernel.org>
X-Proofpoint-ORIG-GUID: 9wUlgNUtsorQtl811HZj6DwlsXaBDhag
X-Proofpoint-GUID: 9wUlgNUtsorQtl811HZj6DwlsXaBDhag
X-Authority-Analysis: v=2.4 cv=f8t4wuyM c=1 sm=1 tr=0 ts=6a3091f9 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=yLdGSESmcBtXjVWxBBYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDI1MyBTYWx0ZWRfX75V2asc+Px1j
 BAfS9uLqziKksmmRKZSzAzCMq5mvRXljrogGQ5a9GlOIExxUkAo43uGDoI5gh+B2jJTbGXcBoLW
 dhwenHQMSQtbSnLHpdO3a0mQ5c3fC5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDI1MyBTYWx0ZWRfX+iF5bx8xcP4b
 lMk71DmHOIQG7Rll2P9fYvmi5VCgT1N5dgM7dA7ptu1DRrwp4iaSbJY2buK465GHCXt+VvD+bJi
 ujDMLM/+J8EEiWakVtUPsG6CT37vrAszjwFdg2/eRQ1oP4VsM73t7P2xx6CBn6L+Z7JHGHT/LSx
 LKn5F1yWio3oitohICrliKcWZ4TVAT1bBCUYisxbXTpfL5HTRGk1ZXqDjL/9COBvon9Oo754VhV
 /H88fvIR5akSrdGmEoPK90RQJ93w48a0wDg9WmNJVytAzKxKnpfUtuxojs8fztq2mhtj/rGLyeO
 qT9qkGEwkbNfOFfLi4dZakKVG/J4JEtQqRXBiKTU3iX+r4bUeygC/HCR4r7gjnAhYgOJ2SnFr12
 dewqubRysDPxtOHEjXeusWMgM0BzZfUzXAAouS9ZQs/fcclxypAvHJswXxDkc9Oi8OQBK5OPAEr
 bDiyTKVVUY76N8UcFeQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_05,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 clxscore=1015 spamscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606150253

On Mon, Jun 15, 2026 at 05:15:19PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] Missing `qcom,hw-settle-time` for the `channel@749` 100kΩ pull-up thermistor (`pm8550b_wls_therm`), leading to inaccurate temperature readings.
> - [Low] The ADC channel nodes are not sorted by their unit address, violating standard device tree conventions.
> --
> 
> commit 4a45cdf2d6ed588ab63165c08752b51ef046be4f
> Author: Neil Armstrong <neil.armstrong@linaro.org>
> 
> arm64: dts: qcom: sm8550-qrd: add SPMI ADC channels and thermal nodes
>     
> Add the SPMI ADC channels on the PMK8550 SPMI5 ADC3 for the
> other PMICS on the system.
> 
> The thermal nodes are sorted by the sensor channel to be
> coherent with the system thermal nodes ordering.
> 
> 
> [Severity: Low]
> Similar to the above, this isn't a bug, but should channel@78e and
> channel@78f be placed after channel@747 and channel@749 to maintain
> proper unit address sorting?

Yes, sorting might need some improvements.

> 
> > +
> > +	channel@749 {
> > +		reg = <PM8550B_ADC5_GEN3_AMUX_THM6_GPIO10_100K_PU(7)>;
> > +		label = "pm8550b_wls_therm";
> > +		qcom,ratiometric;
> > +		qcom,pre-scaling = <1 1>;
> > +		qcom,adc-tm;
> > +	};
> 
> [Severity: Medium]
> Does this node need qcom,hw-settle-time = <200> like the other 100K
> pull-up thermistor channels in this patch?
> 
> Without it, the ADC measurement falls back to the default settle time,
> which might be insufficient for this high-impedance path and lead to
> inaccurate temperature readings for the pm8550b_wls_therm channel.

I'd also guess so. Neil, are you sure?

-- 
With best wishes
Dmitry
