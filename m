Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D354B2DEA7B
	for <sashiko-reviews@lists.linux.dev>; Fri, 31 Jul 2026 22:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=67.231.153.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785538770; cv=pass; b=vAZM/8yWeBwXDzZ4OS18S0bQapV0ardEF9vmFmtB5O5OH56hNBjm/cNMqF/zFl0BvUg3qx0ACk7Atq3WXvvPPMaLgDhCLWYE1+Ysh4KIhRyVb7y+k60qKxQJev6UbYjtAdnlgC/f8uBeDpGe4uBu5zbhfY9lQdebgljEcoABZ6c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785538770; c=relaxed/simple;
	bh=TWcPtjAG4u7chlP5TyRDKKWblA7wU+NlX2Ibp3AWBks=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CkFOXoU2Wv8rv+JSd9l9/qPiWFtlIfNQdHVqB2twk1x6hRXrdrz9ixu6EwH61coOaujq8flfj3ql/8hbKDIF+4Yal4KjLZ4luQOsdS+7trj7OubaecdDE3fsNQ2OG6SeeyCVc+uYB+PLw45YwXTuEpJKmJjYhcti4mk+ggJ9jUM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=FUF2N0Ff; arc=pass smtp.client-ip=67.231.153.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="FUF2N0Ff"
