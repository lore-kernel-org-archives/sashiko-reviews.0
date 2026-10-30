Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793374164;
	b=A78T/t+Jb5Hx6xHpG1MfZsLDdtBBoN8fK96ZXOIhwJGojzydR8Twz+lGKLaIohKMWXHz
	 jAtYH7alEapVK0C1lZ9meRdZ8Yx24usjEMcdca6HDfOQOu9b6oOgrs02kz+EmtMKh99oT
	 ItQM4V0kjQ8hi57Djg+v6RXfo+4FS5yV32geXdoDlUS7DOtRqPjgUEcRiaO6S2qr5d7R6
	 Y3jRYyV0dKDDpf+lCTd1vgbLjHH5BFCTmzCzOJYkdgWR+jR1J+QGi80KT/7LW5Zh+N6tZ
	 gKX3s2sVHy/41YaVns8Zeoya+iMqfAfXzpRrntU4nIpO6IoHLz5rAaalab9OLl2bU8g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793374164;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=ifs0dZiIbKAiwzh72marcgxeqRTvjNaSkmgSKzN/rXA=;
	b=Huq+dTJhKDPY9iTaOdjzxJnyU51WPByw+djWO72/nLX/MXYf42m0w/iv1f6b1YYlI4A3
	 LT18utGCmPTGXRVEkyjQwC8uqe1QxoB4M0omdAmVGYuUI8xdcBirAzjIntr8K0dMkadpi
	 Zov7pZ/o1z69l+8vg+Bh2mArflI8Vlss/qt1F/9jgvuUKss3TI1U/i18amenTXdu6RU7C
	 tyksxDOAWPY6CZO+BHSCM/EcR5I0mmOmFsNWMvmaGT8nsOfmJlmyPq9rg2JeKqudEWHE4
	 v8OKqpzBMMbwZsfFgljySuJ3oE5S6wyQRXvJ294Q6k7CR6eJGJrA8zVz4IjLzqaBY/w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=XsSNIrqY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.51
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0029606A31D
	for <sashiko-reviews@lists.linux.dev>; Fri, 30 Oct 2026 15:29:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0029606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=XsSNIrqY
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5bcb4f23ddeso858205e87.3
        for <sashiko-reviews@lists.linux.dev>; Fri, 30 Oct 2026 08:29:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793374162; cv=none;
        d=google.com; s=arc-20260327;
        b=Ld/ST0h0RsLaKeayaLjQ69PmvJB0J6iHQtO0DTPPHrm8ce4XvQY+/i7Y2Lv4dskgmq
         Ryb5vYqRsMW26a0TGE93r6Nt9eJl3AoiDLZB/GbkuQ6Qy5jHCiTLRTubr7dUUyGUYpbm
         BOyehVhxK1G5+72gMAe/FDxlyTbOwwbC2GRXcuRlRAIBpK+Q5J2BG5YgXN9xMLdlJumb
         sU3KkGxn/C7So1Oa2ZRoBcSzJw0uILqn6lNwSmlV4wTqjartikCDFKoVesmDSReo+WpP
         i2o0c/fOOQGaldEZSm/kSlom5rVup6Usw6vb2AZlOz/+xt5wBl9izDdbml5lCkPyad/U
         jaOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ifs0dZiIbKAiwzh72marcgxeqRTvjNaSkmgSKzN/rXA=;
        fh=/XafWwXInU6xSAMitUKTVJtcnn7zkW/jx5Qszu7SSug=;
        b=YGoW0IFTMIN6JHsdPlem2m9aNRnj61YM3FFfujaR2jaZ8Maz5FHCd9sRuL8Gu5l9ar
         EnL3OeXcr3zU/A3FIUQSLohDszcCXPuYdceAcXQaXWdmcNrQ0l32Uo7uyl+xrVmrPmrN
         dEe3nkt0gHGo4FG3WU87CBTvjqKXnXgrSUtnk/HBt3A7qVpDpOzwIYOIgk7zngAwKBmd
         X1PfalSjdURjBdmOWcGW168ZBl7La8t93DZ2yxLES5kIFk+wX08pAgp/CpqALX874utY
         5HDgvwSBP/JknDxxpwXohyjHp26urk92fbyd2hdE2L0IY9VGbvOpUNpGMqNzYl7qXKO4
         tsTw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793374162; x=1793978962; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ifs0dZiIbKAiwzh72marcgxeqRTvjNaSkmgSKzN/rXA=;
        b=XsSNIrqYbMWFgnQ0GaX3tMs8J1KtRpdwLP0IALL8mMtLN/mEl3vaSlaRM69sz7iyJz
         RzSDu9MGnCBR1qGhOQxs20nhWAay457+eD7DKgY5Kz1Z3blvx0IwKJbT73aKT0y9Hr4Q
         HiZHctino5/h4wzAhhfibOSS62GsGcni03u+zhOYFdQHe2HZFUHNJhfsFixrAzXtqIpj
         d9m+PoDVtWBF3JGTU6hpxWouUT9+ENOF4fe9NRTshz1EPCkW318YMtx/4Osc2/fd94Mu
         FSd1VVIahyynZL1owjnNcq0vAHNcDLQfZ3p07zAdAWlwI8ts9Tkx8p73uzH1ylr/LT+j
         U7Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793374162; x=1793978962;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ifs0dZiIbKAiwzh72marcgxeqRTvjNaSkmgSKzN/rXA=;
        b=ygWSInQRpaAqW3dopS4G1cF1RCzmdNgaoLv9316dzPE/1o81j/PyyqxPusOJ9RpimY
         7PIbN7T+TYzX5AX2MdzuivrFVoYvtvtP4IJ/lz+HNmDe/j86wmpIUpse8TJy9yl/wVk/
         bkAztoM3ziFLRgOXluvgvXPenvnFOGK1pkWWU2IfsGRgIkGC7BpeccuStholqXzsyAjv
         4nR1W81/eqH+QRumBbNU47T7TJN+ZylqGrpn46f0GRfVFQ81zsL8XBLBR3GkUZSa8jah
         8uPYxZZD1NVW2+I/TW88GHEdwMzURut0cfst6Z50XWccloDMM/gCARpONA4I+/3alLPF
         ZT6Q==
