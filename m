Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B79D02DC357
	for <sashiko-reviews@lists.linux.dev>; Sun, 11 Oct 2026 15:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791733787; cv=pass; b=qI/2qSo4V4HofLJRXt2PetaG9vROnFzULcZfkZyenGtuCrm6E9bwgJLd1I+BSPW569HbFBbT0lGThhFPZFRXD8qM3wc9k0pvXNbOtKbYOoIzKIERqAwJGh2Qykg+ZlvAbazEOQ/drNFHQh9zk/SCN58DgmANMKgxaG+mmg3Tzrw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791733787; c=relaxed/simple;
	bh=j70uu2FMwecarTBfLTkycEwqg+OUmVrVo5QBmX5ENNo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b67WCuc9OowNXjDH105KH1pwJW8QSZ0ZsZFYbpoG3Myeu12CCuWeI4wM65WtMPzAMgNtcMZ4JHqmpSq/FI5IEVFu4ZrYciHt7eb++iFNHl29on8nlVQgSrSgGyUuTrSzCi6Ulu5OzQB6u2eGWulTUI4bLGfWfPTJmcXhEOi6Mvg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=p3V0VlUr; arc=pass smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="p3V0VlUr"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-144e1b6d52cso2865c88.1
        for <sashiko-reviews@lists.linux.dev>; Sun, 11 Oct 2026 08:49:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791733785; cv=none;
        d=google.com; s=arc-20260327;
        b=CYS361a1Mbg6a+5j7Z5W/I316AvhPMXDTGI0lDib6Rc9mEGS42iVRVJxoT0CHA9g+w
         ucB/wCZ9r6BQ2u0xKNo73lyOW0HbM6hQUFlMOL2qbGD56k3JjkLWkk9BJ1v+fciG6nXo
         lhGHaCRkChiMd2idZQv4KLVTo6LPZcm4IdOPdcQEPr2/v+vU/uOSlaKXerJ7+O8+E6D5
         6/JtsOzGCJypSqDhMp9CX9Kkpg8f596CuWKgu6/oXhQ3cPCzn449uSVr55OgNnnma2l7
         BcACI9cjQaWtCjNbjNTWGprJopV0MSp6nX2kCtSzuPNLyeW2XBgDCMP+siRCfqp1jeSz
         lLDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ecTB/b1KVuwggL9v6W55CF5SsosIuAwWeEbKXxOAN1s=;
        fh=uA360uvxR9S0K/Y4Lovo7aIaGlBwzVBnnb2BKWupr/4=;
        b=X4kNnff3LheYlEKBzsS1dVbi7vuy2ZljBq9BMEiWXQOaPfiKYoEKUxZAou5AXlqKHc
         FDWuuQZmxD6cfLHfhVfoFwBxo5D66XehwbUvJmqpnyfwpqXFXnraeD5cvtG+ZMCOHUDc
         GPB6b8+tZSiIMsIAE20RDs2jjZKW+f7YTOMgCKtAC29vS7Gnr5zhFTtN64WRVC1zk2sF
         QKIRRk9Fzf0fXuaejALBl4umvXbSZn4yG87Z9rYPChkZQBl6HKA4Cpw8pkT37gOXsfFa
         a8FKCvLpqA44rQFI1kQGRtQmEpalAv1CwYgJNaFqqtrvXBBOOtX/KQaVJWSN+LGz1UjM
         U+2w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791733785; x=1792338585; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ecTB/b1KVuwggL9v6W55CF5SsosIuAwWeEbKXxOAN1s=;
        b=p3V0VlUrxTnMnQo9wV3rR51LXbnHpNKtirhGpe6LuaV75yZ95eNlLbsm2gqpgqLhm/
         LmQRHN6hmIU7VdJqMe5WVLe+erPcpu2t3oqbg14cIhrOEUO0SPP/sfquIz94x5oRJdrb
         HiEPxpz2zNVhuPGsmA9uK/zAQGuNI4+inacQkaklj9txMMBw6sln5Bv5sqwJ1KNp5P03
         WgxqQ3RccZSsLC5bUPs5eSRqR0S98X9T7loaWUBSav8TYvjcf1y+i+/G/pYISjutuTgW
         5CTNFIHoB3En7c2f0iw0Sv2Z9oRphj48RjXwtfWQJLneTKpHR8w7GTWt9QV1U/n9OOJa
         rabA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791733785; x=1792338585;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ecTB/b1KVuwggL9v6W55CF5SsosIuAwWeEbKXxOAN1s=;
        b=ZhyigbFVokFkVw1cj0CuBuyGa87++Ctm1/WT+wkE6Fnx1nw//IIAbeARbDFWlWeLol
         VLHFKVQleW65I66pHSK9x0v6QZiKDbb07G1c1nH4ElnMvpyIDuPv2i7i1er0SIWLTgA6
         W3H/oYtmcEJA7D9XB0i4ezP/i4JP1A4vUS7LuMGF/I3ENF9lgGEi2OkUDoqGs+efP3JJ
         6QWpv4GL1Xl+jQYgxkiXmMR9kTGrSWI6Nkfrwk3TDhHrQC7Et7A4hnwx7IbjnJDla/fM
         4ZyGJuvDZV7dJbwT/s+alJVbPkpMjV/BKWP3nQB46jB/gNTALWIa96UFKJc0YrewtzGC
         pvXA==
