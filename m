Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792537043;
	b=eRWyIyk9pT6QZNR133m9tjPbcQjFwpfOYE4h34qpZbW7E0uQ1tfn3rqXxGxUBq+slzQD
	 PSy9buz7+G6T4uhqVrLr0jDgKVz3R54qoAPcIdp4Slp+RQ8tEkLbkZAjFjlhJaF4tDnEw
	 vKXvdplwutrEEaBz/4n3nqdz1XAB+iepOxj4GPyzMeKaCVcNNleGpPWfe/iljGtEzyYeP
	 +sEk1/mOeOHihP4YLHXGTw3mOmnvggi7mPQYzkL6N+vgjR1pELkZVWJnpnVtOLvke7uS3
	 TDN3Blx0NnJckHPPcAbGAJ+eR3goin3fv1fma3fUhYYMANkMjSvBoK1CS2SAq81RNow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792537043;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=M+zq3/RTDO/8tOWvja+6CZAxKVk9ioosPOWISPdbg2w=;
	b=gd+ZtH2sUaI9MNxSmsbQt4AMPaVda+K1Z+FFJjH/L9UPdNki/aoByrzRYhQ4BQZNrSuN
	 eJ9DT5kHFu7Ojc4W4IXHpQRK/yfOGseWPcxiSB0gCwKqmr3jNUAo28blRYETA4eE7Cbma
	 Seslo6iCC1/D3ukS43g4SMaBhAPGA+sp+dIqyoeyF+BUplK8e6EDpBQSUByahCNdsgbPa
	 7zSdAbKU6e9boqStOUWOZg4d9gLlvjATYV8q3V0UiwUI+3fpzQp310a9iJx1zArstQBv9
	 tIQG9c0ef1X2esCCSlEqRYL1vBSNzu9bCw5dFHqFhgpfh8/TVtEo1uFFnJMZdi/4R9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZCW8LJpF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F22E606A31A
	for <sashiko-reviews@lists.linux.dev>; Tue, 20 Oct 2026 22:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZCW8LJpF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 413371F000CE
	for <sashiko-reviews@lists.linux.dev>; Tue, 20 Oct 2026 22:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792537042;
	bh=M+zq3/RTDO/8tOWvja+6CZAxKVk9ioosPOWISPdbg2w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ZCW8LJpFiui0+jXEzE13ync5DkaPvr/TrQ/Oc+zv849mcTxeAAb8xBftnO8lLiMGZ
	 GmPk+1tzAoHQnWRdxvrbYUGOjk8DvD1HPyzAHux7ZnQ7Yup9OwF44uYSx8MZUu5VW3
	 /N6rRuXRvC/b6wTVyG/4it0WXaCFc6CEmzRRPiJQnwDx4b6chd5x5iT/hl+9BD6hp8
	 95vjRY7Kxsfgj/prjvJB+HsgQsMNRqzPKbZTpLvnyHwrYXgYcUehuq+9eahVqxveiS
	 tsqwp2iHFKHugoZe9epQuRmsu9EdeqdjZEwEQBdtH6xkwsHM8+U+SHzfC+nugRRCSJ
	 Y9LyEfn4GAOLg==
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-918f75a68f0so2394166d6.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 20 Oct 2026 15:57:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwnNbGcLfrnS8t7gMegyVu1bcv0znHj23BqI08+K/n+XLpspkG6iH+qpiQ3PFaBhF1yiPJATwjfWOkoqLojrZo=@lists.linux.dev
X-Gm-Message-State: AFq9FYIz9XV/v5uVOt7NC8DA9/qY8wFmwa2HU4j83932QxwjzQ0UAVQH
	Dp9ULBlhr9QQwx/c/wYmiPt51CtUiuViHXCa4p8gz4w8gxGJAQ27dY0/0yN3acBnO/EMjwiWZPh
	0Y0QoO7hi3zMKc0hv3NwdA+JKtjH/08s=
X-Received: by 2002:a05:620a:1b82:b0:93c:c4da:f46c with SMTP id
 af79cd13be357-93f57f46150mr129759385a.56.1792537041637; Tue, 20 Oct 2026
 15:57:21 -0700 (PDT)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <sashiko-outbox-175822@kernel.org> <20261018064458.86435-1-baohua@kernel.org>
