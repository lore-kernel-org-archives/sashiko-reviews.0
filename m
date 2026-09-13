Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92CA93246ED
	for <sashiko-reviews@lists.linux.dev>; Sun, 13 Sep 2026 22:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789336883; cv=none; b=ufUij2Egm6dlK4xxnQpfp4i2lkhaowq0AeNiVp5/7P85dgvLL6PrZgb22bEJ6wDeABCMOy7DsNpJMpPd8s9mdUvFwJdMm4Q3t0kE4i9fst6o5z6vT7ZyY7HCCQh56wHrjH8JdPEwl2bMrPNnU0auT93w76wZK+BqomBxgRK0Hv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789336883; c=relaxed/simple;
	bh=fkfCNfqsfjhOkKTfsHOA7UBcM2R4xWEwHEd9jRMCz6A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d8nKMQfepMXWOoi9ihGVFsc9GpNd6bRKlsZcv5HANXClcRvaxKn6hrm5344xFgDYQDAK+YY4xKpvObTW73mgV47wEWPnml2FAuNZC4ai+xUvLs5XDZAr3pDom6ddyrJ4uTc7f5zf+oS3qGkMpBxlDOw43SgQOvx65vH+Bsxiv78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L9ecl/3r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TDbIwTy9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L9ecl/3r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TDbIwTy9"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DJxvUf2527548
	for <sashiko-reviews@lists.linux.dev>; Sun, 13 Sep 2026 22:01:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Xgq9nxYg1s4/w+cKJgzA5F91
	zhXCkDXvYVANjzYyq0E=; b=L9ecl/3raYaN7trux13QAE77+TplzkUFbUFZxit/
	14iMkaJ3UaKfZVqg4SkYu9s8Ip4X5MzEYMog18kLTYsPiaqWyb7+L/+swzCwrUp1
	FQPu26+AmdFH9IhOBiNm7NjFhdriEJJLrKI+Si3OKcWLk4scv5lq3kBfA2kVL59G
	l6Gs4xrIZ+1HJAg/SytB8nrrY+8qAmxluEJ67ALppiO+tUMkXc8eU+QgCR53xn5A
	qgPrgmhq4UnCHhthfA189EEmDL6KCZad+LxlAEeP/KYFsO4IgBlqtvZng4H28EQg
	ZQrR8Qy8b3xyYz8ZxWrPYxZ3mCwCwNzDqDHxaBRvfbfKsw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9dc6ut-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Sun, 13 Sep 2026 22:01:21 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-78fb9f59781so2357348137.1
        for <sashiko-reviews@lists.linux.dev>; Sun, 13 Sep 2026 15:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789336880; x=1789941680; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Xgq9nxYg1s4/w+cKJgzA5F91zhXCkDXvYVANjzYyq0E=;
        b=TDbIwTy9oWMhuILw44Wc973B3yKTPMA5EF2Bqrb57KMba8dGgLFrhHBO45WtfrUOuQ
         wDFWbu51EcPHFOyBdc1j3bK4PVXKdrskATamTbPm6wBGtYJLgRa4n4cgouFhI7D+uPQi
         UqAwF7ghosmPEtQleS1RPe5YaBYbWaJXcOjGvc/Laz6sU07O6OmBVsAbnwM+q+U4EIyO
         EYjAVB9U0xnF61Tbid04fGc5XRtsWTDBmn0I3mZu1Q3d6iKZ00ZL8NuBCA4PyncwZrF4
         YgEfk4TMlGFKjLmmYmEEaACVZb6pRGWiFtsoJyaYTzcYoN0rr3yM/bBzTm3Rz63fO/mo
         9dUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789336880; x=1789941680;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xgq9nxYg1s4/w+cKJgzA5F91zhXCkDXvYVANjzYyq0E=;
        b=Lw0hIrgzmd47nLPZvcwtE8JAklQtAB85HXk8aRGHstSLogib41nOsys9PjDAF3y2Nz
         nzuxxb3U+WYq6sCkrFBbTaRA0XBp0cfNb6Ud5Ad4ktKZOC77vPRCf+kJseBNJ86wRcbF
         +WEvVZso2Y6x8RBkhgI6TBvSDe5+YyTkomXdaE9skrL3UjjfQMs8ssRkd2q1NkhnkkBn
         1F3GQK2WS6zISdXcBPAoRD6rMiBQ+6ZOcpBWMcxN3aATvUOxPU23masBf4cGUqWoyqJT
         ntcH6Iwb6TbRAZ5KRPoRJVkxcPKcE4LoadMU6A7Z+IaX+L7Uaujb2SweD7MZiYb+xBxa
         B4Xw==
X-Gm-Message-State: AFuF++n7jnje1BI9CdBWw5QeaIoLa7SJi/y7L7MtIo9DfCTDydgMQK0U
	zCVbYm1/QAZugw/H1KuMw30n27NGvkRNCSp9oE3gIi0zKuZbPelegYIE/rmKqg8vMX6INbgTQmq
	w5ZZqJTFUUwdXUE8+BlC85pCFDOFiYcTmsqkZ8ltCiS356pK+SHwQPAp+iVB75DvQQwnhosg=
