Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76AB9312807
	for <sashiko-reviews@lists.linux.dev>; Fri, 12 Jun 2026 05:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781243967; cv=pass; b=abyg9DLnwX4/AXU5MUD0mCyFc4U9AcBTHwSt5NwtNVPMnytweK0b+zo69uVqKTvuZzoqSBSVv2RMQERN7Boa0kMmdr1tSQLenmQyxBn0k5xUAScqY2MmqjhUwOILaXK8r23jVsHm+IvoFv1ipIQ6Xx4PjfEWyakWiCa77mneUxA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781243967; c=relaxed/simple;
	bh=NCMOSv8PebqwPmrSyGCA5at/gCV9usFfd7wYj6j8PWc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iHXuOmpsITZIe5rGsUbhHLD8X9dhVEQbgGLPrqDjGcFvxirwrCFtfDRxHtipuqOIPhWrhz4k5oRte0aZdCtmAg0mxi53Ary0GxbG1YLmAo+CAVhDbgtKsHpLrprbdupXpi9IkfHaRTO8/OCABS8CZ08FtSvQUuV9hfE3hbOaJNs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DY1I8PlI; arc=pass smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DY1I8PlI"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-304c520fe9aso1464290eec.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 11 Jun 2026 22:59:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781243965; cv=none;
        d=google.com; s=arc-20240605;
        b=ZvV+/6Ng3gODYBIZANQ439C+PbQtToe4lIHh5MnvVxxX2mo3QWwzmKUwffooo+72rC
         qCCz5SMw75os8eU5OFlYgaImAb/85scFboZD8vrsxS/J1FnkowV9phLgvAqP2c/7p1zj
         Q4LfiguLv6pY6skFT/Qd6ckMUhMaNzXyC0JKWIZSlZ2/Yd3TRixa6Mqt2aWWWjjleRTf
         aC9385lVyaklFduCFkHIgPRji4bwLD/0L46D/xw9PY8w89cx5OI6Tj+rYe19XcmGKcMO
         cweXRuopLKouTvTuW0/LdYl2zKgHd1UC3H4hQjDJg93Tt4YcrvDLg5tbj/g0p/UglX8N
         PgUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PX3ObJ6hAnulchFlbqVK9HnQncb17pHwM8Q1uYSdLsA=;
        fh=uA360uvxR9S0K/Y4Lovo7aIaGlBwzVBnnb2BKWupr/4=;
        b=A10hUvWWacKNs097dLv1GU51Mp0+n27FeR6aOt9tdd1keNljjrcAMRLtgQqekYzcYp
         +a1BcaAD3wk0OKfU47AnAMaru49h+7XP3HbRR6TEokFQqP0S+SAFDBLUZc8d/P/V1e05
         U0gw8jd6ah64t10Vt0yH9M/bZNkfnAH2ioMkWtTZCALkS/6TfMsbfXQV64Hg+xHcGpzX
         Bk2IgGNWSaPZLLkmEoDkrHDUkGiahGSik3wZGMM+/tYqeZQQaFZU9whNRzR6rgG4gcXy
         +DSllmCOnSqrE6AMZOwx4FLSvuPskoG2wUT2Xe6uM19bwxOHwxuQLEQ7UDC7fbiWhOBx
         MDnQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781243965; x=1781848765; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PX3ObJ6hAnulchFlbqVK9HnQncb17pHwM8Q1uYSdLsA=;
        b=DY1I8PlIoG81FTcCefJGbtGRT+jYUGxZVsff7TQ3o0fnkdNXj+GgBxjbqGbm8YCVJi
         EZNI05jlqHCmeY1byD/ZoxKderWHV15UY3gXFVH+pUibGFbgKqaKk0g6kquTKKcmtrcz
         VX2alIQu51MAsmzt41tLQDlJ9AqylT4lBHfILB0Ptop6LssXD+0FPEC+i56r+eIqUe8k
         HnP/xmhxq06M1aQhUrX9Mf0itPpe3nltlGxplYMSGd4SAvPRh2gJZUnlklrwFghXSo+w
         I0Fkpa5hLnONnG9JqklmGW6MfMHFm30lQ6y5U0nklZRf7mrbUlpIlp0ZeoMvhoF7Ooxm
         yHZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781243965; x=1781848765;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PX3ObJ6hAnulchFlbqVK9HnQncb17pHwM8Q1uYSdLsA=;
        b=IifV8xsU4TVHSV+AL6Xq/MtT2tuZqtYdTuslpR+c/EvsXk6eZ6rxq1JM1PR9QUdgcB
         sj3J1Qo/QY9EYezUaIe8nE2m7XpK6hfKbP2LftKaHCZaCqxNhRKa3O2ggEgfUKbSELS0
         lfAK6Vqm+ivwa/KkQtzTn6p6bEuDinE8RE6M5IoJE2Ggsc7STyavwC5+vjiLQbYKMgpA
         jxFj0FJIidH4FwjNcuZsUjYvjXaue964IWwqcRPnO/Ci49ZuagTplha+Hpl9Vj1TaWiw
         61+vfRDkXrCFa2+bm5vU5Y9KIomNdQijFrYu4ZKfvW0i1v1WT8WAEM7ha65QtgGj+s8X
         I74Q==
