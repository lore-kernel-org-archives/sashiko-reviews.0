Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E6A3EC2CD
	for <sashiko-reviews@lists.linux.dev>; Wed,  5 Aug 2026 22:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785969378; cv=pass; b=jZMJ5YgiIRRomoUuh/XTccej2Hd0jIt6Abrm4QC04YTclgp0Jcys/2jlugsV+IvrD0OWaCoXxGAfFm7y8LLHsGhOOOCwXX2hMGTYH0/bqTxy34I7qdrc850bxIZMEPtvQyhc/s4bH7x1km3xYDfwborCF+sGBkAKZ5xgRDyUh0U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785969378; c=relaxed/simple;
	bh=QZ5BTdhWuwNTqn+F9W1Yqtel03/GsDTkRYB+N3uM570=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ebpDFKZDyKuZxS28to02YWSsD/25a3Sy1WjZPRENLyt8bM7Du5QBvSHMAgApIVDG6PzLG9Y4GulR+S+u3ap0rumm4fE8dK7LwTEkj+Ku9SPipIY3UOad3bEaZKfWgbdO5QEDsEgx/bXXS7kF/4nVE2WkpGgupAG8xnlvNynBDQ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UcHUGxpa; arc=pass smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UcHUGxpa"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4954d5d814fso20615e9.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 05 Aug 2026 15:36:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785969375; cv=none;
        d=google.com; s=arc-20260327;
        b=Rc6eDY7SKxHzwKlRfXtpccIJ3DzyuzHuOgetKKgx5+7+BDpu2/Ye9fjWglZcENx9DI
         2cfdHhHnnN0wuCPkzASV+uttKitWEWunevsN7cOHMuQy2RZ7Dgv2cB5KfKRVNWYk11uD
         lFGkUBQ4cHMZiHmhV1r2p1hzm1NU8b6HdgwW5pszF9t2xe/bSB+EabRBnXUbYuoQMYh2
         sXeTZdnJVFwppPMpwK7M6N+TQGxWRRStGikrDMJFWravHnLqIslroMyoAiis6djp4aBr
         UuzpDXYkmUTm+qmgCM1lAd9LgtC5V6QoMYEODfsoE2HOEDRGgGLwvIeZVuYhRgD21O3Q
         NL/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vbUa1U5S2JVGGRifyu/m/Voi0f7XGnyVnDbFu9OkoGE=;
        fh=uA360uvxR9S0K/Y4Lovo7aIaGlBwzVBnnb2BKWupr/4=;
        b=oQJlJFjRZP8Lj/7ayJPmZD0lcowScMYZ4Q/hGycfXnhKxwbwqWXpZq2AnmoKYoYlWU
         NHx2L11uqq7jo3wyhgPnWHEbUelMVw9MMrZvK7ahv4K8Dlpbl/2ax+NJXd0zCaGSV3eJ
         HtKmF05v/Tzf1iaG7ixEYP/Kr6m+/AZLO7oEPdGFl8ZAXaayeXxOSDlpjjImbEzuB0N2
         TZZWV3AGGAKOEI+D5DAz53VwupWRZH0R0w2xcAol/OjRJSCuORhMpBEy+rz7bkCjgTTg
         1yFPSlQHW8ofeRm5DayN9nZTsd8aMc2SLLDRlPghg1Jpkh9XROBZ2rsN/fNz5wkdVHGa
         hVxQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785969375; x=1786574175; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vbUa1U5S2JVGGRifyu/m/Voi0f7XGnyVnDbFu9OkoGE=;
        b=UcHUGxpajpX3oOdax4C6f8PjUoc5unAdRPATZUNMV6RKsW0YPLcibUPRiVU2GHNsbK
         44jhx//nwPyQAPe+UemDR2vTSOAP3j/tBya96I0ME+1w2o4rjjg188eb0qz9Pru/PSPM
         oNa7v/T1PesK7B555cp2AkERcDiPP68FdWAE9ABSIXAhbvSvcjLM3IT8LIXEaY4bKJrL
         IYhPjzE5pJJG4xZLxDcgkyZI0R6r8GmSG0rm1I182lpde97wYtcDU2pyNLN2o2cj0rxO
         byUMFiB3Ca1KpCklm3vPaNI9Kcj/2f+hIoo5cAlMM9izEYvTJ3K/IcAWYW0frQ1xSWNB
         Kaug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785969375; x=1786574175;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vbUa1U5S2JVGGRifyu/m/Voi0f7XGnyVnDbFu9OkoGE=;
        b=owiXFQNGw3enSNDNl480fheZtou0Asy8utRnagkoi/4+1DonR5JIVzO59imLC9Ml/F
         nj6K7lNHN2iOXEbmYC4QAgwCDYFMPwQhQuIfzzhWsKNWuywhlwa38WE+McaKN/1/2+PB
         KM7XSI93GC8JOWXuqHUTar7Qd5Cv0DUEK8w4IwEyDESR1MBB22YRiqd5vFpsurq09Sln
         ZInWAl/9raz161Cj2kfXsnKKQHARstAcULIZKMmsUx5jO4b+7GQQcl86yvzlfj6xWYtC
         1UmXCPa1PQphlr7VJAnar139i4yj121Soi3sV/u3GwJ82oRVzoxn+nspY0uUvGviHLXA
         dfZw==
