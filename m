Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A28B37C107
	for <sashiko-reviews@lists.linux.dev>; Tue,  9 Jun 2026 16:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781022322; cv=none; b=U8x1CGLRV78pbjymORAplFodUicnlORYYYn6PwY4iqi1I9KPeersGEyrisvyIzzkrLCkM2Hi4yAYdW/+0/iWIQcVvThxCyItEAWkej7oIKfDFRf5OBmHyXw3HLszPY3sL8iCo84xhgfuWUqKDlJlSN03sUfuzelO6+v6S3lGzQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781022322; c=relaxed/simple;
	bh=zle7y3M4QVODtmVpss10Mqe3V9cSUnTbYMWNvBDGhWU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GbTlV0tc+I6H5wl+Nz+T5bSxcR81y2Ef10JB3dLuogT1faFKWfEuU2f+zKnJCoaccpLiPL5CXd/BFRtpABhxdnCPVoV/sKEJN1BecIw7FppMXBrpUYFn6SQiZ8SF9AenaCYg84Pa8qYAxC58b7KdqH6DkWTqV5G9Gof1cSit2qU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d2VCpcjM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bjIGu48N; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d2VCpcjM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bjIGu48N"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659GOACO2748434
	for <sashiko-reviews@lists.linux.dev>; Tue, 9 Jun 2026 16:25:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XMoLKRw5r6fZppx05VZeAYkl
	8r/wHRIiOFUZe20opBg=; b=d2VCpcjMPL29RzdhADlJJFcHK5ZHD9wjqNuszUYA
	QZO1+JS3hHEwkypjo/6mnEtnvG3isDt8fiW0R6DR+zEpre3CFKf21jHGHu9oVeaj
	5L4oYZIYbZ8w4qX++9AqPR44qOXfhI0IhPZf65ZWkgSKy3PlT+6lrclFefVfLQ9F
	ajLGuUlQgiVw6JXjNYKiOJKpfDFDADtttZgisn8iouNkSTwQ9D1sAtJVLxKFAl4u
	PpnkKi0zNSviSLXIPsUrlTSIXzsGgVOUicCKundRma6OmvVJU+NNLZettNbo+o3H
	F8SePkB6FenZcYgoEFOD388w2pwk31nNMW8fl2PhreSuSQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epdeetugd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Tue, 09 Jun 2026 16:25:20 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c8581f7723aso3333242a12.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 09 Jun 2026 09:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781022320; x=1781627120; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XMoLKRw5r6fZppx05VZeAYkl8r/wHRIiOFUZe20opBg=;
        b=bjIGu48Ns3zjRXrfRYxpEhIvGW+9kinsZ+usW9/bTHi+E3D1UvavkTcLHO+uMKMoR6
         opkOurB1ScZ+sUsRFOrtwfNlWzkWzaLcHi2GCo4MbNKmWvw34njUVPdLiTnEE9DW4EnO
         g1ck3RTqV2WvDbG5spJiWQFb8UHd5u8+L6bi2HDc36ZJpVvHNmCtQie+0DEdIbMhaTNP
         TNcmf6hjaUk9TX5QJHc3nbFd01GnQ7JyrGAIS9p3yVT82nOZeWvtTDHur3oAxkqqLw0b
         f/OYThFRUisXhGvBS2rykVgFArw29Brf8hXTFgvuDriD30SuXE/gFsWY+xZCydvxCCeR
         BwZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781022320; x=1781627120;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XMoLKRw5r6fZppx05VZeAYkl8r/wHRIiOFUZe20opBg=;
        b=paOw44RkhLPa5Xq+g/pU0RRqWEGzq1vbQmakw1cv0CxRXui5mQAOmMm990K04xeLbl
         BH9BU0exEUMILD1Dv0WxbL4nmK/ZPUYs7wMM+tihodYoW/lEMbB5OUSFOCWAmq+t22Mo
         rCmVnCddRB6cQczL3j9RCBF9k/bmJ6iiQmpvj5HP6cAFdgcutUxq72VtoTLsbynZ5O6p
         M82NT8J43D4qITrXLKUM99Wt9G/lN0g/BmSdPvpq9tyjRs11LOA8JVdb0rWm95DAIUjn
         AfC2qtUUc63xKmc7m/Em1udSDptCHbKFvYMMXcRhsj0xPve91AW0TXlT2aJKv4t4kocK
         l7Zg==
