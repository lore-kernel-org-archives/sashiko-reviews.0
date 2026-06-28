Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F4BE3A6B66
	for <sashiko-reviews@lists.linux.dev>; Sun, 28 Jun 2026 12:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782649740; cv=pass; b=b1TY5H4rRNyCHetn/JRw3DB0nPoF8kX/Zv3t7xSRz/4CLGu+iS4p+L77vU5kN6AUZSpGDRWqMH5KurXj+HjnW1u4mDgCa9zVvLxXT2q2ESpFruXI2pJ5FapCUPerJsuOiRXygSMRkFO1XK6alElLxu4Bc8/xCKehHY/vDWqm6Gc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782649740; c=relaxed/simple;
	bh=5ApnCwq5Hsy6OnK5R9dFY0h0QMvGDBvhMeGj0FhJ0Eg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=amlXxhspKvw7eUwZw1B6Li+78PLLTwhtG+mQ+TkwjHDOy+Yke+V07KU2CTzR2Ng1/rgdrZhetQN3M/Q00ZNQk40/b22AeoP5P9bWEs7x8NMkYR9o8W2sIqS7vIsCU50iE629nDkTqxPJ8IBoebbmCp6l7ezFhYkT2F8nkUOq++Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com; spf=none smtp.mailfrom=mojatatu.com; dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.b=Tea3aOKZ; arc=pass smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.b="Tea3aOKZ"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-845dc38ad4dso575547b3a.0
        for <sashiko-reviews@lists.linux.dev>; Sun, 28 Jun 2026 05:28:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782649738; cv=none;
        d=google.com; s=arc-20260327;
        b=SpQtTLERrd0l24iVoXI8FAlc5ubuRNoMPeJ2Z1wsiWGwnsba745xwHxOyIlnrZ+Mgy
         +h2wwYrwIss/uYFZbUH0pmu3NJuPS7ZjlHDl6TLwWXamv8YlmExe/j89VKByKDZp8Y+e
         CeKgMnoqasoXbHCZHEAI587kCYNkmIEbkc83WWANcOEiOuVyXWjVvYqM8BjeTthaHpmg
         xGSdILB81D10/s6KiCz4lnmzQWrO88cI30D1NoJXx1rUGGVsiO9E55A7Yv1UP9l29eVl
         SCUSOiUImru8FeKFk7VFOVFdWzlB/V3x/skw1QNsHUutvWycv/ZVTHnPqQtns01z+iFk
         lQmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sEdjbIGDqsoiW4GawsVBo2JW1gWoEIpSwHHzh69Rb4A=;
        fh=h6FRjY4Vg/+m/z24uvzYaeQBI8nwVTWs0k3ZXJWq2bs=;
        b=kS4sEGn/dG+Ko/Hig0a0AZybMIUMSrk8sRBiMNlmF0xnzVuomxs79zzcBKqTiUJbha
         x2ugjtEO9wX26KJx4jlCp7ZJOgQVv6QTttOlM1m5FGyOzuuZCHCQRguATHZ+JKMlq+N3
         KK6D/O60jmgdQhNXLDdjt+HAFfEeTKLOoJCPtk0+7Mq52whOR6cLd31MqsNIcYbslfck
         Sd4k0hrw5erodLJ1z11ET1E2c51Xh4CwiIqRiPSo/ZbBDmaKpz25GG0QMhDsN/B4B1s/
         aJhvsAd9V80Zv+wES0ax6JYYToXpQQ/jWts1DYeuLphLqLIenP42oKmOm1KEEYvkMRe4
         uGHQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1782649738; x=1783254538; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sEdjbIGDqsoiW4GawsVBo2JW1gWoEIpSwHHzh69Rb4A=;
        b=Tea3aOKZW2057VOpbYa8OMnk4oKAhFbJfex6fR6lH0du8K813/Daf6fswYZEC7KpGQ
         eVZNZa9J7asPVEWZisO8IRjEzPNv5xwGvAAwxMs83iSZ0Bd8kgLy6kS0EoScyaqpdqa2
         TLs+p7BSAZ0R8AnVLZXrpxL68k2p3zjE52vPs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782649738; x=1783254538;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sEdjbIGDqsoiW4GawsVBo2JW1gWoEIpSwHHzh69Rb4A=;
        b=U6lxgM7IqTzBWjj0THjqLePeyrK+UP0J9ENU5WSjIpo5xW+2nd+o8VUVuklxC7KPOV
         g79uzvJtzWiLkVO5g7/1Z1HMhWLhImpvqkRaHxkA53NS+0otXxHTljgLWWyqsu9HiuvG
         kTSAF926jqolrYih1IpscR31Wf3ZvBNLBMiyhmgEHbQm4VEEjdShtukW/tFbjJo24uov
         LVrq11lY+1j/h05VXYIyvz+aeMz6of0Hc7WSVpk+SAojdkfSs4NsxIdywB701RYIYHeI
         eSbbORmpUjWygG7E7otghmMu/Xd6UFxfPtwoJcyU92R0Xwtoflkpt4zt6AOdRsa8NjHw
         iX1A==
