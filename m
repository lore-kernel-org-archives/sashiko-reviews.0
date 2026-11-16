Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794832383;
	b=sS+pLfGSsCOsWIas4RouimKUI5a17vkzPBpf7Z/zL1Z6ULlC2p2sMHZePBurkVPyPh6g
	 ulkXsIkeiMWGzSeljRqvDkS2AHZjAVniqDq7Ybvf8uZMJMZblTwhvA97d8w6JJrdvJJF3
	 1jIhmTS1m8B9TZVVSCf44Uiz9XLCz4QGB06RsRGsWq/hUKXvaCv8flCbFb30jmO1AoK1o
	 Jhrn5CmbNwq3QNnfRhKf+dslpDt3vvBVE6ubqcLUbUoPCPOGhYNpH1VAGskeN3pON2raI
	 FpMAMc4j3pH/1LM35JIxCyKCJXAVWFps6DvJA1R/vBqXruxqrzO20czfYIa3Z5zOJbA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794832383;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=WM4OfNSQop42FqaSuvQj4VY5i6qnj1lHHTtJWd2n1+8=;
	b=zAAtn2JYiL8upstiFsIIby9uoSV+dnMBG9C9oB9m9p5+/HHjtHaWZ/IHXe4BeVwsn0z4
	 TWbBNlXEKe8/MBBoHr+RXYGZNJb1g+t0PfFTou9dRYRnQ6zKBwJah/k4NQVn0b92JKkyI
	 XTZ4W3NRwYonl15uSSlTiPap/p55lJ/HXi7X4Lmob/5FizVKF5/nG6+aO+VfDd0U8zocN
	 9E2zJs2GPHcXl/KLgVKivVevqXHvv5UWMytNlZDMw/d9HQ+YdYim55YIObO4QD1w3/57D
	 S0XelNDqogNZUR699bf8bn1DqDQrXJ2IO2ockAne7MmkuPucEzuB/MJHAu1Z6N4vK7g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qvhdbyIT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.173
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11E3606A323
	for <sashiko-reviews@lists.linux.dev>; Mon, 16 Nov 2026 12:33:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F11E3606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qvhdbyIT
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-5364042eecfso17818761cf.2
        for <sashiko-reviews@lists.linux.dev>; Mon, 16 Nov 2026 04:33:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794832382; cv=none;
        d=google.com; s=arc-20260327;
        b=BJTIUJ+p0Hp8z3iTPYK3FjgsyWHlWkxgTl2vOOwrz6RyywEnbC8DM8GL4Un0Y4SY4D
         bk5oQn7ijtQP+tBohIHG6aJvEnDNF9/t+HiF1OEhsW69bEJYUugwaDal6pupogP/YIsV
         y9e47EkK4mO5xn+/7tEvAMqFl0v/zH3bw1e12Xo61/aUEfvj5Byrd07kDSEuPUReW61d
         s3S4AerCPqQzcirztRD7bgkY0hKBZ8G7Se8iauRZCweOYpD5Dv4hyIfDMrQudJxAwWM4
         +Ud5Os6fjGdC2lH8nWY4kf1pShfjHFLmcDA2JkPv0tj3FqIfA77DmHS8t9sEfuQa45VD
         NAwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WM4OfNSQop42FqaSuvQj4VY5i6qnj1lHHTtJWd2n1+8=;
        fh=ovoIV3eSQ8lwoP46mLx/1hpCZWJRZmZt86CkqVtrYmc=;
        b=mmTE6fJbzXLuz+M+UnBgDRLfPY4VEIE1u2oN5n+JaQW/BzLxDqtqv6PgddBlKiV+MQ
         ZKWl2K5k0faSd6ecFz+D1lqn6AXDRNdAElRLIJ3XYcVD91aLnXk7upRtQWnCs+i3NTxD
         W2u59knCnskMbekJ8+3anwg02+W13j8bGug3l26ABQoSq7UqwYWbVmyLMCxMPYWUh3tl
         7Nu13pctZvCUo4yxGT3Znx43BcksE4+Z3r+Q4MZELv/6x0ta32g7+dH4SM9Mos89dpxu
         OBlNVBQ3nXVHf7PmULEj05n8syk2gaenW7POjll38IeHEQRqKrIz2K415i1poiyzI8ei
         pxUQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794832382; x=1795437182; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WM4OfNSQop42FqaSuvQj4VY5i6qnj1lHHTtJWd2n1+8=;
        b=qvhdbyITmtuNx9aDEd3ykrWXtIgSrP9b9UiCualYASMZrYIl0jTIKbPpZWR3SKLImS
         SdVfUi2eSSX09Vn0DnFntmtLqrHBa70ZAtNKwr7usmuEmIYTL7NhmWtnXcgkVXwnigEz
         brYfg5YaCkZBKK91bu0tiocVcQAzBbp9B5CSArVl6xX6hVE0TTAbb76worDNhIU7Q2kf
         3wZT1QRSGVZ471tvOh5C6vSLqHUwzhCf67gSvG2Rk9p86jA6QI551CFtRDBFAomOZGGJ
         mx5fED+Jz6RRruzLAJ15wsPPZdERalxYdKbX4E9z35Q219D4Hg+4r22OXI+3LwLYojI/
         LdqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794832382; x=1795437182;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WM4OfNSQop42FqaSuvQj4VY5i6qnj1lHHTtJWd2n1+8=;
        b=gPl+HuLNhaqWHmcDWa642IE+lTpcS1H09GCkddMxY945jbeQLxuLN0Dwp0XRxxa9k4
         dGAUm0MX1fbzvFcQ5YI3YtzMccCD4NKL1UjWofzlpzAODzyBZM2G3kqm1dDBDRE+iXkr
         j8LTYQc/K5bYfcLQnGxWh3hhgsIo3STnkWpmIIhnZFZF2DA0IczGF8pKL8VScVVsMcmg
         CPha+ttdmqQu6EnHEl5rBz+/U8ibn42T89unawmenYB5Y8/TiPsDjX6Ooi9DWdtZ2kOh
         3e8/fslta0VaVCwuL9vzNCMaAGu6YhXYfzJzPl0HAvpAujREy3n9e0qs/usg40Z4CClH
         lg2Q==
