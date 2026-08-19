Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3811D442398
	for <sashiko-reviews@lists.linux.dev>; Wed, 19 Aug 2026 09:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787132352; cv=none; b=Pn7QQ8iGdQ+yV/H7r3DADMOrX3EMc/OZbOC1sZLScobn9v5chbCGLkdwkvHaSOUo/lZsEvKxGUH+OKEGRnDcOfRBaf8eDletf3FoKqnxzgwsDmkfrsfSjX4ND4U3DuFMAougbCYZxpgo245Nioh3h1PamZi6nPD0M93olE9J4LM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787132352; c=relaxed/simple;
	bh=zlErMMR25SYOsUd3S/0AwpVYnof7u7gBjzWgLBfix9I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AdXuSCPNeQW58cJP4fZ073UW4DYaqE7Kwl6t4TlYt8JGBQcRsUwpIqiFCVHvuvD+lXG8Lje2o/a9cpwRk1lQDLHAwJiml9JmMWXx5S6C+waIgVbSj/poJc/FqSmwpiBcvrzEFz6XURLkCdzKZJHAgSAGwSMvVD0s0/OkgKx4z5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5c30d9adfa7so304834e0c.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 19 Aug 2026 02:39:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787132348; x=1787737148;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dIMgKn9ssmwMdJVgg9MfbDylpozJGdyvq0xNOf3CW1Q=;
        b=eQNmf6/6/9FOMwcOmXt5Wgp0lSLj515ke8E3rqf2gX6BuNZOT54rf5pFpCsC15vyoR
         oSfLjTx8tSbtrAN7AIUnwdDTlnZrnjql6ylfqiLzqk6PxE9vxWSLPlJe9n6lJ54en3uX
         RqEwnix60cVGdbzvvM1NPxTTMBoEg6dMp0dCFbwzBVoDpzWf2XQOLk70vqJYkX2cEFga
         s6YDxZ/QGB0medP514sZQOe1fljiCfqaZFrOMtoc/kYImoFGfXQcK0KZYZeGWrbAExuk
         RVXHaImMTbWJdmFFsp8GvqkDJMZYHBiR3sKdn/PSQjeSMe2J7JMzezs0YExhNDnMyxVm
         3SkQ==
X-Forwarded-Encrypted: i=1; AHgh+RrOXlK4Cd/rTbs1WDbLcPNwCYTFlFUt5Y/szp2N18t/mgu1GQVyQHEDothHGPUX9I6tzsCJj0eIlQcGupzaE5c=@lists.linux.dev
X-Gm-Message-State: AOJu0YyaX/qmOQgunTPYVbg7/bsEtlcEWfUTnYMG9ry4ZCMyVSsAob4k
	NLABCLW7e+nHktELz8fjiU2ir6jSYSho2XEODybQNe/PeGkK//p0G14SJEJYhPmsAfA=
X-Gm-Gg: AR+sD13xTDEzzGPnofBBaQ7oh4OgrOXL0M/qqeVtM+5h/ErhSAQX4liR5GVr1wDdEk2
	80N1H9Xw01F7HBBsQ/u/RO4apbiV+8zSxjUukN2MD1v3qiUhvWY2okegYHZjsSG0MxWOJUicyX0
	7Nnj613A+Gpm3qT9L0+FLRwkE54eUuqvvtAToMOK9lC5cq4CiLRV7UtIIMAzm+lZ3jE7X80nXbB
	O1Kn8Hk+Wc6x2pZySKcoY3CIFDhJ6/eE7Cmj2fXmbJptoyBMrF8X/ycuNbuX4VzvBPEX0Msep/I
	F9JCc9GZJEutW6pS7GZRMFmVOKuMulZsDwC9nWcXlJx61C5SobzgSJkI+WYxXK9SQAgZkkMDcYH
	bEz1Ipakz73mflK9sxUmD4mgHfy6VyTqWyIgMq1HR2eN83JpAkwLo5a3qpXJA4Uxo3FbVA0DRRI
	wkvX6qrBSmAZGopp+7oEH2iSvzGkSlWnzesPuQABNcXM8S0hRGxKHkLUNstXCJGHs9X4rkLmNal
	9fmEn3MhikobJ/boZvFCnP1dWbIQb+7Tn/v
