Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 875C43ECBEE
	for <sashiko-reviews@lists.linux.dev>; Fri, 17 Jul 2026 10:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784284202; cv=none; b=FTduiLvwPcdxql9fe2bwRkGVAdWOi5iSdNwNNrbY1LyO1Jqb+98bBRr+929IHnpR868Gcs+TQpraN5y98mgP3gnVAgMCNfMsp8WoCW5fxhB99X7qdQSs3JhjKfWEd6+98v41q8h3zxLLYJK2pcHPG6JeijkwH7bqZffHSt0MK/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784284202; c=relaxed/simple;
	bh=qHe6ZlC3NRO8RIAOPo9zIJdPF2tWl92RPA2ZXw+M0Zg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FkwSKApkjBUTS1o70D8B+SOU5eYkiexcr4V4UoHUGWmSxXZVA6RM+0XYnhqNYnAv8u3S/awxRk0OHnLxr8iVJmlQdbOSMQai5MhijekAt4SSL0LTwU8OK/oqv2lcby5HtLSFgc9Nuv2DP90QcRo+8CwQN+fBE1fkO522elQUiFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YXt7wPM2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KdumDf9J; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YXt7wPM2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KdumDf9J"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HASXTq1190959
	for <sashiko-reviews@lists.linux.dev>; Fri, 17 Jul 2026 10:30:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jXQqLcZa4k3vOKE8Gg+Xq0ho5HHR9pHsqihv6Qjt5CA=; b=YXt7wPM2Lx+uXriv
	7OVETmQbV7NL6XlQ7eZE/7iBpT0BAQdqQsc6keobpEVAdWzf1VBjJbfFV+Su7cii
	3VOCXNgb9d59l617qQTxzYGYehHLEOkNzhhznkq7oRdS4xnQnQpDERJfeExxmv96
	+FU7FBl7XS/pRax518Dx6NK0y81yuJrvzFXnHKfwAfXkCT4354G7GGcl/5Qh+BwS
	0tlS+g7XgT8EQhMfeZdjmWn/hg4JoNh5UbeOoBzwFRmNPQ+/XrLI+96MF5mrv4Bw
	QgcxDWicQanA6uU5ym70lBnzSlb0bTMvVxumCZhGVFT2yOFM9p7F8HHubGpckjLA
	Za39sg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffj78r3dk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Fri, 17 Jul 2026 10:29:59 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38dde0df80bso9788917a91.3
        for <sashiko-reviews@lists.linux.dev>; Fri, 17 Jul 2026 03:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784284199; x=1784888999; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jXQqLcZa4k3vOKE8Gg+Xq0ho5HHR9pHsqihv6Qjt5CA=;
        b=KdumDf9J2IfQcH9dUO3Kx7D0D3EfQjMV1XU424c+SVaoV1FllLJ0zuU3buVNJZhgMh
         jVE9/KqISa+XjGU+3szOh2z1dMNDkYo5D3HRvxWbp8I23X3CXASmcZPHjGGekL+7GHO3
         QAu120k/tCp+eFoQn+VtWYlW9qbdqaWgq1otAjszTbHhucMHgDYYR361t5MJM9JsUo+D
         ZKGCJv0C/8ShhwAka33RGMFRW4huWNBIePcDY4GDG86abt4T8VYgezMnWaXN7Jan/hwg
         YI5Ant2oXb8nqu1/ACqzcRC/1bMzw9UHtusIMD23+YiRYXelsEopo0zsFNfE7hqH/Xb8
         nWjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784284199; x=1784888999;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jXQqLcZa4k3vOKE8Gg+Xq0ho5HHR9pHsqihv6Qjt5CA=;
        b=osDi1n0n0MV5mQ+HBxoRj7iBflCqBV/tWGwrXwCPaJeNqHjALO70qnNj6tsxNodZ3z
         KX3i52GX6Vyo9mpHBINC1Pl6zXD3z6ict87au+ICmXdD9f32M1iQWwSqCm6lz7J0atp9
         ZlLaNmXr0JUQy1dZeKNBJfLCzmXoFZHx1v/ySBZH8E2zLdoidUIB+ZKBbLRSyaQWSY1N
         ynjZk0u1Q46QnEM3c6cO3AAmQh6f8rWQaT36NmZvg9NKpVlaoX0eTbYXPEc2nxz6iipZ
         YW3jmj6yv8bvoTNR53f63GWZn/KNq/IkamWY4m/C6bJCtM42OeIAhTMGhHEH4wXjI6a3
         NQ0w==
