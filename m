Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792865347;
	b=VtZE0m3MxHyWlpkfKBNPRaGJ1XKFZJDORkS1ohfCuebr7T6sKEgzaSMIfw1KKclYju0/
	 D5CnQsMpZg1NdtfFFgY1mVWtfituiQQ0YwxOKpEtsJ6EUls6+SiMRN2Xy33SV6AMy6C4i
	 Rkv1RYIXReXhKIP3xIzj5Zbg9MHqOK9P9gzDDDDU82KwWvZvrrT8yqWd+dY+Yt+Z1/XqZ
	 YUZTK+w63wGj7po6LyeiP1p/62I4e7Iy6LrbXKOoZ5aI8w0ElLqg2QJufwvZ1u4znIRnS
	 EpisfC5WuvirBsLujsaxGbG0NrA88n5fZC7MSrRp7TW4fs7lUTuQJqUz2/FEZfFZapw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792865347;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=ERdyhAtVPKJZFC9C4hXaHC+3+7Xam6OVWXt0NVslvcg=;
	b=IKCCR5614deUYtMGR66Q9FBwT2fNX0F62VAOCXmUZDdBtu/tbbPYKx4W0M4KfZhSZdu2
	 RS6Ut+8JoaRF9RkCQSZsIy6JbIikppkJlMafqtb4ndVVt5Yfi2xYGbCxkhJp/+eXYBWwy
	 zRqz9hwmLCk2tKK1R0IHXo9WW+wGb7Gdxy4r+Ee7Z+kJZK6U4ifg+iYbQg6SOSFTinVrX
	 sBzMaiv2Lj3wMoF6pT6ND9xKE5YS9/Le+utTaEYXEniN+PEA/5oAxSiK6m8zm4z/HNhkH
	 w1x8nHkCe0ys9hb9G64c7ED1Xxcm8U0hR68UG100vadJGcDVeRFPRkklpLA7oUsU4wg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Hg2IGN3J;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A179606A31B
	for <sashiko-reviews@lists.linux.dev>; Sat, 24 Oct 2026 18:09:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A179606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Hg2IGN3J
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c2e8c710847so224202466b.0
        for <sashiko-reviews@lists.linux.dev>; Sat, 24 Oct 2026 11:09:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792865345; cv=none;
        d=google.com; s=arc-20260327;
        b=CEpqgBvMSsXKoNACSeJlYE7E7Tk+YihK12cLc9ns+LwkXcEvBH3MkwmC37no1OPRZO
         x4tMrjRvmoEQgsib03RvONUwSYdAKcNgazSME9J0z6l7s0erXtH9F+F6QDxhPkFHiesv
         LLNRX33KCdP1hmedWOM7CJPn3V3fp05As8xja58bwwnyR8rrb4gJeDoEDXTx6anJs8bb
         gPLpQ3uYciUYeSXj0kqKx+5HUmEXMQhvg31CLEZqxmR2b2Dbd3+CpKaBkTYijTumt/NY
         0RlEAfZrRtocUhV1KbNR5tIe7EoerqJ2eSiqIwYFJ22UKCwWCpUQqQW0B1thWhTLQIIz
         7SNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ERdyhAtVPKJZFC9C4hXaHC+3+7Xam6OVWXt0NVslvcg=;
        fh=luCPnnVstdrQVMGL960i/bkf+vsPiecmH+dKLh4tZ1o=;
        b=kLntom+/sN5M2euaqGymyQJD/I11q/f4NKSdb22gtFd7Nx+Xan8+ZSKGM+jmcp/wYh
         JKIfUBrkde3iRtEWQwyHyX6f/YUqmKQ7frRNrgRK0BmEQFZBairtitVFou34Kys1+ZXR
         9XDKKR+aq2snKcRJDmGcZ3ZGfQY8OCVekybBrLPXt1fMkt9OwZG6r/hWHfQnTi4l7gQF
         KlNHDqpZMPFOB5cYBGNi9+0K6Mwi74kV8NJDi+1c/qegTRCfJtP/N8MaIHdr3KYa86v+
         Le6jhOUsI9wOT7rhOZQqjh/m4j/Tgk6OQ58KyF/QpHdTV1QQDyuYSSDiJ9JzpGnLu9QK
         TquQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792865345; x=1793470145; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ERdyhAtVPKJZFC9C4hXaHC+3+7Xam6OVWXt0NVslvcg=;
        b=Hg2IGN3JCdjleLk1tDOI9Ijp0FLx3CNpdFrL05UCzvfax+AXkZguxRc99FXPE+b/Z6
         0wDc8dGKuekp6WXR35FkY+2DLIIF/DdE8xNIScbWmDnJh874qJJWuIWHz14A2Q8ucuI3
         3OzjsmG5FvbxhxtPPh3yHBgj4wjRb2h7/sLuChj4qdazrQqRTyw0jXwD4jqV1lmlAEGB
         NAe1iZQSfTbBcLzMm9ZidDPHwih36Azgr1114EpCEDYt6qC0ra4Pej8gQr4DA+iySja1
         2RcwcoSQ/og14urB9xCqxJFfLKuPZ846PeOublpOFLeXR2dQGahuEPUBgm6h5NEuek0+
         lFBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792865345; x=1793470145;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ERdyhAtVPKJZFC9C4hXaHC+3+7Xam6OVWXt0NVslvcg=;
        b=g/yjsYDfqaGu9vxLKOZnYuXS7oEZgU8MivGxnH3uvTgifIEL1rM+DheCG3d7uSdzIt
         Bo9IZo0rrA/9GPBGyWeqM1ivjmmtu2uf8jZUvh4EFLthsj9gNlZciYmGZv+xqKPtmY/N
         9NP4crnzkI+V5EDndQy5W7Zk9k/pov2uEUPUOKt51b5bPQ2fWtv6bRiJyUkbTNv5psA8
         ZNmKJuojnCluVeAhU01B+sO+UgPcLrcPzOoZ68F3tmJ+Otp19VDw4bAhYXMHqwffEvJE
         E3rjOAA2H/xrNqaUe4gZ5+9CjnCLl4zKaJJLjpoK1c0mT1Gd5o3ha42cCC3SXyq5RvRd
         seLQ==
