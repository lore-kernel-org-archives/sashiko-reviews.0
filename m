Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A6537E5FB
	for <sashiko-reviews@lists.linux.dev>; Sun, 13 Sep 2026 20:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789332641; cv=none; b=Y+Zj7kOGHqGDf/dFMlYnuAaBlpBkl3RDhuI6sUQb1F/lZuEB3exrBONPl2vOoXPZ/PNAQOnrh6vkF0Ms/mwJGAoUkXsvdESfdS1d6f3uZhgQ+8FSy1XTkcBn6vWTZ+xtlJYBaaYRDJCQTv49yDfqtp2PolBcfgZcK9Obb5iQn5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789332641; c=relaxed/simple;
	bh=vvnPqg+ilMnahnRFQfmWmy2+BdvfdXTivOTPJ8YVrKs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a+h6lRUPTCfzRzwOrIZWWIuHn1Cao4GC9DMjIz7p4uXdYEwlm5QvbJ71UEM+cn+qR+C+GQGwJYen6AOU0oACDW/CXbT6QCOSM+y+WbzocRyPuEFTUMW+RKL7jfuJuxs8WR93mydeVzocEPcKa+SN73GpBJ8rLutucfjoJVGXcJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LXVlswPN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YjTW4d3l; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LXVlswPN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YjTW4d3l"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DJxTot3520299
	for <sashiko-reviews@lists.linux.dev>; Sun, 13 Sep 2026 20:50:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=skUogQ4fUjIsvv3csVnuR/5F
	uFXLBFbMZ5tGqMKNf54=; b=LXVlswPNG3jLMqeT4ZptclfnJ8PL0tXfdhjetTVj
	QSLYuneRDJtQvETUR+aVxDedzYL8f8Iv6mArLNaIhYFNHzdkKw2XubBYT27PCIr7
	qf86bfpoKd+VRnLwoUSvfm1lOUFu9+rRah1RKgNwTlAfEh5qDEZZrpyt4CUAl+Ys
	5LGvKhu+5p91gZcUgeVihewMiYzLXWaEYKykcIZIrs2S1JfV0MWrz4PuszE2ghFb
	Y3R6ZeAYIyhboQBzZ/Kg1xa9Hneb5gFbDeuHPC1y2pj2NqoMoJFk0nQqnVNpRtEV
	pVa6367SPcxiuCyoJ5kmq3qle/L8ndNo3M3RUuZRdqUR4w==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9cc563-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Sun, 13 Sep 2026 20:50:39 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-79014f0b44cso2459525137.3
        for <sashiko-reviews@lists.linux.dev>; Sun, 13 Sep 2026 13:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789332639; x=1789937439; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=skUogQ4fUjIsvv3csVnuR/5FuFXLBFbMZ5tGqMKNf54=;
        b=YjTW4d3lWe+/FbDP3BuXvSQKzs2nMb0GdqCmwV4NANONpJejcHsMChwZgaRZm5yxM0
         F8CQ0q7SwUHLjJKRK0AZFuwEi5mfZ36e88YDrpdo9JjovuHZDtkzFqk6b8RfneG+wadW
         dbrMwMwwiBE9qmUk7IT86xwz+tLzqh7CtKrmbFlTSQOH2G9aWqALK3Gt33x/M0D9HzBk
         nMmRMRWjiUp5fHB6C0+joJsveydcYrZ+ncewL84pvsTBbVo17bJM7Ab5g3tEAH/crNUW
         Nrh5twbduadCgMu4nOb/g6eDiLZVXwVzaPGZoP6XU4FVnHQyAbPx5f8uMaXeIrJVBrXZ
         Bmww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789332639; x=1789937439;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=skUogQ4fUjIsvv3csVnuR/5FuFXLBFbMZ5tGqMKNf54=;
        b=kA/0YyolH5vB26UuPbEStwtSXn4yPMS1Zur3uaxtllwLZCiDuwZhlw32cN6bAqgFdY
         ACnxTsCB7AXbhCfGDZI2H+QIzJQOCPHA7bnV6DWHkvmpZyS7UgXeGXI/PJXfCNOhO80d
         lHrj4JXL7P5DrGPdwacoz78Y/Ho4hcl1YwGjsjiQ0RA9RDtpjsio3hZ49UTuHTQOr4RK
         ZQ4XhT/dNIZePkGHbuiC1UVkmKjgd7boZvuFFC8yrNxM3NCdoE1NYDLzgknnZTqMMLWG
         mCt5XYdv6h1S974DxvNzAIGC83I3i6sPTP/OZ2tKAKBu/T/qP3lNl/n5nQ2DFq96xn5a
         yMSA==
X-Gm-Message-State: AFuF++k3O4TnIz0jM5lYBWZMMZQYnJB9Bvl/aejy9JYqXyQrRRWypqyi
	GhoIfeyMTYJ+0V1QeMiaxkY5vdArYvsrpYTfHgGsYpP3m7K09ekdGrVKn4XiDIy520e5EHXD53J
	etiMp304o2D0E7zh7cy9jitXJDziMgsnI6qzpY3iDet0WhgyK0OhF0ldorvGZxuE3a9wQsIuXqs
	NrFJ8=
