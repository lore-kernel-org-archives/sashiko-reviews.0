Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794352270;
	b=4E/n3LvCSPJYJfH5wjv+Kb+NDxOW8RhSTWCDg7uwMU5GKaaxya5qxHiXCVs2xq6unAIw
	 5Lywkr/4OH3J+jfurIEsrVe0E//ojSuC/qc0MXbr0p5CFWEObIiPlIjTdI3+QQF/MM0Wt
	 p9gujhAWdFc6Jj9mDYldnUGLYbk5SnXeXEtfxp+pUXC1j8vfUmCLviBgtKz8lCg9JxwsS
	 tB4UDraDMlaL6GM0y4nBDHm7Fps3PqYnP3K0jjB47/wcLS9ggx2EsEB6nK8xcuZMwAEun
	 4eyEb7Au4nHG8JO1DwM68TEfrsX5sPFhGp3GV6r9wPzQVp1EKZODSmrUp6ZL66+PyBA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794352270;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=wahlQe2g3fyZOdMzE4NOHeW/SspvW2KMChHvizkHdbo=;
	b=zW30/RVAZMzDiTrAcW6XMWozrXtJMZugMnHMaAECzas4J/Wjx1Le+9mEALx/K5+PUUr1
	 NeAOzidZH9URItzZEygNZP14c+OOjyqsOVHnesB7/NGh+Z1mwt9Z0ajUCMfjozm21+PX7
	 ponnEUJUR6Bxaqe2fT45UodLVYO1Bf+yhSTz6p+u9ahTLQsBPTlucbvyPKeS3sjCf2fb6
	 McCoB5Q1Q/XmGXPHezUgrVGVejr+qWaOQPF3IyXwP1z3PwDuW2z3oiPecIFtBHWnPhg6x
	 kOXkPl5riga6dRwIE306zQ1C12DLoQQMFedGNjzv/h9AonLP/jiARwYP0zIKR0Dhxkg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xBK2Aveh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.179
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08E2606A335
	for <sashiko-reviews@lists.linux.dev>; Tue, 10 Nov 2026 23:11:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E08E2606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xBK2Aveh
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8b309147589so28650967b3.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 10 Nov 2026 15:11:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794352269; cv=none;
        d=google.com; s=arc-20260327;
        b=o71Yl6otZ3jyWU6attDuXshJsaAB6r77jVo1N6z0ts0JQoBV32Rj/tWh3kmd3IBeYg
         57kGk9RkKpXeXhJnzIfIy/70AgyW3+blbbqOYcw60R4jl0scRdojxTJkxLeU3pgAo7bY
         HNFCeeLV8Pv1q/dUpYo2BfgjHAkMPY9HDDyvDHhKIuYOG6MM7AYbL9EwXUc86x0eDB1O
         1QvEsm+SiUqNwqdMrQudHXmj8uHOnbRU2k9QVzrE915MK9Tu4wDXUDnemNJKo13k79ju
         PXj7QBsCdwwHdmlu9Bqze0VSILIS5YKNmy70/ciBz41J9/M5+iFiHZlJWjqo5x2X7GVD
         y4TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wahlQe2g3fyZOdMzE4NOHeW/SspvW2KMChHvizkHdbo=;
        fh=LqK0Xv+a9kr5LlKpzUfj1bgwHBYxnPQ/UdHksy+Xi3U=;
        b=mUWL4/DCmxque4Vvl5jaxxd6+uTi697+eBJx2vqH51tqM4lLRjpvf7W8mMCo7w4Hz2
         hrJXd25tE5pLoeJehYqUOJ0yj/tw7ItB5+1mSziBUvjf2aqm8wa1j8rDueHdqXo9nc3B
         Ez4bTq0KAaqcsSn9E6wZdxvti6mzvP+ybCuXpZSVeFyX0UzYPiLrMKr/ggLy/25j/hWQ
         f05oiU+iTKW7wt4d28YEa3M1HlpA+AoPrtqYsRs10WdbfkPjSfW9RIP+Md6UnoyVhfEd
         zpho8fabPnfNNyEK8ty3EnqkWznbZiLmNyHcjgkrvttA2P0ynKyssDInI6QIV16IKP/X
         kttg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794352269; x=1794957069; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wahlQe2g3fyZOdMzE4NOHeW/SspvW2KMChHvizkHdbo=;
        b=xBK2AvehuwVNtpG7glMYgOo8T39bClnzdxBrpDfCKDKHwDN6IK8KDpzfqUdFelknmc
         C3oT2bsd969oH0NCNfkYPnWxp0FJ7H4+Z/hvppMeZHxpkHSER47/dEEAxAvoeG22FtF1
         PfwvIhQ89T7qOEYRH5PRK5WOKWgpqdb3t7cLnID9DINmWMMVot9D+2K8NjQmXU6TgFgU
         HVoZaB5eiR0QJBFZYeD+XM0RLo9FM7sEIvAyTm9w8wZqxyi7br6RdSmZrE6RWarKysrT
         C9LezvHe6TbUXQduCJ5+inG41JF4bpweXSSZHuJrsIOAtRFfLxhy/6N3ThrUdzbdj4js
         7taA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794352269; x=1794957069;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wahlQe2g3fyZOdMzE4NOHeW/SspvW2KMChHvizkHdbo=;
        b=xgTMiAw3SOJIHFJqv16H1DckGc9zh9rn4Hzi865kPb14ll1mWqc9jkM/nY3IfBnJHN
         yxJmmYyCi/S7YgeDWMq9BCyxqW0v7OF781sqCvAM+t8XJly2FRG0jAIu/1tQLMA/Zw29
         ZjtBcRCu99Iqyk0pzmo96ZYPwXt8YHko99C0OTxKEEgqNNWIRsM8B+uP6OON/7QSwg9M
         nQWozJ2V5NzxUDBqSopCX1Ang4SIHZz0IYrgZ+XJxM1u2UBrpiUszefkd2SqhJQdGy/V
         aTMthRbMgtSkw21YYlFSOB6gj4vj+hS46mwC4mgKIKmznS0bTCkrtcpGfW2vLR9CNMYh
         A54g==