X-Gm-Gg: AYBFou1DKLmFnQj7yqJuvWThX7pYp4uCmmnYo1alF5D/+QvjPGjF8CbfmRLLedeeSZu
	EwAkHZvu0Bcd1RuVKflDkUmhC4Pi8OUFZZGkt/kc/m6LJgFb6m421zxCcJO43TK2e6LJvZjv6lt
	bulssvah6WHvGgfr84q19yY23ydrUU/0F1kMmZh+tqV05lGEMksb/JfT2Zyq4KPbjqFARUWfV9x
	N6nkVY6CqPnZRRtE+qHN3T9IZGVIMa8gXWm+rrXLwcfW5KfT8VgzWDgGoKFESvqNDjxDNkUWilX
	zSPj6KqAoKEnnfInVwhvhNzLbM73+3x7DNjmzoHALrV1nAiz8D9AdmIyJ2/fBUU0j6dsgooZrOZ
	8wtmNXijEONQutT4r2SO0pUcWOTvoggLAt4IfpFEbehoc2vlnHE3wmHg9CO66u/XbvBEl35O8Jo
	9xiRduoFaFciVU
X-Received: by 2002:a05:6102:a203:10b0:785:d308:cc2e with SMTP id ada2fe7eead31-792a89d2f10mr5496651137.9.1789336880495;
        Sun, 13 Sep 2026 15:01:20 -0700 (PDT)
X-Received: by 2002:a05:6102:a203:10b0:785:d308:cc2e with SMTP id ada2fe7eead31-792a89d2f10mr5496642137.9.1789336880100;
        Sun, 13 Sep 2026 15:01:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a5a334bac9sm21074531fa.28.2026.09.13.15.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 15:01:18 -0700 (PDT)
Date: Mon, 14 Sep 2026 01:01:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: sashiko-reviews@lists.linux.dev, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/msm/dsi: Fix setting completely bogus rate for byte
 clock
Message-ID: <ca3it6wi432z6dp2vrmo2tof4zuxdstj7wutoudzcjfmdacbrn@x7rwkvve454d>
References: <20260903104732.145353-2-krzysztof.kozlowski@oss.qualcomm.com>
 <20260903105241.41C2A1F000E9@smtp.kernel.org>
 <de3e9d23-c55f-497c-9d82-caca692d2f66@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <de3e9d23-c55f-497c-9d82-caca692d2f66@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDMxNCBTYWx0ZWRfX4VliRRbPwhEk
 +51ZkFa2mtSk0B2Vss2KCKkcg0uK6JiqdHYP1QGTU2jQDk53YQOEgJzt3kG/V6WiOmPGFgPXpT+
 YIsZ0vf6tctCZx0jN9indyiexLwA0PHxJII9K9CQxpipAcPuY4pZ+NnvBx5WIUqc9HUKbDIcqDb
 JBYKHTdqGxqsNV+u+CoqyGFwUV8h0IxQBe/EmBLssnTdJC+da6CAz0KZxWSA2RGG7tzlkNQKkkK
 k0X2OqGkGFpjj1mTVw6bXObCzChTjhkNXOOOLGENLbTKN2zOb3wF2HCIolOf3BR9m+5+9e5seIJ
 g51V4JtMiT54BYgqS1XkMeWoT3Q+DIaa8lqZ35BOrALRnDgJI9OGFnCGyz+wKMwVZ2NMxKzr3Cq
 SuNlC/vBO0IytCnjcFljefE/sIbivVNGKwzO+VfC04VeuBSBCNOj/jp7321o9SpubBCvgJbZDbt
 fTWqRyQ9UGMMiwOzk7g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDMxNCBTYWx0ZWRfXynXTDDz+OCE+
 N82vU+B94xU+JX4QFgAoJ8TOkxYHhpHIGqkqUE15uaZ55Rjx69zS3mI5C7XP7jod1VVdZ+Q1oQX
 4IgkUbl7QzF+w3jlfrKhnrUJn51kLv0=
X-Proofpoint-GUID: DlRrhtmTZFpAfDvs1d982k2Hkg-inJcc
X-Authority-Analysis: v=2.4 cv=OeUNnRTY c=1 sm=1 tr=0 ts=6aa71d31 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=9kEsh1pE3Zk3MPBAzk0A:9 a=CjuIK1q_8ugA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: DlRrhtmTZFpAfDvs1d982k2Hkg-inJcc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_07,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609130314

On Thu, Sep 03, 2026 at 01:02:57PM +0200, Krzysztof Kozlowski wrote:
> On 03/09/2026 12:52, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > - [High] Reverting commit 6cd33b6f4155 directly reintroduces a panel scanout glitch on MSM8916 and similar older platforms during runtime DCS commands.
> 
> Obviously. The problem should be fixed other way, not by introducing
> incorrect clock rate rounding breaking other platforms.
> 
> That commit introduced regression so it gets reverted till authors come
> with proper solution, for example.

Fixed by
http://lore.kernel.org/dri-devel/20260903-fix-eliza-dsi-v1-1-3474a6c9f2e0@oss.qualcomm.com

-- 
With best wishes
Dmitry
