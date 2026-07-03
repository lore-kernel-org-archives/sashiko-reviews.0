Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D0E2D1907
	for <sashiko-reviews@lists.linux.dev>; Fri,  3 Jul 2026 14:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783089727; cv=none; b=tN7z8BTKXMz8SZu/2bNVlEBrfYtdinRUy/IliE0Xo+G1DxIbqzqLv5kOUdB4pivD3m18WSJdBCYeqDajvbZRpRA/gg0u1QhJ1qxIPBVntCd1Aiamto6AyA19gXW65xENfrSr8DXd7Dhfy/9+Gf6EINWU7ShQ2ZMhbNoCA82LrWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783089727; c=relaxed/simple;
	bh=BexIPO296HHnFB3egdyhM4wdn60AvBo4dBPn8kuz0ug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TdWXR9HgzfFWKiIoVue5CcXBAhUXOlTLfUBGoFNtPVrAWkd8NXF5W+EJXjZvomfvfCRCQWAk13GmNrOljhEYe8ht+G4XhB0syF56JnPD+o4LBpAagCWLoPOHahl+NM4ekkdt/BBteqoqUuIic6VY+LbY2V6JTJR/+gFzNwrHgUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tlssev/n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A8CwD6tn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tlssev/n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A8CwD6tn"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663BBHBJ3136145
	for <sashiko-reviews@lists.linux.dev>; Fri, 3 Jul 2026 14:42:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N2H6q9Zu+ilnyHf6y5X57NbcUQFjDlhgAC/o/J13NTY=; b=Tlssev/nT1E8SeJk
	qnm5RfdWZV8A5Tui6ejIq95X8B59z/bgKOhBO2vmIl9bqgoDqcIhjEWwFwQam87v
	2Dyh7yCuviBX6YzEVROANuSIdTPOq8ld23TscTADHEPMRbLJD/WCILcQfyZEoiJD
	mp9BTg2PS1DyZOxy+PS1ynp/zPzrZRzGvro1dQV/YqBTmKJgzear7MuFwYjgH4jo
	EwjqCpprKPxU9XJ0CkmJK4cA7tq8NXDdPHsfLyRwSHzGeraXb0yDAfyqsGZOy6bY
	KYFmmpE5s5G2vOOXnCkMuEvJ8pvOZ4Ik7JrtZZUYpDLQ0veR3fQTZmb2Rcv+UuaF
	PIUEzg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f64b5as0x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Fri, 03 Jul 2026 14:42:05 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-381250979d5so749134a91.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 03 Jul 2026 07:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783089725; x=1783694525; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=N2H6q9Zu+ilnyHf6y5X57NbcUQFjDlhgAC/o/J13NTY=;
        b=A8CwD6tn2xvN1Vs9auhR8CTqGOiN+8FCUxqCtNkXf+oABmlN/YgQd2LtjQaMK69sTE
         fsNM8wjXI2JiJgfY8jdwKLQgDaV7d/cTck38+QB/1nkNZsZxzf31ZGDiwJ1J63nR4Xh9
         vo1ipZtjgRg75qTaUbuWFIT+SSEYCt5IKgbs0zOehYqNxZOfyQAFuKJkiJ3ITbuAYttc
         QxOmSZbky467rtDr4RqRm200NIWiXqVDYBhB6+CmL1+c4ULemRY7fLvo2QAeFZdXSJu4
         e2AMqNUBonQ1AsOEu/COEF6pxsHQeQpRb5C0oC4MT9uLbvkDYrMtO0AnvADWz485xsPy
         Sfsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783089725; x=1783694525;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N2H6q9Zu+ilnyHf6y5X57NbcUQFjDlhgAC/o/J13NTY=;
        b=XxqXudtnU1Z6VoQz0GTPICZs95QqUbMwuODWmNXxfuQsMO+vcQEgwAq2IBCJPSdUto
         iMfnjxjxDY7Y+fco2sSmGhyvDmIq98EVb/9Xia7DFYvuZu8xSn7BuVhQElmr0CY3ibPs
         t0oFn9UbO4tmZoatsDegrbw+KZy3bmbkEwACU59vEMailBA/xhgJDkIn11s/N0h1xWlJ
         Au3upzNNLxmZrkioHyzSmwxm0wqxnK5WbDeKPm3DkO1Vm7+EZ0FjjXDTzr3Afwk2lrJg
         BXhX/hGSJx3vAPYqE4L39RuZnZ2ArNNbc90wyxHV74GV6vcU7KjG+RboFP0WYzQAZR9M
         yCcw==
X-Gm-Message-State: AOJu0YxZGfXdIjasBjCydwx1l4pRguGTtlL8IbR2Og0luCYmdxHlU/JH
	dvVNMbAZfiNzkc85mIoktQXcDI/LtE6ozLML+eA+bjuWu/2ACpsepEhI+IXH/UH5WHaCm0iDblt
	+Vdcr4f+BRZL9bu1s1sBU8QZ8IUKu1uYpYkCjJSaNojP95dPYPjJRNvRDKqxY7gkDwEqPYJitMG
	oTE64=
