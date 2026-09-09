Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC993B2D24
	for <sashiko-reviews@lists.linux.dev>; Wed,  9 Sep 2026 10:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788949783; cv=none; b=F+9AXXbXUUL/p+dWLiahjRM52saSPO1G8cbZSCAs+0Zv0kZBlqTCIPXwDe4ERsHRXHLOfOsJKmMe3nxvL3C7S8Ty2u59K9dt/4BtPzO5DajkfU4VS3sTltgx87cZDAL3gffSNmq7cFA10XWutXXB6+nMjelr8A4HwieB8XdcZhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788949783; c=relaxed/simple;
	bh=+S8G1QTSh+/2ZxLJJReUEKrRR2fKzGymIwe3VHDcPCU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YyZGyFl9PcQl7lKtzEH2R8OeNmHluJiz4w/bBdZsvey4SEqXs72VcV8SHy3G4HA4zFME7u0S6d399M/rSB1Z3i6B/VbjEmsPy1vNL0q2A48bB//h1dU9DJFCi+VwiXkZiA8F6MPKHnCuzpNpSTaXT4GT0OqYaTYU86D0jzl79xY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mlKJuqLB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mlKJuqLB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D81371F00A3F
	for <sashiko-reviews@lists.linux.dev>; Wed,  9 Sep 2026 10:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788949780;
	bh=ophW8hL5cnAgIkhl4wzLKsoeshxW8ytst2y+WVzOBZY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=mlKJuqLBnudHHUxwhBtzODAjQdHw/7MPOocYRHlBaQctYzb4t3DQESjyqkj8+qMXU
	 N3YqQMCS4jvOixhEdQqBOm7Ndp0B3XumnQrog8MkXg7rNYyl9KqeUD8vp4pzHS7N5l
	 Y8AegTmTWPsTKzhKsJPOKc2Xknd/PwahpbRxuN9EfHTYo4ZPHD28uiszeYIjigJTMO
	 3KSnFicE0vZGq32dV113lHe/DyNM02zOazBOaBkvwMdFn68oo3cAdIatTYQT6gXDVR
	 D/ih/h7/NUXa+e4+rdIkUHCw+X7R1cqVB4841DmBKon2OfhO8sYNqTP0PwNowQ4YEB
	 DAuDse1QYAvoQ==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f15b79so30169e87.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 09 Sep 2026 03:29:40 -0700 (PDT)
X-Gm-Message-State: AFuF++kxJUxEW5XNPNdjh3VAlqqosDEE6eWOr9vSTE74SwMfo5a6r62b
	z0/NmEtv745tXkN6fs+GKOpdGrvQ460WN9Up1F3DMl8ZwhFF+TKsy4lxfOuGFrHtZd+sFBctQkt
	eWl3iTFWGVvNjMfVymsn2zILEJMUT3hM=
X-Received: by 2002:ac2:4f07:0:b0:5b4:7d9d:16d7 with SMTP id
 2adb3069b0e04-5b8984de1efmr140771e87.11.1788949779595; Wed, 09 Sep 2026
 03:29:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260908-ks8995-to-ksz8-v10-0-7379239eb65f@kernel.org>
 <20260908-ks8995-to-ksz8-v10-1-7379239eb65f@kernel.org> <20260909093926.34F8D1F00AC4@smtp.kernel.org>
In-Reply-To: <20260909093926.34F8D1F00AC4@smtp.kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 9 Sep 2026 12:29:26 +0200
X-Gmail-Original-Message-ID: <CAD++jLm+vpuOrpVJxOqsqxadT8yPMd82NJ9V1f_bbguOzs-SYA@mail.gmail.com>
X-Gm-Features: AcwNN1VjDXhRpeSgmQnU6UCD9FrZtdwZrLV8mA3yo76B382PsM3nc5sQock5VEo
Message-ID: <CAD++jLm+vpuOrpVJxOqsqxadT8yPMd82NJ9V1f_bbguOzs-SYA@mail.gmail.com>
Subject: Re: [PATCH net-next v10 1/4] dt-bindings: net: dsa: microchip: Add KSZ8995XA
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 11:39=E2=80=AFAM <sashiko-bot@kernel.org> wrote:

> > @@ -122,6 +123,7 @@ allOf:
> >              enum:
> >                - microchip,ksz8863
> >                - microchip,ksz8873
> > +              - microchip,ksz8995xa
>
> [Severity: Low]
> Does adding this 5-port switch to this specific enum block bypass generic
> DSA port validation?

Grrr I inversed the if expression, there is a NOT there.

OK human error. I will respin it as v11.

Yours,
Linus Walleij