X-Gm-Message-State: AOJu0YzteL/e6QxY8yJVN9fhtow7Vbu0qz/8iagfKdNYLvrUYEGX0K4X
	OqeCdvN+bOKrPeJ7Y3nqEcfZXGD3QUPgbuppKtCqjDKAkcF+QpD6eWXZuv0E6Ial7wmLJDPJzWV
	jtEiuhBxo+9QiwHMRsw0oWjcJfd4dldHdxLdynjF3zawjzXXOz1WMLJE1+a683vHvJj6eXJw=
X-Gm-Gg: Acq92OFs5Z2gvlk5Lp95pcReUykq2pPlFcZnRld4ldN1c7olqJ4og23G7QMNjT8oXaE
	wNnqPpWGKvtVyXg8R0U8LQdR8pD+rmoqU3Fhnx6xJ7KrifiNC5T70Jo6sS5DjIESx5LM5/F38nj
	VI3m12V/kJ2eF/gq/SST6BpP5+ny7cWToqNQwl/62/wQkv+zrhCAx1iQzMYhFTNlN57YX2eK82I
	bp0rjglp/Z1AyprTTTsbl2ZWkIHOOm0uhKUs6gpLVPQKmQwA0yt+EpWfrCPVnhRuVUC/IoHi4pq
	RBTuEyXnINGjdOd4QyEVh2CY+k83y12DUOeNs+e4t2NB7+un2ew9t/XsXE3MTQQdw/0gjqASjky
	2ZT3X3z5c2QuzpbvV7cwObe4Rcci3Yru6x+neT4LsZ7Op1uW9WbroOxYKKQU=
X-Received: by 2002:a05:6a20:12d5:b0:3b4:895f:6ac8 with SMTP id adf61e73a8af0-3b4ccd1b4f2mr26166670637.3.1781022319971;
        Tue, 09 Jun 2026 09:25:19 -0700 (PDT)
X-Received: by 2002:a05:6a20:12d5:b0:3b4:895f:6ac8 with SMTP id adf61e73a8af0-3b4ccd1b4f2mr26166599637.3.1781022319240;
        Tue, 09 Jun 2026 09:25:19 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df0a61b3sm19162834a12.17.2026.06.09.09.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 09:25:18 -0700 (PDT)
Date: Tue, 9 Jun 2026 21:55:14 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, devicetree@vger.kernel.org,
        conor+dt@kernel.org
Subject: Re: [PATCH v2 14/24] arm64: dts: qcom: sm4450: Reduce OS PDC DRV
 span to 0x10000
Message-ID: <20260609162514.2jwiar6wodlyy6cw@hu-mojha-hyd.qualcomm.com>
References: <20260527094333.2311731-15-mukesh.ojha@oss.qualcomm.com>
 <20260527095343.9192E1F000E9@smtp.kernel.org>
 <20260602163821.GA464439-robh@kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602163821.GA464439-robh@kernel.org>
X-Authority-Analysis: v=2.4 cv=H+DrBeYi c=1 sm=1 tr=0 ts=6a283e70 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=_blq5yYnQAhNC7mzMlwA:9 a=CjuIK1q_8ugA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDE1NSBTYWx0ZWRfX4pAdMPzBYAV8
 NgqfYcGv3CbbcJCoq0rvAxej28fvZNNLIwcaOGp0MCXafJsYz5j7hFZQ8h7QnqEjNrUlQoSKD83
 of0IkOS21abroBgs8gvKgaXC/sEg5ais3U6xOlVIrvZ0428c7XWiRkDq2qHZ5CieVA+mX+poiLJ
 QVza7GbwX4grD7gYNdYaVShh/OdQBPSpz7MeEOvFcJ7qMxIz/Lv5TJ2pa1u32LXvsbPyrwaYH59
 z7DHFMkB8O4tmX48ZIHaLrzT0GQ2yv9VwsBXcCJ/x+KfaT8kQC+HevWveZz5YjYh4ZInX24GXNk
 GV9ADqnGYW9exlQ31+YOgGMqhzMZi/jJykmy+i83tBvmRJTwCsPqdyYvYikSPK0AErUzZcVAZJe
 ikPJqPiv3a6uyCbKyn0PR3hDN7FECqW0eGGTb6sOT1hd2fz5twtp26tKW/q6ad8qgUmCQ/lJsO/
 hMhkjIQQSA3LAY3xC3Q==
