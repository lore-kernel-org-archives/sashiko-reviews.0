Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D13A02F8E87
	for <sashiko-reviews@lists.linux.dev>; Sat, 18 Jul 2026 17:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784395283; cv=none; b=UqyBagd6A7A81Zb6Fhl+CCXpFQ+NLT0ZeAisemghWiAUFHhF+K7nfcUnBqIwZrnGZfAr9Ejtkpx9FG4xIvSjlzcfjTEur00pmsy+efPONpIUvyMRa5GyvQuSNSQZCjRdE9FGY8yIz/o8kUuEK/Wtd8jw52ZbT+SxQ5UAeTrhL48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784395283; c=relaxed/simple;
	bh=UVKN3gjb8JCRV0Htlzk37E2U2/BGELValmkZ+BpUkoU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=DUvc0xMVmKwe7XAji+0GFT15lF4tgbINGdfga85VDFC8UMe5W/p03ie2OhWTo7VuVzeTGVI+Zz+ZUD+pWqrfXhoaiQ6TiWeWSDxU1P1kfOWDPpuV83Ps6Tubl3T/JcWtC1ZBTKwtUQ99ICXDcg/157+oFqdkdim/ri0a3Ng9SOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JQzWVyoK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G+umC2aY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JQzWVyoK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G+umC2aY"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66IGOdkc1237761
	for <sashiko-reviews@lists.linux.dev>; Sat, 18 Jul 2026 17:21:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UVKN3gjb8JCRV0Htlzk37E2U2/BGELValmkZ+BpUkoU=; b=JQzWVyoKNWr7/CdY
	EoWdvERzkOkFAXj4c1oP11acOzt3Tvgnc0DpCsrvRrl4pmDfNHnSje1QFtIr/9zJ
	lPebJwrfblbFXQrVdhB9OFF+PWptxHR5X7gUIQEyXknpTjNWT70WE/euSOlK4j7b
	PocW4MDpW5lBki8/eAHI478nDsAD2gYCwSxvXmajuHG5zitmEvUVJZr9jN/Xetn2
	gp01fX2fADntQFzUdLFb46ccdC9SWYMJJpGQPXe2BGghYfcR1ZnT1d/4CxsE2O28
	jui1s1ALoT9EnYvM41/cfholOFvEUU4lf9w92gCKBraDAKYDQ5VdigOXhri/BLZl
	E2RvpA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2af16h7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Sat, 18 Jul 2026 17:21:20 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38ce7fabf76so12396132a91.2
        for <sashiko-reviews@lists.linux.dev>; Sat, 18 Jul 2026 10:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784395279; x=1785000079; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UVKN3gjb8JCRV0Htlzk37E2U2/BGELValmkZ+BpUkoU=;
        b=G+umC2aYThPa1eBQhxejDjKeELHpx/vGFIZrSkXPXPzfHzJop5t4tFH+bw8sj+45M3
         FxI8FltrOsVuGQpNevHnEzCFSNqCEA7Vy+wa2VqesZCKcLBN38AQtRM2gvMQEGQ1Kx0V
         7qu0AXPGK1TnWSph9MJhb6lErFUosvpar0/SNSv9+4UmENy1HpTSvd3gjlpMTy1Hti0r
         jPChm1fP2H2h6mMqVmuQUmD6JAvrWSQcEhPwR7w/rKjhANoddVOrwg2OP2g5s2DOvkOd
         YoHg+KEfrm9KN6NWlK91KWdBdadXQQoFhvDL2CK3YDKYP+bU4Z2wEapSIvXjXUX7iH3f
         LZYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784395279; x=1785000079;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UVKN3gjb8JCRV0Htlzk37E2U2/BGELValmkZ+BpUkoU=;
        b=N08E4Xnbaj+5Oe+4NIETFXTsAuXejfhLGMU2piBvrFsWJKnMjctoUXNNiH/7WjQfsc
         0+m13O+UdZCWCqpEyRh/Fz2GRx/IExEprpABSCRaVS4/UxNk7KmnMKjoqCIGSnJM3KnR
         HQtjQA9diQHFD3619SxndqFR9pgdvi4qbOH99ZTKf9Gen2vwIlrKL6DGtKoH0ASRr1Ut
         WrpR/THAiqhMTSZ03XWcN5U+XIRHZz6GWwcs+UQk2DcalH2PyjLVeO1QhHCeBv0dTcrJ
         oB/AFkilX9+w+UO8ptIbqdfNwNG7xTfCGocd0VeWV/kuGDRpCtr9yIny6A1aXWQ98re4
         YQgQ==
