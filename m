Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E224252D5
	for <sashiko-reviews@lists.linux.dev>; Mon,  6 Jul 2026 22:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783377125; cv=pass; b=doApy6UyFBe5h8nz/RaiOdNUPatKeZ1UdJu+Fxn/tH/8TiBA0e5OqlhsLCbPNedCmd9hiWdnWGxuWFavN94cevxgy10pz3Tojg7IjtgoEy2vxQWE6f8+XmG22YfN7HgAqzosqoo+dZQWB3URLzLWL899S663W00L04E6sXmjK/U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783377125; c=relaxed/simple;
	bh=VkMptyWzBPx8wBS35jJuVIhCQolKJDhtL7+V/Nw/XiI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BE9v7olE4mdWTaUit0AmLmzhqBCfe/0AH8vhNa3r11FOEtt83L0DKVz+zQZwoUhSUHpbQF8sZcwBwniJOLV7tVdtnCv9ILZw+Krqd1WH6XH3b/R1bA2jUkC6ag31QlFWtgduBNWODxYBmyM2igQFHNGhFtwnd7W5ykg9YBjd0AU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jmUgPt20; arc=pass smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jmUgPt20"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-6649ffb1d01so5859247d50.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 06 Jul 2026 15:32:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783377122; cv=none;
        d=google.com; s=arc-20260327;
        b=E0jvzutbtM47WgOIcTTMHOynZLNJbk8TogcBgIKUii2hwPRWN0yFwhh2KeXJHo+FNh
         VEwo+6CnmSV9cP6W6VEVpQcdOUGd4j/X+YLHgyn6scmWvOkYmY1wzcvPybyZaN3Oeegw
         n0HcQvSHxTlz6UW3YDAPLt6JZ/NQjTQTEYGyPs+2JKxykcdR3yqlVaZrPDCRFmNeapBX
         VatTVYHOwHH+oLAleWJGq+dnVR3KN61YjcjJRIRYkls2jlgyVuvuK2u0fp4zb53AyObh
         p7X09hPHVI8jYM4Mif9+w87hUWrmmgaHV/vgR2eWl80wi0NQS9aiKFr+/KneF8Yz1kz0
         QRGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=I6Kjbx3XUGCt0E7myA9GzyrUsA48dN9R24sT3zkPd6A=;
        fh=uA360uvxR9S0K/Y4Lovo7aIaGlBwzVBnnb2BKWupr/4=;
        b=BIkzqYQiXRzYkqkLLJqWD8v7FwOciNQOvqBZvSWwdRCcPvjQxoAPA5z5vkNnuowY2A
         ynsAsQzTmAv6Rs5GBEijFHb6A3+MBjD6IzG0QYvEYYBr6uxvmNKej2dvemTQ2h3orM/W
         AWOqq6GECY8EZTzeK8lcLiKUHH05TYbBKXy+n9f1WA/SeXZ1wfFh8Zs9amMxysKbErP+
         H3ONvfP0Sk0LvjyxFk1OtpLxaNVKS1WnH0eYOrirJI2TGOzdLTEVw/DS7LbN23RtR3t8
         7j7dRSAUpYn0/Qea13+qHC6KA2MtqBDL0dZqMOSUmivN3Rl5zHAqpL9bFtrqzFzT7RO6
         Lz4A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783377122; x=1783981922; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I6Kjbx3XUGCt0E7myA9GzyrUsA48dN9R24sT3zkPd6A=;
        b=jmUgPt20zKFCqEwvu0I7lJtrtUJbtSXxzf16/iryHoNJWJ/yJtM2Yudr7hUPiRLOiY
         w/tUxcBshVoKl1NJGrTzImv8osurV/qCgcDl5DOvDrZE7htpSfJPIWchfC6NQF+CMANG
         1OYsu6YTxOoJdzk5cLWssEvPQLOuIqoEhZwA5o0haetoh8EdlWf59k7Uv9jsrg1dQPMq
         AP/Z+f6da7jwVwvm2SbGY8RjNxBnmKPMeMj/BYb7WGmjK/jN0mOvIeZUOQE1zK5rOAqL
         +RJ2QT+I3A+TpFoyWJu9uanp25v3Rptpk26RrN8nUtwtQ9iLdE2MfvNtz2bqrG3iFkeq
         9S9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783377122; x=1783981922;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I6Kjbx3XUGCt0E7myA9GzyrUsA48dN9R24sT3zkPd6A=;
        b=a07CkFn381bNoozsy4C29xrAntWSmmc20FArB0C8jzRjAqIdHltRA/cxUz7Jvmm/no
         S3fD2bU9xXWhD+XryacJ+sv9ioChsOcal1DrjGuMWUScGEDoxZGQi9tcsUDpJkKGeSEI
         wBE7T96CGQuUOXZBdH29tg1TQ6L7U5+c7VxYza6BfPY+k4eKFYgtSK3OwippWZ8AzLhQ
         ySqy1TqLUPxx38LxWl16ZHZ15k/8Lw+eQYfu8K5XLU2qiigXTZCDSgMgm7jY9DZAYXb2
         +R+ZK1UdbMINRDmirAnEf76kAZsnDzWQNwdokSINVRTFtON6HKfdREw3g4KTiB0u08pG
         /PEw==
