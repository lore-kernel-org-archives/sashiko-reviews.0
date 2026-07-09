Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D533403E3
	for <sashiko-reviews@lists.linux.dev>; Thu,  9 Jul 2026 12:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783599082; cv=none; b=gWaZdBrlN8sXI9P4VLcyKZnIHa/DKBAyePB56LKBk5dKb29uLhENKzWVVaU1fOV5hBYqIuTyGErJKcLHBRjxDki1wpO0BiKGSeX7ngugbE6cwIzPfaQuHOgI/QqoMtVejLqDo7cs0gOO36ZTOL1zvvk2Woz6rx3KnCimiepRwP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783599082; c=relaxed/simple;
	bh=IaoKShWdnjsuH9prVEQZP2sLwIKjqPYh31jwNnuIJMg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PEynBq3+bJi4/EFw6nUjUa2AtrRzUacjFJaRfbRLcocLGW3pPn0jGZAgqotCVTcLhTwMDID4vGCN9vEfq5xszrHXH1yBWlsi/E7v6jIooHo5vhkwJMsAOI043Dwx/1noeapSRTOOLg8rvLzjF6X2S1tyY5i1mmzMJb5L5ZYmXo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=idW/ioHX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ui4LByCy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="idW/ioHX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ui4LByCy"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BNjMB1668110
	for <sashiko-reviews@lists.linux.dev>; Thu, 9 Jul 2026 12:11:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	waSo2LLZrzKV6A8PpYRpJeTWahFZkQYGcL1Q912rKUc=; b=idW/ioHXatBgs8z8
	XOOLVikmCVNpX8LgKweO8n7vNzAwyIoozWRdYKbsdKtLldrk+1+zs27CT36qJJJq
	SD+bl1HsC6xLbrNgGD1uqAtUhoIKljL5hAOjNPb33O+W33NL32c6D1OE+A0NGIaG
	/q8dIUldZyfPexFyjPu9Kffm5tC86+Udxh9+fma3n+BK2/vIdDTtGOV4HW0RK6YK
	okUe/EkBN5EGiuDG9PUklHVoOHuZmpbu/6bxe+tRuez1a2K3QEfg2c3mf0Wuy4M0
	LaA0avLFzPNSku4+huQ4+qyrqJrwWFCGwJ2mlpNtq9NEsqJp3j+T+kA35aPh6CE/
	uFGKRQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9ug6kmea-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Thu, 09 Jul 2026 12:11:19 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-380ddac2b02so1616053a91.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 09 Jul 2026 05:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783599078; x=1784203878; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=waSo2LLZrzKV6A8PpYRpJeTWahFZkQYGcL1Q912rKUc=;
        b=Ui4LByCy1di32ltGzybigi4rfnrVLYUjja08GSbUPIbbwG6hN610M0XXbXsbRW1Yoh
         oBfXEIaFMUOBqA4aZ5uHYX2esIvDYr3w3lj5xJB4FX9eXkR+RVeX0qO7xbKbkJ8MILVa
         SXEoWNk4+/lhIEfdkvDOwRUTMtOJVSDrJz4qCvRlyw/ccvCjTr/AGc+HCAareZZ/qCiR
         tmXjJadBeCItfug+s0L2RMxjC9F3/2O1R7t1/rqr0JiCSyiHk61YB0Q/RcOT0u3jrlrK
         AURSBrWOx0z/NdW5p66lxffQFlGzaCdMBWNjDURMPDXv0mhcUN1a5DCRKm9wUYVe7fWo
         OK+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783599078; x=1784203878;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=waSo2LLZrzKV6A8PpYRpJeTWahFZkQYGcL1Q912rKUc=;
        b=KeONvl52NOgjjDIYVmlQdVG1XN7F5U3m3t6CUgiP00BlSPXQRVZRPiIeIcCL16Dd77
         ZX0f+occsBM7VW4/warP3Kpt09YGvUENxejIowwfEnQqd7Zlp6d2uD3lxTozdKfoj0WI
         kj9YeZIdqBbmxoNelAwZbiN0H8ETU3ozHaagphK9DJIxWCwnuAj6BDdMfCJ8Jl7lzQON
         B/1DUUeYzWZCPsJ4AQM+QeUdSy+oOxlErH0as9U80y+MBX5orXznJJXQdVJE808kSzvo
         S0b1++IMtwoPo9DXA8RePSKRQIcRKNheKcry9RyHoQn+LBjv/C3KNu0RLAgH7GsL3ysN
         FqOA==
