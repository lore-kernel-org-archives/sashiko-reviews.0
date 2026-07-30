Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 202B243305A
	for <sashiko-reviews@lists.linux.dev>; Thu, 30 Jul 2026 19:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785438558; cv=pass; b=EIv07sE3sqhgWNV6vO+dlrgPvFSlMcGlGEcdPLHdga+mBLfbFIPI7E00rGmRBFgJu3ElgP9sdsMne6uRFykFiFCPatT5eiQnW+RpY06z2OxvCK+8ErrXNMJ6TrlcjvZh7TGJF96Nlgq+0YCn13LInXKeFVqdD5bB5LVhGU/UPU4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785438558; c=relaxed/simple;
	bh=v0u4alOrwq5rTIgb2VMXyJVDRLR5K6pdRFLGd6pBE08=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TUTSjdnTUTVUjotdVG/zE6HSuMf/fGvnilfATkytiSMwFUez3I65uZ2TbBrtsLD/CDyCm7bzpTHxxUbO6/5F5aVaHuomLjLruZH3iOevRkdsG+703FXdxxNUr71FuaqORjahI0P+CAnp61yE5LmnNyXt38o/wBBzGL3pp3E8Soc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UnqZrS0A; arc=pass smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UnqZrS0A"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-caf45fc5202so93376a12.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 30 Jul 2026 12:09:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785438545; cv=none;
        d=google.com; s=arc-20260327;
        b=slhKwZsH8NzOzuWuuAKzay8aXOg3MUuS6yviMvRFQFYUHz8angzapY4hjKOTHZ5G0j
         GasPcC11jLzSRV7DZb/p/IF9GkojuV1ezPe0aFYcB+/c8dw/cIHm+tplt1P4vc0AJ/ac
         AfHRlWOlsjKmt1VCxKgrbo1bAHpGXT6PNP3S/yMAsjzA1NXK4d4M6B8GRueKUKkHOUA/
         jy3Pu4IW2UFXaOH+RV7MJ+6AgW+1ey5TcXJekiTTrvZNFqhf/Y/OEsj4wool8t8Y9pu6
         NTVgbK7bpBYIUSH8BtQS56UTmWqa/nXP0oNPjcQlw6NIBZQFm0ZSyXDUbFyOKW8MeXwe
         zgvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=v0u4alOrwq5rTIgb2VMXyJVDRLR5K6pdRFLGd6pBE08=;
        fh=whXFWdLlNAmGn1NV5bZnnfrroQODufnfTj2xzN3okn4=;
        b=inq2v4rfKZxMg8KHJVLxmS3Wqxfc8cVb8VXLb7i6VzkAJ/dj9QSSP/nmWgbD3o/Jqi
         sPYDKAexQV5+cKX1JB1kk/ZbtmtWV6pNDl4KAFtoUNcwCI+IN0/0vfEEmFAadA98/2jH
         LHWNoa/8ZpiGJZJU/L+5bbXNvOpCRacwUwot0NXPoDkSp6NL3A+fDzBmlWUFppNVnIxh
         QgnveqORFl92/5sURsD0D7UJUeYMFlPo6SC20exBm0keBHwTYGgmJ015m7pQpO+ECKRE
         P1EMCikEtLX9nUq5o8h1egY9c1JOpV7QM6+ZsGGDzwCug6/i9PgxLxzHY/Ein3uWUkfZ
         d+Fg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785438545; x=1786043345; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v0u4alOrwq5rTIgb2VMXyJVDRLR5K6pdRFLGd6pBE08=;
        b=UnqZrS0ApXgi+T/TVi3kJerup6FT3qNIaAdwScs1aO7TaMiRSySIg3TIUamC3poQ3n
         l9AHwO+jRrSbBV7FyILuNkm7mb4z1DbRKW8fosnV98GClCgbfPIASrJidYMoGRLgaFKn
         XOd+8mBMuJPyxLc0aGcyy2rZvSHjHJwvgmB857Eo44+WNuwVSChqrvdbYem3TKKAMARc
         j5wtkb6nuFGkQ8+PwStydS1Kn0NOl0tfOjr98XDZab7+U3eXehTpuUlt9EpG4G9G4IJj
         5aDaH1tWBLVigWrvKnLSJsvaajzI8Q1x3Gk2joEE/3wL2PMDqwLEiPzZAQbZlEsWVp1P
         g4Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785438545; x=1786043345;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v0u4alOrwq5rTIgb2VMXyJVDRLR5K6pdRFLGd6pBE08=;
        b=OgXQpO6bv9lwd+gAY4lDQhysxvhcPUjCZnp1UUDdIi80+vqUdgiEsHv6DUebXBujm7
         +beZXpTPx+oKzRVoh0ykdf8CARDJ0dR7BhLkMngTP4yPiClDgEyhAhRYAH31GDZbeKIV
         Pw7xJbyS0SeLJyYomL/z5sf3hoik3WZEqAzbzgo7Yb80vCC64FWNBjmqf8EWeQ5q0UsT
         ehlASFyu7yCExMN0IP2Qyy4+C13Kr67ZD4/2xYMLWhIZBYU4hUFUDFAJ2O/q5xApldJ1
         I81GnmvWyuF88NXBhRxrcb3GyDX2QnsAasUiPMI52ipvIktH9BEVF4m49UR3vfBQhvS1
         AR1A==