X-Gm-Message-State: AFq9FYLeeQeUeEq/bXNO8Lx28oau+WDKDfi+uR/LXxbUQ928TpVu7b09
	ui7zQpEUM4OHPEnkdBP0AhQ4jc0Wqo72jsQL3G/7KGZyp1T1/4vIzs1JvV/YuAtAMODcMDJ9nGW
	ml1phidwYBvEQYD0Qnvj59s3GmhMi43wVIXzACTnHmg==
X-Gm-Gg: AYBFou1vRtF9plZZp7MRNO7DVKnkfVMNXuIVhkC9z6RtCFYLDqGdqAJyiaUvsxay0YW
	knUjSZfkilVtI9cWErd1hScy7+KzUr7bseyM6dP+X5vWayjK9U0nJiwXTAu+rNG25Ipwoy/SVN4
	+JRlfVx1xm8IHHLol27A4ydeIruGM69g0ZKYWFnvO3Ftkbso3IoCBqQjEXgD7uw+LVojgsEJUBq
	rC3yvCECApW45X77mZTJP0OB2boWBVBM9VPkr+x79rSSASeVHUtAZVjxbIFMCz/H+ZvR7AAzD0K
	XwYaiyzA9nMzN7APe6GpvmoY7555FeKRKUs9tqXKn2MzRE8ierurzN6XLH9scMDoH39CMcT3lZT
	4kcq8uQer0m9GPb1PiPdrywqNSJX/XhwQHuS8JN6MsEllQ+w8/3rcwCjkbOs5khXw3SDFQw==