X-Gm-Message-State: AOJu0YwKw6tnPUoflWEeUFMR78apmzMGPi8xl+L5naz6u+F2bFm3zIwa
	gOd6ejdxr1CwW7ZdNZRjjZw+8QFIQQmAhDju2p+tESODJC0E2WiNVNa8NMVneE3JG3q4dMLh+2H
	XMO60Qt89Xy5ZRcj5QvfGXVT4nAH/TzuSTGTlJZo5lCjpK/o7e5x+YLOBwJ6xmgROnOYGnXTCl1
	RLbVE=
X-Gm-Gg: AfdE7cmjmBH9NVR+Rgdf9EBhvQ2/7NoAQwbZWHjrJUps7TPs1pxdweT4FaU0Zz3YdDB
	B5aeBP1exwtCPvsHszvGF553lwU4VCDDt0Y71GVwwD/5/cbqUhiv9F6DiC9XHS2h1si8EyoOXw2
	pl6B2ObzSrvXWXKoH35L2ZSodnSsKSJul/IGozynRnRr43N0l9f70xQXngu6KW5S1IJSTyOuOHL
	dZ4YWOzcb7NmpT9Ce6lY25fFLQu9lxrDT3qY/Og8ktgiPwoMqy/MsXGV1+EgWZucFw3SywNnidA
	ZliUCDpDiG5Qh4M4weVqGXTToKoL6NdVBH3NU2M0dfNTKoP0pTg0v2Nz+V8+n2gjWksEsxqjW9A
	mNTA8CzRzcpbLnXkSE0vAVuML/uMYx8m1sgt9+jhF9Y+lPt8=
X-Received: by 2002:a17:90b:1f88:b0:37f:9cdf:f0ac with SMTP id 98e67ed59e1d1-38e4b538984mr2018244a91.27.1784284199036;
        Fri, 17 Jul 2026 03:29:59 -0700 (PDT)
X-Received: by 2002:a17:90b:1f88:b0:37f:9cdf:f0ac with SMTP id 98e67ed59e1d1-38e4b538984mr2018225a91.27.1784284198548;
        Fri, 17 Jul 2026 03:29:58 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e39deab2dsm2671936a91.1.2026.07.17.03.29.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 03:29:58 -0700 (PDT)
Date: Fri, 17 Jul 2026 03:29:56 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v9 2/7] dt-bindings: clock: qcom,glymur-tcsr: Add mahua
 support
Message-ID: <aloEJLLGtDW9TBU8@hu-qianyu-lv.qualcomm.com>
References: <20260713-tcsr_qref_0714-v9-0-373670ab15f9@oss.qualcomm.com>
 <20260713-tcsr_qref_0714-v9-2-373670ab15f9@oss.qualcomm.com>
 <20260714050831.0E9631F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260714050831.0E9631F000E9@smtp.kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDEwNSBTYWx0ZWRfX0wJQNY7dgBUc
 b04KlgxRZ8fkCJXCiPe9pkuhjocxODpJ/PJTCreROlzGgm5MsCYlqqxA0E0qu/qQEtmQ0DIBlvB
 vJDqF3mwiBPmNlf5QRXT3pkznUTAXUlau4cIjUI2+RU5BGPfzEj6asyHOTnhy8jwxXnZ7YX9pvd
 pkiFHmuGhUFCmzZxhvaag43+fCdUN+ewolVEteVyE98eaXhEZZyaisLHtmACKTo53M46Jzl/WXf
 YB3gWD6HmTEqqhQ5ylnT6w0aLgPTATVEAnLUgg6q3HSGxDcCR5ibAY+o+zoZnWNWne6S3J8PZ2c
 biKPUoaI+HYb8wvk41AZhozrt/B04N/DXwU3FR4+rnmC7IgXe+sJQifi1hKRA3715SWunDvGEf7
 ONUPItlrNoqVGjATsNxrAR5rI8P17nDY22axWdaKDa8QDYDuTWyKGN9Mwz5OA2QGtIF5IL4OlGA
 DH5VT5bs9ORFmufy4gA==
