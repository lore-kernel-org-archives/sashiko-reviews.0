Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E453DA5A9
	for <sashiko-reviews@lists.linux.dev>; Thu, 25 Jun 2026 11:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782386981; cv=none; b=KneAGpZUrA2gDjPzqTfID6vZzjyYwYkvzCMUuYhXZyAWYnBS0Ckq9ub71xJOOcwM37mumTo72OG0Dt3AmZqIg7eRWNK5z45kMyRsj+1xVbg4cPcnBBMM2eloYoPeJOnwVtxqEh9WENhu2607kK1/JTWoClgJhWpfBougdUVA0NA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782386981; c=relaxed/simple;
	bh=FeigaeCzSOK6iW/OKgSAX5GIoUm/l8/iWDJQKj0rvj8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YdGAckVaV3VhF/g4p0vNyDQBHpaQsdXrme2Qac0xkaZnBfp1ZkOSMBA4XMjYmBvUB8VVHgr9ypNCval+TGPF4nR7gF6yJg1ZZAiqJLSUiUkekN4Su+Uqzrxt5o18MSptyCIhmq8+ayb0h5SuP7S2tQoZ+V9Z4Wn2QmG+CfGu6Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VnhRxF6I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Oem81IAG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VnhRxF6I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Oem81IAG"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P9k2ni1921324
	for <sashiko-reviews@lists.linux.dev>; Thu, 25 Jun 2026 11:29:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KAAWbB5ZoFnvyjzUub8MKnikqeHBsD0LJWooySWChIY=; b=VnhRxF6Igru8Fj5s
	4fztfEUk4pCk2tarxFFBy9tQLtUBGcaiMqP5Qs/SWkbN2Vnx0PViVQM4pS2gu7bC
	ATzRWm5Q7w2wHSmpmeekTywbQobOgVwYCqDgyBkXBHFpYWKzqaWHSHQzAVKTxTCZ
	O7rVRRu6FZrzruzjMyT6rwBNBwVbQm3aAphhcOh8NJMAGz0HBjrKyUgQ/vl7v6OR
	fFG6evMRbb2CH3bgxJvLXxbug3rkKNTwza6p467gvAYiv3w/btTPkW+vk3maCPGm
	SoZrMcZ2UhPAL5rJKI1NJdAaVKekWrvrWpa2KAdd5hIoycs0khJ61uyVeclgNJTV
	ikVPIQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0ueu9y0a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Thu, 25 Jun 2026 11:29:38 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30c13bb8ca9so2754080eec.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 25 Jun 2026 04:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782386978; x=1782991778; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KAAWbB5ZoFnvyjzUub8MKnikqeHBsD0LJWooySWChIY=;
        b=Oem81IAG/dDYJQBscyuzDXFnr8tjYJAwQSeBa2Zbg03Al8iNiq1ZqbZztCDZdQfuHm
         oYnDNaCN6tgVVhK+4Asb6RFT2wqXNypk6WRwEJt1Hp0TDOMuskdBcAAJOguqaKq02odZ
         FPS3Ar+KOGqdEDW9q+T6OmQRnlQju8qsNj83Bz4oAfxVbfwAumB0UQRRQHmFQzlvJd3j
         wYLssEaqhU+mTHuRAURgS/g5F4ggm/lmKJDvGvFYR3w4vd6tKJzvEXkyl0C+HRKGBJ3J
         vsTHBnKrfqDbppfGMwIb804wKlUPegwzbf2H3GAhjRghjs9V3SjdZKk0cZ5r24DVK6dg
         P5Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782386978; x=1782991778;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KAAWbB5ZoFnvyjzUub8MKnikqeHBsD0LJWooySWChIY=;
        b=Woa/5BUiVOXywPfkOJmtthuFHUueY0abe0AaCeumPZhWfuRntUrKSKWH67Or8GZy9h
         W02PXnRCRpMrJ52r4QU1WNAeb+PLEw0bcEVtkK3WAA5mnCYv6hR9a1fuRaOOJmUoMmwW
         UJkz/zg3QM1z6ytR/zGEUIz1xQPeaxgUstXBwTzgN1sUiNfZ/WZZz4IIt1xZPVA2HBgP
         3Fjj/QvaO9NA181WVXGGITbPwRW28TTHfXJN12B7lBlYnSsghJKf36QOAFbTyeLq37mU
         LKSwbCkyJEKDOg8KipjDzdAVZ3fVVoer0LO5OWbk9Qk3XpbKhJODUC7Q0fwD626z8pRl
         z4/Q==
