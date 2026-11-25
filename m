Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795634688;
	b=0RSC+GfNOxVd4B1nQcKvfxxLcH/zkwjupZKeA4QO7C88ZSq/csXnbrrVFt7v3sDNG29o
	 Ra/F+W6J55utqus4OhhTojVv/Y7v31VB3+VRqw2X5hhAgaR4pMkoT8iGGZo+UyYi6AozV
	 KvP2gjMynb+wCyCfX81FBBfQ/EjuQFx9nombgBItm9R6+o/UUyYQUSyEHZ0APam8okgAd
	 FzcckxG2zA2Tw9zBP21Z5iSb9op5thDNZFYha3squhQYMcFzMK6ZbksJMDoQdHSB0lrBb
	 fenYsPdPf66/9efPPlwIB12tETJHDaFlAp5q+CeHhtdQvglanLd0EI/3z7EdEDdxsPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795634688;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Subject:From:
	 To:X-Mailer:References:In-Reply-To;
	bh=G29maGtmsp2d6vk52+6UC3L+iPYrlznjCdfPM1nxstw=;
	b=NZH8TgDJmoQ5bm249Jv8rYLlDzgLs/978Or/m+u0nYeXluWoeXALsB2mW44zAlAQRlz+
	 dl6cL0A+3sPRzlzgoG4sLaCbUk08xOXVhM25wdLP8cwvPCr9jbLTAYSdxM26/7K7+hMA6
	 anS9IL0xk18GwoHde9Q0LFFYHyZmdO1fkcraL00W3Q57NwEYRmKZ6lvzn7tq5sczF3HMp
	 CHp/QR44xpzmll7ovo6bICWXrJmQ+neKTFujJXvYWZNrW29gN1Lkfzmu7xRpWtL3xLuJU
	 8jJe+vFuztuZwFyyDSNIfecTzHdgkU3lrNJeneqr6xkdhjyXN6/91h3AcQK/VeEnEFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Hx41+78+;
	arc=none smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C82606A6BA
	for <sashiko-reviews@lists.linux.dev>; Wed, 25 Nov 2026 19:24:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57C82606A6BA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Hx41+78+
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8a07078200fso3329264b3a.2
        for <sashiko-reviews@lists.linux.dev>; Wed, 25 Nov 2026 11:24:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795634688; x=1796239488; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G29maGtmsp2d6vk52+6UC3L+iPYrlznjCdfPM1nxstw=;
        b=Hx41+78+yoifqi2lJS8ixgSdGuujqefeGjRErVvmy6kS8Q9O6GebwSLrYYlJccxzp5
         qmxO66BA4qtvt8GWXP696/xwzh1N6KO9Ox/TkL8fEuJ6eY/e5Riyahw5hW1+NNMpvCen
         ZGtEfZ1QhC9igjCj4PyIL9xYjlnVdRaedsgD2Yxg7+6YH4a9vW8Gc39FFraIv/0f/sBL
         n1JBxc8c3dvFrcsJcy6FuE+mXTQg2A4Sk5Q44GMEuLlFgf6hDku49yETP3+0eK05DA9Q
         Q5mq9TupPJR0ih0bpAj/qaCnkmMoAMHYWGIATu0TcBaJy80nVP70tvrSNg2zNtuPr/PY
         sdPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795634688; x=1796239488;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=G29maGtmsp2d6vk52+6UC3L+iPYrlznjCdfPM1nxstw=;
        b=KQrI8riln7glDOuA9OJtpyMnrfpw6G30x6u0N2a+Fntk3gZkweBuBvUl+SkoIxMsYS
         Ls6wStMhuqzQviFHjzjHUzkorMfFIeF4rDMnvjKQZQexSpAEES/XUU6oI3Dqrzsgr+z1
         OqcG9zeeUkRSQgobuuj0U10kMy5s1gpmFZ11E6juF1U6ZqdxYSjLZ/gxir9RbKcOYkcj
         f2IFbzDeY860EJDIncMbO15UHIyuSDftqAeRIdx6pGSuZD01aU99iX1pFarGuO6V0jYH
         iaAaV5wRR2SOuajwU+MWHbpcOIg3JHJU46coFwYzItreGC15cMp+d1n5YeMJL8AQ1kI+
         Wqhw==