X-Gm-Message-State: AOJu0YwM6ld4plj9Jg64UDVkJFSt6RwFyJFkpLdcpLb4vLGNaSnUKRmP
	McR7ZLAfWC3O+NucH99qgF/b5nRx0Z3IXVCNEVF+KBoyiVoXvHan0NRe6aZaX3ax+e2P1MiZVP0
	rpl4E7i7Kf7UxuWN0M7UZvQH6FPCiDDFe3WeoXIlsF8xiCaGsmNIGnngiJ0KTrqWoVyDZwxmF0/
	3NQSUmaj3M
X-Gm-Gg: AfdE7clHJ2iDBstPuqCSzvVGyPSYx9qrN8Z+yPWhsibW8OzzM52LEgU1WKRGZu/mXHK
	4PRZZLyr05EFsPyVb8oyR1wj1bGlpkrSlj9ctPvzhsdvkWH7wRTO2IpQmJ3yhT04jrddkmM7EoP
	OAj62FSL91BUS0IyIfomH1McjAfzki6txWM7x/mGW6zZ7gGHZTwy/FHrxDqFS/swKGX+mBTev5a
	ZadrfMd+CqsFL3ki/hpN3OGrZQMKCTGdwMGoXl8rgYhJXXMnZr3qRnwPgn8yqwP8DsoBgoVWmRg
	mbr2VOEvF434zO1SWA09MK+Zx1Vb5k66EcMrj5YsH5d1VPMuR9dT/fuA7jfEek7b0eF1rysdGRk
	I7q57NA==
X-Received: by 2002:a17:90b:3b44:b0:38e:1fba:fd79 with SMTP id 98e67ed59e1d1-38e4b5753bamr7566340a91.36.1784395279398;
        Sat, 18 Jul 2026 10:21:19 -0700 (PDT)
X-Received: by 2002:a17:90b:3b44:b0:38e:1fba:fd79 with SMTP id 98e67ed59e1d1-38e4b5753bamr7566304a91.36.1784395278949;
        Sat, 18 Jul 2026 10:21:18 -0700 (PDT)
Received: from localhost ([188.253.117.185])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1bbda9sm18795128eec.19.2026.07.18.10.21.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Jul 2026 10:21:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 19 Jul 2026 01:21:14 +0800
Message-Id: <DK1VC0BQUHEL.3R0D087PCM7KY@oss.qualcomm.com>
Cc: <Frank.Li@kernel.org>, <dri-devel@lists.freedesktop.org>,
        <imx@lists.linux.dev>
Subject: Re: [PATCH v2 2/8] drm/aspeed: replace struct
 drm_simple_display_pipe with regular atomic helpers
From: "Ze Huang" <ze.huang@oss.qualcomm.com>
To: <sashiko-reviews@lists.linux.dev>, "Ze Huang"
 <ze.huang@oss.qualcomm.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260716-drm-simple-kms-removal-v2-0-1133a8fc3785@oss.qualcomm.com> <20260716-drm-simple-kms-removal-v2-2-1133a8fc3785@oss.qualcomm.com> <20260716092750.933B81F00A3A@smtp.kernel.org>
In-Reply-To: <20260716092750.933B81F00A3A@smtp.kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE4MDE4MCBTYWx0ZWRfX32fXNLfk4odK
 nTD45ONx+U8kFgokMix7CMm5w41Vk0Uam8QYQzErNPFnEXDikD1BVQStgm5QQV/OFIae0sftqTG
 TU9p/I+mafdjTXaxbAB6dS2BT/YT2/g=