Received: from pps.filterd (m0528004.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VMWYjc2439284
	for <sashiko-reviews@lists.linux.dev>; Fri, 31 Jul 2026 15:59:28 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=sXFksAHvqmB7jfoZlHKXAtLMdf8uLXt8quqrA
	vj0i34=; b=FUF2N0Ff8bRoI+Jm4n4FqP0UEtfp2ZafABB+ZLlVHxt3/n4mCu9ji
	tmyxKNmYnX02kKgIzt0D6oWqHsCR/pV7Siysc8tevnCjpRyn3Gaj8zpE3MTkzEpi
	JbkNSKFBfbAdcskM38ush7GML4ZLCte0uuKQsbFLbGQfF/KeHa0erD/zloXr2ROI
	2AcS8a6XIy80Em87RsUtY6SWr0zB5JnmeGRZ6C7E8olWq6tpJQAZIvP+Snodglwa
	rjz8oiOujIhbDetPlVi+T3Bdit9GkMDR66Mb5drzUvjTtoqwuDn76UsltmTSxKdb
	FzgJ1fIASoS+LL01Ez+/4cm54Jds0ENhw==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4fs0dshjgq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Fri, 31 Jul 2026 15:59:27 -0700 (PDT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7ebfcb4c999so1753422a34.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 31 Jul 2026 15:59:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785538767; cv=none;
        d=google.com; s=arc-20260327;
        b=TAgdNgPcbjPVIkhB+XPSSlEh6spgvPUyNViD3tXGXoU9bXWcm3ZEkkeOv8ZJhRYFtX
         puQ1xdITZCMH2fyqOQf24rsB64cSAD5HiZ5ar2Ys9K25yNv/7tUI0b2B5Bbp/nLghCiQ
         r7XGB5gUyA25vmyZ7WGzq+eVxgfYz1VUbIv+LF5E2f3FduFCMlLo6BJWAG+N3SkTdB7Y
         UTYspvzl9h4KioONMutKMMlzHlGNylBStDTsy1iqlyz1rwNP9uKV2rwEyTgn3wVcNBCb
         Shv7AFIHcIgm0+aqmpkjfL5dl8DiiwSXefXWbitOxPAzK6SoFwS6IVyRC20lEjtZFv5I
         JGuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=sXFksAHvqmB7jfoZlHKXAtLMdf8uLXt8quqrAvj0i34=;
        fh=sImXpcRDPx5U58yDC/2Ri7tG8zC0m2k+SZgE0QR0TMU=;
        b=dynns8Z8Eo8e4LCinL3100hakIVEVqVkoc112y25Zcq7ct+qg36MsyjX6sGYhI8QF3
         /fZa56C/IPHomRh1+FBHR7oIrWl5GnfHQRbMgmzJOeL0c5OdOZEWSgQMrCbGUBws3u1a
         xq0WQRgjULxTGrU75bluW8ir9ugo37aVHZuabBkym4L9p+h6mEbbbGum7DjWjlBtYHXx
         HmisaSAWjp8iUG2VigkYSbbzdlBsaKY08PABcCPGod+2cTmyTokEbIy3hx/akSlS1eVt
         1/ZqGFgmRdp2HycfgllQIm3qSL+KI7inKtYCDiV/LuQerHjOegPYIu+GUt4vScKpgQCq
         bQIQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785538767; x=1786143567;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sXFksAHvqmB7jfoZlHKXAtLMdf8uLXt8quqrAvj0i34=;
        b=hXYtQXUHyCAEkHYvwR32n9F40xcfeyB8RV6YiKy3RiWGLcGuIOZTEqrLn8JMgEiF3E
         SwmeC/I61+Iz+x9dtZg072SVs46YeyhCPwQDGCMlKqKA2yJsB1s83ezSUTq+12Km4E5Q
         n+khTt3ueb5GRaKI4ekNsoLW0R45W/0SEpP7vYMK5MMZlzCorsCXeTuuqy8RtYd9PUcr
         BMScKSR0QJVIK8X4t6FVhAuuJLaKjWm8lNW0ajsTJxbdMz6XPlbn8Qtuax/ypsfPP6bc
         oFwSNqjRH8YrSsSCArMXmgigR0A/gFO1L7KyVhm0jW2TbBGtMYd673OfR7214ZX85YiW
         iOsg==
X-Gm-Message-State: AOJu0YwjLLIsT/a1FwUOG7tGYK7ItD7gvX9TjxOxKGGBUTdISI7STfmJ
	Otd6tpFCTo0tq4DY1ZYcyxCDHi40Brr2Ikb8ELgRVXf4gZr71u3o4dsh8Y3NsaEZwRPtSHzI7Eu
	oYwxuSOqKbR6yEJSTmxTZWFnGPgqCKhdDmRGQBUtOEC1CjI5R+H62JIBR3gkY6sMVvySmAkuKHo
	iA1Y8oJ9Fqm6cFiKXfd18f/qLk+bZ+mJwNqX7pjFCHCyEHlPZH43PrmQ==
X-Gm-Gg: AR+sD10wUui87CWhYYSc7QlnFWKFHfFmsdvfgTuepO3BeFlG2yfGcffg4b4y+xTcfjP
	gcDqWTkdnLrsTFboFqyFDKMvzzWHxlFeW+j0w0NPU8czyxC4B4FzslqTruTV87GyiNyXsFAVr1q
	deopN3hrAW7hZ8Pwo24Cplz2vVBWMnmAGd7yKIj1+UapPho/KomuMDPTtRPOrv3eFcMp01DuK7
X-Received: by 2002:a05:6830:67da:b0:7e7:5e4:ee11 with SMTP id 46e09a7af769-7f196f48db7mr3826371a34.16.1785538766992;
        Fri, 31 Jul 2026 15:59:26 -0700 (PDT)
X-Received: by 2002:a05:6830:67da:b0:7e7:5e4:ee11 with SMTP id
 46e09a7af769-7f196f48db7mr3826328a34.16.1785538766468; Fri, 31 Jul 2026
 15:59:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260731211601.3033906-1-zhipingz@meta.com> <20260731211601.3033906-6-zhipingz@meta.com>
 <20260731214821.2A9AA1F00AC4@smtp.kernel.org>
In-Reply-To: <20260731214821.2A9AA1F00AC4@smtp.kernel.org>
From: Zhiping Zhang <zhipingz@meta.com>
Date: Fri, 31 Jul 2026 15:59:15 -0700
X-Gm-Features: AUfX_myHxlkqFnSLC9MVeO-2eucc1qmrR-J0Lg2UWhuCZpzuHdreSVtFADd0gQo
Message-ID: <CAH3zFs1Nhp2vWnoyDT6RpePRM3=JV9JeMuWz4jZwbnSTx=6PaQ@mail.gmail.com>
Subject: Re: [PATCH v13 5/5] RDMA/mlx5: get tph for p2p access when
 registering dma-buf mr
To: sashiko-reviews@lists.linux.dev
Cc: linux-pci@vger.kernel.org, kvm@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDE3MiBTYWx0ZWRfX+kLs8Kz4fesK
 1qGPmYKIJmWTPRploa7T8fKYVkLizGok28KlLJXhrQZCxeD2Te1UpX1hjtBG9KSbPBz9vPXv+/J
 JN3mDzhUOi+CFgcrpB5kM5qhN5s1GCfRCdZFJuoRUJ14fWLFdvZbOO6fhql/3/Q0rDeXAtyK8bx
 OSxa8Ueul2hbzNBcFU40Y2GkaJ4cLh5waGwyMWABZWQhYEpfabiqTes2/vd0u3KPmH+R0pcw3O9
 Q4RnUXQRcRP1M/lPFCpZ4V3VrsF5j4fzfVl7LXRt8NwBIBUpmcoBc/OX/ertTUk4kqQ2jRwivB/
 X56mU7eP4+0qDsK/UQr4DvZaktn5QssV8VChr2DLoDKq9LyhGYLbqkMSF6z6qQHB3mG5bZWK7qT
 6zqH9q4C0eCRjk17hal06/4cPlKdlHZ55yJ2eLxZw49Tonn8R+3XnTuWSG3t3LcD1BC/GoU5esn
 KJ4zlqMiQyjk/KOW+VA==
X-Authority-Analysis: v=2.4 cv=Du9mPm/+ c=1 sm=1 tr=0 ts=6a6d28cf cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=GbPsI2Ihf5RTnMjR_gZv:22
 a=VwQbUJbxAAAA:8 a=So9IXvp4ApBoCZzCt-gA:9 a=QEXdDO2ut3YA:10
 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDE3MiBTYWx0ZWRfX4BRK68XctNgm
 N/XpGiyg4+U4glCFS2JkyxwCnADB8v/L5/IJw0qWNHsaZeyc/5JRKp3EuXNZW74QN9OdQvEWssF
 83ZlXLwbADNwQmCjW8HxYK4f9D/B/f0=
X-Proofpoint-ORIG-GUID: 7Y_B9nWEyMTiOukuhCpY8zbW06noTqxt
X-Proofpoint-GUID: 7Y_B9nWEyMTiOukuhCpY8zbW06noTqxt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_07,2026-07-30_01,2025-10-01_01

On Fri, Jul 31, 2026 at 2:48=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
...
> [Severity: High]
> This is a pre-existing issue, but this patch introduces a new, heavily-ex=
ercised
> reachable path for it.
>
> Does mlx5_st_dealloc_index() leak the mlx5_st_idx_data struct when erasin=
g it
> from the xarray?
>
> When a steering tag's reference count drops to zero, the entry is removed=
 via
> xa_erase():
>
> drivers/net/ethernet/mellanox/mlx5/core/lib/st.c:mlx5_st_dealloc_index() =
{
>     ...
>         if (refcount_dec_and_test(&idx_data->usecount)) {
>                 xa_erase(&st->idx_xa, st_index);
>                 /* We leave PCI config space as was before, no mkey will =
refer to it */
>         }
>     ...
> }
>
> However, the underlying idx_data pointer is not freed with kfree(idx_data=
).
>
> Because the next time the same tag is requested, a new struct is allocate=
d via
> kzalloc_obj() in mlx5_st_alloc_index_by_tag(), won't repeated allocations=
 and
> deallocations lead to an unbounded kernel memory leak?
>

This is the leak fixed by "net/mlx5: free mlx5_st_idx_data on final
dealloc" (df6134b527a8). Sashiko appears to have applied the series to
a tree predating that commit.
