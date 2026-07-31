Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486471E5B88
	for <sashiko-reviews@lists.linux.dev>; Fri, 31 Jul 2026 13:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785505077; cv=none; b=TwM9G0blZ+rQKR7iGPcFSQPf651QcXHjz8AXSyE0wOuQVyO2rvwwhwgZvwRgNvckJI9mBwJ5bO4hSygOxPSnH8AeirKw6AG5cfHTwzD2jr9/oqAm4NuR3Yg6PGAnbC9WKE6wL3KwMNsq2i7OzAh/IsLlX+1KJOXMghETEZJmZo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785505077; c=relaxed/simple;
	bh=HUxaPgZzZoy/fDjdKUdV3G4kk7TJuOo4ZrL8Y683ddQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nI9so9MvLjTntzVXPI0ed7PoR6xAW7FANQu1QJ0O95lSV5caLXG+xC0bJdY28NA/Q5Ori0IO52CMfAZtf7s5Ynx9bbjQCKSqP0YV4m7kyEzsXl9Fop5m0JO3fbJtShzuK/tqb4WVka5bAlRXiE7siCjk0yLeNVbkWaSbsPeX9C8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p5zOcnbN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X/+Q0Hce; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p5zOcnbN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X/+Q0Hce"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VBaOkM3743622
	for <sashiko-reviews@lists.linux.dev>; Fri, 31 Jul 2026 13:37:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Jy4i2L4f+/YnSFmQn+Vd4jxC
	NtjOS9zp1+meyasx1VY=; b=p5zOcnbNNF3nC7qyM2KndRVBW976ornY3ITfux9N
	a/5/Hi+THGrukjb0GjXmZVTNhpoz2I96bvRoftZbLMTu6qP6jNrhwqVGO1zg7Vmq
	U84WLgzzpSPUwF/7f5IpZSi62GdjUMcdpJtDNwPw8+ziSEln6VPOqPmQxrCCcn1K
	AjbbQ43RhGavWnvrXDk6SwOHJrPZXDql123QtY4UYRwGd1TN/ufkr5muozZeME45
	q01Ha0pWbdEf91dOkQmSAIomcQY2cky3n7/MU4rkebin7Pt8Qi83TIJM4QkF4Wbt
	E/RZp79l+lU+WFBc4+mTxjf7QiKOYr/3Ir3m+J2Ey4Z3YQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frtyqgfxa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Fri, 31 Jul 2026 13:37:54 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1e6f602cso15694191cf.3
        for <sashiko-reviews@lists.linux.dev>; Fri, 31 Jul 2026 06:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785505074; x=1786109874; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Jy4i2L4f+/YnSFmQn+Vd4jxCNtjOS9zp1+meyasx1VY=;
        b=X/+Q0HcexJVdrJZUNjaoulpj4prTYXQNi8KSqRsuqAbIVC7NVIOnDlWtvKUJmcb+KA
         hbOkZozGp3hdJxVtoTjyQhitVrhOiPLJxcQopj/9IbSwLUvfQWE+Koc6FAQR+tz/HFxs
         ZJRREYbr9c376fWruE2tbwJsAlBbpWrw6Yqn3sJXGjQhXMkDRD4B2Kt57YOv2ZC/vrn+
         kkqUR+ecKHoMuQjVVJdTFWFn1jPAlElR5BY8Iir5PbNSx7IPJc5XzlrLDOZg3fI5miTR
         OL46s15Y+xmk7gCib5NafjvGPR2PhN2phuAIB7YGbNJ2ffIVAf0hy8riyeE8RxHVGLZB
         DuJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785505074; x=1786109874;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jy4i2L4f+/YnSFmQn+Vd4jxCNtjOS9zp1+meyasx1VY=;
        b=IkvalnDpDkXnItxSGx/0iYlogLIhMq4e8NepXys4lBZD+iGEiKb+xQM8CCIqbUNWEP
         2mvwcQBmFnqLJ40a5xJlSbCYMWnnLzKWBjtxfQrQ2xFuCaxREHlrNmftHcVR76mAdNtK
         ZHtmCwfVOq8xIHdjIz8cAv3jyT/FgzMavsiS9fzshSHN7YPwV7DxlhLmfELLzGeOAnGF
         Fy3hEj4cWcxLvJjiAU/p3V0EEqcbabUybegUvD+i/6VyOeMKBvjDoOIsHl9gj/9oqjPY
         /UWdzc7qevmbGn92kRXYCJdkeGVMbmO2itEXn0+rcPEDXOxb8PQxkBQ8llXEPCRY2Kvc
         osqA==
X-Gm-Message-State: AOJu0YzWXBoZxUIlcNufdfreKWnR141O1YlCTGE4CD0Mt3q5CH0ItdgL
	WIzvfIMNiIhlCScydaOCbn2rdC9nPQ0OyKIcEu+cBQBitre11wwHpaWhUtAE9CjWvgLdUPWzP2F
	ouaJzwtJymO+VGiNDlbpWygr/76aLyRIaE6uJ+XgVlpx5apCY/2qB6RSS20v+pzMW/Lgb2pvYS+
	2kQhc=
