Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE09F435ED0
	for <sashiko-reviews@lists.linux.dev>; Fri, 10 Jul 2026 16:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783699979; cv=none; b=iO40c7hCVINNachqVpeFchlo+qC9fwnZok9c5CABSerBb/rRkkVOw+WPaCVQSNUqSTFO6snOEOYUaB9UtFZm96J+9w0uxOb+Yg76SjYg56BifKB4+qez8M8UTjSje05HDtMhQ8PNFBfds1UgPsztaSoA/cwnIIyTi4ewhkN92K4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783699979; c=relaxed/simple;
	bh=eL4daYMJ6yxcHBISM4TXDH94SSluJkVFBsRnypd75sM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j9iUlDDtlYYpjzgitQSpOkqJfdG2n89v515u8MXwxeHzV6sChVJYZocwhfT/2lLArTQW94b4sWtsep67tikI0MAPBu3bPzHnVPfgWvlPVuF9+b+m8qC49WA3fT23o5NHkXeu4TB8OEisrwhvEnRj8RQkiLm91tQOrdwy4VFqFyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SQYjhCco; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IE6d9efm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SQYjhCco";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IE6d9efm"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AEeGxX1032633
	for <sashiko-reviews@lists.linux.dev>; Fri, 10 Jul 2026 16:12:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dSF5znS/Q3lVyRs7GUlKV/7p
	8jhA5H6nxgUveBPbv2E=; b=SQYjhCcozFuTgko/+VsXG3KSPX9UcXujVnXmDE+a
	0ttR3bpsJf7RyZaIj3f7ZnHwTuGA7W5JzL0HkL3KM7iPcknR2W52SQFPpzOIPPBx
	eFtVVnzTcTNoukyygwY/vQ38v4xr1scDLxKHOXrfOGovAeclMg2TD5ourmjO+qAT
	/c4xbFsaTpBETtb+OFEv582BHpYGBfsHulzh5ReF+PqBiC5WZ+fAypvk9fASot8Q
	GtBiqZqlklMFUyg9vCEmxj3K62lnZIUvdN4sUh8S2IGYiVn2rWKAKOwk0acJ7BH0
	yXFKohuRPKtG/DEqMgKTY/khnA+GdYns5PEgIikEh7Lb7Q==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fb2pc8e6m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Fri, 10 Jul 2026 16:12:52 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-7fe835353acso15976547b3.2
        for <sashiko-reviews@lists.linux.dev>; Fri, 10 Jul 2026 09:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783699972; x=1784304772; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dSF5znS/Q3lVyRs7GUlKV/7p8jhA5H6nxgUveBPbv2E=;
        b=IE6d9efmPobUkQtWytaaqfVU2stQdxLCC0h1DxWDbHTTqhp4Fl4HZlXB5sm8F9iUSX
         d9BJR+DkJ1AupbAvy7cRAQ/uooc+GHJYQW+fgT73z7Acz1nxx9WiMitHfe4RScaN7js7
         RLKK25pfrnanSdB8nNiM1sdiGtqFY/J8wbP9IJtYfr/rPBzSLKjix67cCqKRi0xiK2+M
         6LYWe/LikS9HD+3xAXocAXlZPkM5ZuDrIJJlOwoA+WF31P4Opz1FtpIcOOsxZikx/ZLg
         jj8TAYbLVy5Fc6zdHhJQWLbysloscQnvwCPXQEo9rldZUsJ5D+meSJgBMSX0g99Cz4Kp
         u84A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783699972; x=1784304772;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dSF5znS/Q3lVyRs7GUlKV/7p8jhA5H6nxgUveBPbv2E=;
        b=F34wYHsJVj7DscvznQxYcGBXWsl5puQ9gO3zLpaxiVft0yuEHFz9WbpbcXIj12T4hM
         SvfZA3InLnjZIVdTuBiv5+z0Emd/TIS/k+hrTWYbIButArJj6KDMjsyfp8lEFPnNN7jD
         ZEmUETYH0KBVJGOSNo21ubXHq4A+/CFhrM0AAvAl9EMEWUSw2tQYufGFqdiiDxOvigwK
         xCs4QNe6T/Dx3fo7yGtCbF4XAjv0x8/mUJw5VMTDrzqunmRiE+46P8ly6jvzSFH6bq1a
         GnsQz/sEA+LMo4GTc+ytyVtavz73xavhjSMIj4VJN8Gh8OP/0d9LNJaUif7ln/I1pSBT
         gp1g==
X-Gm-Message-State: AOJu0YxG/z+9tGPBPWcHkgLWijTDLXHQ0hjxXaJiGvSK3BHed5eBXv3W
	WNf1w9+jBqd/BlLgLlQDwsz6wTko+DHM4LkQ5ndnTcK5xvTtpad++v1HqgTgpBLy1WhRW3i65P6
	lY2Gfb1ujUgXdxiRKVl9gVCKEJCBsIxmqTZMHyhQ/mKfYY7hAQ4BVcajXU2LRWFqI8K8pq7Xxom
	XjaDo=
