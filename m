Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD1E468C09
	for <sashiko-reviews@lists.linux.dev>; Wed,  9 Sep 2026 10:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788950855; cv=none; b=XIJ8lAvT5avUZV73K1NpWw/QqvPzHXn2Zj9kQmFMBbGUQf8JWv/RSByarSjDRrGPDbSOpBnIhMPV183hlz13Cbd9pPN0SQi3VV6rbgsAup/bcS4UCjikWbdFjh/R900j2KmrP66DLZrIjk8MSjFDBP596XwD3emp6uRqG7ebr2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788950855; c=relaxed/simple;
	bh=eu2IWW00F4r/0BWjPKtIIgN79HEqnSG+IlWqOYp2vUc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k6bePFFNA/ptGgJdSeWI732wWd+PQE77l1BFf97NlY+0bJTTPujJdhF9FglPq/n6GKxGGkFDyuHdQp+BXqARHS/hNrExh3pYWXpGT3pAWY8Z33rleJzgCJLULHcoxSzEdAjiM1gI0gdyiB448P879X32jpGuo7l9jzbVpSM+AYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NqJQ/v12; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NqJQ/v12"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 819761F00A3D
	for <sashiko-reviews@lists.linux.dev>; Wed,  9 Sep 2026 10:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788950853;
	bh=f+T7jhJWJhVnVCwA6aH2TnR+/nkc2vHbyy3LDwOw+E0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=NqJQ/v120CcWTDJ+YIN591ZDNL4Nv0eVxnhIvBNPOg0TuAeUh7ohRv7HZ+7WVZji7
	 lB5pVBe8nJqTr3yRO4ALkPYR4sMbRxJujdAJPjyEKIOSokA8JNcOAE3PT+TpaT/deK
	 ELtbzsdIIs3s7zeB21bTn77DmkmEBqukOvoZcEYS+cjOePKnZh5ASZqeaDSqfLrUF+
	 J/6l+rKwIqRXWDkLnoaYs0Eg8QlQ8+2nCw5veHcPGq7Tvz2AHnqOp/xBj2ywuiK1EM
	 JEAsjTx9kCs5tEWGW7U7/YQwON40WMwkh44kHMNqNtERB9EqWBgeFTu53E8CeUJSXF
	 n52uh2OLoz7jQ==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f18010so49394e87.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 09 Sep 2026 03:47:33 -0700 (PDT)
X-Gm-Message-State: AFuF++nrwfQiSxBMWmQwDpq2ubIF9IbJ7C96OYcJPz0QV5oCfd79siwP
	z1H2Mg1NqPGNF88Yb/hKaHWmhucxHVZgDie6GhvStdvIXRRi8f+znXM8WFEyW+EO8wm748cQfBy
	6TmUJyPWwleUfYnarzBoSf00WJ8A1o8Q=
X-Received: by 2002:a05:6512:39cb:b0:5b6:183b:d20b with SMTP id
 2adb3069b0e04-5b8986ce51fmr66009e87.50.1788950852272; Wed, 09 Sep 2026
 03:47:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260908-ks8995-to-ksz8-v10-0-7379239eb65f@kernel.org>
 <20260908-ks8995-to-ksz8-v10-2-7379239eb65f@kernel.org> <20260909093928.276631F00ADF@smtp.kernel.org>
In-Reply-To: <20260909093928.276631F00ADF@smtp.kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 9 Sep 2026 12:47:18 +0200
X-Gmail-Original-Message-ID: <CAD++jLm7KMopkxipJCNbfPYb5vbVfa38KQo=WBZGwC6G0tgjmA@mail.gmail.com>
X-Gm-Features: AcwNN1VC4GrtyQcCy2RNW0MgsYlOeJeZpaQjcMQILCcNdfYK8_-LZCIiMsCXg1M
Message-ID: <CAD++jLm7KMopkxipJCNbfPYb5vbVfa38KQo=WBZGwC6G0tgjmA@mail.gmail.com>
Subject: Re: [PATCH net-next v10 2/4] net: dsa: tag_ks8995: Add the KS8995 tag handling
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 11:39=E2=80=AFAM <sashiko-bot@kernel.org> wrote:

> > +     portmask =3D FIELD_GET(KS8995M_STPID_PORTMASK, etype);
> > +     netdev_dbg(dev, "%s: etype %04x portmask %04x (%d)\n",
> > +                __func__, etype, portmask, ilog2(portmask));
> > +     skb->dev =3D dsa_conduit_find_user(dev, 0, ilog2(portmask));
>
> [Severity: Medium]
> Could this result in calling ilog2() with a zero value if a standard
> 802.1Q packet is received?
>
> If the conduit interface receives a standard 802.1Q packet with ethertype
> 0x8100, the check (etype & KS8995M_STPID_STD) !=3D ETH_P_8021Q passes bec=
ause
> 0x8100 & 0xFFF0 is 0x8100.

OK that "should not happen" but I will add a check for it anyway
in v11 because better safe than sorry.

Yours,
Linus Walleij
