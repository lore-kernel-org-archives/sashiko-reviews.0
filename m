Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B24DF2CCC5
	for <sashiko-reviews@lists.linux.dev>; Mon, 15 Jun 2026 02:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781488986; cv=pass; b=ezvVLgNKN+hfrZF8Ie088PY/Q4B0vodBvJUMKSK4z2ONhBne4BSBLATBmxmPhcJZJtBVN68e+z+USEJQX+HlZDy1hIbMvto4oZ99X8pv+t/BLcprMjgALOGvplVx36HkXU8Chn7II0kZxhG+PZ5Tg4zU0IWjOJ2yS0H6UOMwR1k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781488986; c=relaxed/simple;
	bh=q7ZHAmS0APGjMZ2UEjMMdEuI69pi2FKaXpdMSyK5Y8k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=caovt6zYnYvNgt6YkrM2UgwHIIE527QLfne6/naoBBx6v1dsSTtTrK5nLbFkYO4If8ARmOdSI7liCyXHEuAxn8nitfYY7iSlSOKB3QfGvLY2J2Xpv8O8yfBvG2Y38Cqlyh5EsIpSNnY6ObvXD9M56ygzG0gzTVvKeurtubStJO4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X5kgw0PF; arc=pass smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X5kgw0PF"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-45eedcdaeaaso1863497f8f.3
        for <sashiko-reviews@lists.linux.dev>; Sun, 14 Jun 2026 19:03:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781488980; cv=none;
        d=google.com; s=arc-20240605;
        b=Mn5DFBDnJUS7DHoJ1YQBmooTWKyLzrXsYLbWzhFplYg4gD/Bs8xSrJBJoUR/nq9cQv
         60Dk7ouXaUi3qtonQU4pC7NZOEQAKWZXqVbJqM+wfPrh0z4LoXxeeetmMQpCldYJQyU4
         0a4XztSxAata1YYP6BJO5CkE5zUeZx0VH8IzomOo0VhuFJnxXq0LIsGU49YCITHuP9UW
         oIGDAc9oBnF8tNtVcIKQiBCCfNn9qZ14J9S9bcoJI1W7T0o8Nqq6Ll5QY62vwjGVI2rN
         JELi53TuEYp1x0jO4se82c9OdSBtmboOhT1XkqEiQbq4B0DJ7EiheATznes/lsNc+8rh
         lnUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=q7ZHAmS0APGjMZ2UEjMMdEuI69pi2FKaXpdMSyK5Y8k=;
        fh=CvI/CQm1w/T2awhAvXRM77KvHxvJuf/F+hTvEsd4hW4=;
        b=MWadcthrqOs1BmeA1ovbHseuric96W6Rs2RJK1O+v3HczbLdI0tievocJohlOMOfRB
         L5mTSdknPmO956N65CR+Lesf2tjrYiV1mzO2L4EcbOZb8Y7IVZclM4xU81p4daDfLANT
         edDgIF1LTWPk5hjGbapVoHJrP1P/hS/UCC372sW+alIyel4vV8fRdPVQH4wP0YCp6Ygq
         HX5+tdVB2tahUi/gZqrmaXVhjHgxW0CSZandJVOJglgDsiX8KYBBjZJReZ6mJMVxhkLr
         idXZ+hwmBGvsw+t1W9/kdsyVVZkzSN8pGVs5lpIBZoC30/vIHVYUvj2jIuJeYZTwYyan
         iBTA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781488980; x=1782093780; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q7ZHAmS0APGjMZ2UEjMMdEuI69pi2FKaXpdMSyK5Y8k=;
        b=X5kgw0PFW+SFCrDXEsIyAs3zqAW34+J9D4PwW4zs6ZmrjF8+8to+AWdrtYX1EPZMnP
         r/CBNeP6GuH2xrgK2GNweqp9wnP1sjm7Y99+HO3lodf5hZIIOGCYF74wjyyeI2SdgzNz
         j8+N9t25XlBFgRz52gKvIUMIGrFBVcVbUOZ+QkFp06HOQ8mtTuSvVFuLr5+H96UlgYHc
         ImJi4UMKrj7RaEXNAsuiC7n/SwkLLlGGtIyFVDESfku9A/wMzd2qKElEpId322Z5zJyH
         dSEkgWCN6q8PIMKQKnSSoN8qQpV2RZysWFJVrWUc+ng448eTcQOt+KdK4u40tDo20S1f
         Ezbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781488980; x=1782093780;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=q7ZHAmS0APGjMZ2UEjMMdEuI69pi2FKaXpdMSyK5Y8k=;
        b=Y8EQg/hFKaXi2NwT6qhUQMp4qlotLoDzbupfaYCOkKnMDBTyUb1yHEjYWUbINbZ33V
         1qVTmAsIkqolk0Dx8Q4Hmqz4C/FNnTBXLLdLj1wnKh8xeDmDLZdVIIkcAWNc+LnMR2P1
         otXwFDTiXWTsEvP+xGCtCWGPh2IwouEGusa3zQPUnHqjf0ArVm3y7U693lSRrXOLkNIl
         NDc+Ts9cq2eXaZ3NuK/a000F9Pp0vJUVnDvkFh3HDqTCyFC4HzysqPHOkzZMOEMoSUO/
         j08G6J01u9bvLc+K7O/nbcoLyGGv4spZglZICX7HR36jO7h7pCTlZ6kKPFQ+Fy3gca6r
         QFaQ==
