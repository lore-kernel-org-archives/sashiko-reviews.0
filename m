Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793844051;
	b=vV59aVH4rluwpYUF8OQ3sfaAiact0ebreFgdSrMsV2stFVGmzLname/k10nwZbKEc2qw
	 A5yqY2HM+ibtPeMIwNkMveBoK2pEHtUVF7Qp+1HZVc+Q18ELLT3ugWCR1LNOxZ2glqr2Q
	 IJzR0WMsu5uB2AkRvufAap72j11EBBbUthc+dF9lm86Wxntm7IGDauzwUKD60bfi5aDLQ
	 Cf/q6JHs380FObQ5UtNCPh3X7ohUraUcKXbbFjCwUBoSnD9pGSSWbgeJ/V04YtPL1sN46
	 2OZH1mJfY/xkYCfQ5l+Y5ELlMJrXg1DdZpNyMX5b1uTptYdLdyi1Qp+0LUqIHDo3MXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793844051;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=2tqjA76vRfCUQoWeCH/paZIcbbeFKw2hvgd2Oi1xO5A=;
	b=BXZ9kevYbq9qR503JvgcEsW9hEPAqKsn0x3rggGTFHb1IwwifoSYC+p5mrQkj81zRJdd
	 LmHjr9ivcjCA25WVfSArZWtrOMVB4m+SBAmuZaKKNidqQHXb2TbGXpavkhT2noeV4OC3x
	 /Hd18x1Nh9D0RfJPt6O+6gyyYmPat+YEQ7X9/yQ+Myxj5VdPod3H83nJ7G8mNg9SH807K
	 Noker6mtHpjPm+Ty5ImSt8o+zqbIPTihZOaOwbU23l18/VPHL4MZT2Httr/QN2jJpx6sW
	 8GSa6aGXZ6k5ISFXZJts0akOdFCeno4+1Wm/VtxvziGSdeluD0Z1BS8olnPcx0vg7Iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L1LB3qZu;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A4A606A32F
	for <sashiko-reviews@lists.linux.dev>; Thu,  5 Nov 2026 02:00:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83A4A606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L1LB3qZu
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e96502e447so11470875ad.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 04 Nov 2026 18:00:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793844050; x=1794448850; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2tqjA76vRfCUQoWeCH/paZIcbbeFKw2hvgd2Oi1xO5A=;
        b=L1LB3qZuuvdoivwdCjtjX8ehi/TXXQ8AGM1ykoaXVFDeOZFtblfdcLRydfOvX09HK3
         dNHJVN3EPxmdI41054Oa6THxEW9oL5eboBMBhowqEN7bsXfgX8Nd7eRR07Wet9TElhtj
         ZM9YnAQsMQH0i0Y2rBNQjZBvOpEZ9sCbyWAT8D64PLI4Kn2CLgDaGVyyqjx9/ql1Bac9
         bQuGV0mRxQhs9+BuzA4OW0JdwZYj9hRGx7oK9gVHieI4Rw+5GhXdxwgjAAvTeFfCOJfY
         DGXivGNukJSUrsjiS/oUebaFBHZrtIHflfQyy6iP6R1kzUZ77Bo7vPDO1EuEavZ4p/w3
         MMbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793844050; x=1794448850;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2tqjA76vRfCUQoWeCH/paZIcbbeFKw2hvgd2Oi1xO5A=;
        b=a/An8QpcdfInEAe+OZKNyIsKZ2aRX6DxLdVyXPJQYchoue3YBk/US3460m7tM3X1mP
         12rj5XW3AEEf27y1l25cmH68aoZSTtvoj6WMa66/+QzXBbuo7FoTMzBaFK2upkWqv08P
         y7XHohZKBRxUrynYi41+SN1ixlRBk0Fw1BRqTNKwYxdeoA4+Yt85H0iCS9bw73SXFHOi
         D4uDhWnd0TRM0cnUlwtmMXrfjuDN99IrwUPkedLv5danQXYA78wXhHYGqOFnEM9E1FKb
         JySanQbg6YA7EGkpZWKgs//7acM2Vduw9QSfUL/5WLFb2mhYyDh+jy0ieOEvqM54/h4q
         I7Lg==