X-Gm-Message-State: APuU4Z/Tqw4MEMbdP30KaP8HL+hPICj9VJv9CvJdSk5ytYVbY9gfXJur
	wUJsUFspCC/4IsBTKuRY7+4haks/dD+UrUz69iIqwGjWSPiWIzBik4Z390Fnb00H36VA8GkfqNF
	N3XtYWa4jPpQkzw6b6pRk3r1dzlQePZ1D9gdEDWg=
X-Gm-Gg: AYBFou0hmeTTu5AV2bTbP5I/v8QRlK5kK9rBVpVv6zDCSSC2hWBjjCdBzhsTb2PDVWh
	Vq0d1Dh24qisN+thRRevAkOb1rJo7Fj0ZSRey8WIww4Z2ha+oF1F7Y8GvIne1rlBSenwxvVMT+v
	DJLD36QYLly6sF2HKwV4GjwqDML+h9PdUtywtpVjRWO/bxwozfD8C1YmbyjaP/C+6Jcdo19/7t+
	JEUDdWHXAdeFZgYq9dttR2LzpgQ3RB8wqpA4OEND6YWuVyVRzYOLnh7BD7pplxxEf5kdm+GuXI2
	1RN4vfRn2TaL8ad965cyqZPhbpPA2QfrZbEW3vXJzT+6J8Qs2Hj8Ubt2UzhJ+oUQPPrW6ABJkkR
	16ewvEDcgi/8Y5B/2CeG54lIsA1tIIfueHIajeQH4HhexMNXBrXSvVFd/N99kSdqcuu5kHPJWxk
	aMmrzUVTs/VZP48+huJA==
X-Received: by 2002:a53:c3c2:0:b0:67c:191a:b1b6 with SMTP id
 956f58d0204a3-67c6804a36dmr465377d50.92.1794352268572; Tue, 10 Nov 2026
 15:11:08 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261110015321.611093-1-joannelkoong@gmail.com>
 <20261110015321.611093-3-joannelkoong@gmail.com> <sashiko-outbox-206041@kernel.org>
In-Reply-To: <sashiko-outbox-206041@kernel.org>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Tue, 10 Nov 2026 15:10:54 -0800
X-Gm-Features: AclHuK_x9P6OqkboG6qb5NIkTUFkL-irsJ3EWWNoTZvU-iCZdnPmiRbQT2ahxgc
Message-ID: <CAJnrk1aQrRE78wqd2yZWS2Sk8MiCHd9x0dveZBh5LHE5w75nkg@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] mm: memcg: read root lruvec stats from the node counters
To: sashiko-reviews@lists.linux.dev
Cc: akpm@linux-foundation.org, yosry@kernel.org, shakeel.butt@linux.dev, 
	hannes@cmpxchg.org, mhocko@kernel.org, roman.gushchin@linux.dev, 
	muchun.song@linux.dev, nphamcs@gmail.com, chengming.zhou@linux.dev, 
	sj@kernel.org, david@kernel.org, ljs@kernel.org, linux-mm@kvack.org, 
	damon@lists.linux.dev, tj@kernel.org, mkoutny@suse.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2026 at 6:23=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] mm: memcg: node_stat_includes_unaccounted() omits file and