X-Gm-Message-State: AOJu0Yz61f/ETds097oUhXm4byTYWIyOTHYF9PFBXMeLjKmu+sd42QNM
	y9VmAYf8b3eWl7+NhZRjLW8+Hz83aEnK+bMlPuyAdAHaYwlS4iJvnexMr7tX2qSRXq4vS47PGFu
	ZMFUHbaRUkiYBGU7XRmCYXow6suHPNaT3qcan
X-Gm-Gg: AfdE7cltPc9MTCsrcs4KdEaiLE4mYv6xR2aRQdQGZ8kDrHyRhKC9b8Bn3XKrWzwtCnO
	BbexRQMV47Fll3gk37iTTryl5uF9Gx39lVZtsUnXBCM5mvzrCd8LCPO0ooMwSO3IlD+ZSYU5lkp
	BVDQWQLVyqMaUwruPfPzdLAS64rCEdOAfE4cg//2tgCwIHILgZ6QPR+lkB4who1Bk6+EeeZ1JD1
	pe/6mX5egJp2qLq8gqgUh/dYC2AQTDWvqzlThoLIRwdXvAAvagbOy96yqZZJEQYlSJX/1hA
X-Received: by 2002:a05:690e:488c:20b0:664:d231:2f73 with SMTP id
 956f58d0204a3-6677fbd4331mr1524615d50.50.1783377122477; Mon, 06 Jul 2026
 15:32:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260706171918.317102-1-ameryhung@gmail.com> <20260706171918.317102-13-ameryhung@gmail.com>
 <20260706174538.9597A1F000E9@smtp.kernel.org>
In-Reply-To: <20260706174538.9597A1F000E9@smtp.kernel.org>
From: Amery Hung <ameryhung@gmail.com>
Date: Mon, 6 Jul 2026 15:31:51 -0700
X-Gm-Features: AVVi8Cfq0h-o8TKHV6WzOcuV2FkiGWUwG67nsfP3MjAUS5MRYZGMhzXN1WzytIs
Message-ID: <CAMB2axNVV3vFKke1S08_nr0Vbwd47QFBRhSbJv=TjwEkzBzjzA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 12/15] bpf: tcp: Support parse/len/write
 header option hooks in bpf_tcp_ops
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 6, 2026 at 10:45=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 3 potential issu=
e(s) to consider:
> - [High] Out-of-bounds write in bpf_tcp_ops_store_hdr_opt via TOCTOU race=
 condition.
