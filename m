Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57DD2426EAD
	for <sashiko-reviews@lists.linux.dev>; Fri, 31 Jul 2026 13:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785505060; cv=none; b=dv1L/FEEVQYuQKAvGDOQ73Uuclu6aG9Hzb2yT4Nu6LsXZla9B0gVhQjH9jyDz6KqS4snB/BBOvUVPL1hNezlNCUWkuQxxOss7WJ9dRQ3Fv/a5c0iRQrNPvXvhHffpaAn4dXlJfpZCex9KiMix1LxL/85cieKSNVePQU8iZGjIw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785505060; c=relaxed/simple;
	bh=CtB+uThNQdElfPruLS88IkQN+8pYYvaNKgXpTjWm8dI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IVsDq9F9jttdDiNZgxUcQ5AQGhdyZObV23w/vHqJvuH/BworfhUDXTb4Dr6Tkgfa2ZDQuwKxSjABQl1D1Qieg5mYa44+89gu3yi0Bbq/ubU5/tmgHn1NHfo0mvFjNa9VnGi160UxOV5zaT5CCoP+Ya3ap16Qb9APAcxSnddpJTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I00iG3zA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YSDFkz/P; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I00iG3zA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YSDFkz/P"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VC9rvV4154379
	for <sashiko-reviews@lists.linux.dev>; Fri, 31 Jul 2026 13:37:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1UHWdcuhd2ga8Vdy+j8u28yQ
	M6gZ2F4ymuOo6UaOwbs=; b=I00iG3zAd30bL2pPz5zBZVS5nLd1F5N+EP0CwfhL
	XyRMaLuqZE8Few53OAAtaL476uf3jPuBvCx69cFid7FAHMpJ1HG3QJXT648s2ofy
	KBksuOXUA+nHhQfCsPtuDnRWvN1SrIomk40y0QQ3eyyVPwlr+POodctKif6GvMW5
	jnfOp9cp02A3T+u7meseSkSwXUtWK+MUQIN43znGk05jgqxQMqVtKbc021aFTvXl
	gstk/le1toMTW3F2+CDTxF2aSVK3DvbXdHkrBohbAaK7cbJXxFzIYhifBkx1Ktyj
	BV00FG4U/lwmgFLZ5uNVWVfUE4Q9n7dPwkdUdHdpy9u5NQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frufkgbys-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Fri, 31 Jul 2026 13:37:36 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1b4d961dso6984501cf.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 31 Jul 2026 06:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785505055; x=1786109855; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1UHWdcuhd2ga8Vdy+j8u28yQM6gZ2F4ymuOo6UaOwbs=;
        b=YSDFkz/Pa0lMvGovNVS9D1AG5EMUKxBwrx9EPrHMABezsr+XQovF+sR+HzEJqWajPZ
         4YCbwV3Zx3mAO7eO0dOnf1cZZwpAxvtrZ2VsoEUAOeYx5bA3LBE9g0Ul0nCiVJxi3oXe
         aL+MzNHTJH3Wzfe7hkfIQT2PG/lqw/Q0ureC9L9nhUT1Gh+DFd5++SdErp+KLSi1Lrrv
         gOnYeBUje8+6u2jDHpQWxkixtDI5nYTRqeTWrr+UIGUF1XjRcbmUreekwOXNEh5UPLoJ
         xMP783gK5sCFjhJlWucFSwumcKYkNkcyfnBlQo3/Fus8eDsw8mHw4tOO8ZPJKXpSdrOH
         hPsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785505055; x=1786109855;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1UHWdcuhd2ga8Vdy+j8u28yQM6gZ2F4ymuOo6UaOwbs=;
        b=n92DCb9DhTgISfzvkqm7Qef83xjevWnfm9pFWOag2lTixpKuzg+cJefx8zPIIqIrWm
         03Paz7mVlT6rFVfzb7lY475R5gOQ+cEN6AaJWX3YijfU4ltCUGpgIpdnn2RJq0CMkwAB
         BXrDfnpTTLZuDEKhTk2bgxhOPfxCO8S+dg0vkPb623HyMVyDBcGwzDdSR7SvYZ3+s8UO
         haVR0rX7NDtUhFTR9nZiWgWsfqxQ6z32cbB2VolvI4f7/bw+TZnb7EsK28eq6d3e+Nt/
         p+a4zp3kiHlLDxT+61IQl2Ibf6pqYslz4sPQB5eO2hPf0ilAVwVzLYyl2qk7TchuGJyE
         z8+Q==
X-Forwarded-Encrypted: i=1; AHgh+Rpe5jwV6am5s+AnWjhvmBG0/+utzt3G9s7BvAx2H11MRjPBRaYTFtmTvkNtWfbC53tYUvJBjc1AWP0GT73hWJ4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx4KPwKUq67ZyHUS2KMXX+1UzGPn2wtgMI34rfMgColgzaJR2IO
	rJVHspalcGuxVhGYEBgHrIPqcfjDmhgWRThFq1uOaohA+YFYgJ3Cg4SJN+PNWHT99bdrjH8zC9b
	gqbvKDV4p1EjX/TVom34TT5nGeGNsuqtRr87+O+6XqnaXz8w5xwcrQ/CsFpEId5hZ7ldn3SY=