X-Forwarded-Encrypted: i=1; AKwUvByego1yjH/uvxTf1xUG7KXQVjHh0K7mAAcUsnOUBYINWDVXN+piEe2Z2VqLfG+XSO1b2NLKYzI5Ruj+TpCi4G0=@lists.linux.dev
X-Gm-Message-State: APuU4Z/vrYr351mRkiJRgQyeozEw6VWhapBFcSznwKZGuMSuICrxtGmd
	1I4fygCISksCj+3BsUc1ogQVdAxLF545mXSPQj5gcc7pHPxt8XpmoSK5
X-Gm-Gg: AYBFou0Ua9Pew8J21H9Y+x6ybAQysUd2IXgSyYNlSROLq2Psn0ASUfuauHd4yUUB2p7
	0kqt6heJRFpNP81/7+z/WbZZ2cVFsfklzwk24p1PUkJippdjEmK8ITXy/MUUEehj9sb8Er73sq/
	5O3wa3HxsfXHpG3g/J4o/O8Mwxf/PmnBC+e77+WjFt5Ky8Gm+rX+Z2EcA5oNlsCBEy7f83bQzqI
	ikVsVX/3yNSiJqQclBGaaEsErbxX/s8QLE8gto/5bWxL/LH8ptNZaIXF7EdlkcvO+tAopCVGSho
	qn+ioqdamRRCaOjYZJTW4t72w1Pp6Ai0RcfL/l2MeG2tvbZ+00MLlmIgkr9VADZ19pMNH5+RKnK
	L+oxjEsUkkt3SLtKzUyf/QuF4oyIfMNkOrHY22/LK1zVOtoJys8OGoiCtkq7hdFGK+VaZjhdXU/
	9WHrw5369SNYejYiQvnQrnU5hJHkHppBYrE2b3vT220ffW92UUVt0O003zXUHqDP4OzWTIrxM1L
	RFqsK4Q/gURz7XoZa1xq0nepSY/SwXixFuui7+vOkD6wFDK6xDZoTOmNHDLT0jSf8H3q3YA9Z2V
	c6lgN+KtfzvwoGcOWHTWhrCBJhirfHxteizAeiGJ7+t6dZtjtq7Coj6/FzMYnzT55W+t9IAFMQ=
	=
X-Received: by 2002:a17:902:d58e:b0:2e9:776f:66b4 with SMTP id d9443c01a7336-2ed2d9781cbmr853015ad.44.1793844049572;
        Wed, 04 Nov 2026 18:00:49 -0800 (PST)
Received: from KASONG-MC4 ([43.132.141.24])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed090fadcesm12330035ad.46.2026.11.04.18.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 18:00:43 -0800 (PST)
Date: Thu, 5 Nov 2026 10:00:36 +0800
From: Kairui Song <ryncsn@gmail.com>
To: Barry Song <baohua@kernel.org>, ehab.ababneh@intel.com
Cc: sashiko-bot@kernel.org, akpm@linux-foundation.org, 
	axelrasmussen@google.com, baolin.wang@linux.alibaba.com, baoquan.he@linux.dev, 
	kasong@tencent.com, lance.yang@linux.dev, linux-mm@kvack.org, qi.zheng@linux.dev, 
	sashiko-reviews@lists.linux.dev, shakeel.butt@linux.dev, weixugc@google.com, yuanchu@google.com, 
	yuzhao@google.com
Subject: Re: [PATCH] mm/mglru: fix using folio_mark_accessed to replace
 folio_set_active
Message-ID: <auviWipVDTh_yk_T@KASONG-MC4>
References: <sashiko-outbox-175822@kernel.org>
 <20261018064458.86435-1-baohua@kernel.org>
 <CAGsJ_4zY5PrYgbFvY96R+52Tftp_eVrMkSbf_-2b3Tw0r6FgBw@mail.gmail.com>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGsJ_4zY5PrYgbFvY96R+52Tftp_eVrMkSbf_-2b3Tw0r6FgBw@mail.gmail.com>