X-Gm-Message-State: AOJu0YwY43kUFO6WXuECezdwqoxsCXXu61Lk6GiyXUJyR5vACkwto3aJ
	p/jOXr8UFrvm3NEztZpJd255wYj3sjngNY9DIPMOg+9G/aT8Oc0AaFO44exdGJeJE6iLbubRme8
	dp0ICDe8YEZQd2z1aetsIlSKlu2C5pYsc2KH9lLUGywAjufYrTkozGbQ79eyDZITsXeB8WdXZc4
	sMphU=
X-Gm-Gg: AfdE7cmp/FKFYzxamMzHCAkmJ7lfwQVCaNdMELw86Iv/+3ndsr2Rdi42MeUYvTctXbF
	TqP2rpWQdkvThg8CeegUqQEI6qZnPL4JX2joCPYKW1xQdUiKZcLjAgH9Ac+LjD+Uv8yFxsOG3M1
	8Pj9zT2AQflVZ3DG+0vvgn7nvNrR3Te6Spe8ZMJPl1xJJfwBEBJ6t6NCb8skwDdbyMeaxbmZiGI
	o/UpvM/BGCITgFkUKJTlsYl2FM26v7CEhOUhR/eFzNZStLpa6aQxjnFeD6h06D2Jl+Psat3f1Tf
	s6jHuf8dveX1SqpmwSllnoiAuJS1MbvPAy1mXDPq9YuhQZTOUnV3dTdMlMUMmUGq7A8V7qGwc7B
	OLIsDwWNbYNaRM/4SQcHEyEPYbdn/QmAn34wU5A==
X-Received: by 2002:a05:7301:a88:b0:304:4f23:4466 with SMTP id 5a478bee46e88-30c84be5889mr2505591eec.15.1782386977409;
        Thu, 25 Jun 2026 04:29:37 -0700 (PDT)
X-Received: by 2002:a05:7301:a88:b0:304:4f23:4466 with SMTP id 5a478bee46e88-30c84be5889mr2505544eec.15.1782386976723;
        Thu, 25 Jun 2026 04:29:36 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c4ca21fsm8467784eec.6.2026.06.25.04.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 04:29:36 -0700 (PDT)
Date: Thu, 25 Jun 2026 16:59:31 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 04/19] firmware: qcom: scm: use dev_err_probe() for
 dload address failure
Message-ID: <20260625112931.4ibhxk3zjgpclaob@hu-mojha-hyd.qualcomm.com>
References: <20260624190830.3131112-1-mukesh.ojha@oss.qualcomm.com>
 <20260624190830.3131112-5-mukesh.ojha@oss.qualcomm.com>
 <20260624192213.C82691F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260624192213.C82691F000E9@smtp.kernel.org>
X-Proofpoint-ORIG-GUID: 1aiWUJCkP8YQZ1gupAGGMRmrzvUl1A1B
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDA5OCBTYWx0ZWRfX0NSHeC7fpUS/
 jSE3A4XXttCRhiCqwKMqlPkAwi6fKU4avknM8T7cqFQu1uVytbpek+if47H3emsmqPatvwJsMc4
 U4rNMgkVTD66DXKSIlv6yy4SwQf5znM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDA5OCBTYWx0ZWRfX2poRrQqO2s5X
 9G/xMB3Er3VmB0zZsdzakIHSE0Ur03Bmpav9gVS0RCgJe2ytZJYW4OmoWbDHFmrji1NLw6xP68u
 jowpHsswy1Fc5sfu5iXAYpGmxz9qHDqfCy1wuSUujgSO/4tqBUD7YydqtKTfUwH/QTjJqr3UyIw
 JjGVJBgHBP86+BRVehEL7880zHm5dVXOmWwKx7FJyBoFV4VaQwtfiSSYkn80xXW7nP/tdHpQJGa
 Uzj9nkk0966EH+5TKsU+PpLhwPnzRrijpxMw9t3MFUZ+OvaiVJA32Hu9phIYif0ydUW0AW34fpV
 Q08lykrY9TqNmmuGAORr5ra29XX0cchLz87ycVD2Pjk/aQfjxHulimh/jpd0LGjkSgZUTcFyvuR
 SoJI5xDzN4mkLSWOAD1RrTXDMssQVg6NJHHYQenobIkw54lnS08aUaFTbQpRk9nbIDQhrIf4Cah
 VaEXhphcHFaSu/Zcw3A==