X-Gm-Gg: AR+sD133AeV/h1SXiLPdXmKYzRvMgwM2YG9bQJpBRpafXe/eimrlXgV4tyjo9kQq7T5
	0Q9ILi8RMvTf2Ge0YwYtRymfaQagGH423H2x5s91CX/sRF4gHLrc6qireydxEq4G1tpAMbiY49a
	Rb0H2k0DlQl+2lNnIRU8SdqEmkRKaaIlA18Co7sVkbkOxaW2MpNFZp3iTOs3/KsVjE40sZNZxFy
	2uKpj5J1MGZ7e2cZH9KIsnDildObEQOcn74REiEvzNvmTtzuPXZ2RBV/lCbUmMB5RwN8xfIqgLW
	E88K2rTYHOGqFZH67YMDnRqkdUaFBiulcbJJIbxzxMAC0DnRwr527JSkF3mg1tgrjwjTwEmzaOj
	FBW3IBd4xDi7XT7rgUIQNhny36m9ccMT9w7sq9uregnKW18VgXSHRBqDDRELaF9GDC2QWBCAzcj
	wl2wjyNjL1q4BzUQ==
X-Received: by 2002:a05:622a:305:b0:521:103d:9f98 with SMTP id d75a77b69052e-52b4ccd6226mr22722421cf.19.1785505055004;
        Fri, 31 Jul 2026 06:37:35 -0700 (PDT)
X-Received: by 2002:a05:622a:305:b0:521:103d:9f98 with SMTP id d75a77b69052e-52b4ccd6226mr22721811cf.19.1785505054447;
        Fri, 31 Jul 2026 06:37:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2e2441ec2sm309349e87.43.2026.07.31.06.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 06:37:33 -0700 (PDT)
Date: Fri, 31 Jul 2026 16:37:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH v2 4/6] drm/msm: fbdev: Calculate buffer geometry with
 format helpers
Message-ID: <zufng4s4refvweovvogyq62zxl726npmzqh2sf474qmje2uwlt@qaavrkvos55m>
References: <20260618141249.151338-1-tzimmermann@suse.de>
 <20260618141249.151338-5-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260618141249.151338-5-tzimmermann@suse.de>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDEwMyBTYWx0ZWRfX8rOKQhgNPzIW
 1WO7h9nyumZyunrIDVyntj6F6yfgPRoRIu3Xu/9VqmDRBSl3VoDJMBM4vYjjIt+69zUzpVEd58f
 dkFaH2h9ej/evxMNVcCQTD5UCSfrE1o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDEwMyBTYWx0ZWRfX3VHTZrwWhkgv
 MIafV1MzbBvu0f7PU2Luipuw74xI2eM9Q4Mk+fNmv5DIj7yxuMZ+Lz+GxSjFcYFH6msdX+FY1Rj
 3D2n4n45+7snu3NfBOqTOS8vhBhe+gi1nedFzYl7kckS7px3pAMQt52AIgDw6nUEE+ggDiag9mr
 ag8qW9yTWSjZ86gmz/syPc0xcDX1hadj8L725dJYkbrPOJKsbJJIUwo970wtCg0plFBXi2SzzAI
 KkMcYjX0DWMexslClM+02KTpNxcyYzlL9M1kUnQNY2ll8sk6fSpqAMWdUMxMzvyPX1xamrRS/AE
 ijIELXu6oVIWgWmlEEqCj992QsksgExNIRu+MSmW6dqC1MeZMLkIrvbZlQb3VIva2wLSuvqP163
 5DoU7JA65iwZE69lcJx4ZVHjzor3YXIuHy2P84gSdsJoGVlMbrp9s1m4v9PynmRWxurbz3u4QcX
 UokuF0nFo5J2quNe/1A==
X-Proofpoint-GUID: R8yWHDC8mWfytoih94hHMCKZkISAtvCb
X-Authority-Analysis: v=2.4 cv=BpOtB4X5 c=1 sm=1 tr=0 ts=6a6ca520 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=yktShXf9RslwC1abtNAA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: R8yWHDC8mWfytoih94hHMCKZkISAtvCb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 phishscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310103

On Thu, Jun 18, 2026 at 04:11:35PM +0200, Thomas Zimmermann wrote:
> Replace the geometry and size calculation in msm's fbdev emulation
> with DRM format helpers. This consists of a 4CC lookup from the fbdev
> parameters, format lookup, pitch calculation and size calculation.
> Then allocate the GEM buffer object for the framebuffer memory from
> the calculated size.
> 
> Explicitly align the size of the allocated GEM buffer object to full
> pages. The contained memory is the framebuffer memory as seen by fbdev.
> The page alignment is required for mmap.
> 
> v2:
> - clarify the page alignment of the buffer size (Dmitry)
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/msm/msm_drv.h   |  7 -------
>  drivers/gpu/drm/msm/msm_fbdev.c | 26 ++++++++++++--------------
>  2 files changed, 12 insertions(+), 21 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