X-Gm-Gg: AR+sD13RqgVDCL1RtEg1ckqx5tjm6Zqw41/P1s4sqjMK8VD5m0x4eGyWY+sn8UnVu7D
	pqgfGoXLHX9LFFga/dEY1UvJyPklppBybmXFLUJGkLF4P2VqVm8WkG1fmK4XMN+9ZIr1+m6eJer
	ghKCABxw66pEdSViZTJprE0e5bxSYdNVYAPNtUQ4SevQayOlzzG2zxtrp1HkB6KnSgP0R36UKqE
	511CGUGFW/f9NxovX2aFh06mfumH2yA30RlcioExTclk9HMhddOFM+cDEkEKuW4aPZoT3SeOUr+
	YXYBezkHFbyZZ/hihoenbP2r6j/7MYRO+M1kVbv8YGQ/J5d57EqgSoseiUMk19WlgLYwco2eP6Q
	lLrMPY1GCAe3II/X04AqvgQKDdsksKUBLUWA9mj6ag8OuuqZNRCQGI7b8FUupNcVu/uPIpvZME/
	IBlC1ILnhgI2mkVw==
X-Received: by 2002:ac8:6907:0:b0:527:edca:8761 with SMTP id d75a77b69052e-52b566dc6c3mr2534601cf.19.1785505074351;
        Fri, 31 Jul 2026 06:37:54 -0700 (PDT)
X-Received: by 2002:ac8:6907:0:b0:527:edca:8761 with SMTP id d75a77b69052e-52b566dc6c3mr2534191cf.19.1785505074000;
        Fri, 31 Jul 2026 06:37:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39f813017ebsm1203061fa.35.2026.07.31.06.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 06:37:51 -0700 (PDT)
Date: Fri, 31 Jul 2026 16:37:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 5/6] drm/msm: fbdev: Use a DRM client buffer
Message-ID: <vuyo4upjjtyt33dztk5hl5votggs4mkm5qt4pwvmjt3ofdeufp@bncbhob3krax>
References: <20260618141249.151338-1-tzimmermann@suse.de>
 <20260618141249.151338-6-tzimmermann@suse.de>
 <20260618142656.7CBAC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260618142656.7CBAC1F000E9@smtp.kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDEwMyBTYWx0ZWRfX5JsiN+6zYBb5
 U2hBrFJIeVhMRXAOTheTrNapSGjUF0LpWIRuAAJFH2d3hUqyYAGG5HZ7LhUS7b0GUyDlFjtqO8N
 ffjx8bJenE3BCDeAs4UaXzx6hZ1RJrqMzlgIj15HJMvlsQQOAa1d8Nh+JF5iugHUaJhsexBLuXt
 oC94WU2tIk6/z3A62JfYbdkPdCryiU+O1l9j+QLiV8XvixqQPMGmqHfHq7S6f6WHY+jzwo0c0Rp
 Yu/Qn3VI1luIoJwr/F1+mrMyCKBf7EGgwzfCq8eyVXJq6fXSXO4LJNf0Y8xsUzsmfaemNeetFoz
 b+0o6UaAv4Gn1N+NoWBJe5esDsIRUHz7tPSp8pv8wIvxEHGfyh6ntNx4cnSOXa22w/KulQQFhvF
 noEhT4KwBWvmPnwlOMeGYbcR7kYreHQvIK5xCkMzByqR646LN+MzyWc0v2uqCueC+sls9T4qvTE
 mDRy1tIa1whhcTM0yXg==
X-Proofpoint-ORIG-GUID: MfpzWqcbhry1rw8BwVgabSMytw7RY8UQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDEwMyBTYWx0ZWRfX/mztGyEhkOes
 zYIlxZxVOqg+NvFUBOSkMVh1+GjKGb877HP1EV92m3jsObF6pVYpGfwkBTvjlbkk33cqmsHTWEZ
 ELE4PpVVnCuupLC15PqWUf05WGh4/3k=
X-Authority-Analysis: v=2.4 cv=YaGNIQRf c=1 sm=1 tr=0 ts=6a6ca532 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=5vUDMa2vHLDEXdyCDEQA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: MfpzWqcbhry1rw8BwVgabSMytw7RY8UQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 malwarescore=0 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310103

On Thu, Jun 18, 2026 at 02:26:56PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Unbalanced `vmap_count` decrement and kernel warning on probe error path.
> --
> 
> commit a68322c2e5e8736f3b039ddfe130065a05ddf719
> Author: Thomas Zimmermann <tzimmermann@suse.de>
> drm/msm: fbdev: Use a DRM client buffer
> 
> This commit replaces the internal DRM framebuffer with a DRM client buffer
> in msm_fbdev. It unifies framebuffer allocation for DRM clients in user
> space and the internal fbdev emulation, and simplifies the clean-up side.


I'll fix this while applying
-- 
With best wishes
Dmitry
