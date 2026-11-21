Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795261020;
	b=P+kj46kOkpwJLr8pu0itRJh7ztVs6/zmeQbtPAnDspJ7a2dGmG7rUOfT8mrg0ctUbjcz
	 Uaqyl9W4EO7B991qo3GMD/ttxoyzq3ccMG966/euTYnqKLtNd7M0Hts3jqRL82s79T0TF
	 2b8TOwYmg1vdZN7SduhowwSJk93gWKdir5YsiT8fPxkT+iVv4r0J9yiII6s4PctbKPHi7
	 i0I3Tmh+PiVWzThTaD0YVexZ39rc2193BjBlWNT7FbbShI1BpfO64xTfytnPxZi1NkoxL
	 EsYDMQMee4/XMdi+ZNloNOZtW3cbcnmc6UAt1aD1fmck8SqcpIkS4tJqfHG8tUG4eew==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795261020;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=gpxUmT1DXpteToj1Lp4HCEtZ/G9nbHGyPF9Kc8ok+s4=;
	b=wemOunai3qCw+OXcjqra+MmeHyDrMeDlGd62UFfBeudTC88qCZTCvHxPbWQpj10/yr8T
	 prAkIEW+uleH0KFf8bAHIdB83P+mR2HIe+07QW5MK9f+vzQx7b99Vg0x7geP4URtWLDtz
	 mQL4A9bsQTOGo3Ed447Ll6WATQf8yc/OQLCI6ggmdKSonnGSBe8jzGIMEp0WmJIm3Bwdz
	 WU2sLvVosDOr4/khJS2i0kHT7rxVJPnPuHaPaHTocXwcFW6+3Y89cg/Pcznmrj75CxoKE
	 bfFI7Xm8BKcowMunTfC9RaGPuLzFUVfTQqijJeub6d14f2wlGtAV3GqW0g4rL5/T7Gg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=mojatatu.com;
	spf=none smtp.mailfrom=mojatatu.com;
	dkim=pass header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=tdChTqY3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34917606A325
	for <sashiko-reviews@lists.linux.dev>; Sat, 21 Nov 2026 11:37:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34917606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=tdChTqY3
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cdd9d0c9bbdso1022825a12.1
        for <sashiko-reviews@lists.linux.dev>; Sat, 21 Nov 2026 03:37:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795261019; cv=none;
        d=google.com; s=arc-20260327;
        b=VqwDt8gF+61VfSH9r7Z+fg+RAVr6+E01ukp0AaSXWQ/fcmIYcY2A8AFoD7Lo4FddUS
         lXo7Jpy1zaoxH9v2u3VcJZIU5CpzhfFFXJQPOxhmQPqyRMEJauRGmbnOtKEEvUL5wXPr
         BGKczXsxYCntsLDu/nsTyPUTFrhOvKTk3ElhUt+p0e7jnGvSsbYV7zSU/4qE8w2McN8F
         Wgq/4v2r8bQAjhhTnWCOt3qwXx+GROKoaEHQ4u2KMGT9I9OeOb91F+YAbc1DaLaXe3ko
         yqgmaO7vK4agRbFXzBmutQhh+7tluGPwuJSNXsoll1AWN2r1sdCrWoFLXHfDsaIqlEAe
         wJxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gpxUmT1DXpteToj1Lp4HCEtZ/G9nbHGyPF9Kc8ok+s4=;
        fh=uA360uvxR9S0K/Y4Lovo7aIaGlBwzVBnnb2BKWupr/4=;
        b=P02xyE2hV14wWZBQfzSnHxsNvxVjhDJbbZ9yEGR6g2byaM1/Auxdf2fB6o8zBMUEOj
         PzqT51yqoQFzSVJLYivmad1SqJBshLblj1Uuitfu1pepTxFKQqowQs/sshbLapv0BJ8F
         iCl2mckH92CYeuIvNpzUerAeF9+SUXJO1W2ZYfzcW+c3ZsU6J6vo4jI2cD3Wa8HuS/yf
         pWZLAvIhnUmB8j9barvG4EO3gN0BSuF8d5KQmme8CDaTGXFGwtrcdshbdFlkJ3N+iPfo
         3qSUlhlutD0HHAdrNsFxXroPuTEj2BmxGjuWAGqa2giQw3tVlydfTj7Qb3X+zl9pexSw
         xWpw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1795261019; x=1795865819; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gpxUmT1DXpteToj1Lp4HCEtZ/G9nbHGyPF9Kc8ok+s4=;
        b=tdChTqY3pT/9P1Op5s/nNLQYFKWt+2DsVHoAtUKa4RRaWBXb6NM7sOFQO32p78Fw4c
         7v4REfw32rux5G/IL5Ya/TOlADEZTo2aLqVv2zazbLQTUJbpQcHjt6LNilparg/20pjY
         MWkcAyG34JeuPW1LS0zJYSD4lwE3MPyVBXbWw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795261019; x=1795865819;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gpxUmT1DXpteToj1Lp4HCEtZ/G9nbHGyPF9Kc8ok+s4=;
        b=w59DNxFG+9nDdx4HSjL62h9QvywTrMlkYYOXJzrR+b/iV1EWOCDaXsPhnaYQUDpmAn
         7SmWxcT3CMFBg46/kfvRd7BvuhIIFFCvYi304jO2GT+Xn9Rvp9QDhgOi7S7kDs444bI5
         NWsnbf3Ip5IK88gQfLDF3ddZY9x/IP7MdyefWqylWPLWTd05V2I9CFz6LjTGVQwJADlc
         aSEo6aUDzT7qN4fwkZvxT+/P87LuZnvD3XsX/ebYkqz1rT/IAmuQTdhrDnpKX2+ocIKw
         8tAf/0sun0jXxliw8Wj23z/FZw3pb4/yf42QLlqjA76jSPr8922Edx04qelw9FR6APHS
         ivCQ==