X-Gm-Message-State: AFq9FYLGbGU8c3eUKEAmvSqNL9sBWyIimpGr/Xu4PaqzdNLAQ6QIumKe
	z5UKa+6TAsQ5C4TxyQL2o7p7HrqiYVqrWUBbk6QzL+gMxKQZ4hhmRpRL2weK5VHKI4zzFer4VzQ
	b5+wSMhsBNAO2Z8awoJzMiKU/IDgzCXFCj/ZHPIa5admVSKkr836lV5sj1Q==
X-Gm-Gg: AYBFou1IoneqUxcbd7WWryU2wpJXdAKNOlK3iI31oFApOCM/CSkwyE82W/xzKQyvR0j
	X2P+zYG7tuMHYaQk8+aBbLK/oWzja1hPEV3xiAqGaFoD+xKB0WNsG2ibam8eKPjuDIZ7f2fPOf6
	1Bu5kBzmZCP+qxdAZ9DumWpb/YuIS2f0XR6rOL3L8NanDOQ1LcBKPWmDA8KRDoY16QBlQUqRo9l
	UMOI6CAWS5INk5Ln/iMg2J54B+lxkjKMjT4xQ8Fr+tw7z77ytuFQa/kGyYT65MZFAOfVmU4VwRj
	Vf/NvrUcDII/RCA/NBuiOfFvbrsaoNhVSN/SZHM5tZcxNs5xjsnqPt0EhHE7uXiint228CTzZxK
	9NYr7lFaZ82zaYFIL4JFP9X63fk5htoMBhcXkv+fy4bjqI/b0CMbWdQ9Asvbv21jqnbIw+Q==