X-Received: by 2002:a05:6122:6161:b0:5bf:4522:fca7 with SMTP id 71dfb90a1353d-5c5e3dd68eemr1028868e0c.4.1787132348269;
        Wed, 19 Aug 2026 02:39:08 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c5e2617f06sm1511476e0c.6.2026.08.19.02.39.06
        for <sashiko-reviews@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 02:39:07 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-97bf910aa70so207668241.2
        for <sashiko-reviews@lists.linux.dev>; Wed, 19 Aug 2026 02:39:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpxBrKxDCNsZvr0j8c3upJl5an+5i8ulRN8pLdoJocLM2xOSUf5QqlOeagguGBpr3re7HtCjeug0tKFzX7zrDQ=@lists.linux.dev
X-Received: by 2002:a67:e04e:0:b0:777:ffe0:a10b with SMTP id
 ada2fe7eead31-777ffe0a6b7mr539021137.4.1787132346344; Wed, 19 Aug 2026
 02:39:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260818125012.468092-1-tzimmermann@suse.de> <20260818125012.468092-2-tzimmermann@suse.de>
In-Reply-To: <20260818125012.468092-2-tzimmermann@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 19 Aug 2026 11:38:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWYVjvGM2pOzWoDq8LUSrkFtzOQwdmosHYQuBLnSn3D-Q@mail.gmail.com>
X-Gm-Features: AcwNN1Uwr-MWNK1wEAyEr8Z9JNVhxk4jrnSNE7dazUpWIvLo30uHHQJP967oerw
Message-ID: <CAMuHMdWYVjvGM2pOzWoDq8LUSrkFtzOQwdmosHYQuBLnSn3D-Q@mail.gmail.com>
Subject: Re: [PATCH 01/12] drm/panic: Allocate QR-code buffers statically
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: jfalempe@redhat.com, javierm@redhat.com, airlied@gmail.com, 
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	amd-gfx@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	linux-hyperv@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, nouveau@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org, virtualization@lists.linux.dev, 
	sashiko-reviews@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Thomas,

On Tue, 18 Aug 2026 at 15:00, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Declare qrbuf1 and qrbuf2 as static arrays so that the module loader
> allocates them for us. Avoids the kmalloc later on. Also allows for
> using sizeof() to get the number of bytes in each array. Access the
> arrays once with memset, so that the physical pages are available on
> a panic.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks for your patch!

> --- a/drivers/gpu/drm/drm_panic.c
> +++ b/drivers/gpu/drm/drm_panic.c
> @@ -628,24 +628,23 @@ MODULE_PARM_DESC(panic_qr_version, "maximum version (size) of the QR code");
>  #define WINDOW_BITS 12
>  #define MEM_LEVEL 4
>
> -static char *qrbuf1;
> -static char *qrbuf2;
> +static u8 qrbuf1[QR_BUFFER1_SIZE];
> +static u8 qrbuf2[QR_BUFFER2_SIZE];

I am not a big fan of increasing kernel size like this.
You may run (faster) into boot loader limitations.

>  static struct z_stream_s stream;
>
>  static void __init drm_panic_qr_init(void)
>  {
> -       qrbuf1 = kmalloc(QR_BUFFER1_SIZE, GFP_KERNEL);
> -       qrbuf2 = kmalloc(QR_BUFFER2_SIZE, GFP_KERNEL);
> +       /* best-effort allocation; can be NULL */
>         stream.workspace = kmalloc(zlib_deflate_workspacesize(WINDOW_BITS, MEM_LEVEL),
>                                    GFP_KERNEL);

<ironic>Why not use a static array for this, too?</ironic>

> +
> +       /* touch memory so that pages are there in the case of a panic */
> +       memset(qrbuf1, 0, sizeof(qrbuf1));
> +       memset(qrbuf2, 0, sizeof(qrbuf2));

Please clarify "there"?
In cache? Not all systems have sufficient data cache, so it may be
evicted at any time.
In RAM? AFAIK kernel and module memory is not demand-paged.
In TLB? Like cache, it may be evicted at any time.

So IMHO this is futile.

>  }

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