X-Received: by 2002:a17:907:86a5:b0:c41:6149:cb43 with SMTP id
 a640c23a62f3a-c46bde099a6mr296933566b.18.1792865344596; Sat, 24 Oct 2026
 11:09:04 -0700 (PDT)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261022220203.91911-1-baohua@kernel.org> <20261022220203.91911-9-baohua@kernel.org>
 <sashiko-outbox-183274@kernel.org>
In-Reply-To: <sashiko-outbox-183274@kernel.org>
From: Kairui Song <ryncsn@gmail.com>
Date: Sun, 25 Oct 2026 02:08:27 +0800
X-Gm-Features: AclHuK8eWzuWavI0MQObBpMsb7z-DtSxrWiDtHQlSG46lBLdU3C2a79kHtVHB8c
Message-ID: <CAMgjq7DjYS01BQAWnr=EdbhM1gbX+K+pXM6z04UEKg_NLU3CNw@mail.gmail.com>
Subject: Re: [RFC PATCH v5 08/14] mm/mglru: lift youngest gen protection for
 higher priority
To: sashiko-reviews@lists.linux.dev
Cc: "Barry Song (Xiaomi)" <baohua@kernel.org>, akpm@linux-foundation.org, linux-mm@kvack.org, 
	hui.zhu@linux.dev, axelrasmussen@google.com, baolin.wang@linux.alibaba.com, 
	david@kernel.org, hannes@cmpxchg.org, ljs@kernel.org, mhocko@kernel.org, 
	qi.zheng@linux.dev, shakeel.butt@linux.dev, weixugc@google.com, 
	yuanchu@google.com, zhuhui@kylinos.cn, baoquan.he@linux.dev, 
	liuxiang.277@bytedance.com, wangzicheng@honor.com, lianux.mm@gmail.com, 
	liam@infradead.org, surenb@google.com, mhocko@suse.com, rppt@kernel.org, 
	zhangbo56@xiaomi.com, lyugaofei@xiaomi.com, ridong.chen@linux.dev, 
	kunwu.chan@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 24, 2026 at 6:03=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] mm/mglru: scan_folios() scans expired gen < min_seq at DEF_PRI=