X-Received: by 2002:a05:6512:6097:b0:5bf:dc0f:6462 with SMTP id
 2adb3069b0e04-5bfdc0f66a5mr730635e87.20.1793374161913; Fri, 30 Oct 2026
 08:29:21 -0700 (PDT)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261012095452.135828-1-marco.crivellari@suse.com>
 <20261012095452.135828-6-marco.crivellari@suse.com> <sashiko-outbox-169423@kernel.org>
In-Reply-To: <sashiko-outbox-169423@kernel.org>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Fri, 30 Oct 2026 16:29:11 +0100
X-Gm-Features: AclHuK_Wy1ICXYldQGV0SVt-Z8rxfuERMYG6nsNJshBN3OSvw_3xfKbAS6Qaf7c
Message-ID: <CAAofZF7DvcYaNt_SUUA-wKUJXcX5rx0x7qBFadidPGdBvjKyEA@mail.gmail.com>
Subject: Re: [PATCH net-next v4 5/6] net: usb: pegasus: Move long delayed work
 on system_dfl_long_wq
To: sashiko-reviews@lists.linux.dev
Cc: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 11:59=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] usbnet: pegasus: missing locking around multi-step MII USB contr=
ol messages
> --
>
> commit b4ecccdd796761b12d0bedd35e1c982cb24bc36a
> Author: Marco Crivellari <marco.crivellari@suse.com>
>
> net: usb: pegasus: Move long delayed work on system_dfl_long_wq
>
> This patch shifts the delayed work for carrier checks from the per-CPU
> system_long_wq to the unbound system_dfl_long_wq. This allows the schedul=
er
> to optimize task placement for long running tasks.
>
> Cc: Petko Manolov <petkan@nucleusys.com>
> Cc: linux-usb@vger.kernel.org
> Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
> Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
>
> > diff --git a/drivers/net/usb/pegasus.c b/drivers/net/usb/pegasus.c
> > index aba1a640fc268..ed3f8d555c2a0 100644
> > --- a/drivers/net/usb/pegasus.c
> > +++ b/drivers/net/usb/pegasus.c
> > @@ -1118,8 +1118,9 @@ static void check_carrier(struct work_struct *wor=
k)
> >       pegasus_t *pegasus =3D container_of(work, pegasus_t, carrier_chec=
k.work);
> >       set_carrier(pegasus->net);
> >       if (!(pegasus->flags & PEGASUS_UNPLUG)) {
> > -             queue_delayed_work(system_long_wq, &pegasus->carrier_chec=
k,
> > -                     CARRIER_CHECK_DELAY);
> > +             queue_delayed_work(system_dfl_long_wq,
> > +                                &pegasus->carrier_check,
> > +                                CARRIER_CHECK_DELAY);
> >       }
> >  }
>
> [Severity: High]
> Does this code risk data corruption in the PHY registers?
>
> The delayed work check_carrier() runs asynchronously in a workqueue and c=
alls
> set_carrier(), which performs multi-step USB control transfers without ho=
lding
> rtnl_lock() or any internal driver lock.
>
> Concurrently, userspace ethtool operations or ioctls (which do hold rtnl_=
lock)
> can read or write PHY registers.
>
> Since the operations interleave on the USB bus without serialization, con=
current
> execution could overlap the hardware address and control commands, corrup=
ting
> the PHY state:
>
> drivers/net/usb/pegasus.c:__mii_op() {
>     ...
>     set_register(p, PhyCtrl, 0);
>     set_registers(p, PhyAddr, sizeof(data), data);
>     set_register(p, PhyCtrl, (indx | cmd));
>     ...
> }
>
> Would it be possible to add locking around these MII hardware accesses to
> prevent interleaving when called concurrently?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012095452.13=
5828-1-marco.crivellari@suse.com?part=3D5

The race seems to be real but is independent of the workqueue change.
Add a mutex in `struct pegasus` and use it inside `__mii_op()` should
solve the issue. I will not introduce this change in this series.

--=20

Marco Crivellari

SUSE Labs