X-Gm-Message-State: APuU4Z+hG5+C9QJWZH5l1key13iIxZl30yTNzex+bglGJsw41S4KrF6+
	GYwV6ZO8IgGNskyaCV1HwxNWIbESV4Y/xWGnC7rsPHrkM0Uu/0GTP5jteP/d0lmvbxoxVdiU9xo
	vd6ZBaZocZpunpEpRqEwaDxe5wN7rwY2guwY1OUoiLvGgHge55ws=
X-Gm-Gg: AZFdTZe+HPrxmW3c2BfYc3YFT2PRvQRKhjO4FgjkvIe/b8OZqX6ZQ5cvj68rBfeZtyZ
	ZiWY8aiP6SZ08/bDxBuXiIoYKpUFQsTOqJa744vxldD7LMV12u+oB8P29i7Dwz+zYivtKyAXDaU
	KN4r4Htg2bQQznzm4LKSrL6PslYmO0nzaxzFNDdByOLc02U7S0kyVmqCR7FH6fByNT2lfhbyzJI
	3KDoa6ivMxuQzPOB2dC7mPeKkgDw1WyYE9BIiS4qH+w+AUWp7I9B8Io7zgImn5u8u6/NXWXA7Ln
	aYpXiLfFnOVPrpze3MuiflpkXzaInfMM790g6BQomB/mzRHfFwze06oUfAIAYjcxEjB2Wiq59tA
	HkaT/+LSmL243AxajtnkU/XEcX/YBvZnJuxHkhlozH06/FFHvzN0qksIhJy4oxwkuzJMlYzFMJd
	KBXZAhWcuvQzfIke6UOb9K
X-Received: by 2002:a05:6a21:d83:b0:3f7:8096:254a with SMTP id
 adf61e73a8af0-4014d76478cmr5859141637.42.1795261019528; Sat, 21 Nov 2026
 03:36:59 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <QDISC-6HS9.v6.r0.20261119070330@mojatatu.com> <QDISC-6HS9.v6.r0.20261119070330-2@mojatatu.com>
 <sashiko-outbox-225153@kernel.org>
In-Reply-To: <sashiko-outbox-225153@kernel.org>
From: Jamal Hadi Salim <jhs@mojatatu.com>
Date: Sat, 21 Nov 2026 06:36:48 -0500
X-Gm-Features: Aa3M54pgLaAdx6r-YmeXtilib-Ky2ELKZp-WJOZtHqBg6iwZDGGNIq4wUb5NCkg
Message-ID: <CAM0EoMnrLDHJQfC2fPdmnxW+L51XRArcL1nWggKXHcO06VEiiw@mail.gmail.com>
Subject: Re: [PATCH net v6 2/3] net: neighbour: reinject a parked skb through
 a headerless output device
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 7:40=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] net: neighbour: reinjecting skb onto n1->dev misroutes
>   redirected packets

This is addressed in the commit log of this series. I know you read them.

cheers,
jamal
> --
>
> commit dce8515be5271f5a3b9c463a37e73a62aef0f6af
> Author: Jamal Hadi Salim <jhs@mojatatu.com>
>
> net: neighbour: reinject a parked skb through a headerless output device
>
> This commit restores skb->dev to n1->dev in neigh_update_process_arp_queu=
e()
> when n1->dev has no header_ops before calling n1->output().
>
> Link: https://lore.kernel.org/netdev/20261110101908.2e64e8e9@kernel.org/
>
> > diff --git a/net/core/neighbour.c b/net/core/neighbour.c
> > index ae2db3912454a..d36d86cfc441c 100644
> > --- a/net/core/neighbour.c
> > +++ b/net/core/neighbour.c
> > @@ -1342,6 +1342,9 @@ static void neigh_update_process_arp_queue(struct=
 neighbour *neigh)
> >                       if (n2)
> >                               n1 =3D n2;
> >               }
> > +             /* headerless output transmits on skb->dev, not n1->dev *=
/
> > +             if (!n1->dev->header_ops)
> > +                     skb->dev =3D n1->dev;
> >               READ_ONCE(n1->output)(n1, skb);
>
> [Severity: Medium]
> Can setting skb->dev =3D n1->dev misroute packets that were steered to an=
other
> device while retaining a dst pointing to a headerless device?
>
> As the commit message notes, nft_fwd_neigh_eval() and
> __bpf_redirect_neigh_v4() / __bpf_redirect_neigh_v6() (when nh is provide=
d)
> steer the packet to a target device and nexthop while leaving the origina=
l
> skb_dst(skb) attached, and neither site drops that dst in this tree.  Whe=
n a
> packet originally routed to a headerless device is redirected to an
> unresolved neighbour on another device, neigh_update_process_arp_queue()
> re-looks up n1 from the retained dst, resets skb->dev to the original
> headerless device, and transmits the packet there instead of on the targe=
t
> device (or re-runs n1->dev's egress hook and decrements TTL a second time=
 if
> redirected from NF_NETDEV_EGRESS).
>
> An egress redirect or mirror via tcf_mirred_to_dev() from a headerless
> device to teql0 hits the same issue, and cannot drop skb_dst(skb) because
> teql_resolve() requires the dst to resolve the slave neighbour.
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/QDISC-6HS9.v6.r0.=
20261119070330@mojatatu.com?part=3D2
