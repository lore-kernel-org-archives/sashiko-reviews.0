Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC94338F64D
	for <sashiko-reviews@lists.linux.dev>; Thu,  9 Jul 2026 03:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783568068; cv=pass; b=J2mqUswGBQ01UwSXKOh/ukninBmyNQblEMQJNNz0G+RdiOZ+kgkEIm4kqfC4Hi+hn0ZP7F3CwePvtOjWMdrdicSKvRWUmv2M+QmQ5dFm48mLCcEniCrEHDPJjI5FWQRZluh8+LdGjQCZRaIqDUfeBWE47Wn0iQHXG8Iw9wD9vF0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783568068; c=relaxed/simple;
	bh=YnwHcp5gSCbZJi1VkH0uzYLY9T/1f9/oVSvbGGMl3UU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gqp7dtWR2KUvMWg+7LM5jJ9v7OoqOYWb8EWwMFJF3NGm7giqBG0hcnaB0kbXjw7C+PlCMiXnXggxgl2oSTeIUPQ08qwc+091e+eJGxnwV16XvxKc7Hh2tf+M0CF1UdY1z17/5iMKrwRzKi2uB5p72oo0PR0Gm2CTC2+JO8wROIs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FHGB32mn; arc=pass smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FHGB32mn"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-51c01c79467so184161cf.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 08 Jul 2026 20:34:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783568066; cv=none;
        d=google.com; s=arc-20260327;
        b=QzP00biAZk0k20SHONGuinABtl8u2xGT6ZGupzvl921z5v0/hpf+zcAlKWgsRsmVuV
         OIBEBhS96TEwRJ4Pv6EpzTiyV5h5eVAHhjeIFRqPxYE0gYr0dxFh6ww7FwU0zJs5WUCF
         t6ouvyDf6ZIP7wodO4wdNfUAam5Ivw7DFI5WMQOQzKZuiukDZQW9E/BxWX/dHTFWtZwh
         POjl4TDcvpWGi/wEZSs7qMtU4vCjwAdM9KtUSwTO57YDsv1tt0zuZ8hn6/T0bLpbWVIx
         B3M5ThQoxLnhiMHNujMIuZl3y7rJJdFPkC8HpFjORSYEP+r7sWY67xChZhnYzTb2rT1s
         nwAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YnwHcp5gSCbZJi1VkH0uzYLY9T/1f9/oVSvbGGMl3UU=;
        fh=TYEpv3wrjtuDfMe6DtVmC1upklkbyVjb4BVz5ZJY2b4=;
        b=H1aFuq7Qh20D1vfQtU9Ea59j+Vxq+t6JtxUh4Wsd8Z8bICc/745hbD6LEAOpM66KwE
         0X4wS/SPLIWAGFd/JBOqqV5zNb6y5YKSHADqtq7M5PET+sq5d4laWjOANbRqn8fyHzV3
         vG584JHKWm82SHACPlozLLZB+dGIzG5LpkTVjudUdQQePZqLbNbkk3DL26GEAGSIz5Tn
         eXwqVcDnXkUSeYKUYJQu92YHNLjuExos/lWShaNFWo9yiBxgH4VOb0Aahq6sAM74JUJm
         sCeGf3H1NSKmS06EahTU4PeclJFfzUeJBOxkbz25QVrdNGml8vqBirLMeYzxCzbDnv1N
         +UzA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783568066; x=1784172866; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YnwHcp5gSCbZJi1VkH0uzYLY9T/1f9/oVSvbGGMl3UU=;
        b=FHGB32mn5FE/IocgFVLWzBnU7mvnOWdRJBfi71L+e9nYJ44skFgE9DZjwAg3mV5m4k
         yoFGks22bw0Q1E7bIXnzotP6dKZjQYM3KArgzsEbyXQANAQdQDT43AC1yBe4e0GHaS9t
         0AqxHo1rqkvTnjLR8sJvKhhXvPMJ7Ih2o4W5d2+5d/UJhAQPjcHVxJ5s+0kWuQMU4yjV
         EgIP/6DLy1pqy5rudLNmyw8Rg/70tNMGkwVXTPXLSoG54l+DKxsT4zHMpsgLtd+bT0mu
         aGMxmgFnBfr8INFKNxtoWrdtD6LaJtXYJtab1P3RllDi4f/0vVt5hZUNYPPpvybC8Suw
         Iq6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783568066; x=1784172866;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YnwHcp5gSCbZJi1VkH0uzYLY9T/1f9/oVSvbGGMl3UU=;
        b=pYx5FqpDSY8fY+SZ6OGhD9SnvjOFcZu4Zwpc3qG9XfJ3y6OqXmmBxgGyl1syz3tPMs
         P50aYTor6pg/r+zDGprFI5S6E0j1sKzBvbyzVA1oG/4d+Q8kL6UKZMd/GFQoRYgbKxe9
         FwSfBk+rdMUEN9SgTSwYAuxkByiDUtSc2GNVs5RlmrK+3D+diw11dqTv5pe/44JdMekU
         cHtIojBobca0hkSJlLuxJ/1GLf5nL3c3FSmG2hMGS4RGlMcs30vAVxvtyzcnQ6ICeKWE
         0AA0PZLsFNZXp7WKrLdhu1FxIqyfdD6c3HdGue9sITxoYtLW/AnEQSXx5Nu8z5vx/NQp
         cedQ==