> - [Medium] Logical starvation of bpf_tcp_ops header option space due to s=
hared reservation allocation.
> - [Low] BPF multi-line comment style violation.
> --
>
> commit 16cbab0861ea029c828cf9218ec942f85b8d7050
> Author: Amery Hung <ameryhung@gmail.com>
>
> bpf: tcp: Support parse/len/write header option hooks in bpf_tcp_ops
>
> This commit adds TCP header option callbacks to the bpf_tcp_ops struct_op=
s
> type. These mirror the legacy sockops callbacks but expose them as
> struct_ops members for regular function signatures.
>
> > diff --git a/include/net/tcp.h b/include/net/tcp.h
> > index 2102f9f2afd63..7bf702117602d 100644
> > --- a/include/net/tcp.h
> > +++ b/include/net/tcp.h
> > @@ -3005,6 +3005,45 @@ struct bpf_tcp_ops {
> >
> >       /* Called on listen(2), right after the socket enters TCP_LISTEN.=
 */
> >       void (*listen)(struct sock *sk);
> > +
> > +     /* Parse the TCP header options of an incoming skb received on an
> > +      * established connection. Use bpf_dynptr_from_skb()/bpf_skb_load=
_bytes()
> > +      * to access the options.
> > +      */
>
> [Severity: Low]
> This isn't a bug, but does this multi-line comment start on the same line=
 as
> the opening /*? The BPF subsystem coding style prefers the text to start =
on
> the next line.
>
> [ ... ]
> > diff --git a/net/ipv4/bpf_tcp_ops.c b/net/ipv4/bpf_tcp_ops.c
> > index 3febbc8dd1a06..b27613898337e 100644
> > --- a/net/ipv4/bpf_tcp_ops.c
> > +++ b/net/ipv4/bpf_tcp_ops.c
> > @@ -66,6 +87,102 @@ static struct bpf_tcp_ops __bpf_tcp_ops =3D {
> [ ... ]
> > +BPF_CALL_4(bpf_tcp_ops_store_hdr_opt, void *, ctx, const void *, from,
> > +        u32, len, u64, flags)
> > +{
> > +     u64 *args =3D ctx;
> > +     struct sk_buff *skb =3D (void *)(unsigned long)args[1];
> > +     struct bpf_sock_ops_kern sock_ops =3D {};
> > +     u32 opt_off =3D args[5];
> > +     u8 *op, *opend;
> > +
> > +     /* bpf_tcp_ops does not keep track of the end of the written TCP =
header
> > +      * options, so search for it every time the helper is called. The=
 free
> > +      * space is NOP-filled, so a TCPOPT_NOP ends the search rather th=
an being
> > +      * skipped as in a normal option walk in sockops.
> > +      */
>
> [Severity: Low]
> This isn't a bug, but does this multi-line comment start on the same line=
 as
> the opening /*? The BPF subsystem coding style prefers the text to start =
on
> the next line.
>
> > +     op =3D skb->data + opt_off;
> > +     opend =3D skb->data + tcp_hdrlen(skb);
> > +     while (op < opend && *op !=3D TCPOPT_NOP) {
> > +             if (*op =3D=3D TCPOPT_EOL || op + 1 >=3D opend || op[1] <=
 2)
> > +                     break;
> > +             op +=3D op[1];
> > +     }
> > +
> > +     sock_ops.skb =3D skb;
> > +     sock_ops.skb_data_end =3D op;
> > +     sock_ops.remaining_opt_len =3D opend - op;
> > +
> > +     return __bpf_sock_ops_store_hdr_opt(&sock_ops, from, len, flags);
> > +}
>
> [Severity: High]
> If a concurrent BPF program modifies the map value containing the TCP opt=
ion
> length during the helper execution, could the copied length cause the loo=
p to
> advance op beyond opend?

The loop before calling __bpf_sock_ops_store_hdr_opt() is scanning
skb->data not bpf map value. Therefore, a concurrent BPF program won't
change it and cause an OOB.

A separate oberservation is that "from" passed to
__bpf_sock_ops_store_hdr_opt() can be a map value and modified
concurrently by another bpf program before memcpy(). This is not a
memory-safety issue, though: the copy length (new_kind_len) and the
bounds checks are taken from a local copy. The only effect is a
possibly malformed TCP option on the wire, which could be a functional
caveat, not a bug to fix here.

>
> If op exceeds opend, would the calculation opend - op underflow the u8
> remaining_opt_len into a large positive value? This could lead to an
> out-of-bounds write when __bpf_sock_ops_store_hdr_opt() calls memcpy() us=
ing
> skb_data_end.
>
> [ ... ]
> > diff --git a/net/ipv4/tcp_output.c b/net/ipv4/tcp_output.c
> > index 978d8474460b0..15915d452d6a1 100644
> > --- a/net/ipv4/tcp_output.c
> > +++ b/net/ipv4/tcp_output.c
> > @@ -573,6 +573,13 @@ static void bpf_skops_write_hdr_opt(struct sock *s=
k, struct sk_buff *skb,
> >       if (nr_written < max_opt_len)
> >               memset(skb->data + first_opt_off + nr_written, TCPOPT_NOP=
,
> >                      max_opt_len - nr_written);
> > +
> > +     /* bpf_tcp_ops portion is NOP-filled (everything past the sockops
> > +      * writer's bytes). The writer find the append point by scanning =
from
> > +      * first_opt_off + nr_written to the first NOP.
> > +      */
> > +     bpf_tcp_ops_call(write_hdr_opt, sk, skb, req, syn_skb, synack_typ=
e,
> > +                      first_opt_off + nr_written);
> >  }
>
> [Severity: Medium]
> Does max_opt_len contain the combined space reserved by both the legacy h=
ook
> and the new bpf_tcp_ops hook?
>
> If a legacy program dynamically writes more options than it initially res=
erved,
> could it incorrectly consume the space intended for bpf_tcp_ops, causing =
later
> store_hdr_opt calls to fail with -ENOSPC?

Yes and this is by design. Sockops and bpf_tcp_ops writers share one
reservation to avoid another layer of bookkeeping.

>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260706171918.31=
7102-1-ameryhung@gmail.com?part=3D12