ORITY
> --
>
> commit 1329290ce5f86b7de9b77d6b22e4b265f16348ae
> Author: Kairui Song <kasong@tencent.com>
>
> mm/mglru: lift youngest gen protection for higher priority
>
> This commit adjusts scan_folios() in mm/vmscan.c to choose the target
> generation sequence number based on reclaim priority rather than using
> lrugen->min_seq[type] at default priority. It aims to protect younger
> generations at default priority while allowing higher-priority reclaim to
> scan newer generations step by step.
>
> > diff --git a/mm/vmscan.c b/mm/vmscan.c
> > index fed39b0422e01..d1e14001f9346 100644
> > --- a/mm/vmscan.c
> > +++ b/mm/vmscan.c
> > @@ -4930,12 +4930,14 @@ static int scan_folios(unsigned long nr_to_scan=
, struct lruvec *lruvec,
> >       VM_WARN_ON_ONCE(!list_empty(list));
> >
> >       /*
> > -      * Respect the gen hotness distribution at low priority to avoid
> > -      * aging and scan cost, but prefer to satisfy the reclaimers requ=
est
> > -      * when under pressure to respect swappiness more and reduce IO c=
ost.
> > +      * Respect hotness at default priority, and only reach into the
> > +      * newest generation when under severe pressure, so hot folios ar=
e
> > +      * not evicted as soon as priority is raised.
> >        */
> >       if (sc->priority =3D=3D DEF_PRIORITY)
> > -             seq =3D lrugen->min_seq[type];
> > +             seq =3D lrugen->max_seq - MIN_NR_GENS;
> > +     else if (sc->priority > DEF_PRIORITY / 2)
> > +             seq =3D lrugen->max_seq - 1;
> >       else
> >               seq =3D lrugen->max_seq;
> >
>
> [Severity: Medium]
> Can this cause scan_folios() in mm/vmscan.c to scan an already-evicted
> generation when a type only has the minimum number of generations left?
>
> In try_to_shrink_lruvec() -> evict_folio_lists() -> evict_folios() ->
> scan_folios() at default priority, when get_nr_gens(lruvec, type) is at t=
he
> minimum (2 generations), lrugen->min_seq[type] is lrugen->max_seq - 1, wh=
ile
> scan_folios() sets seq to lrugen->max_seq - 2 and passes it as max_seq to
> lruvec_populated_min_seq():
>
> mm/vmscan.c:scan_folios() {
>         if (sc->priority =3D=3D DEF_PRIORITY)
>                 seq =3D lrugen->max_seq - MIN_NR_GENS;
>         ...
>         seq =3D lruvec_populated_min_seq(lruvec, type, sc->reclaim_idx + =
1, seq);
>         gen =3D lru_gen_from_seq(seq);
> }
>
> In lruvec_populated_min_seq(), because min_seq (lrugen->max_seq - 1) is
> greater than max_seq (lrugen->max_seq - 2), the while loop is skipped and
> max_seq is returned directly:
>
> mm/vmscan.c:lruvec_populated_min_seq() {
>         min_seq =3D READ_ONCE(lrugen->min_seq[type]);
>         while (min_seq <=3D max_seq) {
>                 gen =3D lru_gen_from_seq(min_seq);
>                 for (zone =3D 0; zone < zone_limit; zone++) {
>                         if (!list_empty(&lrugen->folios[gen][type][zone])=
)
>                                 return min_seq;
>                 }
>                 min_seq++;
>         }
>
>         return max_seq;
> }
>
> When scan_folios() previously scanned younger generations (lrugen->max_se=
q - 1
> or lrugen->max_seq) at elevated priority while get_nr_gens(lruvec, type) =
had
> fewer than the maximum number of generations, sort_folio() can move folio=
s
> with a stale folio_lru_gen() value (such as after __lru_gen_reparent_memc=
g()
> or when inc_min_seq() skipped draining old_gen) into that expired
> lrugen->folios[gen][type][zone] list:
>
> mm/vmscan.c:sort_folio() {
>         /* promoted, or moved due to reparenting. */
>         if (gen !=3D min_gen) {
>                 list_move(&folio->lru, &lrugen->folios[gen][type][zone]);
>                 return true;
>         }
> }
>
> A subsequent default-priority call to scan_folios() will then visit that
> expired generation (< lrugen->min_seq[type]) and corrupt active/inactive =
size
> accounting.
>
> In addition, in lru_gen_seq_write() -> run_cmd() -> run_eviction(), debug=
fs
> eviction runs at default priority. If a user requests evicting up to
> lrugen->max_seq - 3 when four generations exist and one type has already
> emptied lrugen->max_seq - 3 while the other type still has min_seq at
> lrugen->max_seq - 3, wouldn't setting seq to lrugen->max_seq - 2 in
> scan_folios() evict folios from generation lrugen->max_seq - 2, exceeding=
 the
> requested seq bound?
>

Looks a false positive, though it is tricky. A folio on a generation
list is only ever promoted, and min_seq[type] is advanced only after
the old generation has been drained by inc_min_seq() or verified empty
by try_to_inc_min_seq(). So when a type is down to MIN_NR_GENS, the
max_seq - MIN_NR_GENS target is empty, not a populated expired
generation. Lazy folio flags and the non evictable skip can create
temporary skew, and reparenting can look odd across generations, but
that skew is transient and cannot survive until a DEF_PRIORITY scan
targets that generation. sort_folio() also refuses to promote from the
last live generation.

For the debugfs case, lruvec_populated_min_seq() starts from
min_seq[type], so the type with min_seq =3D=3D max_seq - 3 scans max_seq -
3 while that generation is populated. The type already at max_seq - 2
was scanned at max_seq - 2 before this patch too. Not enforcing the
requested seq per type is a separate pre-existing debugfs issue, not
caused by this change.