X-Gm-Message-State: AOJu0YwCVfzscYtRCLJfFXvUJWMShUAuiHJxM7zWm4r5nt81IeK3Eori
	cjkunz7uypIrDTvn/vonEe9Ts4lrIyGdlba44CEVso+MGFLPygesSFUKgZuK70pATs8VZqWIsPv
	k0oXQS0+sLi00BYMQqZYYc3IRH5UYwZmzcmcy2Dfo+7pJFHnltud1sFXiQ/Qoy8HWo9NTQqCnxZ
	cVdPI=
X-Gm-Gg: AfdE7cmV0R/oKiwvVaFFc2BfwHof7Wb0zeM0PROYdJIpNmFlR+MffCoFyuVNNYXiHPk
	jmsqg3zRyJpa4XbHR80LAnOYciEYLhyFtwmEkIwEQHO1o2XA77H/98TeeMCl595WTRhxa8l/JDr
	FtpB2kRcpHBURPXxPdUBk+/NpHyd12N0/kkco8oN7hxWmXFwHixmltJWwLzlcNtBNbvGC6kKhKM
	Dj9JkDLSUM7ZZY6mHPBXe/YOLA+dFznRRqb5XSynV3OWqO3cLD7YyeunQIQl8AHD/lGHRs4DwQy
	AvnjXOsz0g4b80AoodT5SEF7nOnIIZ6cREMekND0hCdqFrbIKHVf6kxkZKqUBu9einYOe72dVsJ
	joLNdUblZHn2bDQvG4nZscPhDgfS3DkWsRIxqzi5HmITT6oc9RGFW8nrfYbFA
X-Received: by 2002:a17:90b:5808:b0:389:8f6c:4d58 with SMTP id 98e67ed59e1d1-3898f6c4f4dmr6639279a91.34.1783599078445;
        Thu, 09 Jul 2026 05:11:18 -0700 (PDT)
X-Received: by 2002:a17:90b:5808:b0:389:8f6c:4d58 with SMTP id 98e67ed59e1d1-3898f6c4f4dmr6639219a91.34.1783599077759;
        Thu, 09 Jul 2026 05:11:17 -0700 (PDT)
Received: from hu-anancv-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174a56848sm31876262eec.16.2026.07.09.05.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 05:11:17 -0700 (PDT)
Date: Thu, 9 Jul 2026 05:11:15 -0700
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
Subject: Re: [PATCH v5 3/3] arm64: dts: qcom: add SoCCP DT node for Glymur
Message-ID: <ak-P4-oWqCSV03M-@hu-anancv-lv.qualcomm.com>
References: <20260707-glymur-soccp-v5-0-053993f0c6fe@oss.qualcomm.com>
 <20260707-glymur-soccp-v5-3-053993f0c6fe@oss.qualcomm.com>
 <20260707102536.0055F1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260707102536.0055F1F00A3D@smtp.kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDExNyBTYWx0ZWRfX2CCu1iKzlCLB
 Q4VvlWB8BF9fPw6copl4I9G/3C7M7N6Xul1kxDMcWVyo+18BFpWkOubaG2C+tS+49VfVVVN7dfF
 F0TXYBdcuIqfovspAc4Kncdfaszc8EQ=
