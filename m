Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4D253D0A6
	for <sashiko-reviews@lists.linux.dev>; Thu, 15 Oct 2026 15:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792077570; cv=none; b=ZtufzkOa6mf38MTici/OK2V6/XJ6aTLNaiC8fV9Lpgip4Fx3JDvPD6GWcDVo77sFokc4UHBEGonIWjSQnVi0NDzuQC2r+c+UCOxfbqU8MXQ8eAup+GYChwzSOxpS6RcbWLjMVAnTv3yyOKfQ0XN5LH5eXavroEHDhZ8ez6Ae3Cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792077570; c=relaxed/simple;
	bh=e7fS2xtv9ypaUPY5HvWBBGpaGJRXS3qwevPP39BlOtA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mtGDNLv016RgFpYuUc9atRSd/Tn3woJ9AI1YlRb3cuDvKqup33Aa0YJXHVob9WkXU8wN3J79sLD4gymsu9bI9S2zKk4NAPNwq8hfQcfhj5TXkAbjiQmUyON27H8HygJrgln9biRy4RDwbMtJCWfxaay1bVDN8Fb5QUqXCoM9dbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=pYz5Qw/J; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=P2pd0KJ/; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="pYz5Qw/J";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="P2pd0KJ/"
Received: from pps.filterd (m0167071.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FEYCgu2297731
	for <sashiko-reviews@lists.linux.dev>; Thu, 15 Oct 2026 11:19:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=QhSf
	4ZJfy8rNmGXFxMJd1R/8liOB33/pGtpd9UpP1zY=; b=pYz5Qw/Jw4V0YZEHpRS8
	tYGKcwrb9gZWz3zBlKkFyWpjmv0iY1vvE+PblJM8psToj9jFHMS82TZybG9K9o4p
	NG4ns1JYr+nU73qnT0Y0FTWJfK4OCw9s4iRpc+lnQkmKNjbQSRQNikd4crWGcE2U
	QeVHgBIUl3P9YjHiENOXCArfCX3plg3AOglhWSJ0IWuNoFfX4FNS1aPeBq0SeZq7
	hbe2NeHh/CqN5LY1VVQITtPFMlW6FB71QRuM240A7CmvWqZcM2agVKjzrU7xN4n4
	oXhca1yYXtQtYN2MndKQHbqUhZUu9mxNXCarVcbyztUavXlAG6GFVTKk2Hyl0ONl
	zA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4hahdrd8ad-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Thu, 15 Oct 2026 11:19:27 -0400 (EDT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-936aa34873bso328781985a.3
        for <sashiko-reviews@lists.linux.dev>; Thu, 15 Oct 2026 08:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1792077566; x=1792682366; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QhSf4ZJfy8rNmGXFxMJd1R/8liOB33/pGtpd9UpP1zY=;
        b=P2pd0KJ/XMt/knB3fLtDx3Fg9aWklDFKfRQgwpSd0o6cZRoVGnVslXJLmufdsP/YRR
         8vnpj8J+nDn8WOv6Izvrato6RQVVGX3jXM4lXHljGhnA8je4gBOaGf5VhN78O3tyt5Av
         fzuBARCulYKfuKvLOQONSf4Wz2RnUn9GdvHZ84JFaO2UmLWkmkO3F257oWR0glU5UVNG
         IyLmgY6hj3y7xpkArj24K8NTf1argdTBoKCSuzGbOx0Ndf0t4VrWC3/4lOxaxOSd9q/O
         pPe+ekP4p35vQopc2JhHhPBX0jmDS7zRZ2+f9nHeiK9Jd9QcV2H5582HNXXbxDRrvxw1
         2tNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792077566; x=1792682366;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QhSf4ZJfy8rNmGXFxMJd1R/8liOB33/pGtpd9UpP1zY=;
        b=0BGSbTD8Qid6AYntpNVHVBTNnuaZsUas/z0NTuGONoLZKBGEP2+vZhazDVI0oZevN7
         Q4l92GLKcnC10piocRfY1GiQSyoO8Md3QP/nHQyN2M1ci3PzWbQHwP+e63j6bvx25VBY
         zSzcNHk7x2ymUK7/eE+fLrbEtGZoUb/itme5yKfY18uzZl8nnWYFSwKtrlNrS+LSiCdv
         FqgGXHrnHjX4fbBNAvk8ezyMu3lIOKAUdiAHwKb3W2fBBYEe1xvDGZAI4xgcTepuHhLv
         svKd30wq/CO6cy7xa3PONvaOOc1MMVgJx05Bg2zLOb0YAjBA7bX2tQ0Z8cm+MsgfyRK+
         VL2Q==
X-Forwarded-Encrypted: i=1; AKwUvBzbDVWQVZJi/1DQYCAqGPNlkuQEs8GRxUSJLzCtAauhNAzohEMAxnxfADyJgdvdzIkyQoNK4Jl3qBm9qsC1qLA=@lists.linux.dev
X-Gm-Message-State: AFq9FYI/POQsrluD77r7Js25VZpNJTNXRjVZMxaAN1hBscIppnPKN0HJ
	OUAJ8Namuvns6BT4SzSv9PfYtoaSi8o0t8FUZUz8d/sjMNEN5kTrkz2jWLmfdCnznyWzxQPejdA
	Sn0QD3+0lsFpXL08PnPl7qNXRfedhdnqqeLFk/yQ9wRgyJPJIg/W+YtRXKeKm0FEHFg==
X-Gm-Gg: AYBFou0sf0gtlkFK6zeizbjA41iFS8tJCb/9Sh94ekAlimKMmXvXJYuCqQAAxKCfeUf
	uAwM9uwohVWrqCgdt53vOeXDDqABkUDLV8R6lTnfDhGUBPzOOeB2yPmXnoHAsNwql5FsmRYZogl
	CRsu0Ag8Sy8R6L3q8ScO03CxKAbSqgyYm47OEoMu5HcIcD1qiOqeeZSjf+KcmxWmnfxau87cUg6
	b6p44STvbfJLXxyYBTA3DXG+YUtABAuIDGt7IU2cqW+CXcqBc7Mh9wBGin8zqmFSWcP4RGp4YDT
	M6Hr+ZjSJyW0Njc2kCKwjdXA41Fa2+0UqXOKl4KdYmxBvpLny8o/7GAvJILxJQ5TNa3ec++5P0R
	tg0fQpATYWdX+WOxGaADEAzBVs68Hhh2jlozbKILicPhPhw==
X-Received: by 2002:a05:620a:270d:b0:93c:2c15:e508 with SMTP id af79cd13be357-93ebd20e626mr3244184285a.45.1792077566239;
        Thu, 15 Oct 2026 08:19:26 -0700 (PDT)
X-Received: by 2002:a05:620a:270d:b0:93c:2c15:e508 with SMTP id af79cd13be357-93ebd20e626mr3244178885a.45.1792077565752;
        Thu, 15 Oct 2026 08:19:25 -0700 (PDT)
Received: from [10.207.9.0] (nat-128-59-176-51.net.columbia.edu. [128.59.176.51])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93ef4f4986dsm798204985a.2.2026.10.15.08.19.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 08:19:25 -0700 (PDT)
Message-ID: <5ec61284-3ae9-4875-bba3-932cbede14b4@columbia.edu>
Date: Thu, 15 Oct 2026 11:19:23 -0400
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] mtd: block2mtd: convert _block2mtd_erase() to folios
To: Miquel Raynal <miquel.raynal@bootlin.com>, sashiko-bot@kernel.org
Cc: Joern Engel <joern@lazybastard.org>, Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>, sashiko-reviews@lists.linux.dev,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        linux-mtd@lists.infradead.org
References: <20261014-block2mtd-folio-v1-0-19d24ae676ee@columbia.edu>
 <20261014-block2mtd-folio-v1-3-19d24ae676ee@columbia.edu>
 <sashiko-outbox-172225@kernel.org> <87mrsfwck3.fsf@bootlin.com>
Content-Language: en-US
From: Tal Zussman <tz2294@columbia.edu>
In-Reply-To: <87mrsfwck3.fsf@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA2MCBTYWx0ZWRfX9cpxvjCIrML0
 Oz1Qu6sotCODEJM47d6FUsJaW1f9LChnPFHTwTRv4t/1qzCTcM8UCaKspm20DMa+90IxduwGmCV
 ctGzOmoHP8OshFGI9Y5g44g0QeSbNKv5ttYptRxW+PI/HBrYQ4aW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA2MCBTYWx0ZWRfX4dxW+UMtJhU0
 7W5KlnAyLaXsu4xJ8E2ZJrdZt4wkDpl2Vrhe0qUbUUxHC9FtgvZxp56Cv7iFE1lrL0yhi+jWpoT
 fR8LpEXQn610A0QTJQJJUtalXCIzgMSoIfIxXMwdwzFFvD5XzU3ZV//4wC0uAKTZ76OVKmK28yb
 6ztJLEOg9cWb1P/z5EjuZ+4A6+9FIIwSe+fI5NCADwV37f3zn0FgWNLRwjRUKyHOMEOsX8XTt0x
 yO1pEeWXaTaXX0yLGuLydupXNt23EnUKAAecdrvfOTUhRxnMr14Q0+e8MPvw+rF/ypiC0/pZiMo
 tIGQmVnMfBC+KY0D17RVsDkAQuPIe+3UkUFuky8F5ogbHh4DeIy4AZ9mLamvgh1HOoQwb+EAkkA
 u6WHwv/HjKZAJ8EO52rXTavZEE82FdHsCLE1V2L4ISsQdQqOksZZMtOFMuskrVj1/HnLmFmNXeo
 qP/uEDnFuCbii8FHaOw==
X-Proofpoint-ORIG-GUID: nHlSyz3vZRVwKHYj9s3Uz1s4GS0pbWmg
X-Proofpoint-GUID: nHlSyz3vZRVwKHYj9s3Uz1s4GS0pbWmg
X-Authority-Analysis: v=2.4 cv=a7KlZkSF c=1 sm=1 tr=0 ts=6ad0eeff cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=NKoNGjn6KhAaSQkl0TXC/A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=79PYxaXUQd1wl-QFWJnA:22
 a=VwQbUJbxAAAA:8 a=XB4ytFqntYz9O7eB9cgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11936
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 bulkscore=10 spamscore=0
 priorityscore=1501 lowpriorityscore=10 adultscore=0 phishscore=0
 impostorscore=10 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150060

On 10/15/26 5:14 AM, Miquel Raynal wrote:
> Hi Tal,
> 
> On 15/10/2026 at 03:45:56 GMT, sashiko-bot@kernel.org wrote:
> 
>> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>> - [Medium] mm: missing folio->mapping re-validation after folio_lock()
> 
> TBH, I don't know the folio API so I'll let you determine whether this
> is a real issue or not.
> 
> Miquèl
> 

It seems like it's a real but very rare pre-existing issue. It would require
invalidate_mapping_pages() to be called between the read_mapping_folio() and
folio_lock(), which isn't something that should happen here on any normal
workload. In any case, the fix is to check the mapping and retry if the
check fails. I'll add a patch at the start of the series fixing this for
erase and write.

Thanks,
Tal