X-Gm-Gg: AfdE7cmq4xmTbE//GSEvBPDxuIGtjpo5e8Pm3Ai5sLK7Q2oBuA2UULD3H4ZFtTaazNh
	NJBqujGZZZOnKyeqXVDKEd/xm3Dxs2WT0EyyZ5Ppbz34A6rjCRYEO+BphfP2sGLdPXynbJXkEgi
	4dfRUE4Tgd5R7ggnDbtxekNG3l7b8s7ZvRCLKMTkJCTkLDBFAYUgIQT0NLa6FAju1HqBYa/HgIt
	xL5WaLfFxRHcGD+8ZA7lx2r0ci9FPggGHJvAA8OrnG92MblVjoPWTUN/IhyNbTz8vVGeE+eRSsf
	QCyaDZZXEaOXE9EvrFSlCgUYz5g8XI4PfnH2hRHbMDu3EzeZOstnZOcob8ErBQsXCRPskZvgCo/
	IYwbFwqFMcwP99dBhX9NasP9M8uARSEbRUJrB69TSMmFidMydJv7fqKF37CYsAOOGepTQpoW6AZ
	BacjmaWRtalvIuFtoTDzDAvkMc
X-Received: by 2002:a05:690c:600d:b0:80c:ebd4:762 with SMTP id 00721157ae682-81dbe248d3amr92630707b3.7.1783699970949;
        Fri, 10 Jul 2026 09:12:50 -0700 (PDT)
X-Received: by 2002:a05:690c:600d:b0:80c:ebd4:762 with SMTP id 00721157ae682-81dbe248d3amr92630467b3.7.1783699970527;
        Fri, 10 Jul 2026 09:12:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c84917477sm10590821fa.8.2026.07.10.09.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 09:12:49 -0700 (PDT)
Date: Fri, 10 Jul 2026 19:12:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Subject: Re: [RFC PATCH 06/11] media: iris: Add hooks for pixel and non-pixel
 context banks
Message-ID: <slmagkascgpr7wmuifdrkhhbbiceqqvfqg5n4boqui54sbgzwi@4sntjn2rddu5>
References: <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
 <20260709-vpu_iommu_iova_handling-v1-6-72bb62cb2dfd@oss.qualcomm.com>
 <20260709135418.9421B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260709135418.9421B1F000E9@smtp.kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDE2MiBTYWx0ZWRfX3uAW+6r0DlOM
 dqUW2Tt3bvWqD9cktcpng2jwZS4OfrkDB4Dice/sMpuVDegYaqjDl4uAj+AJhnBVPnDASvP0TXF
 lrP4unKRIKSDEr3DG1Fj6yx8DJzb5XEfOCSt70R67lDR5rwtsPnTV2LakG+87Y5aEv/hQCDeHrt
 LFt0QtaEID2QRiyEAr/qIK7l4Qow5bG6CttAmwstTEBXH4N4Bo0UeJG+/Dsv/xy2QDVZaKUCVT0
 gDKdXP2pdTEtLKca1y6P+73D/YXI34u6po32g8gINjxOn+eMSQkNRW1eC1l8BXeMGIoh//BK+ca
 gequ2iK/R0HgFucIN1hPyRNhCXNWj9wld+vEJP/mHNUDxyi7r6fwz7N4DhfzM/KN1ECvWBDZJTh
 ifrMZ/eOl7aekEmCdBIphk8voWhRBsGJnrF+41FhU9PnOMpu+U0O3yW0iQJLNWi+8CELs4hKvf6
 dyeb+/vofnBiW3VxsCA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDE2MiBTYWx0ZWRfX5ZwET383A0AA
 /Do292An7fM49oHZndtgfkR+r1Wt+NGsEqVmgnaCunngpJaTm9PyG2rUmribMjSC1bHWLzwM0D3
 o7KMNBfZv6KrndIcNOtEwjRnmmW0Ny4=
X-Proofpoint-ORIG-GUID: 8fWpak6emEZTh4yQgOLmdI-uafQhEzza
X-Authority-Analysis: v=2.4 cv=J9SaKgnS c=1 sm=1 tr=0 ts=6a511a04 cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=DDwluHWFvHwLuo1iedEA:9 a=CjuIK1q_8ugA:10 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-GUID: 8fWpak6emEZTh4yQgOLmdI-uafQhEzza
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_04,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607100162

On Thu, Jul 09, 2026 at 01:54:18PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
> 
> New issues:
> - [High] Unregistering context bank devices in `remove` while V4L2 FDs are open causes DMA API mismatch and IOMMU faults.

Please fix the runtime issues. It's not the first one being reported by
Sashiko. Please go through the previous reviews. I think the nature of
most of lifecycle issues is the same: corectly handling device removal
vs userspace lifecycle.

> - [Medium] Hardcoded platform device ID causes name collision if multiple Iris instances exist.

Dreams... But using PLATFORM_DEVID_AUTO makes sense.

> 
> Pre-existing issues:
> - [High] Missing cancellation of sys_error_handler delayed work leads to Use-After-Free.
> - [High] Use-After-Free on `iris_core` during deferred V4L2 close due to `devm_kzalloc`.
> --
> 

-- 
With best wishes
Dmitry