X-Proofpoint-GUID: mtwlMBYZts9KHyavFgod7WaN2GBggME5
X-Proofpoint-ORIG-GUID: mtwlMBYZts9KHyavFgod7WaN2GBggME5
X-Authority-Analysis: v=2.4 cv=a+sAM0SF c=1 sm=1 tr=0 ts=6a5bb610 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=RQ3dwY0XcLBFaqRX7rIGyg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=6pLJlD1J5kOrFlOB4ZIA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE4MDE4MCBTYWx0ZWRfX1WvOE1gCKx7E
 m+kSqYYiieqnwXVfjBdh+VPHLMVbSW51A95T8XWRj97gy1Wz9Q8pkaLMK0BswDMFIbPybqHGfIJ
 BZZKY7NtmlmI2yZHcYukwIAPebCCxEhRzz1Uy8uuYCrxM+ISBc+p6sKknVNpmhRDB/JSysjVpfe
 KVHmGOg7unjM/gNwI/REUZ7IcXGcGDM22htuxCoYENz6crlrv006eqjj/WiQXhGrLNLOXmk0Em0
 hhBLov8sChvGcnTuUoKNTJ03zL6oBr+bnaLJYaUZOU12LLr+ZiAvGFjfDz5C6AAgTsllrS3UpQ+
 QfDsgE1I1Y8aH78BHEtGWSujSczU8pxUYDXIEKMCznD1rINJ8eKVGYv8OIEdrHiOCWVuMF6714Y
 OTbRzq94A3MCIAggyQoVJh+IUCdO748q8XPIKH+T/m/A9mOKufYrfARpr/pCNZGLfgBkrqcoGTZ
 REFEUyJRL0H9D2QGr5w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-18_05,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607180180

On Thu Jul 16, 2026 at 5:27 PM CST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
>
> New issues:
> - [Low] Missing `inline` keyword on `to_aspeed_gfx` in a header file.
>
> Pre-existing issues:
> - [Critical] Direct dereference of `obj->state` inside atomic helpers lea=
ds to potential use-after-free and NULL pointer dereferences.
> --
>
> --- Patch [2]: [PATCH v2 2/8] drm/aspeed: replace struct drm_simple_displ=
ay_pipe with regular atomic helpers ---
> (Note: The format of this report is altered to a free-form summary due to
> automated recitation restrictions. Code snippets are not quoted directly.=
)
>
> commit d1e92d6b727d3655d12a72430c723784264108f5
> Author: Ze Huang <ze.huang@oss.qualcomm.com>
> Subject: drm/aspeed: replace struct drm_simple_display_pipe with regular =
atomic helpers
>
> This commit replaces the simple display pipe with explicit plane, CRTC, a=
nd
> encoder objects in the aspeed DRM driver. It moves callbacks to their
> respective atomic helpers and shifts page-flip event handling to the CRTC
> atomic flush path.
>
> Issue 1: Missing inline keyword
> File: drivers/gpu/drm/aspeed/aspeed_gfx.h
> Function: to_aspeed_gfx
>
> [Severity: Low]
> Does this function need the inline keyword? The to_aspeed_gfx function is
> defined as static in a header file without being marked inline. Could thi=
s
> cause duplicate unreferenced copies of the function to be emitted in ever=
y
> translation unit that includes the header, potentially leading to binary
> bloat or compiler warnings when compiled with -Werror?

Will do, here and other places in series

>
> Issue 2: Direct state dereference in atomic context
> File: drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c
> Functions: aspeed_gfx_set_pixel_fmt and aspeed_gfx_crtc_mode_set_nofb
>
> [Severity: Critical]
> This is a pre-existing issue, but is it safe to directly dereference the
> object state pointers here? In aspeed_gfx_set_pixel_fmt, the code directl=
y
> accesses priv->plane.state->fb->format->format. Similarly, in
> aspeed_gfx_crtc_mode_set_nofb, it directly accesses
> priv->crtc.state->adjusted_mode.
>
> Since this is accessed during atomic commits, if a second non-blocking
> commit disables the plane before the first commit reaches its atomic enab=
le
> execution, the plane state could be updated to a new state with a NULL
> framebuffer. When the first commit's worker eventually reads the state,
> could this lead to a NULL pointer dereference and a kernel crash? Would i=
t
> be safer to pass the specific plane and CRTC states down from the atomic
> helpers instead of reading them directly from the objects?

As noted in my reply to patch 5, I'll access the state with atomic helpers
instead.