X-Gm-Message-State: AOJu0YxSnn8aOiRRzUeqq0xpG3JLeh6M4T3ON66xnGcCgzxajq8tOz4y
	4kJ6Hel2KrLkznR/eO3E8hUnmAvfdENSV3oFnbQuhWr/l4jw8xc6p40rKlUEqdw4OHlidEQ8Owc
	pFOLwLi3BhssnNBx2slj3O6HCIYfUH0c4KHrBlTRi5wJgn4z14AhgvvI2
X-Gm-Gg: AR+sD10Xwu1+yU52qE2ZPsiCHk0ZmJ3JvMiHdyonB/yiT/SlewWJNeIbb7zeeFPpeKi
	5dT17EZAaA/3FNrQ3GchA3e6A1Xd90o5ba/LwVbNiCc3Gg6I8hB5dClLBs2O/ay1oVQhfOWk0cX
	3NzIEWaeHAJCmHfAyMacWYgy3ELnP12aakD6WjCJcBHOz0JyUYWdJ9Z+hr4trRA1r7wzIjIdqVS
	AbIOZRDF/Qt6hNFAj6gI6abyyuQ7TYZGYJqAElIwtCtNnzpF2XC6em8XvrQc4eITJKF/9sUpMf3
	fwLqfIcKxbFA6B4uakZdPN0dKAQ/6zpdQp/LbEYiH2yWjPZ0atsGH6ffEp2HLcT6KefgD3QO20x
	UzwG6n/5mGeZem8REwhs8LTz0yl26VQ2dblusE9UOwPY=
X-Received: by 2002:a05:600c:6d5:b0:495:61fa:c936 with SMTP id
 5b1f17b1804b1-49953a481efmr395135e9.0.1785969374277; Wed, 05 Aug 2026
 15:36:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260731010645.3965783-1-tjmercier@google.com>
 <20260731010645.3965783-2-tjmercier@google.com> <20260731013500.5D2491F000E9@smtp.kernel.org>
In-Reply-To: <20260731013500.5D2491F000E9@smtp.kernel.org>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Wed, 5 Aug 2026 15:36:02 -0700
X-Gm-Features: AUfX_mx1O7U8jJ7lxB8hApscdlIws8QflJDWDCXDBxhjjF7HNLkg2iDBvs1YmTs
Message-ID: <CABdmKX2iuMORY+_iWDqE62tPk6sVAa9sNC8eMcZT0Js+2CqQqQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 1/2] bpf: htab: Split htab_elem_lru and
 htab_elem_pcpu off of htab_elem
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 30, 2026 at 6:35=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] Multi-line comment does not follow the preferred BPF subsystem st=
yle.
> --
>
> --- Patch [1]: [PATCH bpf-next v2 1/2] bpf: htab: Split htab_elem_lru and=
 htab_elem_pcpu off of htab_elem ---
> commit d1965b9ee7c9db7418fb306ab2fc480a8cd067d3
> Author: T.J. Mercier <tjmercier@google.com>
>
> bpf: htab: Split htab_elem_lru and htab_elem_pcpu off of htab_elem
>
> This commit eliminates per-element memory overhead by splitting the gener=
ic
> htab_elem structure into dedicated structures for different map types. It
> introduces struct htab_elem_pcpu and struct htab_elem_lru, and updates
> struct bpf_htab to track a dynamic key offset for element accesses.
>
> > diff --git a/kernel/bpf/hashtab.c b/kernel/bpf/hashtab.c
> > index 9f394e1aa2e85..f54366da459f5 100644
> > --- a/kernel/bpf/hashtab.c
> > +++ b/kernel/bpf/hashtab.c
> > @@ -117,11 +119,27 @@ struct htab_elem {
>
> [ ... ]
>
> > +struct htab_elem_lru {
> > +     struct htab_node node;
> > +     struct bpf_lru_node lru_node;
> > +     u32 hash;
> > +     char key[] __aligned(8);
> > +};
> > +
> > +/* Only for non-preallocated PCPU maps. Preallocated PCPU maps don't n=
eed
> > + * ptr_to_pptr, and use htab_elem.
> > + */
>
> [Severity: Low]
> This isn't a bug, but does this multi-line comment violate the modern BPF
> subsystem comment style? The BPF guidelines specify that the opening slas=
h
> and star should reside on their own line, with the text beginning on the
> following line.

The multi-line comments above and below this one use the same style.
Same for most of the file.