X-Gm-Message-State: AOJu0YxhK5SbiCHK8tVwWXAUoJxaYky8YHlRPpeJA5FqnySbU3bVEZWI
	D4LZO5hOXO3+jDYEopIa3fDbUdaKVs2dWXEvUIg0b6Dl1zUBPlbejzU2yyn1pBmaXsCpohhNav7
	gCDmysL8S8PMqw0zP49IauMOHEO3Ozn5QJNNl
X-Gm-Gg: Acq92OEvgSwmV6o04YMWt7VMM8pwEPFvEnzPGWPHbA0iU6WdBSn6qzlC4gc3m7sfCDz
	aE+HaU3WnRmM+n4koXgcKC1lKY9+Php5vTZzwsRQb09d7BnWiOZMfdQ12eKrtcoDQk0i073rdfP
	abFGubrk1KxWGGutrSIQGbFzRYNJM0ms9q1psZ9wlO6Zm7USnhyDOed+L3ZaXZa+p2cckDDLUhy
	MqqD0AWxwO3ubtHye7g5wcwy7R04rmTUQKaXpkrrot+RjhpX89jBvI0oocmztCl7cnvzLfZ4itI
	EAbTiuAyZdlo1QZ7HZuJvy2bCYR/4HAGvecSEQ==
X-Received: by 2002:a05:6000:2087:b0:452:6aaf:76cb with SMTP id
 ffacd0b85a97d-4606da57b8fmr15312696f8f.1.1781488980029; Sun, 14 Jun 2026
 19:03:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260612193738.2183968-7-nphamcs@gmail.com> <20260612200002.9933A1F000E9@smtp.kernel.org>
In-Reply-To: <20260612200002.9933A1F000E9@smtp.kernel.org>
From: Nhat Pham <nphamcs@gmail.com>
Date: Sun, 14 Jun 2026 22:02:48 -0400
X-Gm-Features: AVVi8CcP_2rb0QJOJkH_1PHhtgm5AkJaxbAeQLDzU7cxaVQPuAVLE9NlFot68vI
Message-ID: <CAKEwX=NkuY8aoMewVp31qDa0Wdd9z0-i1_E5T1jb_A+U2kYZ2g@mail.gmail.com>
Subject: Re: [RFC PATCH v2 6/7] mm, swap: defer memcg_table allocation on
 physical clusters
To: sashiko-reviews@lists.linux.dev
Cc: hannes@cmpxchg.org, mkoutny@suse.com, tj@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 12, 2026 at 1:00=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] Lazy GFP_ATOMIC allocation of memcg_table causes swap-out failur=
es and lock recursion under memory pressure.
> --
>
> [Severity: High]
> Will this GFP_ATOMIC allocation reliably succeed under memory pressure?
>
> Because swap allocation occurs during reclaim when free memory is already
> scarce, a non-blocking allocation seems highly likely to fail. This would
> abort the swap slot allocation and could potentially lead to premature OO=
Ms.
>
> Furthermore, does this violate locking rules for preemption-disabled sect=
ions?

We're holding a lock, so GFP_ATOMIC seems like the right choice. And I
haven't observed swap slot allocation failure in my testing yet FWIW.

If it proves to be a problem then we can retry with the lock dropped
and a more lenient GFP flag.

>
> alloc_swap_scan_cluster() runs with ci->lock held and preemption disabled=
 via
> local_lock(). The GFP_ATOMIC flag includes __GFP_KSWAPD_RECLAIM, which
> can trigger wakeup_kswapd() and enter the scheduler.

This doesn't sound correct to me...