>   writeback stats
> --
>
> commit d2ba314724a8ba015e3bf2a30f155f1beba25a8c
> Author: Joanne Koong <joannelkoong@gmail.com>
>
> mm: memcg: read root lruvec stats from the node counters
>
> This commit changes lruvec_page_state() and lruvec_page_state_monotonic()
> to read per-node vmstat counters instead of rstat values for the root
> memcg when querying stats that only track memory charged to a memcg.
>
> > diff --git a/mm/memcontrol.c b/mm/memcontrol.c
> > index 1ebc9330aeae5..2575bf2ba0ea6 100644
> > --- a/mm/memcontrol.c
> > +++ b/mm/memcontrol.c
>
> [ ... ]
>
> > @@ -504,13 +511,52 @@ struct lruvec_stats {
> >       long state_pending[NR_MEMCG_NODE_STAT_ITEMS];
> >  };
> >
> > +/*
> > + * Whether the node counter for @idx can also count memory that isn't =
charged
> > + * to a memcg (eg kernel memory that isn't accounted). For these stats=
, the
> > + * node counter can be larger than the root memcg's value, so the root=
 memcg
> > + * has to read its rstat value instead.
> > + */
> > +static bool node_stat_includes_unaccounted(enum node_stat_item idx)
> > +{
> > +     switch (idx) {
> > +     case NR_SLAB_RECLAIMABLE_B:
> > +     case NR_SLAB_UNRECLAIMABLE_B:
> > +     case WORKINGSET_NODERECLAIM:
> > +     case NR_VMALLOC:
> > +     case NR_KERNEL_STACK_KB:
> > +     case NR_PAGETABLE:
> > +     case NR_SECONDARY_PAGETABLE:
> > +#ifdef CONFIG_HUGETLB_PAGE
> > +     case NR_HUGETLB:
> > +#endif
> > +             return true;
> > +     default:
> > +             return false;
> > +     }
> > +}
>
> [Severity: Medium]
> Should node_stat_includes_unaccounted() also include NR_FILE_PAGES,
> NR_FILE_MAPPED, and NR_WRITEBACK?
>
> For NR_FILE_PAGES, swapcache operations such as __swap_cache_add_folio(),
> __swap_cache_del_folio(), and __swap_cache_alloc() update NR_FILE_PAGES
> only in the node counter while accounting swapcache in the lruvec under
> NR_SWAPCACHE:
>
> mm/swap_state.c:__swap_cache_add_folio() {
>         ...
>         node_stat_mod_folio(folio, NR_FILE_PAGES, nr_pages);
>         lruvec_stat_mod_folio(folio, NR_SWAPCACHE, nr_pages);
>         ...
> }
>
> Reading node_page_state(pgdat, NR_FILE_PAGES) for the root lruvec
> therefore includes all swapcache pages, which inflates the "file" counter
> in the root cgroup's memory.numa_stat (double-counting swapcache alongsid=
e
> "swapcached") and causes it to diverge from memory.stat even after a
> flush.
>
> Similarly, __folio_mod_stat() -> lruvec_stat_mod_folio() updates the node
> NR_FILE_MAPPED counter without updating memcg rstat whenever an uncharged
> folio (folio_memcg(folio) =3D=3D NULL, such as a driver mapping or a
> root-cgroup __GFP_ACCOUNT kernel folio) is mapped into userspace, and
> nfs_folio_mark_unstable() and nfs_folio_clear_commit() update
> NR_WRITEBACK only in the node counter for unstable NFS pages awaiting
> server COMMIT.
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110015321.61=
1093-1-joannelkoong@gmail.com?part=3D2

Thanks, this is a good point about the folio stats.

Hmm... I wonder if we should go with an allowlist instead of a
denylist. The allowlist is longer (31 stats vs 11) but would be more
resilient to failures (a stat missing from the allowlist just reads
the rstat value whereas a stat missing from the denylist will silently
report the wrong value) for any stats added in the future. Any
thoughts?

Thanks,
Joanne