X-Gm-Message-State: APuU4Z+0PfqvU5mRSk1d09pRo2OR+KW57avwWEfbbUzECVg6OhVq39Xz
	UzAMwI2/Rx6IR+iAFSJCEAQEJ3gtXTUjiUCHgqNL52NQZO2cChQNUBA6zHvV/WgekT3HgKlHl+c
	qYjLsGavQ
X-Gm-Gg: AZFdTZcx8zINF9E/5E1jRzuZ9waGolqoR8JKvepqvqoH6/1WuSLbjISLl+3xDtIYP2/
	Bc4yrceZ8ffXKVd0DO9IUO8MkB4iwno7ES3CLaPBxcTcF0GOa+AruH5VkBCz7ilHesdwtppfa1i
	UMk1M00imr5/GCLVW/5l4CwHuYta2SY7WxgQ/J1JRN5AkcT5xi4JA1xR3K0GOlA4dIAV4SIw0MK
	0tPnewsF7q/k1RoYRJxhYQzkCpgVYA4cBOWQgb2GUx2mm617DE1+zpQFK+FrcWdcFwp3Ksf0yFk
	T/Avzbf149xNdzCsiabFjlb5QHR1jIHcrqKY6x0FDuyG05IMSwVM+rcuP1wvwtWIBWRux//h/tD
	E3l1nFrSX5MSjuolakDMFHiErxIYIfXvnfavOu9J+Op2yE59ZszAuToGBWXHyBZa1wcg4tJiUBc
	jyTXX/0iIwN+799iWrzMsgE+gByTT0nBmFruWkIhcyo093MNP53cj1Mim4m+DoWygzRVJlUjBrK
	xHr6hB5rCKpm8JiBCalwGVSFdLalZCIRkcXR/IsqMHXwZNXZE093IAs13E96fQyCb1aZCoDcmgU
	MTPJI88vHXD4PVq066xt2oNjezUc++I11xU/y4LweHAas8dK3RiWa5nAQhfvJBmx
X-Received: by 2002:a05:6a00:b80c:b0:899:74d0:8a72 with SMTP id d2e1a72fcca58-8c87d90393dmr17708068b3a.59.1795634687045;
        Wed, 25 Nov 2026 11:24:47 -0800 (PST)
Received: from localhost (33.79.127.34.bc.googleusercontent.com. [34.127.79.33])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873f11da2sm9204175b3a.55.2026.11.25.11.24.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 11:24:46 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Nov 2026 11:24:45 -0800
Message-Id: <DN4JDERN99EE.2WKRR6CJ5R4OI@google.com>
Subject: Re: [PATCH v4 5/5] vfio: selftests: Allow a size for
 vfio_dma_mapping_perf_test
From: "David Matlack" <dmatlack@google.com>
To: <sashiko-reviews@lists.linux.dev>, "Aaron Lewis"
 <aaronlewis@google.com>, <kvm@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20261114132200.113697-1-aaronlewis@google.com>
 <20261114132200.113697-6-aaronlewis@google.com>
 <sashiko-outbox-214571@kernel.org>
In-Reply-To: <sashiko-outbox-214571@kernel.org>

On Sat Nov 14, 2026 at 5:29 AM PST, sashiko-bot wrote:
> [Severity: Low]
> Will passing a non-power-of-2 size such as "-b 3G" abort the test inside
> iova_allocator_alloc()?
>
> parse_size() accepts any positive multiplier and both dma_map_unmap and
> dma_map_unmap_from_file only check IS_ALIGNED(size, page_size), but after
> populating the mapping they pass size directly to iova_allocator_alloc(),
> which requires a power of two:
>
> tools/testing/selftests/vfio/lib/iova_allocator.c:iova_allocator_alloc() =
{
> 	VFIO_ASSERT_GT(size, 0, "Invalid size arg, zero\n");
> 	VFIO_ASSERT_EQ(size & (size - 1), 0, "Invalid size arg, non-power-of-2\n=
");
>     ...
> }

This is a false positive. iova_allocator_alloc() no longer requires a
power-of-2 size. As of commit 53e5fe5f28df ("vfio: selftests: Allow
drivers to specify required region size"), which landed in v7.4-rc1, it
rounds the size up to the next power of 2:

	VFIO_ASSERT_LE(size, rounddown_pow_of_two(SIZE_MAX),
		       "Invalid size arg, too large (%zu)\n", size);
	size =3D roundup_pow_of_two(size);

It looks like this review was done against an older base commit.