X-Authority-Analysis: v=2.4 cv=b/SCJNGx c=1 sm=1 tr=0 ts=6a3d1122 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=8nJEP1OIZ-IA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=2b9AtHKk-1rM_mh8X8gA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-GUID: 1aiWUJCkP8YQZ1gupAGGMRmrzvUl1A1B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0 bulkscore=0
 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250098

On Wed, Jun 24, 2026 at 07:22:13PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] The global `qcom_tzmem_dev` pointer is set during `qcom_tzmem_enable()` but is never cleared on probe failure, causing subsequent probe retries to permanently fail with `-EBUSY`.
> - [High] The probe function calls `of_reserved_mem_device_init()` but does not call `of_reserved_mem_device_release()` on subsequent error paths, leading to permanent probe failure or resource leaks upon probe retry.
> --
> 
> commit 6dc15526252b78a9c217f06ed35ed4966a794450
> Author: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> 
> firmware: qcom: scm: use dev_err_probe() for dload address failure
> 
> Replace the bare return ret after qcom_scm_find_dload_address() with
> dev_err_probe() to produce a consistent, deferred-probe-aware error
> message when the download-mode address cannot be resolved.
> 
> > diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> > index c8a84836887f0..6cd4d9468456f 100644
> > --- a/drivers/firmware/qcom/qcom_scm.c
> > +++ b/drivers/firmware/qcom/qcom_scm.c
> > @@ -2750,7 +2750,8 @@ static int qcom_scm_probe(struct platform_device *pdev)
> >  	scm->dev = &pdev->dev;
> >  	ret = qcom_scm_find_dload_address(&pdev->dev, &scm->dload_mode_addr);
> >  	if (ret < 0)
> > -		return ret;
> > +		return dev_err_probe(&pdev->dev, ret,
> > +				     "Failed to get download mode address\n");
> >  
> >  	mutex_init(&scm->scm_bw_lock);
> 
> [Severity: High]
> This is a pre-existing issue, but does qcom_scm_probe() properly release
> resources on later probe failures?
> 
> Later in qcom_scm_probe(), of_reserved_mem_device_init() is called to setup
> reserved memory:
> 
> drivers/firmware/qcom/qcom_scm.c:qcom_scm_probe() {
> 	...
> 	ret = of_reserved_mem_device_init(scm->dev);
> 	if (ret && ret != -ENODEV)
> 		return dev_err_probe(scm->dev, ret,
> 				     "Failed to setup the reserved memory region for TZ mem\n");
> 	...
> }
> 
> However, subsequent error paths, such as platform_get_irq_optional() returning
> -EPROBE_DEFER, exit directly without calling of_reserved_mem_device_release().
> 
> If the probe is deferred, will this cause the next probe attempt to fail with
> -EBUSY, or leak memory by duplicating the rmem_assigned_device list entry on
> every retry?
> 
> [Severity: High]
> This is a pre-existing issue, but does qcom_tzmem_enable() cause a permanent
> probe failure if qcom_scm_probe() defers later in the function?
> 
> qcom_tzmem_enable() sets a static qcom_tzmem_dev pointer in qcom_tzmem.c:
> 
> drivers/firmware/qcom/qcom_tzmem.c:qcom_tzmem_enable() {
> 	if (qcom_tzmem_dev)
> 		return -EBUSY;
> 
> 	qcom_tzmem_dev = dev;
> 
> 	return qcom_tzmem_init();
> }
> 
> Since qcom_scm_probe() does not clear this pointer if it defers after this
> call, will subsequent probe retries permanently fail with -EBUSY when
> qcom_tzmem_enable() checks the still-set pointer?
> 

Since they are existing issues, sent patches for them in the list
separately.

 -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260624190830.3131112-1-mukesh.ojha@oss.qualcomm.com?part=4

-- 
-Mukesh Ojha