X-Gm-Gg: AfdE7cnLg8e4oH3/buaUfs7LY3PjOdnxAELBaqqknuREPJGxMroY2XpUAQhGaRn/PK9
	kJ9Tgu4O0BpRKXPs42ayz06a/NT2VuIkQmn6+l9WCb45tFD75PMpiz/hPCLeALWB6LI4E88c18c
	4MJCUuPuoctGlMb2tg56BSb3qNXbEr3cUBkFoD7AaKPFhLh2dzvlRqxavpMphJEVjtkEzRVbPMn
	Z15EgL9oR0r33LB8VfgQS/xXBDyZQLj6lH2LUNcDe2ynV6XGdcidh8Ff3mUHjLKDt57ta50O36f
	mLxHKsQs1XR9qf4A4fClyD7Qj6s5qzTChmyHdH7tLM1Ffm2UhUysKDnGFn9Ww1nUFS6ztPZK89C
	ySWLuaCaRI0vZ5wmYz9GwqtA7R0nAFE+PADJzLNPBgWgUeyw2agitFYgLW1zn
X-Received: by 2002:a17:90b:2c86:b0:381:12d5:1ab5 with SMTP id 98e67ed59e1d1-38112d5279bmr4867919a91.0.1783089724529;
        Fri, 03 Jul 2026 07:42:04 -0700 (PDT)
X-Received: by 2002:a17:90b:2c86:b0:381:12d5:1ab5 with SMTP id 98e67ed59e1d1-38112d5279bmr4867896a91.0.1783089724068;
        Fri, 03 Jul 2026 07:42:04 -0700 (PDT)
Received: from hu-anancv-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b813d37sm22291528eec.10.2026.07.03.07.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 07:42:03 -0700 (PDT)
Date: Fri, 3 Jul 2026 07:42:01 -0700
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: add SoCCP DT node for Glymur
Message-ID: <akfKObyUaMZTe7Fu@hu-anancv-lv.qualcomm.com>
References: <20260703-glymur-soccp-v4-0-b706c4c9b3e2@oss.qualcomm.com>
 <20260703-glymur-soccp-v4-3-b706c4c9b3e2@oss.qualcomm.com>
 <20260703124129.57CBC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260703124129.57CBC1F000E9@smtp.kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE0NCBTYWx0ZWRfXy6GOFbBbUfsg
 DyhcByhSum7DdbJQsTJ97kyVk6iyivNnS2TZGyEzOE48/kVQxNyvHq90stxmOtoNuTlltuEBL4V
 DzcJw8hZmDf5VbGsEXvq8OfMw46fTGI=
X-Authority-Analysis: v=2.4 cv=FOQrAeos c=1 sm=1 tr=0 ts=6a47ca3d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=8nJEP1OIZ-IA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=PhgMLKQm4wwpdYDLYX4A:9
 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-ORIG-GUID: po6NuUtOy9VySF9hH28XnmVunuemP9p3
X-Proofpoint-GUID: po6NuUtOy9VySF9hH28XnmVunuemP9p3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE0NCBTYWx0ZWRfX53UsFZA+NvwX
 lPDnp/XNOogiCFbO8EysYPjCcpP2apSQ5ZNdNTp0BmfpV9u+OJj55MBqEFcboBZw39eraIE7VuV
 mm4rNoGBZaT9UBQXhHWkTQUcuGBtkOTz42gg4oJ6zL/3+qcjBgr5lJvWMJ58orALWLUmAvaTXK2
 bqL0HM3Leh7d6neGM83u28fYrQQg7yMj3MCTvfqYqIblqrunpg143Or4VajBtoakuAIY3JzC+Wj
 OVgKRVSBux4NTKLr25bjrpE41teNVpZgFqpinEFTUJGqDgAqzMJkijSVNXENSvFPjxi68OxXEsf
 wkrGMs0s4ElmGJLuJcNq0LdX5pdeG+t4YxZZ9fRiUdeBkDfL6rv7+oTLhJERWa6e2PUZ6s2dy85
 HlIGRNC7MVT8DXelzAE9yGM2BRtEnisngh5HsYK1pf5uoUj2AKxATV2OYff1R6ITYkFZPxKwR/2
 aqHA1/1GEa5RpUWUrmQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 adultscore=0 clxscore=1011 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030144

On Fri, Jul 03, 2026 at 12:41:28PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] Missing fallback compatible string for qcom,glymur-soccp-pas.
> --
> 
> commit 13add5a1ca37328da1883f3c5d77042558d05a52
> Author: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> 
> arm64: dts: qcom: add SoCCP DT node for Glymur
>     
> The SoC Control Processor (SoCCP) is a small RISC-V MCU that controls
> USB Type-C, battery charging and various other functions on Qualcomm SoCs.
> This commit adds the PAS loader for SoCCP on the Glymur DT.
> 
> > diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> > index 5f44f68efde27..bc259dfbaf0e5 100644
> > --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> 
> [ ... ]
> 
> > @@ -2297,6 +2297,50 @@ &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
> >  			};
> >  		};
> >  
> > +		remoteproc_soccp: remoteproc@d00000 {
> > +			compatible = "qcom,glymur-soccp-pas";
> [Severity: Low]
> Should this compatible string include the "qcom,kaanapali-soccp-pas" fallback?
> 
> Without the fallback string mandated by the device tree bindings schema, this
> might cause dtbs_check validation warnings or failures during the build.

Thanks, this will also be addressed in the next revision.

> > +			reg = <0x0 0x00d00000 0x0 0x200000>;
> > +
> > +			interrupts-extended = <&intc GIC_SPI 167 IRQ_TYPE_EDGE_RISING>,
> 
> [ ... ]
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260703-glymur-soccp-v4-0-b706c4c9b3e2@oss.qualcomm.com?part=3