X-Gm-Message-State: AOJu0YxvYUwX0fTude/LN/keDfqH5ppSSsWBxAtNRp0OsEOpqkgKU27S
	O5dfXSjtpk3Cc60abhk5Op3GChK6/5N1PGX7Gs6ura2A0q2AjaY+l5kxov6AQo4gyuqhue4gzk0
	JBoSxGSqWkGsMzdIfc5XiLSgDE7fdc3Co0FVXEYTFjhFz9Q/svhCktA==
X-Gm-Gg: AfdE7cl0nVAV/VcdX/tucPiEPRNz/y1gOLwusAZgPS9SveYazamOPeemfkXRCMNRq79
	xtr6NrE1D77AGvqLmP/2nLO4B+IU7uDZdmx0l/vbeF3m9FKpEQKgK24ol5E5X5JvFk3I/DwWstS
	D6+lVxh/vU6vcpU2qGzM0dLnEICkzJFnNAESyO8XuYBQOF3YlUrVADW4JgcimBh5LAZoJ3NA9fH
	reZZ//ksjYftNGr4TO1hGhE+jCo+cvHzUC7B5tQraTyPbFVPMH/Y/BUOIpG1S/19zaDOwdxZs3O
	p8bPHWbw
X-Received: by 2002:a05:6a00:32ce:b0:845:4888:74c5 with SMTP id
 d2e1a72fcca58-845b3ab50a8mr14060519b3a.23.1782649738333; Sun, 28 Jun 2026
 05:28:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260626165156.169012-1-jhs@mojatatu.com> <20260626165156.169012-3-jhs@mojatatu.com>
 <20260627165220.096B61F00A3A@smtp.kernel.org>