On Wed, Oct 21, 2026 at 06:57:09AM +0800, Barry Song wrote:
> On Sun, Oct 18, 2026 at 2:45 PM Barry Song (Xiaomi) <baohua@kernel.org> wrote:
> [...]
> >
> > Thanks. I guess the real problem is that we have no reliable way to
> > identify whether a folio comes from in-fault readahead. I've tried
> > various combinations of PG_ flags, but none of them works. So the
> > only solution seems to be separate LRU-add callbacks for readahead
> > file folios and other folios.
> >
> > I've drafted a version below, but it's pretty ugly and feels like
> > using a sledgehammer to crack a nut for a quick fix — simply not
> > worth it. Maybe the best approach is to revert 6cbdd9726fb5 and
> > leave the proper fix to Kairui's MGLRU-FG.
> >
> 
> Before reverting the patch (and regressing workloads such as kernel builds),
> I tried the following two options:
> 
> 1. Remove folio_test_referenced() as PG_referenced might interfere with syscall.
> 
> diff --git a/include/linux/mm_inline.h b/include/linux/mm_inline.h
> index ab69b9930893..e231e56f0257 100644
> --- a/include/linux/mm_inline.h
> +++ b/include/linux/mm_inline.h
> @@ -327,7 +327,7 @@ static inline unsigned long
> lru_gen_folio_seq(const struct lruvec *lruvec,
>                   (folio_test_dirty(folio) || folio_test_writeback(folio))))
>                 gen = MIN_NR_GENS;
>         else
> -               gen = MAX_NR_GENS - (folio_test_workingset(folio) ||
> folio_test_referenced(folio));
> +               gen = MAX_NR_GENS - folio_test_workingset(folio);
> 
>         return max(READ_ONCE(lrugen->max_seq) - gen + 1,
> READ_ONCE(lrugen->min_seq[type]));
>  }
> 
> 2. changing to > 1 for folio_lru_refs() to reduce the syscall
> ra/non-ra interference:
> 
> diff --git a/include/linux/mm_inline.h b/include/linux/mm_inline.h
> index ab69b9930893..a3a894aae10b 100644
> --- a/include/linux/mm_inline.h
> +++ b/include/linux/mm_inline.h
> @@ -327,7 +327,7 @@ static inline unsigned long
> lru_gen_folio_seq(const struct lruvec *lruvec,
>                   (folio_test_dirty(folio) || folio_test_writeback(folio))))
>                 gen = MIN_NR_GENS;
>         else
> -               gen = MAX_NR_GENS - (folio_test_workingset(folio) ||
> folio_test_referenced(folio));
> +               gen = MAX_NR_GENS - (folio_test_workingset(folio) ||
> folio_lru_refs(folio) > 1);
> 
>         return max(READ_ONCE(lrugen->max_seq) - gen + 1,
> READ_ONCE(lrugen->min_seq[type]));
>  }
> 
> In both cases, kernel build performance holds up. Reverting the
> patch would regress system time from 3m40s to 4m4s.
> 
> I believe either option would eliminate or reduce interference
> with syscalls that use PG_referenced.
> 
> All we need is to give in-fault folios slightly higher
> priority through folio_mark_accessed(folio). I now realize
> the original patch might have gone a bit too far with
> || folio_test_referenced(folio).
> 
> I will wait for Ehab's and Kairui's testing results on these options.

Hello, Enab and Barry,

I can confirm folio_lru_refs(folio) > 1 works for me, the LevelDB test
basically aligned with pre 6cbdd9726fb5, the same for some other DB
that had regressions.

And any update from Enab?  Given the fact that Enab's regression is
also caused by that incidental bias, perhaps we can go forward with
this path? I'm looking forward to rebase MGLRU-FG on top of this.

Thanks!
