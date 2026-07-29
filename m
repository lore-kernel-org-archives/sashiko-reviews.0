Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 027F93DEAFC
	for <sashiko-reviews@lists.linux.dev>; Wed, 29 Jul 2026 20:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785356805; cv=pass; b=eOR/tiMuydK+ylsRELu6vmx3u3LKJgOC4SjLFLmARqZEiX7FX0KAbPU6DXEqFVk4OGdblLfvXa1KU1TTSQgCG2cK987ls1Vw+6or0KgtMXndahPocKvJRB/mzJrXMAeFVJZMg3dg1MEK7/8fXxSimhc+BTOQyOqE5W6OmesuHec=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785356805; c=relaxed/simple;
	bh=Cm2CpQg6vqMhCdk/ESknVF7+UXIvAD3hVPBjdumD5XY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qbwyy5XHCXO5pfq6sD9sfNg49kyt+0Hl8WYrzd/NGKtGjr1jjJgwQdJWRwz1OS7A+MJP023u5XQ6Y/hrE8ge8GATJ17bqdkZmvuFYKqm/8WPZl1xc/1eEvycyZ+WS2UFcDOd3OgAS6Sym0W7KvjxtLsfy7Bz40b4ssHotF5CFb4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M4C6cN5g; arc=pass smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M4C6cN5g"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c15cd3fd760so171751766b.2
        for <sashiko-reviews@lists.linux.dev>; Wed, 29 Jul 2026 13:26:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785356801; cv=none;
        d=google.com; s=arc-20260327;
        b=llo0ycMnpHi1zbYbUSTvQQUDa6sZOAaZHcY4ryv068VkJpVcSt9G6IexENk3lXMKXr
         kLNMpEocUux5ec3xKuG48wXPT8Ac5z+uFpUAtPJ/YM23r+5U0xP45IK+fylTVtxlQyix
         xqY+RY3me2Er+LsOLiD9k/vnlaW5iZvNdHWe3yFy+G8YqHLlOaOj7UHQpSAl3AS2iQgq
         NTVa8pMJGnMuhhYU6adFUu1ijtTyMA2SpArxXig3p7tsbna10AMQgPXxgKjIbT60kzyg
         K8KErB8BLk1V36cAGyVB97vrZKX9xoDgv/k3/WUdaKzt7TwVkW5bOAtDtqmVQprDjMaa
         YbTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tWhipNQFQXej/O38PkqRLXjVEfaFmVqdc8EX6rwHmTc=;
        fh=09d0alT2vWugDAMCzpgQpl3/7WoRUt39xgQGbwqyPYU=;
        b=gbCfsrfFSORiVs5S6eHbQHp3PAFm/qmpQx98945KNiOERlixG1Zhw6cVa9WY9jZNc5
         gclK45Oco4kM7YkTn6TIiM0yAgQayiIvVXB//EjyCQrOZ7vHtvpbhEfFSOLYbKLG/vua
         9b1qfzAYidGT8pMKppgdUnFOZMSzbYtlfyOXkVoFY9hWBfDx1q5OLubXuaFjt+1Gs87b
         RhoCDpY6L6HjU9u4HRMZQuCOM7PBhxIh9J+CFykAdgCIB8ZEApJckXYbzwf58NflwmZm
         hBbMDK/0SVgQ/8HQ747QGqEnhR+v8UucwVox2yZBl5wO7W4oOfR3rZhL3DL09eYhCe/y
         9Y9A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785356801; x=1785961601; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tWhipNQFQXej/O38PkqRLXjVEfaFmVqdc8EX6rwHmTc=;
        b=M4C6cN5gRxPMxvyAmmdhedHN0qykGG79tSvSpgeFFRSnWE1/Lq39DdhiFatbl4Il94
         pBizAxRkbyNc0h1moiLJV7peBqg7r/vT4k3kqdkmDHJbPISrolPThy8yWwvddsoWSLxY
         PPCquzN/20jWa88ByiWgynfnB0VThRaSR4Si52lzC9TpakVGqtbKdyi1ZnsVmscdK73G
         qAx8CYWDrBoAYU3YhQtGQkPAd6hn5fWxWZrJePZWJn9Lvs6CB/6IGTIgkfwO0B9QQ2Mz
         Xs9Lf0KuN1XuvBxIxJfqV0SGLn/F7y9EsH/C6gc66tx6DgsYOAPaqlUPCb7GFJ4GQtPw
         qQ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785356801; x=1785961601;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tWhipNQFQXej/O38PkqRLXjVEfaFmVqdc8EX6rwHmTc=;
        b=isnjOAwcYhgRek39GE9CkcpSeKVJIOdc3/DF1l6+GAwrVtGCgeFM/6QTPXUzFDi736
         0kWOKzLmLTemmkx3KDhZMIXD+EkkKJIvNL56CTg3W3ANojVcTLWLRceK5ox65OpObOUe
         HOWUgH4h69fAq6zMXfy/r9yPWAF+CzPO/r2uluHXbe4XKtZhk/kahHLfeAj8JwQYhQum
         M/VGUWL9kzul3dq5O89wLLP5eKGoCYX0gkTZEvol45icwWMdXrlAPXhhPmF8wv9/0lTs
         2zuCPkssS6Cj9CXMqqWL7YrpSHlIdEU+NmTAnegAU8qb57rliNRog2aKFaDToJ2JbniJ
         z9jw==