X-Proofpoint-ORIG-GUID: SNxWOCC7nQwELzMlQcp3sK4ijsZFfvaT
X-Authority-Analysis: v=2.4 cv=U9Ciy+ru c=1 sm=1 tr=0 ts=6a5a0427 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=8nJEP1OIZ-IA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=uKqSePO24bDyLZl5HWsA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-GUID: SNxWOCC7nQwELzMlQcp3sK4ijsZFfvaT
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDEwNSBTYWx0ZWRfX3ibDitchZVTe
 Jw/6gojJKmWQL489d2nm0vnV2moW9pNLxiwcwaDFPDmOss4KFzTbJRq1eI/+5UqjM4hSQYLhl9H
 xRJc357JiNpPukSqsEZE3dKZrujcEAY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170105

On Tue, Jul 14, 2026 at 05:08:30AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Consumer supply properties for Mahua are incorrectly named after the external provider regulators rather than the consumer's internal hardware block.
> --
> 
> --- Patch [2]: [PATCH v9 2/7] dt-bindings: clock: qcom,glymur-tcsr: Add mahua support ---
> commit 6be182ccdfcaa98dff1b1eb3997c0618159a4ce8
> Author: Qiang Yu <qiang.yu@oss.qualcomm.com>
> 
> dt-bindings: clock: qcom,glymur-tcsr: Add mahua support
> 
> This commit adds device tree binding support for the qcom,mahua-tcsr
> hardware variant. It notes that Mahua features a single QREF block fed
> by refgen4, which is in turn supplied by the vdda-refgen3-1p2 and
> vdda-refgen3-0p9 regulators.
> 
> > diff --git a/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml
> > --- a/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml
> > +++ b/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml
> 
> [ ... ]
> 
> > @@ -82,6 +83,25 @@ allOf:
> >          - vdda-refgen3-1p2-supply
> >          - vdda-refgen4-0p9-supply
> >          - vdda-refgen4-1p2-supply
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: qcom,mahua-tcsr
> > +    then:
> > +      required:
> > +        - vdda-qrefrpt0-0p9-supply
> > +        - vdda-qrefrpt1-0p9-supply
> > +        - vdda-qrefrpt2-0p9-supply
> > +        - vdda-qrefrpt3-0p9-supply
> > +        - vdda-qrefrpt4-0p9-supply
> > +        - vdda-qrefrpt5-0p9-supply
> > +        - vdda-qrefrx1-0p9-supply
> > +        - vdda-qrefrx2-0p9-supply
> > +        - vdda-qrefrx3-0p9-supply
> > +        - vdda-qreftx1-0p9-supply
> > +        - vdda-refgen3-0p9-supply
> > +        - vdda-refgen3-1p2-supply
> 
> [Severity: Medium]
> Should these supply properties be named after the consumer's internal
> hardware block (refgen4) rather than the external provider regulators?
> 
> The commit message notes that Mahua has a single QREF block fed by refgen4
> only. Since device tree supply properties are typically named after the
> consumer's input pins or blocks rather than the board-level supply rails,
> would it be more appropriate to name these vdda-refgen4-0p9-supply and
> vdda-refgen4-1p2-supply to keep the ABI independent of the external
> regulator names?
>
The vdda-refgen3-0p9-supply and vdda-refgen3-1p2-supply are named after
the LDO names defined in the power grid, even though they supply power to
REFGEN4. Renaming them to vdda-refgen4-* would not match the documented
LDO names and would effectively invent a new name not backed by the
power grid.

- Qiang Yu
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260713-tcsr_qref_0714-v9-0-373670ab15f9@oss.qualcomm.com?part=2