X-Forwarded-Encrypted: i=1; AHgh+RoM1WzIiMc+lxebszXbgKSrtw6FLuoYU+t82vcS+ewB8fbve3XTr5+73hFI9u1AQ+d3nvtZJU3hx91njjUUBd0=@lists.linux.dev
X-Gm-Message-State: AOJu0YwtBGS4G3cN3GETYQZBJPMTHSzxKg61hYjkQZGOfQN/RSQu35xX
	lXCDC3NRO/HtghUZZZ9kefqNj/Ej2CI/jy6Tng0YvjxnNjpIISRydCF7ZdnbEhA+2tGak4QU7tz
	WcXq7/gfOvsHg4vqq0YWtV48v7xsOpG+bZmAS/7/+wm8XnOo45qW1ZK/IYXXgOQ==
X-Gm-Gg: AR+sD12wug6PlW1Xwny4vPQzlLZAAExVgmkQLJX7EgOPLc4bPsLiPoBjUs7xNsMbkXQ
	EHCk1gSQz3Wx+wgQNbVGHIeHQwmGA/qnkW17XTHmpaSrX9oYUYCfDFJqeCkrLe9taYB6+WedznY
	bnmx0PbzRwVyh5FzclMtFYbTP50NH48BlR3Rbxz6ozjL/m4irFEFS07GPzkGQcmXBugbspVX0Xb
	TGwfO+QM8Q81yYP3FmZMobMJuN/UegIy84PbleroLMQM30j4Ylgw6yO1Ll5AiSLlD/omnnDb8HK
	qcjddT5nz38DDKLcHujrZVsrb7vEyonRBWK7BlazrlkuhQOzx+nisBQjWQevWPTYJue/KDl9g1K
	JK25U+4+wX2M7Dz4sup+c1AspASj/VelFV2NAajJzMhaqZE9l6gLeOuoSCg==
X-Received: by 2002:a05:6a20:93a1:b0:3b4:870e:6f44 with SMTP id
 adf61e73a8af0-3c9007f3948mr3817709637.35.1785438544828; Thu, 30 Jul 2026
 12:09:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260717-bpf-iter-tcp-refcnt-v2-1-8e81f0ac6f3e@linux.dev>
 <20260717025253.23EEB1F000E9@smtp.kernel.org> <DK4HTPHX3NL8.2N1FK8D2N9521@gmail.com>
 <ami0NJ9s6ZhXVZb5@linux.dev>
In-Reply-To: <ami0NJ9s6ZhXVZb5@linux.dev>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Thu, 30 Jul 2026 21:08:49 +0200
X-Gm-Features: AUfX_mxYi3q4TNHstbDXLu_iANX6UYVzbjhCpb708Ut7DV_hLNVXcExA87EeG_E
Message-ID: <CAAVpQUAOzzhG6x96EM=Mk3EgYhmvoyTo0P5tAFh_237QWE-v0A@mail.gmail.com>
Subject: Re: [PATCH bpf v2] bpf: tcp: Fix use-after-free in bpf_iter_tcp_established_batch()
To: "Jose Fernandez (Anthropic)" <jose.fernandez@linux.dev>
Cc: Kumar Kartikeya Dwivedi <memxor@gmail.com>, sashiko-reviews@lists.linux.dev, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 28, 2026 at 4:10=E2=80=AFPM Jose Fernandez (Anthropic)
<jose.fernandez@linux.dev> wrote:
>
> On Tue, Jul 21, 2026 at 09:24:05PM +0200, Kumar Kartikeya Dwivedi wrote:
> > On Fri Jul 17, 2026 at 4:52 AM CEST, sashiko-bot wrote:
> > > [Severity: Low]
> > > Does this multi-line comment follow the BPF subsystem comment style?
> > > The BPF subsystem guide expects the opening block to be on its own li=
ne:
>
> On the comment-style note, checkpatch accepts both block comment forms
> and the one used here matches the surrounding code in
> net/ipv4/tcp_ipv4.c, so I don't think the bot's flag applies. Either way
> is fine by me, whatever the maintainers prefer.
>
> > > Pre-existing issues:
> > > - [High] Double-put and wild pointer dereference of batch sockets on =
the
> > > first bpf_iter_tcp_realloc_batch failure path.
> >
> > Hi Kuniyuki,
> > Thoughts on the fix and Sashiko's concern? (The latter should be probab=
ly be
> > fixed separately, if needed).
>
> The double-put is pre-existing and already fixed separately by
> 980a81345275 ("bpf: tcp: fix double sock release on batch realloc"),
> now in the bpf tree. The hunks are disjoint, so this series applies
> cleanly on top of it.

Sorry for the delay, I was on vacation for two weeks.

I'll review the patch.

Thanks