X-Proofpoint-GUID: g46M1-nmQqhA58j39VPpC6V6NUnQeSHA
X-Authority-Analysis: v=2.4 cv=cL3QdFeN c=1 sm=1 tr=0 ts=6a4f8fe7 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=8nJEP1OIZ-IA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=a-Rp_Dgs8Qh9DFuD1R0A:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-ORIG-GUID: g46M1-nmQqhA58j39VPpC6V6NUnQeSHA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDExNyBTYWx0ZWRfX6PhY93xA0zoZ
 FCWRP2bkZeIo/7fgl+NnXjaijGbnHmi5/vRcXgrjprEUQCKts2JUmi1AsdyKIq7J5MaWtsSF9oa
 4WUsXo0HWDvp48boHodEmg+9HEDjmGjJCNBftyca2mP1ZpOPL6OFh/73Cvw3aIWGtsUpg3A1G7V
 wvq02C1v5b5DmPF8plCi0NdU+WEzht95/5GzoWUaHZUoaEQmUpxYMLBFEcbfIzfACjc+ckXnM1G
 h0qU1r348zlVZpU/w37yKx1gQafjP8yo2TINyE9uJS6RqjRmjrFrq2YIqo5O+wG988c6B3PWDov
 H4LngA6mRix3cLRqgnGJxf+ql20zl5MtV6cIX7ZnIhZdkNDCNR5/lqCJ2DEvA71xeUFFAxXtKrF
 +JD/zhLiVe1rQC/iF2r8lcmeH/5DKrCCgrerqp5Fad+v2693IfaPrOF6h/NnoQjup+VFRDbte09
 V9yfb+1JGSEI/POA81A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090117

On Tue, Jul 07, 2026 at 10:25:35AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] The 'qcom,glymur-soccp-pas' compatible string incorrectly falls back to 'qcom,kaanapali-soccp-pas', which lacks required TrustZone memory configuration.
> - [Medium] The `remoteproc_soccp` node is missing `status = "disabled";` in the base SoC `.dtsi` file.
> --
> 
> --- Patch [3]: [PATCH v5 3/3] arm64: dts: qcom: add SoCCP DT node for Glymur ---
> commit ba22e521690a1cf89042171dd1def802f653ee49
> Author: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> 
> arm64: dts: qcom: add SoCCP DT node for Glymur
> 
> This commit adds the device tree nodes required to enable the SoC Control
> Processor (SoCCP) on Qualcomm Glymur/Mahua SoCs.
> 
> > diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> > --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> 
> [ ... ]
> 
> > +		remoteproc_soccp: remoteproc@d00000 {
> 
> [Severity: Medium]
> Should this remoteproc node include status = "disabled"?

status = "disabled" was dropped as per suggestion from Konrad in v3.

> Any board including glymur.dtsi that does not actively use the SoCCP or
> provide firmware for it will default to status = "okay". The driver will
> attempt to load firmware and boot the remoteproc, potentially causing
> spurious driver probe errors and kernel log pollution.
> 
> > +			compatible = "qcom,glymur-soccp-pas", "qcom,kaanapali-soccp-pas";
> 
> [Severity: High]
> Is it safe to use "qcom,kaanapali-soccp-pas" as a fallback here?
>
> If an older kernel lacking the Glymur-specific match binds to this node via
> the fallback, it will use the kaanapali_soccp_resource which does not set
> .needs_tzmem = true.
> 
> Since Glymur requires TrustZone memory configuration to prevent faults, the
> Kaanapali driver cannot safely run Glymur hardware and may cause a fatal
> SMMU or TrustZone panic during remote processor boot.
> 
> > +			reg = <0x0 0x00d00000 0x0 0x200000>;

If the binding falls back to qcom,kaanapali-soccp-pas, SoCCP SSR will be broken,
but the other concerns are not applicable. And as per the current bindings, not
adding this fallback will break dtbs_check. We will address this problem in the
next re-spin.

> 
> [ ... ]
> 
> --g 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260707-glymur-soccp-v5-0-053993f0c6fe@oss.qualcomm.com?part=3
