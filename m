Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF92324B22;
	Mon, 25 May 2026 09:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779701710; cv=none; b=Otvab/C7qq2clkZ8wkjotDP3qyzn7AfzvPCaI7eEjN25TL/ZHHyrkKi1mbHCEP4qiJjRYtpuv6PIalHGfvw/OHx81m20ZX/jPanPr1nmsW/mLXF1yTtvHOcjp+qFQH9IZLHf1IExXoI6yvMt8wXd+QyBlQ7/FeDvcpRU+pct2eI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779701710; c=relaxed/simple;
	bh=1cwSj+wuJx/itv+ZmJHrAzksMm7TwoHLYvxftVkfKcc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RNoW/QTJ0X9Fk0LSqpnpLmuf3CdsP2vda4Bae1VLHvHpngIuZGVJguhjuse5CQxefjwjEk3PvFJ3Tj9obI3+K5Fm/8mqo/+5GwJ8QLcjpRtu7qIw044YiqlQoD1+GzS6jBx/fAdar11yJBQ57xinhnWwJXty41/o55/mYcIBNSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ireRREY2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ireRREY2"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P9EJ60079191;
	Mon, 25 May 2026 09:34:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aERorl8PN3gDoNsxGdbl0MdT5E8Sf4bdoBmoK0Ydoe0=; b=ireRREY2UtyHqXP1
	3p+cmJx/4cYlxX2t2Zwxp30+M17MrGubqOP8uf/eStALGvi5Ol37rQ/ESsqc3kML
	OKg7NlGxxFmCplDFbEAePb1usqo9Ol++No4uzJvfiCYzGaVSvZdaCuDgnpTd77Yr
	zxeN69LwZC5yZdF6wG34gpiJ90HL+9ALnKZR/lyIBj4msq6UHjHCUdGclC77zwuF
	GljtJ63aUfoMlN+0ZuPswS0mvp5vmatN2lpKQvj5NEXVL8jmGh/+PG0U0AzEv/jT
	uzhJBMosPmdM4QDP25qwE94KmFiNqG7nxrPmIHioWmeWIgHxJDOy2EiNRZSgLN1G
	RwPqdg==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eckma82ss-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 May 2026 09:34:58 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 64P9Ys8t006777;
	Mon, 25 May 2026 09:34:54 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4eb5ahteuj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 May 2026 09:34:54 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 64P9YshP006772;
	Mon, 25 May 2026 09:34:54 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-kotarake-hyd.qualcomm.com [10.213.97.140])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 64P9YsOd006770
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 May 2026 09:34:54 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2389607)
	id 4C35CB2D; Mon, 25 May 2026 15:04:53 +0530 (+0530)
Date: Mon, 25 May 2026 15:04:53 +0530
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: Komal Bajaj <komal.bajaj@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-phy@lists.infradead.org, neil.armstrong@linaro.org,
        conor+dt@kernel.org, olteanv@gmail.com, vkoul@kernel.org,
        robh@kernel.org, kamal.wadhwa@oss.qualcomm.com,
        jishnu.prakash@oss.qualcomm.com
Subject: Re: [PATCH v3 3/5] arm64: dts: qcom: Add Shikra CQ2390M SoM platform
Message-ID: <20260525093453.edmqryggp5kcqxxy@hu-kotarake-hyd.qualcomm.com>
References: <20260522-shikra-dt-v3-3-80ffde8a3dc4@oss.qualcomm.com>
 <20260522191013.23B0C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260522191013.23B0C1F000E9@smtp.kernel.org>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=cL3QdFeN c=1 sm=1 tr=0 ts=6a1417c2 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=1FUQUpU6QHfrpmvLx8oA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: ExxfN7E2PfhBIgUHJ5awJWAt2ht5vaJv
X-Proofpoint-GUID: ExxfN7E2PfhBIgUHJ5awJWAt2ht5vaJv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDA5NyBTYWx0ZWRfXwCYTS+ICWKTx
 HOOP85wwTbqkawMl7xtzzultOLy24p5xJuBoNrcsjRihKN/GQFepOLIZYrTR4KrPEdcwGir1q3T
 7U0jKtiXIcSwYR/rS+iFl4NX/0PuxOMa3L4rSMKqEJCLapdZI8YLEFiMjJBJENs6zNgoy4MvwRB
 oOS4Oz5ODqhzw/qEZ5OXIvQ8twwhOL8uFA+lZEPETTFd23pL/MPwCi59vOHfQ44QCBtt2QQLJev
 3Opsz72uoSDp24OesO7Fy0HKVly14lBe6aTBSZx+zF0Tq2/D+j7A94zliZikIoEDF4kEc7CyJhY
 1pz2BfeGQN4kHavB2GIuZqc9dIlGb1/D7M7lq+RYHdsXMXfjNwpLcR4P3frcrXgw0s9aawVI4su
 v9yXk9F1uuDcbBY6iebX9uFEnTISy9ydj4BiVhS/90Xn57hfHo0CziE8uV3Yk1H7VMp5c07I/yR
 qbxPtRqNGwWh0LMIcag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250097

On Fri, May 22, 2026 at 07:10:12PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The commit message claims to add PM8005 PMIC regulator definitions, but the patch explicitly disables the PM8005 regulators and provides no configuration.
> --
> 
> commit b8207cdfd80924e291ee52448a105708aa7b6a09
> Author: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> 
> arm64: dts: qcom: Add Shikra CQ2390M SoM platform
> 
> This commit adds the device tree include for the CQ2390M variant of the
> Shikra System-on-Module. It integrates the Shikra SoC and includes PMIC
> regulator configurations for the retail SoM.
> 
> > The DTSI includes the common shikra.dtsi, adds PM4125 and PM8005 PMIC
> > regulator definitions specific to this variant.
> 
> [ ... ]
> 
> > diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
> > new file mode 100644
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
> 
> [ ... ]
> 
> > +&pm8005_regulators {
> > +	status = "disabled";
> > +};
> 
> [Severity: Medium]
> Is the commit message inaccurate, or are the definitions for the PM8005
> regulators missing from this patch?
> 
> The commit message states that PM8005 PMIC regulator definitions are
> added, but the code explicitly disables them without providing any
> configuration. If the SoM variant requires the PM8005 regulators to power
> hardware components, will leaving them disabled result in runtime failures?
>
Yes, you are right — we will update the commit message to reflect this
more clearly.

The reason for disabling pm8005_regulators here is that the PM8005
regulators are controlled by rpmpd and are not expected to be enabled
from this patch. They are already enabled in pm8005.dtsi, so this change
does not affect runtime failures.

regards
Rakesh
