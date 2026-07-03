Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30BBB30E85B
	for <sashiko-reviews@lists.linux.dev>; Fri,  3 Jul 2026 04:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783054287; cv=pass; b=YoRr5H1VIe++Q8bCM4gjJFKqcR+Hd04k06ZPIQtsHzOX5IFFW6STpYIBTcFqvCiREks9j5pwtp2R7wpSUY52SAKRav20mxVxVetJX4tjIUwNLOp6Y2XtvYvrLXjeTSBTvm3hJGD5ao8LsQ+TGKuSgF/t6ZujlTBQrFmSI4DfLrU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783054287; c=relaxed/simple;
	bh=+PEDwmKMlxXv4cweX/Pw7SUlOHYM8lpcxQN7R6f0nGQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rSD9PXigQ/zVEassgM9MpfHM7m/2Giuea68BjoyBzONPXaSBsbZs9otQBEhv23KGytDKTXDR5AQZaDvhiLSD4qSVi/Y3gKzyThsKCcp0yEH8Nd1d/QVErZsvJOH+UqrQiTCgXlPqWMQR6v9JuA5NmQBrgouQrR+iYbo++rkNKS0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qZc/QA/q; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qZc/QA/q"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-698439b6e8aso328194a12.3
        for <sashiko-reviews@lists.linux.dev>; Thu, 02 Jul 2026 21:51:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783054277; cv=none;
        d=google.com; s=arc-20260327;
        b=qCjTvRrO+q3qltQI6kef7/LlFdcgwadwwei9/DEy9wZDL1gMJOfswLib1vonyvqvKb
         00sR47VIbQ8YgXoi0gp8MROdTVU3qXhtMlxa3CyoCZR9OW/pPjxuSVZfa9Wh/1zxzvCz
         jpGDdiQWooFBzRG3uz1SfCby+70ATvIky/SxO0oxwvxwf0oOIQB79egJcscHPBApBjTU
         kShqfD2VOcTDE0eszzZI8w8u+RGP7Y0qOCQ/YKMGx6zN0e2fj7N1hptIYo3MXLEuDKU1
         jPzuX/whOMKbNhJm/VkWMntiT2AjIA+1h/PlFRVJZVF+yAPOfQbfC4ZjPqyPCJW+Ss/E
         bQ0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nidLjH/61ALNYi2oe6hdob5c95PJ2ElWhYmQsQsebqE=;
        fh=rEbUDeSlRDHDClN5FFB/8opoJgSDYGApSTj8TnPxcCE=;
        b=TQVYfPt02P/HmqJ5WM+sDFyuyQX7Z8F2L4mK+4XQ2MIKPUAwRhU239w8BQ7RBijL0T
         UXeL1JnwENO5LQn+g7hOgdWcaTqU3P9a1yIrX9NPyjbywIF49FwPoz73X8JNNNbcz/f4
         V6yqyvVPEXfRNWGC79ICNqlgKirVo4ogN3vctkEUCkiTz/oVZsxLLCcdjbKzdrNe4W4K
         hYTy+PLKsP53+JwuNTUO+o3hR+hc4nPhSb/Z3Nid0K85AyrhIUNTnPRuYgPzf2cA1KHk
         +rxhWuA7K1/4TwSxLHCvbKvta9l0gvjbDAS5u12cpuhh6Wb/rf/Nm7G3F/Z23GrNimJB
         G5Ug==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783054277; x=1783659077; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nidLjH/61ALNYi2oe6hdob5c95PJ2ElWhYmQsQsebqE=;
        b=qZc/QA/qpYbfuaguJmdUTnj9W7gTAC/KmvaMOpF1/1raWpmcDNCWk7DHyWVNq30qen
         dTB4vkjGfMIVF0Rz/ub//N3iSt734jqa600xsDzWNWz3Gj7oRAiEAkSeZPexPX1vE1bH
         hLnFyXEoA3AaBfVbBwzPou+bnm/ku7VmaOa18yCVGNPAIXa1z+cgxe6Dem+evJXwiNnh
         OrF2NTk0nVUL+x/xA0um6pMYqD2WuwaFbA5O2s4kgX6EHmKTS94+NGlHIfc+RKpGbrnf
         mAuzrGbfrmFMiqJVddHM3ESoueuUEJSOSG7gJTLar/WKkWHfQMHQmgluNj1t9Qr0NAZD
         XS1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783054277; x=1783659077;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nidLjH/61ALNYi2oe6hdob5c95PJ2ElWhYmQsQsebqE=;
        b=DHpRFkZEkrd5ZHJM74A/z5SPsXy8LIeolAS54YvOomgAwVt2J3Zz6brqwcoDhJjpSs
         DopzpipHLE1bOEYEQEv4KukjV5NEfhq2dYHQtTXEoNns1QSzeum3p8k3FInd5MpEA0GF
         ZgU0hVPDcmp7BaDnVdvRpbYX8I7woxAGg1iIruuYGFA4soHDEICoCF6JJ2dbD23VLwH8
         ukZX/tlH9CtVTFB5cclGNiLemc4yP4Qi63yqB0ZlI3TgwF00zlYvC5+wHlm1udznTYGK
         JeorZVsUk6FlPHWQlKAgzbs6wATlzHXR2tdPBovz1zQEPgTh+jiUX2BjzyVfMlGocWXk
         uehg==