X-Gm-Message-State: AFq9FYJNtGuyGep1JkXfHiR1c67zW96XUCMH7sYBb/R0FNI+Wjh68p3/
	xBQL79p+bmAgeLHznN1Z3zkKIhO4x4+USTfXBaNhDxI57wnfP1SK217HF+QrNMFux/LvipY10+Q
	lfMDE6TD9V9hwUQs9cmOzraK65OGig1VJBHFmvXaRh6rpgRyUH0kOCRnN
X-Gm-Gg: AYBFou2tS+935Gp/+Igj+1SncJof3qD4DTnqXgRBWA2w/XAkYifR+9/u5syrQRtHooC
	/bDLUVeXM8F6PojMzAEO7zpTtvvu9nx8W5HP/I0tEzl0ctzHznALMcgCs2s6GxDZy+uu6yh6mq9
	MYmNEly7A8GtUVVNncjZ7UJ4lxXIwAQjkG097LOR6XUAJECKXs1GuLIuPf1T5Nq1rM6q8vqV38C
	xAZipQYENtGNhK60Mjd9MR4GJ11TxKR+5iYrPDJrRDcUBEoMvM+ewgfuRTRgw3VaIyDTAQxfFva
	/iFOyo8EEM+5O4IwlBijGBhjtTFb5NE7bMfHwoPY5ftQWnsILuaS8A==
X-Received: by 2002:a05:7022:f502:b0:15e:608d:75f8 with SMTP id
 a92af1059eb24-16e254ca4fbmr146550c88.3.1791733783545; Sun, 11 Oct 2026
 08:49:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261010033630.1171692-1-almasrymina@google.com>
 <20261010033630.1171692-2-almasrymina@google.com> <sashiko-outbox-166995@kernel.org>
In-Reply-To: <sashiko-outbox-166995@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Sun, 11 Oct 2026 08:49:28 -0700
X-Gm-Features: AclHuK9L0vL4j9AEIumLIt68WdyKkxbv8x7lovgP_4Jg8MgS4qrAZFJli8wQGdk
Message-ID: <CAHS8izP7iHx9po4p0mfOsriKPFiY2Xwa0=Gyt2yxUmLPRG6cxQ@mail.gmail.com>
Subject: Re: [PATCH net-next v3 1/2] net: netmem: document netmem and memory
 provider design in comments
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 10, 2026 at 8:36=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] net: skb_try_coalesce() allows mixing fragments from different m=
emory providers
> --
>
> commit e4f91f2e0cb9de813eeecc8b5549e79dc322d463
> Author: Mina Almasry <almasrymina@google.com>
>
> net: netmem: document netmem and memory provider design in comments
>
> Clarify the netmem, memory provider, page_pool, and skb fragment design
> principles in header and code comments. It documents that all frags in an
> skb must either all be struct page-backed or all belong to the same memor=
y
> provider instance, and adds a check in skb_try_coalesce() to enforce this=
.
>
> Link: https://lore.kernel.org/netdev/20261008023030.1089616-1-almasrymina=
@google.com/
> Link: https://lore.kernel.org/netdev/20261005004958.3603059-1-almasrymina=
@google.com/
>
> > diff --git a/net/core/skbuff.c b/net/core/skbuff.c
> > index d56f4f0102f75..69d3d27e29d97 100644
> > --- a/net/core/skbuff.c
> > +++ b/net/core/skbuff.c
>
> [ ... ]
>
> > @@ -6210,6 +6210,10 @@ bool skb_try_coalesce(struct sk_buff *to, struct=
 sk_buff *from,
> >       if (to->pp_recycle !=3D from->pp_recycle)
> >               return false;
> >
> > +     /* All frags in an skb must either all be struct page-backed or a=
ll
> > +      * belong to the same memory provider instance; do not coalesce s=
kbs
> > +      * that would mix them.
> > +      */
> > +     if (skb_frags_readable(from) !=3D skb_frags_readable(to))
> > +             return false;
>
> [Severity: High]
> Does this check reliably prevent mixing fragments from different memory
> providers?
>

Yep this is one of the biggest shortcuts we took in the memory
provider stuff. We just assumed here that unreadable =3D=3D comes from
memory provider and there is 1 or 2 memory providers present and it's
unlikely the user has both enabled on their system in the first place
so we'd need to differentiate.

If we land more memory providers (and it looks like we are) we need a
better way to differentiate. That is going to take some refactoring so
I'd prefer in separate patches. I think maybe the comments documenting
the design are useful anyway.

--=20
Thanks,
Mina