X-Gm-Message-State: AOJu0YzpdMLJ0KisWPHlsXbGeYoBE1Dxx0o/lUUS+UoEe7M1gl9owI00
	9/uM2sRfyICRrW8e9GWbCGguyQaWqZfHByiDRDqOSDzdkPpoRCx3VbEp6hi2kTOrSwcZL5Fptuo
	Kda7wTfE2rqdwofHjUTLfpbxfFZeVpMQKRMWYgaE1R19nPo1+4QAeX5Umw6kpow==
X-Gm-Gg: Acq92OGJrnveE55xkksTqsaj4dpZhqXQvoXPogi6t/S9nruGjkD48MhvQjs6oJQxTvG
	eqNzW14CED3w4yxPGYnDl25hl5PbiVwxAbemD19lybUDBbwQom5KC3sjxX33hf6f+6x82jjZb1c
	j7thzplJC7EI49nnflOV6BiDFZsu46cv6QLwU1ZA0qSeKESSBWP0FHgT/zmp1yy27gAbgeLirGO
	HZdqISel13h3S6bfG3YoTHOyq42vIx9g1t6FBv9RzvEayT4EQn8hQ1QF890GglC6o8QUh7sPUSX
	z5/3MC+AgvwCwY/GzL5vtZMZeqNPJYXX2sIfZ7uuMtP9q+DhLTuVPglur0Lps0jU8iaCIkQ8z4g
	5KUqzqKVl/XZJbFia8rvj/P/y5Q1KEB364w3Dk3myKIhdK+6hsWcj
X-Received: by 2002:a05:7300:578e:b0:304:b15:17d6 with SMTP id
 5a478bee46e88-3081ff63c68mr958282eec.6.1781243964671; Thu, 11 Jun 2026
 22:59:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260612001803.23341-5-kuniyu@google.com> <20260612003305.53D791F000E9@smtp.kernel.org>