In-Reply-To: <20260627165220.096B61F00A3A@smtp.kernel.org>
From: Jamal Hadi Salim <jhs@mojatatu.com>
Date: Sun, 28 Jun 2026 08:28:46 -0400
X-Gm-Features: AVVi8CeUfCgYCrMiVLpafN92ArCYDophcwyfKGs-OnnxoG-o95tadQncfOA3DcM
Message-ID: <CAM0EoMkUeJYuPbg-qXxFLEtiLuntT+g4MeY-sHy5yBSVd7+j2Q@mail.gmail.com>
Subject: Re: [PATCH net 2/3] net/sched: Handle TC_ACT_REDIRECT from qdisc
 filter chains
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org, 
	Linux Kernel Network Developers <netdev@vger.kernel.org>, Petr Machata <petrm@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 27, 2026 at 12:52=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] Removal of TC_ACT_REDIRECT support from qevents (tcf_qevent_hand=
le) breaks existing eBPF redirect functionality.
> - [Low] pr_warn_once() used inside a static inline function in a header f=
ile will print multiple times.
> --
>
> commit d96e142c03f9c1a1e9ac2e1d8c8fe26605053b10
> Author: Jamal Hadi Salim <jhs@mojatatu.com>
>
> net/sched: Handle TC_ACT_REDIRECT from qdisc filter chains
>
> When a TC filter attached to a qdisc filter chain returns TC_ACT_REDIRECT=
,
> the redirect is silently lost. This patch adds a tcf_classify_qdisc()
> wrapper to convert TC_ACT_REDIRECT to TC_ACT_SHOT and drops the packet.
> It also removes the TC_ACT_REDIRECT case from tcf_qevent_handle() since
> it is handled by the wrapper.
>
> > diff --git a/include/net/pkt_cls.h b/include/net/pkt_cls.h
> > index 3bd08d7f39c18..3a542a72e9a55 100644
> > --- a/include/net/pkt_cls.h
> > +++ b/include/net/pkt_cls.h
> [ ... ]
> > @@ -159,6 +159,19 @@ static inline int tcf_classify(struct sk_buff *skb=
,
> >
> >  #endif
> >
> > +static inline int tcf_classify_qdisc(struct sk_buff *skb,
> > +                                  const struct tcf_proto *tp,
> > +                                  struct tcf_result *res, bool compat_=
mode)
> > +{
> > +     int ret =3D tcf_classify(skb, NULL, tp, res, compat_mode);
> > +
> > +     if (unlikely(ret =3D=3D TC_ACT_REDIRECT)) {
> > +             pr_warn_once("TC_ACT_REDIRECT from qdisc filter chains is=
 not supported; use eBPF with clsact or mirred redirect instead\n");
>
> [Severity: Low]
> Is this going to print multiple times instead of strictly once globally?
>
> Because tcf_classify_qdisc() is a static inline function in a header file=
,
> each C file including it (like the various qdisc modules) will create its=
 own
> local instance of the static __already_done variable used by pr_warn_once=
().

This was intentional. I used WARN_ONCE() initially, but NIPA testing
may consider that as something "bad". In any case, this usage is
common, just ignore it.

> > +             ret =3D TC_ACT_SHOT;
> > +     }
> > +     return ret;
> > +}
> > +
> >  static inline unsigned long
> >  __cls_set_class(unsigned long *clp, unsigned long cl)
> >  {
> > diff --git a/net/sched/cls_api.c b/net/sched/cls_api.c
> > index 3e67600a4a1a1..3ca56d060e28f 100644
> > --- a/net/sched/cls_api.c
> > +++ b/net/sched/cls_api.c
> > @@ -4033,7 +4033,7 @@ struct sk_buff *tcf_qevent_handle(struct tcf_qeve=
nt *qe, struct Qdisc *sch, stru
> >
> >       fl =3D rcu_dereference_bh(qe->filter_chain);
> >
> > -     switch (tcf_classify(skb, NULL, fl, &cl_res, false)) {
> > +     switch (tcf_classify_qdisc(skb, fl, &cl_res, false)) {
>
> [Severity: High]
> Does this break existing eBPF redirect functionality for qevents?
>

Again, design intent. I will update the commit message to state this
clearly with the following text:
---
Remove the TC_ACT_REDIRECT case from tcf_qevent_handle().
skb_do_redirect() belongs in the BPF plumbing layer (net/core/), not
in net/sched/. The case was never consistent with the rest of the
qdisc classification infrastructure, where no classify function
handles
TC_ACT_REDIRECT.
---

IMO, it appears to have been TheLinuxWay(tm) i.e a cut-and-paste from
existing code on day 1 of  the qevent introduction rather than a
deliberate design decision.
Ccing Petr to see if he thinks differently.

cheers,
jamal

> Prior to this patch, tcf_qevent_handle() correctly handled TC_ACT_REDIREC=
T
> by calling skb_do_redirect(skb). By using the tcf_classify_qdisc() wrappe=
r
> here, TC_ACT_REDIRECT is unconditionally converted to TC_ACT_SHOT. This
> inadvertently drops packets that were legitimately redirecting from qeven=
ts.
>
> >       case TC_ACT_SHOT:
> >               qdisc_qstats_drop(sch);
> >               __qdisc_drop(skb, to_free);
> > @@ -4045,10 +4045,6 @@ struct sk_buff *tcf_qevent_handle(struct tcf_qev=
ent *qe, struct Qdisc *sch, stru
> >               __qdisc_drop(skb, to_free);
> >               *ret =3D __NET_XMIT_STOLEN;
> >               return NULL;
> > -     case TC_ACT_REDIRECT:
> > -             skb_do_redirect(skb);
> > -             *ret =3D __NET_XMIT_STOLEN;
> > -             return NULL;
> >       case TC_ACT_CONSUMED:
> >               *ret =3D __NET_XMIT_STOLEN;
> >               return NULL;
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260626165156.16=
9012-1-jhs@mojatatu.com?part=3D2
