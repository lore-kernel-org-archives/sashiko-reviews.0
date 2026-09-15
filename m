Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1CA44508EB
	for <sashiko-reviews@lists.linux.dev>; Tue, 15 Sep 2026 23:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789514500; cv=none; b=obYlT67DmlQRmUrcVpzzZq0yHXwy8cIarEmAhj9+J6SMyub/llVb0ONacxWFzva8RxmqGf85Q6RCSro/ZvTa7cJGQQRUIECJfY7d1pcLQlUCFrC60gHY+UQVd25Wn/SaheIrLOkYNEUeXZ8M4BKCZAxkyFZDDwmhG8rrwLvuEGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789514500; c=relaxed/simple;
	bh=SZtGWg3Ry7eshvevu8zXbfCMNZeRuM4HiVhM/tf7/CU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IbQxTssB9pOBRFuMO9PT816uilX+WeCthVpuxZSOZFmsgmAlirVxsU3TBWRruVA5l9jlyd0Et8benrYZ2W2lM9AcgpX0WLiYWA43y8QnUnA9F6RxZn09k7Uv4ME1lfCBwQjzFzQB3JxYZAX/b199GUHQ5uKr1NDBUlg87fuuRQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ByYElnZP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ByYElnZP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58B271F00893
	for <sashiko-reviews@lists.linux.dev>; Tue, 15 Sep 2026 23:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789514499;
	bh=qrd046gS7cRLDO73aara+gm0Ms90pWAUaUxPR7oVCK8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ByYElnZPNwkrkIgVfbvKkDd4ddxmtdkWYC3DXB/NnbEDK8M3EDbsv3PvqRiiIw3/Z
	 1auqtIjRNdCYK6eQUw07ks4J4BjW/k129fiH8KLoe9RrtFerRPyMZvQnKAcf0g/Nrb
	 fjliPa3nViQIXNp3xghjIBS/M1nni0PJ1LfJKnqk2moOFVmbR+sW/DR3GNGta/yyCA
	 O1aEXZLKiht3gaNqeBo98n+P9drNN2rnLGuYS2AVFXUXDF0iXEa08PQnt9Hmr4FIPE
	 o02fXkF0syOqfxHciPHE+NjenosGyP91WQYLQi4R3aoZs+CgvUTu4iF0IPpHGNwk8B
	 sMZn1xccNlZWA==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f16f12so302941e87.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 15 Sep 2026 16:21:39 -0700 (PDT)
X-Gm-Message-State: AFuF++nokdFeApd1j+mkv2eqYbBrKHUlI8pMLelKQ2xWK6HZiFG2FB67
	YcHvo4HX+OZw752Iz4sh1ScuOwZIxBawgg+RbJg0SW7advTR+s7t/CtpJgDXRunMcPU/FRZdFln
	j2qm96m8NDhnA8ScclF4b/TTU92rKBh0=
X-Received: by 2002:a05:6512:3a85:b0:5b6:19fe:a5a9 with SMTP id
 2adb3069b0e04-5b8b666ac19mr93443e87.26.1789514498067; Tue, 15 Sep 2026
 16:21:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260914-ks8995-to-ksz8-v14-0-3d72692b3c97@kernel.org>
 <20260914-ks8995-to-ksz8-v14-2-3d72692b3c97@kernel.org> <20260915203532.6631B1F00893@smtp.kernel.org>
In-Reply-To: <20260915203532.6631B1F00893@smtp.kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 16 Sep 2026 01:21:25 +0200
X-Gmail-Original-Message-ID: <CAD++jL=JgmFTrEOwfRshC14APnk0iUFZ0CfqijFZ6GTStxQPKA@mail.gmail.com>
X-Gm-Features: AcwNN1WL3aaCsbfk2k9yU0gijCijANdzYB6oiKYSlFNI_AZuBKzEE9xibKGoZck
Message-ID: <CAD++jL=JgmFTrEOwfRshC14APnk0iUFZ0CfqijFZ6GTStxQPKA@mail.gmail.com>
Subject: Re: [PATCH net-next v14 2/4] net: dsa: tag_ks8995: Add the KS8995 tag handling
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 10:35=E2=80=AFPM <sashiko-bot@kernel.org> wrote:

> > +     /* Always add a distinct outer tag. The user port removes this fi=
eld on
> > +      * egress, so reusing an existing 802.1Q tag would consume that V=
LAN tag.
> > +      */
> > +     skb =3D vlan_insert_tag(skb, KS8995M_STPID(portmask), 0);
>
> [Severity: High]
> Could this lead to an out-of-bounds read or write if a short packet is se=
nt?
>
> If a user with CAP_NET_RAW sends a very short packet (e.g., a 1-byte payl=
oad)
> via an AF_PACKET raw socket, it might reach ndo_start_xmit without being
> padded to 14 bytes because needed_tailroom is not set by the tagger.

This is getting really fringe.

Who does those things? It's a consumer router chip not a network lab.

Shall I just go on and please the AI as the fringeness increases here?

Yours,
Linus Walleij