In-Reply-To: <20260612003305.53D791F000E9@smtp.kernel.org>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Thu, 11 Jun 2026 22:59:12 -0700
X-Gm-Features: AVVi8Cem_OB6wuchwynjCt5I59aMSQZ4TgN3C5ww0DubhLFIYFCj_2Bzyd1nYB0
Message-ID: <CAAVpQUBhoxYNst2FnTZ+NpnPp5YRLDC0+petEyObjrf7OK4QaA@mail.gmail.com>
Subject: Re: [PATCH v1 bpf-next/net 4/5] bpf: Add kfunc to proxy TX HW Timestamp.
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 11, 2026 at 5:33=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
>
> New issues:
> - [High] The TC_ACT_ERRQUEUE action is unhandled in sch_handle_egress(), =
causing packets to be silently transmitted instead of queued or dropped.
>
> Pre-existing issues:
> - [High] bpf_net_ctx_get_ri() will dereference a NULL pointer if bpf_skb_=
complete_tx_tstamp is called from a qdisc where bpf_net_ctx is not set.
> --
>
> commit 532ea1ea43e08b0ed268837eba11a8d463c7b97b
> Author: Kuniyuki Iwashima <kuniyu@google.com>
>
> bpf: Add kfunc to proxy TX HW Timestamp.
>
> This patch introduces two new kfuncs, bpf_skb_scrub_tx_tstamp() and
> bpf_skb_complete_tx_tstamp(), to proxy TX hardware timestamps for socket
> applications using SCM_TIMESTAMPING. It also introduces the TCX_ERRQUEUE
> action to enqueue the modified packet to the socket's error queue.
>
> > diff --git a/net/core/dev.c b/net/core/dev.c
> > index 0c6c270d9f7d1..a86d10659cbbc 100644
> > --- a/net/core/dev.c
> > +++ b/net/core/dev.c
> [ ... ]
> > @@ -4504,6 +4539,10 @@ sch_handle_ingress(struct sk_buff *skb, struct p=
acket_type **pt_prev, int *ret,
> >               *ret =3D NET_RX_DROP;
> >               bpf_net_ctx_clear(bpf_net_ctx);
> >               return NULL;
> > +     case TC_ACT_ERRQUEUE:
> > +             *ret =3D skb_do_completion(skb);
> > +             bpf_net_ctx_clear(bpf_net_ctx);
> > +             return NULL;
>
> [Severity: High]
> Does TC_ACT_ERRQUEUE also need to be handled in sch_handle_egress()?

This is intentional.  I'll add !skb_at_tc_ingress() check
in bpf_skb_complete_tx_tstamp () instead.

>
> If a BPF program returns TCX_ERRQUEUE on egress, the switch statement in
> sch_handle_egress() will fall through. This clears the BPF network contex=
t
> and returns the skb for transmission instead of queueing or dropping it,
> which seems to bypass the intended error queue behavior.
>
> [ ... ]
> > diff --git a/net/core/filter.c b/net/core/filter.c
> > index ab7adef9c0159..0bb8122f9f2eb 100644
> > --- a/net/core/filter.c
> > +++ b/net/core/filter.c
> [ ... ]
> > +__bpf_kfunc int bpf_skb_complete_tx_tstamp(struct __sk_buff *s,
> > +                                        struct bpf_tx_tstamp_cmpl *att=
rs,
> > +                                        int attrs__sz)
> > +{
> > +     struct sk_buff *skb =3D (struct sk_buff *)s;
> > +     struct bpf_redirect_info *ri;
> > +     struct sock *sk =3D skb->sk;
> > +     s32 delta;
> > +
> > +     if (attrs__sz !=3D sizeof(*attrs) || attrs->reserved)
> > +             return -EINVAL;
> > +
> > +     if (!sk || !sk_fullsock(sk))
> > +             return -EINVAL;
>
> [Severity: High]
> Should this function verify it is only called on ingress?

Right, I'll add it.

>
> Without checking skb_at_tc_ingress(skb), bpf_skb_complete_tx_tstamp() cou=
ld
> be called on egress. If that happens and the program returns TCX_ERRQUEUE=
,
> the completion state would be silently discarded and the packet transmitt=
ed
> because sch_handle_egress() does not currently handle TC_ACT_ERRQUEUE.
>
> > +
> > +     if (attrs->payload_offset > skb->len)
> > +             return -EINVAL;
> > +
> > +     delta =3D attrs->payload_offset - attrs->network_offset;
> > +     switch (attrs->protocol) {
> > +     case htons(ETH_P_IP):
> > +             if (delta < (s32)sizeof(struct iphdr) || !sk_is_inet(sk))
> > +                     return -EINVAL;
> > +             break;
> > +     case htons(ETH_P_IPV6):
> > +             if (delta < (s32)sizeof(struct ipv6hdr) || sk->sk_family =
!=3D AF_INET6)
> > +                     return -EINVAL;
> > +             break;
> > +     default:
> > +             return -EAFNOSUPPORT;
> > +     }
> > +
> > +     ri =3D bpf_net_ctx_get_ri();
>
> [Severity: High]
> This is a pre-existing issue, but can bpf_net_ctx_get_ri() trigger a NULL
> pointer dereference here under certain conditions?

This is orthogonal to this series.

Also, bpf_redirect() etc do not have NULL check too.


>
> When a BPF program runs via tcf_classify() from a traditional classful qd=
isc
> enqueue callback (like HTB), sch_handle_egress() has already cleared the
> bpf_net_ctx. Calling this kfunc in that scenario would cause
> bpf_net_ctx_get_ri() to dereference a NULL pointer.
>
> > +     ri->kern_flags |=3D BPF_RI_F_TX_TS_CMPL;
> > +     ri->txtscmpl =3D *attrs;
> > +
> > +     return 0;
> > +}
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260612001803.23=
341-1-kuniyu@google.com?part=3D4