X-Gm-Message-State: AOJu0Yz47wuwqYLUlRwyTjdtPEdd7Tm1Tfxt1T26r6tksospNkiFGEG1
	a1La79W3zZY6l5PQekrVQtu7LRjmS81If/qAYy29DQHyVWl3eiVX5D4ilNUmfITOcGv0g4Ol13x
	zHtynD2YE4bbdXAvMYb28zq11Ujc/jhk=
X-Gm-Gg: AR+sD10t6sSUrjkcd3dVg/YEL+uNaO5q3Ati4rBLga310gE5XvASa7FR/3Ctc6N7bDz
	EAH3wgNwEi7/5ATKl+qoy7hFzMrH7MZOnxibgQoB1tHhTLmYBcboni8GygdReVoQfFctIXCJlXv
	26gqfIysUjJBiSHlxioMtv5LnHtJGinDTQ1QmLtNUliGMJdG/Jp0+yB6XtviWYKHF0YQcvBNjZt
	+gMmEcAv58J5k31s6tEAknSP8o96E2uOIMfhGoACsgC3SVB9msS9WddGcv683Ahb7rs8HpWopnN
	PlMO98si39q9cYMv+Llz6aKrabUS++3tZLV6nC9GL9VI5HqQQ0JkA0ujeThVoZBN4GOodD0Cb2w
	q0s5DP6JDmqbJ2h/hRwqZZny4r8lcNke23O/QujVX6Rzvn5SDhiqZFgd9S5YrrF1YidvgpXaq7e
	m1Vznfb+WpNHRSignySZOSbbieZcXp6K0VAZed7hqIEGMHwgHXi/TBs4w=
X-Received: by 2002:a17:907:960a:b0:c1f:1520:4de3 with SMTP id
 a640c23a62f3a-c1fa53ad2f4mr287866b.7.1785356800911; Wed, 29 Jul 2026 13:26:40
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260628231156.1254012-1-rosenp@gmail.com> <20260628232714.BD9581F000E9@smtp.kernel.org>
 <CAKxU2N-3zVUM6A-fQnYWud4O7M55Ghc-wnTCG+8DD6_nh2827g@mail.gmail.com>
 <ba56ee70-9702-4b11-ad04-d63322ab60b4@app.fastmail.com> <CAKxU2N9Nt+HF-4TzB3+_5ta=28wb0xCCLuUVO6Bm=LW3ZnNmHw@mail.gmail.com>
 <d05ffeca-f289-42dd-b454-5a7c7741c6d5@app.fastmail.com>
In-Reply-To: <d05ffeca-f289-42dd-b454-5a7c7741c6d5@app.fastmail.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Wed, 29 Jul 2026 13:26:29 -0700
X-Gm-Features: AUfX_mzAAzLz-CN3JXCsoYNE_H_HunaCmfqznY42yDJmShDSNw2RihF7rX2dsB8
Message-ID: <CAKxU2N8Akw0+dc=wHUmLrqJe6d6rrk2O-BqeRB7D55iU-S_uLA@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: BCM5301X: drop extra AXI bus ranges that break PCIe
To: Arnd Bergmann <arnd@arndb.de>
Cc: sashiko-reviews@lists.linux.dev, devicetree@vger.kernel.org, 
	Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 29, 2026 at 12:31=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrot=
e:
>
> On Wed, Jul 29, 2026, at 20:13, Rosen Penev wrote:
> > On Wed, Jul 29, 2026 at 8:40=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> w=
rote:
>
> >>
> >> >> commit 4f061464281d4964ce46dab60d36a09328f14862
> >> >> Author: Rosen Penev <rosenp@gmail.com>
> >> >>
> >> >> ARM: dts: BCM5301X: drop extra AXI bus ranges that break PCIe
> > This patch can be dropped.
> >
> > https://lore.kernel.org/all/20260727140939.389-1-strst.gs@gmail.com/
> >
> > is the proper solution to the problem.
>
> Right, that looks a lot better, at least as a hotfix. Could you
> respin that one to print a warning in the loop for every bridge
> window that is not bdev->addr_s[0]? That way we can also fix
> up the DT to have the correct data, which at the minimum helps
> avoid nonsense but may also be needed to avoid future problems.
Not my patch.

That patch effectively ignores values in dts. Needed because of bcm drivers=
.
>
>       Arnd