X-Gm-Message-State: AOJu0YyQh+d+dMFKeQ7WzKYKiggng1Ogiy5/NsOr/6UFx9fNqVdIqCTd
	9xIpw1eSQelwcIVXKF6YTa3jgyjZTiNvEL12Anr1WBp3vXQotApuRPGEfnhlhD1ZY3thn90PJ5c
	x/g3hA4oiafTTfem7h0UeDsmLMT3trDJFR+sbF3YQ
X-Gm-Gg: AfdE7clXnTryTe0xxRS99qpo+wHqXNypc7qtj+hRdmx6ZDVRBv9ZZx0onr+eVxFfDSw
	yXyA4NKBY75RgQBYc6tnotqO1GFzVsycVBQfQBnqTQYhcL+RaLxiWddMUW//5gSK5QAUZAgc9Pq
	8qFdQIwGIfYMwfIYXmlnBV5ANvSJQG5mIwBp+8Wc0Uc8ORc4qrJEXgEw4U3S9tVrZs0q3XeJWOS
	iCumz4iD2GABI5t6L6pRd746ovgWJbjP0yVDL40ZidvpWDt9UHzTuNgQHhsrc8wopchC6ggyY65
	JTsz//kazqBXL40CRXm/LXG8ZjCE4Q==
X-Received: by 2002:a05:622a:248b:b0:517:5ac7:332e with SMTP id
 d75a77b69052e-51c9a7990e9mr3535921cf.6.1783568065317; Wed, 08 Jul 2026
 20:34:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260702020142.3399851-1-rkaruna@google.com> <20260702021411.B01331F000E9@smtp.kernel.org>
 <16780c1b-418a-4555-b4bd-d442cedd620e@kernel.org> <CAD50Xqp_LBvRqhn0q93s3aVxtfFWGhf42jBePKsUonfE6V=WNw@mail.gmail.com>
 <49cb57c1-d7d6-4f30-b628-72c083981da6@kernel.org>
In-Reply-To: <49cb57c1-d7d6-4f30-b628-72c083981da6@kernel.org>
From: Karuna Ramkumar <rkaruna@google.com>
Date: Wed, 8 Jul 2026 20:34:14 -0700
X-Gm-Features: AVVi8CfbAcgGqz-QJ-NyJv_X0AMeDeCMo8PBT3Fs4cz3f84_fg3eA2anGJSuTU8
Message-ID: <CAD50Xqra-_2CnJdGPJtWeOZT-Ne4wRRcQEL+6uy1--jPRYwACQ@mail.gmail.com>
Subject: Re: [PATCH v2] ata: libata-scsi: limit simulated SCSI command copy to
 response length
To: Damien Le Moal <dlemoal@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, cassel@kernel.org, 
	linux-ide@vger.kernel.org, Igor Pylypiv <ipylypiv@google.com>, 
	TJ Adams <tadamsjr@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 6, 2026 at 6:10=E2=80=AFPM Damien Le Moal <dlemoal@kernel.org> =
wrote:
>
> On 7/7/26 08:10, Karuna Ramkumar wrote:
> > Before I start working on this, I would love to hear your feedback on:
> > 1. Whether you think this API update (passing `rbuf_len` down to all
> > actors and helper functions) is the right approach, or if you prefer
> > simpler, and more localized checks elsewhere.
>
> I do not think it is necessary at all because rbuf is statically declared=
:
>
> static u8 ata_scsi_rbuf[ATA_SCSI_RBUF_SIZE];
>
> So the buffer address and maximum size is known to all functions using it=
.
>
> > 2. What would be the best way to test all these simulated command
> > paths to ensure the fix is verified appropriately?
>
> Most functions for emulated commands generate only a very small amount of=
 data,
> far below ATA_SCSI_RBUF_SIZE. So I would suggest that we simply add check=
s to
> the functions which may potentially exceed that. Off the top of my head, =
I do
> not know if we have any, but we should just check.
>
> Note that ideally, we should have each function allocate their own local =
buffer
> to handle the translation. But this is right now a little hard to do beca=
use
> these translation/emulation functions are called with the port locked, so=
 we
> would have a memory allocation for a potentially large-ish buffer under a=
 spin
> lock, which means no reclaim/no wait allocation, and thus potential for f=
ailure
> which we do not have right now. A proper/ideal fix would need to drop
> ata_scsi_rbuf, have some helpers for managing the internal buffer and red=
esign
> the submission path to not have the port locked until the translation is
> actually generated. That is all more work and more changes.
>
> So as a first step, let's check the emulation function if any of them can=
 exceed
> ATA_SCSI_RBUF_SIZE in size, fail them with internal target failure.

Hi Damien,

I went through all the SCSI actor functions in libata-scsi.c and
calculated their maximum size consumption.

As you mentioned, most command emulations triggered via actor
callbacks write a fixed or small amount of payload, and are well
within the 2048 byte limit of `ata_scsi_rbuf`.

There are two functions that can potentially overflow though:

1. ata_scsiop_inq_b9: Writes 64 + nr_cpr * 32 bytes. If nr_cpr crosses
62, then this can cause an overflow
2. ata_format_dsm_trim_descr: Writes trmax * 8 bytes. If trmax > 2048
/ 8, then this can cause an overflow too.

I will prepare a patch to add bounds checks to these two functions and
send it over for review. Please let me know if you have any
suggestions/concerns.

Thanks,
Karuna

>
> --
> Damien Le Moal
> Western Digital Research