In-Reply-To: <20261018064458.86435-1-baohua@kernel.org>
From: Barry Song <baohua@kernel.org>
Date: Wed, 21 Oct 2026 06:57:09 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4zY5PrYgbFvY96R+52Tftp_eVrMkSbf_-2b3Tw0r6FgBw@mail.gmail.com>
X-Gm-Features: AclHuK8Vh6-rYE5cHcP7BV2gGX_pqiXcWh_s7ZQdO0Z4QWPypCZNnf7iSB_RAHo
Message-ID: <CAGsJ_4zY5PrYgbFvY96R+52Tftp_eVrMkSbf_-2b3Tw0r6FgBw@mail.gmail.com>
Subject: Re: [PATCH] mm/mglru: fix using folio_mark_accessed to replace folio_set_active
To: sashiko-bot@kernel.org
Cc: akpm@linux-foundation.org, axelrasmussen@google.com, 
	baolin.wang@linux.alibaba.com, baoquan.he@linux.dev, ehab.ababneh@intel.com, 
	kasong@tencent.com, lance.yang@linux.dev, linux-mm@kvack.org, 
	qi.zheng@linux.dev, sashiko-reviews@lists.linux.dev, shakeel.butt@linux.dev, 
	weixugc@google.com, yuanchu@google.com, yuzhao@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 18, 2026 at 2:45=E2=80=AFPM Barry Song (Xiaomi) <baohua@kernel.=
org> wrote:
[...]
>
> Thanks. I guess the real problem is that we have no reliable way to
> identify whether a folio comes from in-fault readahead. I've tried
> various combinations of PG_ flags, but none of them works. So the
> only solution seems to be separate LRU-add callbacks for readahead
> file folios and other folios.
>
> I've drafted a version below, but it's pretty ugly and feels like
> using a sledgehammer to crack a nut for a quick fix =E2=80=94 simply not
> worth it. Maybe the best approach is to revert 6cbdd9726fb5 and
> leave the proper fix to Kairui's MGLRU-FG.
>

Before reverting the patch (and regressing workloads such as kernel builds)=
,
I tried the following two options:

1. Remove folio_test_referenced() as PG_referenced might interfere with sys=
call.

diff --git a/include/linux/mm_inline.h b/include/linux/mm_inline.h
index ab69b9930893..e231e56f0257 100644
--- a/include/linux/mm_inline.h
+++ b/include/linux/mm_inline.h
@@ -327,7 +327,7 @@ static inline unsigned long
lru_gen_folio_seq(const struct lruvec *lruvec,
                  (folio_test_dirty(folio) || folio_test_writeback(folio)))=
)
                gen =3D MIN_NR_GENS;
        else
-               gen =3D MAX_NR_GENS - (folio_test_workingset(folio) ||
folio_test_referenced(folio));
+               gen =3D MAX_NR_GENS - folio_test_workingset(folio);

        return max(READ_ONCE(lrugen->max_seq) - gen + 1,
READ_ONCE(lrugen->min_seq[type]));
 }

2. changing to > 1 for folio_lru_refs() to reduce the syscall
ra/non-ra interference:

diff --git a/include/linux/mm_inline.h b/include/linux/mm_inline.h
index ab69b9930893..a3a894aae10b 100644
--- a/include/linux/mm_inline.h
+++ b/include/linux/mm_inline.h
@@ -327,7 +327,7 @@ static inline unsigned long
lru_gen_folio_seq(const struct lruvec *lruvec,
                  (folio_test_dirty(folio) || folio_test_writeback(folio)))=
)
                gen =3D MIN_NR_GENS;
        else
-               gen =3D MAX_NR_GENS - (folio_test_workingset(folio) ||
folio_test_referenced(folio));
+               gen =3D MAX_NR_GENS - (folio_test_workingset(folio) ||
folio_lru_refs(folio) > 1);

        return max(READ_ONCE(lrugen->max_seq) - gen + 1,
READ_ONCE(lrugen->min_seq[type]));
 }

In both cases, kernel build performance holds up. Reverting the
patch would regress system time from 3m40s to 4m4s.

I believe either option would eliminate or reduce interference
with syscalls that use PG_referenced.

All we need is to give in-fault folios slightly higher
priority through folio_mark_accessed(folio). I now realize
the original patch might have gone a bit too far with
|| folio_test_referenced(folio).

I will wait for Ehab's and Kairui's testing results on these options.