X-Gm-Message-State: AOJu0YyhG8nBVHz6lKpltlCORFyHSV4Qmz+r0C7JclwntpneBVk6c9D2
	T8bjzxe+hqDGKeyJKXU1l8tcA10PfBKaKtYAkW9pM3PKKv3PWYROT4GLzyHA10oJR/zVTDbmAuY
	juSHnW534QmWJxRDQxZAzNP/r8w7NCLqodrsb
X-Gm-Gg: AfdE7cnSCX+s9YNC+ju3GEB457dDYH+3I6B5uOCvC+b+EKcDN4HahgJorrlclu4TKcq
	itHeh6B2xfAEqCojYBp0hHCPY8sP/wI2q2HEd+j8Fg3JKuc8MfFPzlbEmzsKGEcm5Np7TSS2dKf
	RLUwf8LfsKuUu76abWSB/CwQgGBIbx2JukjiLULem80EXMdIxlTDo/vwlpdF0GvjRhLRD06g+kQ
	sqS944POsL8+Sah6u31zRSZ8tKBK9URpmwToz/bHlBHwFS0NPl9xKX5n+9ykOFJS+hM+A==
X-Received: by 2002:a05:6402:428f:b0:698:5f35:a8f1 with SMTP id
 4fb4d7f45d1cf-6989f2de5a2mr4060884a12.6.1783054276736; Thu, 02 Jul 2026
 21:51:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260703041329.2797584-1-ekffu200098@gmail.com>
 <20260703041329.2797584-4-ekffu200098@gmail.com> <20260703042714.DB91A1F000E9@smtp.kernel.org>
In-Reply-To: <20260703042714.DB91A1F000E9@smtp.kernel.org>
From: Sang-Heon Jeon <ekffu200098@gmail.com>
Date: Fri, 3 Jul 2026 13:51:03 +0900
X-Gm-Features: AVVi8Cd2bVlUnwsKTntq8s3Zx4NQPFH6pVrTlzDTRfN2lT2h5pCleS3fAtXrZvo
Message-ID: <CABFDxMHVt1v6pzj9x_Hys571o=YAi1wprjJS8Nz7Ko-wQ=A98Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/9] of/numa: remove redundant numa_nodes_parsed node_set()
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 3, 2026 at 1:27=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] The function's final return status is order-dependent, improperl=
y shadowing earlier successes if the last evaluated memory node lacks a 'nu=
ma-node-id' property.
> --
>
> commit a42c5d6d6a0d76bbe5386c6e6e6307393d31c628
> Author: Sang-Heon Jeon <ekffu200098@gmail.com>
>
> of/numa: remove redundant numa_nodes_parsed node_set()
>
> This commit simplifies of_numa_parse_memory_nodes() by removing a redunda=
nt
> node_set() call. The operation is now handled internally by
> numa_add_memblk().
>
> > diff --git a/drivers/of/of_numa.c b/drivers/of/of_numa.c
> > index cd2dc8e825c92..230d5f628c1b4 100644
> > --- a/drivers/of/of_numa.c
> > +++ b/drivers/of/of_numa.c
> > @@ -59,11 +59,8 @@ static int __init of_numa_parse_memory_nodes(void)
> >                       r =3D -EINVAL;
> >               }
> >
> > -             for (i =3D 0; !r && !of_address_to_resource(np, i, &rsrc)=
; i++) {
> > +             for (i =3D 0; !r && !of_address_to_resource(np, i, &rsrc)=
; i++)
> >                       r =3D numa_add_memblk(nid, rsrc.start, rsrc.end +=
 1);
> > -                     if (!r)
> > -                             node_set(nid, numa_nodes_parsed);
> > -             }
>
> [Severity: High]
> This is a pre-existing issue, but does this function accidentally return =
an
> error if the last memory node evaluated lacks a NUMA node ID?
>
> Looking at of_numa_parse_memory_nodes(), if the device tree contains mult=
iple
> memory nodes and the final iterated node does not have a "numa-node-id"
> property, the loop handles it like this:
>
>     for_each_node_by_type(np, "memory") {
>         r =3D of_property_read_u32(np, "numa-node-id", &nid);
>         if (r =3D=3D -EINVAL)
>             continue;
>         ...
>
> This clobbers the r variable with -EINVAL and continues to the end of the
> loop. If this is the last iteration, the loop terminates and the function
> returns -EINVAL, discarding prior successful parses.
>
> Could this lead to NUMA initialization failing entirely on valid system
> configurations and falling back to a single node?
>
> >
> >               if (!i || r) {
> >                       of_node_put(np);

Already being discussed in a separate patch, See [1].

[1] https://lore.kernel.org/all/20260621143919.4176646-1-ekffu200098@gmail.=
com/

> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260703041329.27=
97584-1-ekffu200098@gmail.com?part=3D3

Best Regards,
Sang-Heon Jeon