X-Proofpoint-ORIG-GUID: pDDqUuRGphNwvSff9ely8hM95TWYLAJf
X-Proofpoint-GUID: pDDqUuRGphNwvSff9ely8hM95TWYLAJf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_04,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1011 adultscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090155

On Tue, Jun 02, 2026 at 11:38:21AM -0500, Rob Herring wrote:
> On Wed, May 27, 2026 at 09:53:42AM +0000, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > - [Medium] Reducing the `reg` span to 0x10000 in the device tree is futile without an accompanying driver change and will intentionally trigger a boot warning.
> > --
> > 
> > commit befb5e3c3aa5e0f54a7fff3d0f4a5e96013f4a7e
> > Author: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > 
> > arm64: dts: qcom: sm4450: Reduce OS PDC DRV span to 0x10000
> > 
> > The OS PDC DRV register window on sm4450 spans 0x10000 bytes, so this
> > commit reduces the size of the first reg entry from 0x30000 to 0x10000.
> > 
> > > diff --git a/arch/arm64/boot/dts/qcom/sm4450.dtsi b/arch/arm64/boot/dts/qcom/sm4450.dtsi
> > > --- a/arch/arm64/boot/dts/qcom/sm4450.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/sm4450.dtsi
> > > @@ -464,7 +464,7 @@ dispcc: clock-controller@af00000 {
> > >  
> > >  		pdc: interrupt-controller@b220000 {
> > >  			compatible = "qcom,sm4450-pdc", "qcom,pdc";
> > > -			reg = <0 0x0b220000 0 0x30000>, <0 0x174000f0 0 0x64>;
> > > +			reg = <0 0x0b220000 0 0x10000>, <0 0x174000f0 0 0x64>;
> > 
> > [Severity: Medium]
> > Will this change cause a boot warning and fail to actually reduce the mapping
> > size?
> > 
> > Looking at the qcom-pdc driver in drivers/irqchip/qcom-pdc.c, it enforces a
> > minimum mapping size of QCOM_PDC_SIZE (0x30000) for all devices to maintain
> > backward compatibility. In qcom_pdc_probe(), it calculates the size as:
> > 
> > 	res_size = max_t(resource_size_t, resource_size(&res), QCOM_PDC_SIZE);
> > 
> > If the device tree provides a size smaller than 0x30000 (like 0x10000), the
> > driver automatically expands the mapping back to 0x30000 and logs a warning:
> > "%pOF: invalid reg size, please fix DT".
> > 
> > Since there are no accompanying driver changes to gracefully accept the smaller
> > size for newer compatibles like "qcom,sm4450-pdc", does this patch introduce a
> > spurious warning on every boot without achieving the intended mapping
> > reduction?
> 
> Seems valid to me. Even if you did change the driver, it would be an ABI 
> break (though if only introducing a spurious warning for existing OS).
>

Yes, it would cause warning but I think, we should correct the size.
there are multiple SoC like Glymur, Kaanapali, sm8750 where the size is
correctly mentioned as 0x10000 while for all other SoC it is 0x30000.,
it is inconsistent. For Glymur, Kaanapali, sm8750 as well existing OS
emiting this warning.

> Please reply to sashiko reports because the maintainers are not going to 
> analyze them for you.

Sure.

> 
> Rob

-- 
-Mukesh Ojha