X-Gm-Gg: AYBFou11RGUFg5xnzb9wTBc0qJVSB/+Op25lTV6LFBv9L9zHdf0pDCUPra7D9LuhNK3
	euTL2Tkba0m7nk/0EoflIemSsrVR4wHmQFOgqiDV3vLYPYfIcXQMz4CDC2JrTgUpn54sTSt9P+R
	15Q5j+Ti4azzdtMF6itxGbrL5LpT9s2A1C6EQ2FzGCv9/TdP9yKG4Y0E/RlCk6IVZmZ6tiIhYyY
	tZFXKCft/X36iUjEiL5NSw8a2DJ4r4zkwYiqihCAezyzOGWQoFWa9UfrOzONF8CBo4gij3z5UxS
	+RR1nJOReSYjDjqbyfXeNiqecZb+GC4WoD9CW+t1j9zwIds3g+O8IWf07oCmau3dXQ07OYzakIM
	Ztdi5M2bcMQS9Qq+uXELFmXaiDG7Hi/stwPAGj38v6lKY0tdwMuZXE5g7zv1U54+MArCdSoUlpz
	bSGwyccb6iLaJF
X-Received: by 2002:a05:6102:512c:b0:79a:90ac:d18b with SMTP id ada2fe7eead31-79a9f5dc028mr481917137.11.1789332638615;
        Sun, 13 Sep 2026 13:50:38 -0700 (PDT)
X-Received: by 2002:a05:6102:512c:b0:79a:90ac:d18b with SMTP id ada2fe7eead31-79a9f5dc028mr481902137.11.1789332638076;
        Sun, 13 Sep 2026 13:50:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a5a336c175sm22802731fa.36.2026.09.13.13.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 13:50:36 -0700 (PDT)
Date: Sun, 13 Sep 2026 23:50:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev, freedreno@lists.freedesktop.org
Cc: Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2] drm/atomic-helper: tear down HPD/polling in
 drm_atomic_helper_shutdown()
Message-ID: <5n357w6ytzwbksbh2lnv47gbkioo3epbr55ddrw4ipn6vikexp@kbwvjmjuzntw>
References: <20260730-dpshutdown-v2-1-441fc5543bed@oss.qualcomm.com>
 <20260730130104.3B4661F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260730130104.3B4661F00A3A@smtp.kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDI5NyBTYWx0ZWRfX/h+cfPoYtiFN
 t/O8SVFGyCajZxj15/lst34b7H777Jp659M9nFjPyeKlxB4x9QRhOloIS/gj5tSiq5jQPaGTmkb
 Ny6cGIJnYn5gFRpXH4n2T8fslU6NvPw=
X-Proofpoint-GUID: 7Ru-T6WIKTNwUKo6pf-eS9Mio7jJEoXG
X-Authority-Analysis: v=2.4 cv=BdZNQbt2 c=1 sm=1 tr=0 ts=6aa70c9f cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=N4DhEor3m7J97lUnjsMA:9 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: 7Ru-T6WIKTNwUKo6pf-eS9Mio7jJEoXG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDI5NyBTYWx0ZWRfX0r0Sp5eOKDns
 SCLcxOBWtCDA2RD9QAaAuBeKBCvIHERipLd3TFfBZrse2A48w9ue3WPDbtIC0Cg6tpmxshmGSG4
 KoIAVDGx3xN+0O7JSkEvFrRoSF33OBUJQa+pWblD1S9JikE/M6Q1hxjwmVGL1b/MEXMLvfkmlHL
 uLo+FQuVmR9xjsT5K0HYj+PcXIxBhMDo86cCLetfGb5MRorTAWFC6guM0AmO7nqsmVWHlGSF9j8
 JIV9Ukfj8P28v3iXVUun2Cp+ivdaXbr1hG/mlX1HsQixPuGn6GmGj/rVQ2R/rnB9c1EQh/CCUCF
 mMk7BDDFF7TVjC5qQw+C3IgHeBpOs6lydMyu12gFmmw6xS59kXQuoLzzreuprEwLRtYzQ+a7mAa
 V0pWm88QQtYy58os1MOHBtIzmK+UiWgmlvJ5vWpwXpUrmxy9l3thrTBEhon3ugz5h4PgXLm/k1n
 rBFOHgtp22Q9mTA6FNw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_07,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 malwarescore=0 clxscore=1011
 spamscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609130297

On Thu, Jul 30, 2026 at 01:01:03PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] drm_kms_helper_poll_fini() fails to synchronize with in-flight driver HPD threads and introduces a TOCTOU race with userspace probing, leaving the original late-modeset bug unfixed.
> - [Medium] Calling drm_kms_helper_poll_fini() inside drm_atomic_helper_shutdown() introduces a regression causing a kernel warning stack trace (drm_WARN_ON) during driver unload.
> --

No response from Mahadevan.

-- 
With best wishes
Dmitry