X-Gm-Message-State: APuU4Z/qAS/vtMFP6xcVr4/UNEo5LljzRxJWSdhD3rDvxAWyqpaqwp+P
	gKj+d9hex9aN0alvGdTxlzjBDeRTwEaa6+IDVUFh5SbJamoGcCWzhSgQNTYuFPlyJKixf5jigOL
	9yiNxhf5ajK8NO3o/bkvnQZRVzhl2MZj3yQ==
X-Gm-Gg: AYBFou02Mc0GpW04u6LaJ/nehCYVClLD6Q1icd85EW/UOzj4/dsEESaR4pBw+m7wqAV
	PT8a/JahnH2RkC8xZS8bsTDpzrPQyYDT24mKFNpEFdnBno3l++fij1VNROyGIqY9HH7zMQzxtbH
	2DBJbYtvXkRPVVlJBzHN5dNjR01IVLH2zxVF9APerih23Tjz551stJFkFDFceYB7bp/8s5qmNO7
	2miXubhGrdKB0tkoFHC4MgaTQDA9d+8nGlht+2MBi7+3GcJwDd/CtPw1ckNJJskAWLehuUqBwxV
	LJ+TKz0e+s6N8nV/AL3k63sx7QryfEb3F+6AQJAHWe46XDmgLHlou2UNbIrkkMMAZj5FTwhaigW
	lSCyY8ZlqW+oGagmyGr6z31yIOdUt/I8h8qDPLIMseQjmYQLnAAR3ReFJBKR37MRV6QUoCKs=
X-Received: by 2002:ac8:5d08:0:b0:535:bb7a:884a with SMTP id
 d75a77b69052e-55ac706b54cmr161105011cf.19.1794832382051; Mon, 16 Nov 2026
 04:33:02 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261116-sdhi_hs400-v1-0-c5bedd312408@bp.renesas.com>
 <20261116-sdhi_hs400-v1-1-c5bedd312408@bp.renesas.com> <sashiko-outbox-217001@kernel.org>
In-Reply-To: <sashiko-outbox-217001@kernel.org>
From: Biju Das <biju.das.au@gmail.com>
Date: Mon, 16 Nov 2026 12:32:49 +0000
X-Gm-Features: AclHuK9oq5_INK73sxz0yKmI8hWmO1dhokNEi0IIopn97AvOdbkyI5N8-h0lU5A
Message-ID: <CADT+UeCde9kNvK5Qroh-iLp9VHq+E5rvOOFKcc+PnY4uMBo3sA@mail.gmail.com>
Subject: Re: [PATCH 1/3] mmc: renesas_sdhi: Save and restore IOVS across suspend/resume
To: sashiko-reviews@lists.linux.dev
Cc: wsa+renesas@sang-engineering.com, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 12:17=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] mmc: renesas_sdhi: missing Fixes trailer for suspend/resume IOVS
>   fix
> --
>
> commit 2573360487a180f719dfea67f2b66adb00db6390
> Author: Biju Das <biju.das.jz@bp.renesas.com>
>
> > mmc: renesas_sdhi: Save and restore IOVS across suspend/resume
> >
> > The SD_STATUS register, specifically the IOVS (I/O Voltage Switch) bit,=
 is
> > not automatically restored after a suspend/resume cycle, causing the
> > regulator to report an incorrect voltage on resume.
> >
> > Fix this by caching the CTL_SD_STATUS register value in the renesas_sdh=
i
> > private struct at suspend time and writing it back during resume. The
> > whole register is saved and restored, as IOVS shares it with other bits=
.
> > The save/restore is only performed when a regulator device (rdev) is
> > present, as the IOVS bit is only relevant in that context.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
>
> [Severity: Low]
> renesas_sdhi_suspend() and renesas_sdhi_resume() were added without
> preserving CTL_SD_STATUS across hardware reset when priv->rdev is present=
.
> Should this commit include a Fixes tag?
>
>   Fixes: dcbce328d3a2 ("mmc: renesas_sdhi: Add suspend/resume hooks")

Will add fixes tag

Cheers,
Biju
