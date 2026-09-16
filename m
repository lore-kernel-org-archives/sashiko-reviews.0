Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CAC34A5EBD
	for <sashiko-reviews@lists.linux.dev>; Wed, 16 Sep 2026 09:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789551020; cv=none; b=mbmyhRFLQ2ygfX3RILSrLEEHvWk++uae2lEvTKqR6PHNSMQs/sl6jH0p54jlO9CR7nwhAkwAgwPCEM+JgPIXa39ibAZU5LW6p+15eZpAn+Yrne8h3huDGl9DUJ1d0yCozm9kvMvzDMU71Fuul1hrHofpuoh4sZ2EPrV3sV4V5ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789551020; c=relaxed/simple;
	bh=rVlNPjI4P2z37o7qE9/JXBSWEwGmZChcHXGnM7D9n6c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tRJk/PFfLhs+qICPL/UGrOgY0lhAZ4gVlaB6qOVv3jFRsgSvq90PII6MsPdvQcsxN2qEKv5VJWd94eYlrnMxciI+CRdBgQEJRwyaTbTeJl612mzyLwWEAWIiQMe/d8kom/8fh9F8W7xOyp/cWsFKeWKHGr5TXXH9gSeXSLrK+yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YCaIdDCy; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YCaIdDCy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789550997;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pLJ3zniryXoIXYXj2kORk+UpoeKS9R6ImYDJyVbdKgw=;
	b=YCaIdDCyoE93yZmBAfESVoajo49TPwa7hyUImgklXjgAUauE0Chzl86f50GNoG1YHkECbX
	uKOo7D/Pns4ekjXFNcSGeDA73JAlN9XoMn0nntR3B7692bbvQVsqyPCtGxslQ+DCgKEJnz
	UEYk9QAiKvMY6GLKrQa4HtfSFvVHLhs=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-256-Z3FRAl_QN-qrvJDMlGXONA-1; Wed, 16 Sep 2026 05:29:56 -0400
X-MC-Unique: Z3FRAl_QN-qrvJDMlGXONA-1
X-Mimecast-MFC-AGG-ID: Z3FRAl_QN-qrvJDMlGXONA_1789550996
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2dd667770efso19137465ad.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 16 Sep 2026 02:29:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789550995; x=1790155795;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pLJ3zniryXoIXYXj2kORk+UpoeKS9R6ImYDJyVbdKgw=;
        b=yTWtvZCsRfGIDirW21Iq4k/Ql/w0VrnHpxd4QCxN+Zd70aY+WmMn0/SQu/GEDwuG8z
         o8ybE/wAQPGtHdcF9sJ5reni09Zre62ybOvE8SOT0LWx81MrcrNjdAtdu6Q3sQIFKwnB
         FtiMIPmgWG0VHRjgUYG/MbFlGbrkBzQjfU43WfbsUol3aQnZ6UdtZQJSsoBErOrA2Sz8
         gZP7d+NJJyrTMb3QCAKquTCDzOCdpuJfKGXBddlMgS5ou34CtdyV40T8NP/DkzaWIhHp
         ob1XPgCUuidzP8BfFX6rF5lrLcMN4DL06nr+T+eta7BzEXXlBSzEb6I7Y/4dGDfqCjUE
         i/+Q==
X-Forwarded-Encrypted: i=1; AKwUvBy4mLbYm9yQbnvu/Qwk/okmM+RiO0G5EhTZAs9Hrq1WRfEBRnYDwfUIJbdugmyp9U6wwGqY0oW5SDmLCfRpnbI=@lists.linux.dev
X-Gm-Message-State: AFuF++kvt+fSB4+Xa7FYYl8u3C/IHzbeAvPTJLARD75fSk0zfCt/71sy
	gV0vLsuncOateKmkJDQuwhIbdrCvbLpfrRAy8mFJcG0bmDz+d06trHdRsU1Rut3zuu+INOehkrs
	oL0paAA84eWBaNbxZMFHEQJQ3vX0WJgL4ZjaZ76Q2HMKE5fULhe/KIaPenjRiDYu+qnsVWJoc6E
	snlhiyEYMjay18dUoiqgFfCzxb464lki1Flm9fIT7SXwke
X-Gm-Gg: AYBFou1YoEwKxrO8XUw9e0EEX02AZn2vYcipU+u8TZZHxhJovrbp6UAs2b2w9oCWimS
	/LiGGWR1zW31gXH+pM4Zdi3iks3RPUjBHujS6IM8oM2ZfFkRgrd+xVqO2HQe3P3f+BZBYtHVAwy
	d51PGx5kZl7IsDiLfYljeyfs3CIsKuLvpJ1ki03AurM8HkbrhvzhqE9juc
X-Received: by 2002:a17:903:3b8f:b0:2d7:4bc8:41a4 with SMTP id d9443c01a7336-2dd8ea1cd1dmr23798565ad.10.1789550995047;
        Wed, 16 Sep 2026 02:29:55 -0700 (PDT)
X-Received: by 2002:a17:903:3b8f:b0:2d7:4bc8:41a4 with SMTP id
 d9443c01a7336-2dd8ea1cd1dmr23798155ad.10.1789550994573; Wed, 16 Sep 2026
 02:29:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260911124540.279841-1-tzimmermann@suse.de> <20260911124540.279841-3-tzimmermann@suse.de>
In-Reply-To: <20260911124540.279841-3-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
Date: Wed, 16 Sep 2026 11:29:42 +0200
X-Gm-Features: AcwNN1VjQRR608PaSU5v9yXg9eP7o3aE9lu55JInhqrDujLUhvS3kxSMIUXF4N0
Message-ID: <CAFOAJEfWX09ZvnQvn1+SBeW4_MaSRO2JNLfoJRGYS4jXGr-09w@mail.gmail.com>
Subject: Re: [PATCH v5 02/14] drm/panic: Test address from kmap op for NULL
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: jfalempe@redhat.com, airlied@gmail.com, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, geert@linux-m68k.org, rdunlap@infradead.org, 
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	amd-gfx@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	linux-hyperv@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, nouveau@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org, virtualization@lists.linux.dev, 
	sashiko-reviews@lists.linux.dev, stable@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9O4cKjXTRp8Srnm__TKziV3n0ZkuD751rhsZw93N1nU_1789550996
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Thomas,

On Fri, Sep 11, 2026 at 2:46=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> Do nothing if kmap_local_page_try_from_panic() returns NULL. This is
> not likely to hapen, as the previous page from the same memory area
> has been mapped successfully.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 23437509a694 ("drm/panic: Fix 24bit pixel crossing page boundaries=
")
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Cc: Jocelyn Falempe <jfalempe@redhat.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v6.18+
> ---
>  drivers/gpu/drm/drm_panic.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
> index ba21df4be338..d28ce8878e05 100644
> --- a/drivers/gpu/drm/drm_panic.c
> +++ b/drivers/gpu/drm/drm_panic.c
> @@ -178,6 +178,8 @@ static void drm_panic_write_pixel24_xpage(void *vaddr=
, struct page *next_page,
>         u8 *p =3D vaddr + offset;
>
>         vaddr2 =3D kmap_local_page_try_from_panic(next_page);
> +       if (!vaddr2)
> +               return;
>
>         *p++ =3D color & 0xff;
>         color >>=3D 8;
> --
> 2.55.0
>

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

